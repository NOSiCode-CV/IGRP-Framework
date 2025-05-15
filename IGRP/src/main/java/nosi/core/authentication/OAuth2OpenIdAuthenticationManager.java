package nosi.core.authentication;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.core.HttpHeaders;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.*;

public final class OAuth2OpenIdAuthenticationManager {
	
	public static final String OAUTH2_OPENID_PAGE = "/app/webapps?r=igrp/Oauth2openidwso2/index&target=_blank&isPublic=1&lang=pt_PT";
	public static final String CALLBACK_PATH = "/app/callback";
	public static final String OAUTH2_OPENID_ERROR_PARAM_NAME = "oauth2_openid_error";
	
	private static final Logger LOGGER = LogManager.getLogger(OAuth2OpenIdAuthenticationManager.class);
	
	private OAuth2OpenIdAuthenticationManager() {}

	public static void authorizationCodeSwap(HttpServletRequest request) {

		final var error = request.getParameter("error");
		if (error != null && !error.equals("null") && !error.isEmpty())
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador. ERROR: (" + error + ").");

		final var authCode = request.getParameter("code");
		final var sessionState = request.getParameter("session_state");
		var session = request.getSession();
		final var settings = ConfigApp.getInstance().getMainSettings();
		
		final var m = generateToken(authCode);
		if(m.isEmpty())
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador por causa do token swap.");
		
		final var token = m.get("access_token");
		if (token == null)
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador. Token não encontrado.");

		final var idToken = m.get("id_token");
		final var refreshToken = m.get("refresh_token");

		final var userInfo = oAuth2GetUserInfoByToken(token);
		final var email = Optional.ofNullable(userInfo.get("email")).map(String::trim).map(String::toLowerCase).orElse("");
		final var uid = userInfo.get("sub");
		final var name = userInfo.getOrDefault("name","");
		final var phone_number = userInfo.get("phone_number");

		User user = null;
		
		if (Core.isNotNull(email) )
			user = new User().find().andWhere("email", "=", email).one();
		if (uid != null && user == null)
			user = new User().find().andWhere("cni", "=", uid).one();

		final var env = ConfigCommonMainConstants.IGRP_ENV.environmentValue();

		if (user != null) {

			if (user.getStatus() != 1)
				throw new IllegalStateException("Este utilizador " + user.getName() + " ("+user.getEmail()+") encontra-se desativado.");

			final var profile = new Profile().getByUser(user.getId());
			if(profile == null)
				throw new IllegalStateException("Nenhum perfil foi encontrado para o utilizador: "+user.getUser_name());
			
			AuthenticationManager.createSecurityContext(user, session);
			AuthenticationManager.afterLogin(profile, user, request);
			
			session.setAttribute("_oidcIdToken", idToken);
			session.setAttribute("_oidcState", sessionState);

			user.setValid_until(refreshToken);
			user.setOidcIdToken(idToken);
			user.setOidcState(sessionState);
			user.setIsAuthenticated(1);
			user.setRefreshToken(refreshToken);
			user = user.update();
		} else if ("dev".equalsIgnoreCase(env)) {
			User newUser = new User();
			newUser.setUser_name(uid);
			newUser.setEmail(email);
			newUser.setName(name);
			newUser.setPhone(phone_number);
			newUser.setStatus(1);
			newUser.setIsAuthenticated(1);
			newUser.setCreated_at(System.currentTimeMillis());
			newUser.setUpdated_at(System.currentTimeMillis());
			newUser.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
			newUser.setActivation_key(nosi.core.webapp.User.generateActivationKey());
			newUser.setValid_until(refreshToken);
			newUser.setOidcIdToken(idToken);
			newUser.setOidcState(sessionState);
			newUser.setRefreshToken(refreshToken);
			newUser = newUser.insert();
			if(newUser == null)
				throw new IllegalStateException("Ocorreu um erro ao adicionar o utilizador: "+name);
			AuthenticationManager.createPerfilWhenAutoInvite(newUser);
			AuthenticationManager.createSecurityContext(newUser, session);
			session.setAttribute("_oidcIdToken", idToken);
			session.setAttribute("_oidcState", sessionState);
		} else
			throw new IllegalStateException("Caro "+((name!=null && !name.equals("null"))?name+" ":"")+email+" não está convidado para para nenhuma aplicação. Contactar o administrador!");

	}

