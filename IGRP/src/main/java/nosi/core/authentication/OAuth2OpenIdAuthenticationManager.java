package nosi.core.authentication;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.core.Form;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.ApplicationManager;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.*;

public final class OAuth2OpenIdAuthenticationManager {
	
	public static final String OAUTH2_OPENID_PAGE = "/app/webapps?r=igrp/Oauth2openidwso2/index&target=_blank&isPublic=1&lang=pt_PT";
	public static final String CALLBACK_PATH = "/app/callback";
	public static final String OAUTH2_OPENID_ERROR_PARAM_NAME = "oauth2_openid_error";
	
	private static final Logger LOGGER = LogManager.getLogger(OAuth2OpenIdAuthenticationManager.class);
	
	private OAuth2OpenIdAuthenticationManager() {}

	public static void authorizationCodeSwap(HttpServletRequest request) {
		String error = request.getParameter("error");
		String authCode = request.getParameter("code");
		String sessionState = request.getParameter("session_state");
		HttpSession session = request.getSession();
		if (error != null && !error.equals("null") && !error.isEmpty())
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador. ERROR: (" + error + ").");
		
		Properties settings = ApplicationManager.loadConfig();
		
		Map<String, String> m = swap(authCode, sessionState, settings);
		if(m.isEmpty())
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador por causa do token swap.");
		
		String token = m.get("access_token");
		if (token == null)
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador. Token não encontrado.");

		String idToken = m.get("id_token");
		sessionState = m.get("session_state");
		String refresh_token = m.get("refresh_token");

		Map<String, String> userInfo = oAuth2GetUserInfoByToken(token, settings);

		String email = Optional.ofNullable(userInfo.get("email")).map(String::trim).map(String::toLowerCase).orElse("");
		String uid = userInfo.get("sub");
		String name = userInfo.getOrDefault("name","");
		String phone_number = userInfo.get("phone_number");

		User user = null;
		
		if (uid != null)
			user = new User().find().andWhere("cni", "=", uid).one();
		if (uid == null && Core.isNotNull(email) || user == null)
			user = new User().find().andWhere("email", "=", email).one();

		final String env = ConfigCommonMainConstants.isEnvironmentVariableScanActive() ?
				ConfigCommonMainConstants.IGRP_ENV.getEnvironmentVariable() : settings.getProperty(ConfigCommonMainConstants.IGRP_ENV.value());

		if (user != null) {

			if (user.getStatus() != 1)
				throw new IllegalStateException("Este utilizador " + user.getName() + " ("+user.getEmail()+") encontra-se desativado.");

			Profile profile = new Profile().getByUser(user.getId());
			if(profile == null)
				throw new IllegalStateException("Nenhum perfil foi encontrado para o utilizador: "+user.getUser_name());
			
			AuthenticationManager.createSecurityContext(user, session);
			AuthenticationManager.afterLogin(profile, user, request);
			
			session.setAttribute("_oidcIdToken", idToken);
			session.setAttribute("_oidcState", sessionState);

			user.setValid_until(refresh_token);
			user.setOidcIdToken(idToken);
			user.setOidcState(sessionState);
			user.setIsAuthenticated(1);
			user.setRefreshToken(refresh_token);
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
			newUser.setValid_until(refresh_token);
			newUser.setOidcIdToken(idToken);
			newUser.setOidcState(sessionState);
			newUser.setRefreshToken(refresh_token);
			newUser = newUser.insert();
			if(newUser == null)
				throw new IllegalStateException("Ocorreu um erro ao adicionar o utilizador: "+name);
			AuthenticationManager.createPerfilWhenAutoInvite(newUser);
			AuthenticationManager.createSecurityContext(newUser, session);
			session.setAttribute("_oidcIdToken", idToken);
			session.setAttribute("_oidcState", sessionState);
		} else
			throw new IllegalStateException("Caro "+name+" ("+email+") não está convidado para para nenhuma aplicação. Contactar o administrador!");

	}

	private static Map<String, String> swap(String code, String sessionState, Properties settings) {
		Map<String, String> m = new HashMap<>();
		Client curl = ClientBuilder.newClient();
		try {

			String client_id = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
			String client_secret = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_SECRET.value());
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_TOKEN.value());
			String redirect_uri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());

			Form postData = new Form()
					.param("grant_type", "authorization_code")
					.param("code", code)
					.param("redirect_uri", redirect_uri)
					.param("scope", "openid email profile");

			try (jakarta.ws.rs.core.Response r = curl.target(endpoint)
					.request("application/x-www-form-urlencoded")
					.header("Accept", "application/json")
					.header("Authorization", "Basic " + Base64.getEncoder().encodeToString((client_id + ":" + client_secret).getBytes()))
					.post(Entity.form(postData), jakarta.ws.rs.core.Response.class)) {

				if (r.getStatus() == 200) {
					String resultPost = r.readEntity(String.class);
					JSONObject jToken = new JSONObject(resultPost);
					String token = (String) jToken.get("access_token");
					String id_token = (String) jToken.get("id_token");
					String refresh_token = jToken.optString("refresh_token", "" + jToken.optIntegerObject("expires_in", 4000));
					m.put("access_token", token);
					m.put("id_token", id_token);
					m.put("session_state", sessionState);
					m.put("refresh_token", refresh_token);
				}
			}

		} catch (Exception ex) {
			LOGGER.error(ex.getMessage(), ex);
		} finally {
			curl.close();
		}
		return m;
	}

	private static Map<String, String> oAuth2GetUserInfoByToken(String token, Properties settings) {
		Map<String, String> uid = new HashMap<>();
		Client curl = ClientBuilder.newClient();
		try {
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_USER.value());
			jakarta.ws.rs.core.Response r = curl.target(endpoint)
					.request()
					.header("Accept", "application/json")
					.header("Authorization", "Bearer " + token)
					.get(jakarta.ws.rs.core.Response.class);
			if (r.getStatus() == 200) {
				String result = r.readEntity(String.class);
				JSONObject jToken = new JSONObject(result);
				uid.put("sub", getAttributeStringValue(jToken, "sub"));
				uid.put("email", getAttributeStringValue(jToken, "email"));
				uid.put("birthdate", getAttributeStringValue(jToken, "birthdate"));
				uid.put("name", getAttributeStringValue(jToken, "name"));
				uid.put("phone_number", getAttributeStringValue(jToken, "phone_number"));
			}
		} catch (Exception ex) {
			LOGGER.error(ex.getMessage(), ex);
		} finally {
			curl.close();
		}
		return uid;
	}

	private static String getAttributeStringValue(JSONObject obj, String attribute) {
		try {
			return obj.getString(attribute);
		} catch (JSONException ignored) {
			return null;
		}
	}
	
	public static Optional<String> signOut(User currentUser, Properties configs, HttpServletRequest request) {

		final String authenticationType = ConfigCommonMainConstants.isEnvironmentVariableScanActive() ?
				ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.getEnvironmentVariable() : configs.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());

		if(!ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equalsIgnoreCase(authenticationType))
			return Optional.empty();

		String oidcLogout = configs.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT.value());
		if(oidcLogout != null && !oidcLogout.isEmpty()) {
			String oidcIdToken = currentUser.getOidcIdToken();
			String oidcState = currentUser.getOidcState();
			String redirectUri = configs.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
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
