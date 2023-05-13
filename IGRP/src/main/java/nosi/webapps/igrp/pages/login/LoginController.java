package nosi.webapps.igrp.pages.login;


import static nosi.core.i18n.Translator.gt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URI;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;
import javax.servlet.http.Cookie;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.core.Form;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.AuthenticateRequestDTO;
import nosi.core.integration.autentika.dto.ClaimDTO;
import nosi.core.integration.autentika.dto.RemoteUserStoreManagerServiceConstants;
import nosi.core.integration.autentika.dto.UserClaimValuesRequestDTO;
import nosi.core.integration.autentika.dto.UserClaimValuesResponseDTO;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Session;
import nosi.webapps.igrp.dao.User;
/*----#end-code----*/

public class LoginController extends Controller {

	/*----#start-code(custom_actions)----*/
	
	private Properties settings; 
	
	public LoginController() {
		settings = this.configApp.getMainSettings(); 
	}

	public Response actionLogin() throws Exception { 
		
		Response r = createResponseForRetrieveAccount(); 
		if(r != null) return r; 
		
		Login model = new Login();
		LoginView view = new LoginView(model);
		
		
		r = createResponseIfIsAuthenticated();
		if(r != null) return r; 
		
		
		r = createResponseApplyingActivation(); 
		if(r != null) return r;  
		
		
		r = oAuth2Wso2(); 
		if(r != null) return r; 
		
		r = createResponseOauth2OpenIdIdentityServer();
		if(r != null) return r; 

		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) { 
			
			model.load(); 
			
			r = mainAuthentication(model.getUser(), model.getPassword()); 
			if(r != null) return r; 
			
			return redirect("igrp", "login", "login", this.queryString()); 
		} 
		