	private static Map<String, String> generateToken(String code) {
		try {

			final var client_id = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.environmentValue();
			final var client_secret = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_SECRET.environmentValue();
			final var endpoint = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_TOKEN.environmentValue();
			final var redirect_uri = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.environmentValue();

			final var body = "grant_type=authorization_code&code=" + URLEncoder.encode(code, StandardCharsets.UTF_8)
							 + "&redirect_uri=" + URLEncoder.encode(redirect_uri, StandardCharsets.UTF_8)
							 + "&scope=" + URLEncoder.encode("openid email profile", StandardCharsets.UTF_8);

			final var authorization = "Basic " + Base64.getEncoder().encodeToString((client_id + ":" + client_secret).getBytes(StandardCharsets.UTF_8));

			final var request = HttpRequest.newBuilder()
					.uri(URI.create(endpoint))
					.header(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded")
					.header(HttpHeaders.ACCEPT, "application/json")
					.header(HttpHeaders.AUTHORIZATION, authorization)
					.POST(HttpRequest.BodyPublishers.ofString(body))
					.build();

			final var response = HttpClient.newBuilder()
					.version(HttpClient.Version.HTTP_2)
					.build()
					.send(request, HttpResponse.BodyHandlers.ofString());

			if (response.statusCode() == 200) {
				final var jToken = new JSONObject(response.body());
				final var token = (String) jToken.get("access_token");
				final var idToken = (String) jToken.get("id_token");
				final var refreshToken = jToken.optString("refresh_token", "" + jToken.optIntegerObject("expires_in", 4000));

				final var m = new HashMap<String, String>();
				m.put("access_token", token);
				m.put("id_token", idToken);
				m.put("refresh_token", refreshToken);
				return m;
			}else
			if (response.statusCode() == 401) {

				throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador por causa do token swap com erro "+response.statusCode());
			}else
				throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador por causa do token swap com erro "+response.statusCode());



		} catch (Exception ex) {
			LOGGER.error(ex.getMessage(), ex);
		}
		return Map.of();
	}

	private static Map<String, String> oAuth2GetUserInfoByToken(String token) {
		try {
			final var endpoint = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_USER.environmentValue();

			final var request = HttpRequest.newBuilder()
					.uri(URI.create(endpoint))
					.header(HttpHeaders.ACCEPT, "application/json")
					.header(HttpHeaders.AUTHORIZATION, "Bearer " + token)
					.GET()
					.build();

			final var response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			if (response.statusCode() == 200) {
				final var jToken = new JSONObject(response.body());
				final var uid = new HashMap<String, String>();
				uid.put("sub", getAttributeStringValue(jToken, "sub"));
				uid.put("email", getAttributeStringValue(jToken, "email"));
				uid.put("birthdate", getAttributeStringValue(jToken, "birthdate"));
				uid.put("name", getAttributeStringValue(jToken, "name"));
				uid.put("phone_number", getAttributeStringValue(jToken, "phone_number"));
				return uid;
			}
		} catch (Exception ex) {
			LOGGER.error(ex.getMessage(), ex);
		}
		return Map.of();
	}

	private static String getAttributeStringValue(JSONObject obj, String attribute) {
		try {
			return obj.getString(attribute);
		} catch (JSONException ignored) {
			return null;
		}
	}
	
	public static Optional<String> signOut(User currentUser) {

		final var authenticationType = ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.environmentValue();

		if(!ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equalsIgnoreCase(authenticationType))
			return Optional.empty();

		String oidcLogout = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT.environmentValue();
		if(oidcLogout != null && !oidcLogout.isEmpty()) {
			String oidcIdToken = currentUser.getOidcIdToken();
			String oidcState = currentUser.getOidcState();
			String redirectUri = ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.environmentValue();
			String aux = String.format("%s?id_token_hint=%s&state=%s&post_logout_redirect_uri=%s", oidcLogout, oidcIdToken, oidcState, redirectUri);
			return Optional.of(aux);
		}
		return Optional.empty();
	}
	
	public static boolean isSignOutRequest(HttpServletRequest request) {
		String state = request.getParameter("state");
		String sp = request.getParameter("sp");
		String tenantDomain = request.getParameter("tenantDomain");
		List<String> params = Arrays.asList(state, sp, tenantDomain);
		return !params.contains(null) && !params.contains("");
	}
	
}
