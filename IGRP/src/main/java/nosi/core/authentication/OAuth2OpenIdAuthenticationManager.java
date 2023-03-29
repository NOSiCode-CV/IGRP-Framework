package nosi.core.authentication;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.Invocation;
import jakarta.ws.rs.core.Form;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.ApplicationManager;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;

public final class OAuth2OpenIdAuthenticationManager {
	
	public static final String OAUTH2_OPENID_PAGE = "/app/webapps?r=igrp/Oauth2openidwso2/index&target=_blank&isPublic=1&lang=pt_PT";
	
	private static final Logger LOGGER = LogManager.getLogger(OAuth2OpenIdAuthenticationManager.class);
	
	private OAuth2OpenIdAuthenticationManager() {}

	public static void authorizationCodeSwap(HttpServletRequest request) {
		String error = request.getParameter("error");
		String authCode = request.getParameter("code");
		String sessionState = request.getParameter("session_state");
		HttpSession session = request.getSession(false);
		if (error != null && !error.isEmpty())
			throw new IllegalStateException("Ocorreu o seguinte erro: (" + error + ").");
		
		Properties settings = ApplicationManager.loadConfig();
		
		Map<String, String> m = swap(authCode, sessionState, settings);
		
		if(m.isEmpty())
			throw new IllegalStateException("Ocorreu um erro (swap).");
		
		String token = m.get("access_token");
		String idToken = m.get("id_token");
		sessionState = m.get("session_state");
		String refresh_token = m.get("refresh_token");

		session.setAttribute("_oidcIdToken", idToken);
		session.setAttribute("_oidcState", sessionState);

		if (token == null)
			throw new IllegalStateException("Token não encontrado.");

		Map<String, String> userInfo = oAuth2GetUserInfoByToken(token, settings);

		String email = userInfo.get("email") != null ? userInfo.get("email").trim().toLowerCase() : "";

		String uid = userInfo.get("sub");
		String name = userInfo.get("name");
		String phone_number = userInfo.get("phone_number");

		nosi.webapps.igrp.dao.User user = null;
		boolean isUserAuthenticated = false;
		
		if (uid != null)
			user = new nosi.webapps.igrp.dao.User().find().andWhere("cni", "=", uid).one();
		if ((uid == null && email != null) || (uid != null && user == null))
			user = new nosi.webapps.igrp.dao.User().find().andWhere("email", "=", email).one();
		
		if (user != null) {

			if (user.getStatus() != 1)
				throw new IllegalStateException("Este utilizador " + user.getName() + " encontra-se desativado.");
			Profile profile = new Profile().getByUser(user.getId());
			if(profile == null)
				throw new IllegalStateException("Nenhum perfil foi encontrado para o utilizador.");
			
			AuthenticationManager.createSecurityContext(user, session);
			AuthenticationManager.afterLogin(profile, user, request);
			
			user.setValid_until(token);
			user.setOidcIdToken(idToken);
			user.setOidcState(sessionState);
			user.setIsAuthenticated(1);
			user.setRefreshToken(refresh_token);
			user = user.update();
			isUserAuthenticated = true;
		} else if ("dev".equalsIgnoreCase(settings.getProperty(ConfigCommonMainConstants.IGRP_ENV.value()))) {
			nosi.webapps.igrp.dao.User newUser = new nosi.webapps.igrp.dao.User();
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
			newUser.setValid_until(token);
			newUser.setOidcIdToken(idToken);
			newUser.setOidcState(sessionState);
			newUser.setRefreshToken(refresh_token);
			newUser = newUser.insert();
			if(newUser == null)
				throw new IllegalStateException("Ocorreu um erro: Utilizador não encontrado.");
			AuthenticationManager.createPerfilWhenAutoInvite(newUser);
			AuthenticationManager.createSecurityContext(newUser, session);
			isUserAuthenticated = true;
		}
		if(!isUserAuthenticated)
			throw new IllegalStateException("Ocorreu um erro na autenticação do utilizador.");
	}

	private static Map<String, String> swap(String code, String sessionState, Properties settings) {
		Map<String, String> m = new HashMap<>();
		try {
			String client_id = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
			String client_secret = settings
					.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_SECRET.value());
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_TOKEN.value());
			String redirect_uri = settings
					.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
			Form postData = new Form();
			postData.param("grant_type", "authorization_code");
			postData.param("code", code);
			postData.param("redirect_uri", redirect_uri);
			postData.param("scope", "openid email profile");
			Client curl = ClientBuilder.newClient();
			Invocation.Builder ib = curl.target(endpoint).request("application/x-www-form-urlencoded");
			ib.header("Accept", "application/json");
			ib.header("Authorization", "Basic " + Base64.getEncoder().encodeToString((client_id + ":" + client_secret).getBytes()));
			jakarta.ws.rs.core.Response r = ib.post(Entity.form(postData), jakarta.ws.rs.core.Response.class);
			String resultPost = r.readEntity(String.class);
			curl.close();
			if (r.getStatus() == 200) {
				JSONObject jToken = new JSONObject(resultPost);
				String token = (String) jToken.get("access_token");
				String id_token = (String) jToken.get("id_token");
				String refresh_token = (String) jToken.get("refresh_token");
				m.put("access_token", token);
				m.put("id_token", id_token);
				m.put("session_state", sessionState);
				m.put("refresh_token", refresh_token);
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
		return m;
	}

	private static Map<String, String> oAuth2GetUserInfoByToken(String token, Properties settings) {
		Map<String, String> uid = new HashMap<>();
		try {
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_USER.value());
			Client curl = ClientBuilder.newClient();
			jakarta.ws.rs.core.Response r = curl.target(endpoint).request().header("Accept", "application/json").header("Authorization", "Bearer " + token).get(jakarta.ws.rs.core.Response.class);
			if (r.getStatus() == 200) {
				String result = r.readEntity(String.class);
				curl.close();
				JSONObject jToken = new JSONObject(result);
				uid.put("sub", getAttributeStringValue(jToken, "sub"));
				uid.put("email", getAttributeStringValue(jToken, "email"));
				uid.put("birthdate", getAttributeStringValue(jToken, "birthdate"));
				uid.put("name", getAttributeStringValue(jToken, "name"));
				uid.put("phone_number", getAttributeStringValue(jToken, "phone_number"));
			}
		} catch (Exception ex) {
			LOGGER.error(ex);
		}
		return uid;
	}

	private static String getAttributeStringValue(JSONObject obj, String attibute) {
		String _value = null;
		try {
			_value = obj.getString(attibute);
		} catch (JSONException je) {
			_value = null;
		}
		return _value;
	}
	
	public static Optional<String> signOut(User currentUser, Properties configs) {
		String authenticationType = configs.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
		if(!ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equalsIgnoreCase(authenticationType))
			return Optional.empty();
		String oidcIdToken = currentUser.getOidcIdToken(); 
		String oidcState = currentUser.getOidcState(); 
		String oidcLogout = configs.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT.value());
		if(oidcLogout != null && !oidcLogout.isEmpty()) {
			String aux = oidcLogout + "?id_token_hint=" + oidcIdToken + "&state=" + oidcState; 
			String redirect_uri = configs.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value()); 
			aux = redirect_uri != null && !redirect_uri.isEmpty() ? aux + "&post_logout_redirect_uri=" + redirect_uri : aux;
			return Optional.of(aux);
		}
		return Optional.empty();
	}
	
}