		String aux = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.value());
		boolean isDb = this.getConfig().getAutenticationType().equals("db");
		if ((aux != null && !aux.isEmpty() && aux.equals("true")) || isDb) {
			view.user.setLabel("Username");
			view.user.propertie().setProperty("type", "text");
		}
		
		return this.renderView(view, true);
	}

	public Response actionLogout() throws IOException { 
		
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId(); 
		
		User user = Core.getCurrentUser(); 
		String oidcIdToken = user.getOidcIdToken(); 
		String oidcState = user.getOidcState(); 
		
		user.setIsAuthenticated(0); 
		user = user.update();
		if (Igrp.getInstance().getUser().logout() && user != null && !user.hasError()) {
			if (!Session.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,
						gt("Ooops !!! Ocorreu um erro com registo session ..."));
		} else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ocorreu um erro no logout.")); 
		
		// Clear all cookies but lang
		for (Cookie c : Igrp.getInstance().getRequest().getCookies()) {
			if (!c.getName().equals("igrp_lang")) {
				c.setMaxAge(0);
				c.setValue(null);
				Igrp.getInstance().getResponse().addCookie(c);
			}
		}
		
		String r = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value()); 
		if(r != null && r.equalsIgnoreCase(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value())) {
			String oidcLogout = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT.value()); 
			if(oidcLogout != null && !oidcLogout.isEmpty()) {
				String aux = oidcLogout + "?id_token_hint=" + oidcIdToken + "&state=" + oidcState; 
				String redirect_uri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value()); 
				aux = redirect_uri != null && !redirect_uri.isEmpty() ? aux + "&post_logout_redirect_uri=" + redirect_uri : aux;
				
				return redirectToUrl(aux); 
			}
			
			return redirectToUrl(createUrlForOAuth2OpenIdRequest()); 
		}
		
		return this.redirect("igrp", "login", "login"); 
	}

	// Dont delete this method
	public Response actionGoToLogin() throws IOException {
		return this.redirect("igrp", "login", "login");
	}
	
	private Response createResponseIfIsAuthenticated() { 
		if (Igrp.getInstance().getUser().isAuthenticated()) { 
			User u = Core.getCurrentUser();
			if(u.getIsAuthenticated() == 0) { 
				try {
					return redirect("igrp", "login", "logout");
				} catch (IOException e) {
				}
			}
			
			
			// Previous here 
			
			try { 
				String state = Core.getParam("state"); 
				if(state != null && !state.isEmpty()) 
					this.addQueryString("dad", state); 
				return this.redirect("igrp", "home", "index", this.queryString()); 
			}catch (Exception e) {
			}
		}
		return null;
	}
	
	
	public Response createResponseApplyingActivation() {
		// Activation key 
		String activation_key = Igrp.getInstance().getRequest().getParameter("activation_key");
		if (activation_key != null && !activation_key.trim().isEmpty()) {
			try {
				User user = new User().find().andWhere("activation_key", "=", activation_key).one();
				activation_key = new String(Base64.getUrlDecoder().decode(activation_key));
				if (user != null && activation_key.compareTo(System.currentTimeMillis() + "") > 0
						&& user.getStatus() == 0) {
					user.setStatus(1);
					user = user.update();
					Core.setMessageSuccess("Ativação bem sucedida. Faça o login !!!");
				} else {
					Core.setMessageError("Ooops !!! Ocorreu um erro na activação.");
				}
			} catch (Exception e) {
				Core.setMessageError("Ooops !!! Ocorreu um erro na activação.");
			}
			try { 
				String oidc = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
				if(oidc != null && oidc.equalsIgnoreCase("true")) 
					return redirectToUrl(createUrlForOAuth2OpenIdRequest());
				
				return redirect("igrp", "login", "login", this.queryString());
			} catch (Exception e) {
			}
		}
		
		return null;
	}
	
	private Response mainAuthentication(String username, String password) {
		String authenticationType = this.getConfig().getAutenticationType(); 
		if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value())) {
				if (loginWithDb(username, password)) {
					
					// Previous here ... 
					
					try {
						return this.redirect("igrp", "home", "index"); // By default go to home index url 
					}catch (Exception e) {
					}
				}
		}else 
			if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_LDAP.value())) {
				if (this.loginWithLdap(username, password)) {
					
					// Previous here 
					
					try {
						return this.redirect("igrp", "home", "index"); // By default go to home index url 
					}catch (Exception e) {
					}
				}
			}
		
		return null; 
	}
	
	private boolean loginWithDb(String username, String password) { 
		boolean success = false;
		User user = (User) new User().findIdentityByUsername(username);
		if (user != null && user.validate(nosi.core.webapp.User.encryptToHash(username + "" + password, "SHA-256")) && userIsAuthenticatedFlag(user)) {
			if (user.getStatus() == 1) {
				Profile profile = new Profile().getByUser(user.getId());
				if (profile != null && Igrp.getInstance().getUser().login(user, -1)) { 
					if (!Session.afterLogin(profile))
						Core.setMessageError("Ooops !!! Error no registo session ...");
					// String backUrl = Route.previous(); // remember the last url that was 
					success = true;
				} else
					Core.setMessageError("Ooops !!! Ocorreu um INTERNAL_ERROR ... Login inválido.");
			} else
				Core.setMessageError("Utilizador desativado. Por favor contacte o Administrador.");
		} else 
			Core.setMessageError("A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
			
		return success;
	}
	
	private boolean loginWithLdap(String username, String password) {
		boolean success = false;
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		
		String idsAutentikaEnabled = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value()); 
		if(idsAutentikaEnabled != null && idsAutentikaEnabled.equalsIgnoreCase("true"))
			success = authenticateThroughIdentityServerAutentika(username, password, personArray);
		else 
			success = authenticateDirectlyToLDAPServer(username, password, personArray); 
		
		if (success) {
			// Verify if this credentials exist in DB
			User user = (User) new User().findIdentityByUsername(username);
			if (user != null) {
				/*
				 * password = nosi.core.webapp.User.encryptToHash(password, "SHA-256");
				 * if((user.getPass_hash() == null) || (user.getPass_hash() != null &&
				 * !user.getPass_hash().equals(password))) { user.setPass_hash(password); //
				 * Anyway !!! update the user's password and encrypt it ... user.update(); }
				 */
				/** Begin create user session **/ 
				
				success = createSessionLdapAuthentication(user) && userIsAuthenticatedFlag(user); 
				
				sso(username, password, user); 

				/** End create user session **/ 

			} else {
				if (this.getConfig().getEnvironment().equals(ConfigCommonMainConstants.IGRP_ENV_DEV.value())) { // auto invite 
					User newUser = new User();
					newUser.setUser_name(username.trim().toLowerCase());

					if (personArray != null && personArray.size() > 0)
						for (int i = 0; i < personArray.size(); i++) {
							LdapPerson p = personArray.get(i);

							if (p.getName() != null && !p.getName().isEmpty())
								newUser.setName(p.getName());
							else if (p.getDisplayName() != null && !p.getDisplayName().isEmpty())
								newUser.setName(p.getDisplayName());
							else
								newUser.setName(p.getFullName());

							newUser.setEmail(p.getMail().toLowerCase());
						}

					newUser.setStatus(1);
					newUser.setCreated_at(System.currentTimeMillis());
					newUser.setUpdated_at(System.currentTimeMillis());
					newUser.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
					newUser.setActivation_key(nosi.core.webapp.User.generateActivationKey());
					newUser.setIsAuthenticated(1);

					newUser = newUser.insert();

					if (newUser != null) {

						sso(username, password, newUser);

						if(createPerfilWhenAutoInvite(newUser))
							return createSessionLdapAuthentication(newUser);
						
					}

				} else {
					success = false;
					Core.setMessageError(gt("Esta conta não tem acesso ao IGRP. Por favor, contacte o Administrador."));
				}
			}
		} else 
			Core.setMessageError(gt("A sua conta ou palavra-passe está incorreta."));

		return success;
	}
	
	private boolean authenticateDirectlyToLDAPServer(String username, String password, ArrayList<LdapPerson> personArray) {
		NosiLdapAPI ldap = new NosiLdapAPI(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_URL.value()), 
				settings.getProperty(ConfigCommonMainConstants.LDAP_AD_USERNAME.value()), 
				settings.getProperty(ConfigCommonMainConstants.LDAP_AD_PASSWORD.value()),
				settings.getProperty(ConfigCommonMainConstants.LDAP_AD_BASE.value()), 
				settings.getProperty(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.value()), 
				settings.getProperty(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.value()));
		return ldap.validateLogin(username, password, personArray); 
	}
	
	private boolean authenticateThroughIdentityServerAutentika(String username, String password, List<LdapPerson> personArray) {
		boolean flag = false;
		String wsdlUrl = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value());
		String uid = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value()); 
		String pwd = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value());
		String v = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.value());
		username = v != null && v.equalsIgnoreCase("true") ? RemoteUserStoreManagerServiceConstants.GOVCV_TENANT + "/" + username : username;
		RemoteUserStoreManagerServiceSoapClient client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		AuthenticateRequestDTO authenticateRequestDTO = new AuthenticateRequestDTO(); 
		authenticateRequestDTO.setUserName(username);
		authenticateRequestDTO.setCredential(password);
		if(client.authenticate(authenticateRequestDTO)) {
			UserClaimValuesRequestDTO userClaimValuesRequestDTO = new UserClaimValuesRequestDTO();
			userClaimValuesRequestDTO.setUserName(username);
			UserClaimValuesResponseDTO userClaimValuesResponseDTO = client.getUserClaimValues(userClaimValuesRequestDTO);
			if(userClaimValuesResponseDTO != null) {
				// Pesquisar user from Ids
				List<ClaimDTO> claimDTOs = userClaimValuesResponseDTO.getClaimDTOs();
				claimDTOs.forEach(obj -> {
					LdapPerson ldapPerson = new LdapPerson();
					switch (obj.getClaimUri()) {
						case RemoteUserStoreManagerServiceConstants.DISPLAYNAME_CLAIM_URI:
							ldapPerson.setDisplayName(obj.getValue());
							break;
						case RemoteUserStoreManagerServiceConstants.GIVENNAME_CLAIM_URI:
							ldapPerson.setGivenName(obj.getValue());
							break;
						case RemoteUserStoreManagerServiceConstants.EMAIL_CLAIM_URI:
							ldapPerson.setUid(obj.getValue());
							ldapPerson.setMail(obj.getValue());
							break;
						case RemoteUserStoreManagerServiceConstants.FULLNAME_CLAIM_URI:
							ldapPerson.setFullName(obj.getValue());
							break;
						case RemoteUserStoreManagerServiceConstants.LASTNAME_CLAIM_URI:
							ldapPerson.setLastName(obj.getValue());
							break;
					}
					personArray.add(ldapPerson);
				});
				flag = !claimDTOs.isEmpty();
			}
		}
		return flag;
	}
	
	
	private boolean sso(String username, String password, User dao) {
		// boolean flag = true;
		String client_id = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
		String client_secret = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_SECRET.value());
		String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_TOKEN.value());
		String postData = "grant_type=password" + "&username=" + username + "&password=" + password + "&client_id="
				+ client_id + "&client_secret=" + client_secret + "&scope=openid";
		try {
			HttpURLConnection curl = (HttpURLConnection) URI.create(endpoint).toURL().openConnection();
			curl.setDoOutput(true);
			curl.setDoInput(true);
			curl.setInstanceFollowRedirects(false);
			curl.setRequestMethod("POST");
			curl.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			curl.setRequestProperty("charset", "utf-8");
			curl.setRequestProperty("Content-Length", (postData.length()) + "");
			curl.setUseCaches(false);                           
			curl.getOutputStream().write(postData.getBytes());
			curl.connect(); 
			int code = curl.getResponseCode();
			if (code != 200) return false;
			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
			String result = "";
			String token = "";
			result = br.lines().collect(Collectors.joining());
			JSONObject jToken = new JSONObject(result);
			token = (String) jToken.get("access_token");
			dao.setValid_until(token);
			dao = dao.update();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	private boolean createSessionLdapAuthentication(User user) {
		boolean result = true;
		if (user.getStatus() == 1) {
			Profile profile = new Profile().getByUser(user.getId());
			
			if (profile != null && Igrp.getInstance().getUser().login(user, -1)) {
				if (!Session.afterLogin(profile)) {
					result = false;
					Core.setMessageError(gt("Ooops !!! Error no registo session. "));
					// String backUrl = Route.previous(); // remember the last url that was 
					// requested by the user
				}
			} else {
				result = false;
				Core.setMessageError(gt("Ooops !!! Login inválido. "));
			}
		} else {
			result = false;
			Core.setMessageError("Utilizador desativado. Por favor contacte o Administrador.");
		}
		return result;
	}
	
	
	private Response createResponseForRetrieveAccount() {
		// Go to password recover page ... 
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			String p_button2 = Igrp.getInstance().getRequest().getParameter("p_button2");
			if (p_button2 != null && p_button2.equals("p_button2")) {
				String url = Igrp.getInstance().getRequest().getRequestURL().toString()
						+ "?r=igrp/Resetbyemail/index&target=_blank&isPublic=1";
				return redirectToUrl(url);
			}
		}
		
		return null;
	}
	
	public Map<String, String> oAuth2Wso2Swap() {
		
		try {
			String authCode = Core.getParam("code"); 
			String session_state = Core.getParam("session_state"); 
			
			if(authCode == null || authCode.isEmpty()) return null; 
			
			String client_id = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
			String client_secret = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_SECRET.value());
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_TOKEN.value());
			
			String redirect_uri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
			String warName = Core.getDeployedWarName();
			redirect_uri = redirect_uri.replace("IGRP", warName);
			
			Form postData = new Form(); 
			postData.param("grant_type", "authorization_code"); 
			postData.param("code", authCode); 
			postData.param("redirect_uri", redirect_uri); 
			postData.param("scope", "openid email profile");
			
			Client curl = ClientBuilder.newClient();
			Invocation.Builder ib = curl.target(endpoint).request("application/x-www-form-urlencoded");
			ib.header("Accept", "application/json");
			ib.header("Authorization",  "Basic " + Base64.getEncoder().encodeToString((client_id + ":" + client_secret).getBytes()));
			javax.ws.rs.core.Response r = ib.post(Entity.form(postData), javax.ws.rs.core.Response.class);
			
			
			String resultPost = r.readEntity(String.class); 
			
			curl.close();
			
			int code = r.getStatus(); 
			
			if (code != 200) return null;

			JSONObject jToken = new JSONObject(resultPost);
			
			String token = (String) jToken.get("access_token");
			String id_token = (String) jToken.get("id_token");
			String refresh_token = (String) jToken.get("refresh_token"); 
			
			Map<String, String> m = new HashMap<String, String>(); 
			m.put("access_token", token);
			m.put("id_token", id_token);
			m.put("session_state", session_state);
			m.put("refresh_token", refresh_token);
			
			return m;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private Map<String, String> oAuth2Wso2GetUserInfoByToken(String token) {
		Map<String, String> uid = null;
		try {
			
			String endpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_USER.value());
			
			Client curl = ClientBuilder.newClient();
			javax.ws.rs.core.Response r = curl.target(endpoint)
											.request()
											.header("Accept", "application/json")
											.header("Authorization", "Bearer " + token) 
											.get(javax.ws.rs.core.Response.class);  
			
			int code = r.getStatus();
			
			if(code != 200) return uid; 
			
			String result = r.readEntity(String.class); 
			
			curl.close();

			JSONObject jToken = new JSONObject(result); 
			
			
			uid = new HashMap<String, String>();
			
			uid.put("sub", getAttributeStringValue(jToken,"sub"));			
			uid.put("email", getAttributeStringValue(jToken, "email") ); 			
			uid.put("birthdate", getAttributeStringValue(jToken, "birthdate"));
			uid.put("name", getAttributeStringValue(jToken, "name"));
			uid.put("phone_number", getAttributeStringValue(jToken, "phone_number"));
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return uid;
	}
	
	private String getAttributeStringValue(JSONObject obj, String attibute) {		
		log.info("[obj]="+obj);
		
		String _value = null;
		try {
			_value = obj.getString(attibute);
		}catch(JSONException je) {
			log.warn(je);
			_value = null;
		}
		
		return _value;
	}
	
	public Response oAuth2Wso2() {
		
		String error = Core.getParam("error"); 
		String r = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value()); 
		String authCode = Core.getParam("code");  
		String state = Core.getParam("state"); 
		
		if(r != null && r.equalsIgnoreCase(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value())) {
			
			if(error != null && !error.isEmpty() && !error.equalsIgnoreCase("null")) {
				Core.setMessageError("Ocorreu o seguinte erro: (" + error + ").");
				return redirectToUrl(createUrlForOAuth2OpenIdRequest());
			}
			
			String token = null;
			String id_token = null;
			String session_state = null;
			String refresh_token = null;
			
			Map<String, String> m = oAuth2Wso2Swap();
			if(m != null) {
				token = m.get("access_token"); 
				id_token = m.get("id_token"); 
				session_state = m.get("session_state"); 
				refresh_token = m.get("refresh_token"); 
				
				Core.addToSession("_oidcIdToken", id_token); 
				Core.addToSession("_oidcState", session_state); 

			}
			if(token != null) {
				Map<String, String> _r = oAuth2Wso2GetUserInfoByToken(token);
				if(_r != null && _r.containsKey("email") && _r.containsKey("sub")) {
					
					String email = _r.get("email") != null ? _r.get("email").trim().toLowerCase() : ""; 
					
					log.info("email="+email);
					String uid = _r.get("sub");
					String name = _r.get("name");
					String phone_number = _r.get("phone_number");
					
					this.addQueryString("dad", state); 
					
					User user = new User();
					
					if (uid != null /*& _r.containsKey("birthdate")*/) {
						try {
							log.info("GET USER BY cni");
							user = new User().find().andWhere("cni", "=", uid).one(); 
							log.info("USER BY id="+user.getId());
						} catch(Exception e) {
							log.warn(e);
							if (email != null) {
								user = new User().find().andWhere("email", "=", email).one(); 
							}
						}
						
					}else if (email != null) {
						user = new User().find().andWhere("email", "=", email).one(); 
					}
					
					if (user != null) {
						if(user.getStatus() != 1) {
							Core.setMessageWarning("Este utilizador "+user.getName()+" encontra-se desativado."); 
							return redirectToUrl(createUrlForOAuth2OpenIdRequest());
						}
						this.afterLogin(user);
						if(createSessionLdapAuthentication(user)) {
							try {
								user.setValid_until(token);
								user.setOidcIdToken(id_token);
								user.setOidcState(session_state);
								user.setIsAuthenticated(1);
								user.setRefreshToken(refresh_token);
								user = user.update();
								
								return redirect("igrp", "home", "index", this.queryString());  
							} catch (Exception e) {
							}
						}
						
					}else { 
						// Caso o utilizador não existir na base de dados fazer auto-invite no quando env=dev ... 
						if(new Config().getEnvironment().equalsIgnoreCase(ConfigCommonMainConstants.IGRP_ENV_DEV.value())) {
							
							try {
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
			
								newUser = newUser.insert(); 
								this.afterLogin(user);
								if(newUser != null && createPerfilWhenAutoInvite(newUser) && createSessionLdapAuthentication(newUser)) { 
									newUser.setValid_until(token);
									newUser.setOidcIdToken(id_token);
									newUser.setOidcState(session_state);
									newUser.setRefreshToken(refresh_token);
									newUser.update();
									
									return redirect("igrp", "home", "index", this.queryString()); 
								}
							} catch (Exception e) {
								e.printStackTrace();
								Core.setMessageError("Ocorreu um erro no auto-invite.");
								return redirectToUrl(createUrlForOAuth2OpenIdRequest());
							}
						}else {
							Core.setMessageWarning("Utilizador com o e-mail: "+email+", não está convidado."); 
							return redirectToUrl(createUrlForOAuth2OpenIdRequest());
						}
						
					}
				}else {
						if(authCode != null && !authCode.trim().isEmpty()) {
							Core.setMessageError("Ocorreu o seguinte erro: (Uid não encontrado).");
						return redirectToUrl(createUrlForOAuth2OpenIdRequest());
					}
				}
			}else {
				if(authCode != null && !authCode.trim().isEmpty()) {
					Core.setMessageError("Ocorreu o seguinte erro: (Token não encontrado).");
					return redirectToUrl(createUrlForOAuth2OpenIdRequest());
				}
			}
			if((error == null || error.isEmpty()) && (authCode == null || authCode.isEmpty()) && (r != null && r.equalsIgnoreCase("true"))) 
				return createResponseOauth2OpenIdIdentityServer();
			
		}
		
		return null;
	}
	
	private void afterLogin(User user) {
		String dad = Core.getParam("dad");
		if(Core.isNotNull(dad) && !dad.equalsIgnoreCase("igrp") && !dad.equalsIgnoreCase("igrp_studio") && !dad.equalsIgnoreCase("tutorial")) {
			String packageName = "nosi.webapps."+dad.trim()+".AfterLogin";
			Class<?> c;
			try {
				c = Class.forName(packageName);
				if(c!=null) {
					Method method = c.getMethod("afterLogin",User.class);
					method.invoke(c.getDeclaredConstructor().newInstance(), user);//after login implementation
				}
			} catch (Exception e) {
				
			}
		}
	}

	private Response createResponseOauth2OpenIdIdentityServer() {
		String r = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value()); 
		String url = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE.value()); 
		if(r != null && r.equalsIgnoreCase(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value()) && url != null && !url.isEmpty()) {
			String redirect_uri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value()); 
			String warName = Core.getDeployedWarName(); 
			redirect_uri = redirect_uri.replace("IGRP", warName); 
			String client_id = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value()); 
			url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=igrp&redirect_uri=" + redirect_uri; 
			
			return redirectToUrl(url); 
		}
		return null;
	}
	
	private String createUrlForOAuth2OpenIdRequest() { 
		String aux = Igrp.getInstance().getRequest().getRequestURL().toString();
		aux += "?r=igrp/Oauth2openidwso2/index&target=_blank&isPublic=1&lang=pt_PT"; 
		return aux; 
	}
	
	private boolean createPerfilWhenAutoInvite(User user) { 
		Profile p1 = new Profile(); 
		p1.setUser(user);
		p1.setOrganization(new Organization().findOne(3));
		p1.setProfileType(new ProfileType().findOne(4));
		p1.setType("PROF");
		p1.setType_fk(4);

		Profile p2 = new Profile();
		p2.setUser(user);
		p2.setOrganization(new Organization().findOne(3));
		p2.setProfileType(new ProfileType().findOne(4));
		p2.setType("ENV");
		p2.setType_fk(3);

		Profile tutorialApp = new Profile();
		tutorialApp.setUser(user);
		tutorialApp.setOrganization(new Organization().findOne(2));
		tutorialApp.setProfileType(new ProfileType().findOne(3));
		tutorialApp.setType("ENV");
		tutorialApp.setType_fk(2);

		return p1.insert() != null && p2.insert() != null && tutorialApp.insert() != null;
	}
	
	private boolean userIsAuthenticatedFlag(User u) {
		u.setIsAuthenticated(1);
		u = u.update();
		return u != null && !u.hasError();
	} 

	
	private static Logger log = LogManager.getLogger(LoginController.class);
	/*----#end-code----*/
}
