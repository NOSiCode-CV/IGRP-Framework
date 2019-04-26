package nosi.webapps.igrp.pages.login;

import static nosi.core.i18n.Translator.gt;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;
import java.util.stream.Collectors;
import javax.servlet.http.Cookie;
import javax.xml.bind.JAXB;
import org.json.JSONArray;
import org.json.JSONObject;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;
import nosi.core.config.Config;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Route;
import nosi.core.webapp.security.Permission;
import nosi.webapps.igrp.dao.OAuthClient;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Session;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.UserRole;
import service.client.WSO2UserStub;

/**
 * Marcel Iekiny Oct 4, 2017
 */
/*----#start-code(packages_import)----*/

/*----#end-code----*/

public class LoginController extends Controller {

	/*----#start-code(custom_actions)----*/

	private Properties settings = loadConfig("common", "main.xml");

	public Response actionLogin() throws Exception {
		
		Response r = createResponseForRetrieveAccount();
		if(r != null) return r; 
		
		Login model = new Login();
		LoginView view = new LoginView(model);
		
		
		r = createResponseIfIsAuthenticated();
		if(r != null) return r; 
		
		
		r = createResponseIfNotAuthenticated_nhaLogin();
		if(r != null) return r; 
		
		r = oAuth2Wso2();
		if(r != null) return r;
		
		r = createResponseApplyingActivation();
		if(r != null) return r;  
		
		
		r = createResponseOauth2OpenIdWso2();
		if(r != null) return r; 
		
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			
			model.load();
			
			r = mainAuthentication(model.getUser(), model.getPassword());
			if(r != null) return r; 
			
			return redirect("igrp", "login", "login", this.queryString()); 
		}
		
		String aux = settings.getProperty("igrp.authentication.govcv.enbaled");
		boolean isDb = this.getConfig().getAutenticationType().equals("db");
		if ((aux != null && !aux.isEmpty() && aux.equals("true")) || isDb) {
			view.user.setLabel("Username");
			view.user.propertie().setProperty("type", "text");
		}
		
		return this.renderView(view, true);
	}

	public Response actionLogout() throws IOException {
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
		if (Igrp.getInstance().getUser().logout()) {
			if (!Session.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,
						gt("Ooops !!! Ocorreu um erro com registo session ..."));
		} else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ocorreu um erro no logout."));

		if (settings.getProperty("igrp.env.isNhaLogin") != null
				&& !settings.getProperty("igrp.env.isNhaLogin").equals("true")
				&& settings.getProperty("igrp.env.nhaLogin.url") != null
				&& !settings.getProperty("igrp.env.nhaLogin.url").isEmpty()) {
			String _url = settings.getProperty("igrp.env.nhaLogin.url").replace("igrp/login/login",
					"igrp/login/logout");
			return redirectToUrl(_url);
		}
		// Clear the cookies
		for (Cookie c : Igrp.getInstance().getRequest().getCookies()) {
			if (c.getName().equals("igrp_lang"))
				continue;
			c.setMaxAge(0);
			c.setValue(null);
			Igrp.getInstance().getResponse().addCookie(c);
		}
		return this.redirect("igrp", "login", "login");
	}

	// Dont delete this method
	public Response actionGoToLogin() throws IOException {
		return this.redirect("igrp", "login", "login");
	}

	

	private Properties loadConfig(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath()
				.replaceAll("%20", " "));

		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
	private Response createResponseIfIsAuthenticated() {
		if (Igrp.getInstance().getUser().isAuthenticated()) {

			if (settings.getProperty("igrp.env.isNhaLogin") != null
					&& settings.getProperty("igrp.env.isNhaLogin").equals("true")) {
				String url = Igrp.getInstance().getRequest().getRequestURL().toString();
				url = url.replace("app/webapps", "mylinks.jsp");
				return redirectToUrl(url);
			}

			String destination = Route.previous();
			if (destination != null) {
				String qs = URI.create(destination).getQuery();
				qs = qs.substring(qs.indexOf("r=") + "r=".length());
				String param[] = qs.split("/");
				new Permission().changeOrgAndProfile(param[0]);
				return this.redirectToUrl(destination);
			}
			try {
				return this.redirect("igrp", "home", "index");
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
				return redirect("igrp", "login", "login", this.queryString());
			} catch (Exception e) {
			}
		}
		
		return null;
	}
	
	private Response createResponseIfNotAuthenticated_nhaLogin() {
		if (!Igrp.getInstance().getUser().isAuthenticated() && settings.getProperty("igrp.env.isNhaLogni") != null
				&& !settings.getProperty("igrp.env.isNhaLogin").equals("true")
				&& settings.getProperty("igrp.env.nhaLogin.url") != null
				&& !settings.getProperty("igrp.env.nhaLogin.url").isEmpty()) {
			return redirectToUrl(settings.getProperty("igrp.env.nhaLogin.url"));
		}
		return null;
	}
	
	private Response mainAuthentication(String username, String password) {
		switch (this.getConfig().getAutenticationType()) {
			case "db": 
				if (loginWithDb(username, password)) { 
					String destination = Route.previous(); 
					if (destination != null) {
						String qs = URI.create(destination).getQuery();
						qs = qs.substring(qs.indexOf("r=") + "r=".length());
						String param[] = qs.split("/");
						new Permission().changeOrgAndProfile(param[0]);
						
						return this.redirectToUrl(destination);
					}
					try {
						return this.redirect("igrp", "home", "index"); // By default go to home index url 
					}catch (Exception e) {
					}
			}
			break; 
			case "ldap": 
				if (this.loginWithLdap(username, password)) {
					if (settings.getProperty("igrp.env.isNhaLogin") != null
							&& settings.getProperty("igrp.env.isNhaLogin").equals("true")) {
						return checkEnvironments_nhaLogin(username);
					}
					// TODO by Marcos: must decrypt de URL when you do Route.remenber()
					String destination = Route.previous(); 
					if (destination != null) {
						String qs = URI.create(destination).getQuery();
						qs.indexOf("r=");
						qs = qs.substring(qs.indexOf("r=") + "r=".length());
						String param[] = qs.split("/");
						new Permission().changeOrgAndProfile(param[0]);
						return this.redirectToUrl(destination);
					}
					try {
						return this.redirect("igrp", "home", "index"); // By default go to home index url 
					}catch (Exception e) {
					}
				}
			break; 
		}
		
		return null; 
	}
	
	private boolean loginWithDb(String username, String password) { 
		boolean success = false;
		User user = (User) new User().findIdentityByUsername(username);
		if (user != null && user.validate(nosi.core.webapp.User.encryptToHash(username + "" + password, "SHA-256"))) {
			if (user.getStatus() == 1) {
				Profile profile = new Profile().getByUser(user.getId());
				if (profile != null && Igrp.getInstance().getUser().login(user, 60 * 60/* 1h */)) { // 3600 * 24 * 30
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
	
	private Response checkEnvironments_nhaLogin(String uid) {
		try {
			User user = new User().find().andWhere("user_name", "=", uid).one();
			String token = Base64.getEncoder()
					.encodeToString((user.getUser_name() + ":" + user.getValid_until()).getBytes());
			URL url = new URL(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"));
			WSO2UserStub.disableSSL();
			WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
			stub.applyHttpBasicAuthentication(settings.getProperty("ids.wso2.admin-usn"),
					settings.getProperty("ids.wso2.admin-pwd"), 2);

			List<String> roles = stub.getOperations().getRoleListOfUser(uid);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("token", token);
			JSONArray jsonArray = new JSONArray();
			jsonObject.put("myLinks", jsonArray);

			roles.forEach(obj -> {
				jsonArray.put(obj);
			});

			Igrp.getInstance().getRequest().getSession().setAttribute("__links", jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		String url = Igrp.getInstance().getRequest().getRequestURL().toString();
		url = url.replace("app/webapps", "mylinks.jsp");

		return redirectToUrl(url);
	}
	
	
	
	
	private boolean loginWithLdap(String username, String password) {
		
		boolean success = false;
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();

		if (settings.getProperty("ids.wso2.enabled") != null && settings.getProperty("ids.wso2.enabled").equalsIgnoreCase("true")) {
			success = authenticateThroughWso2(username, password, personArray);
		} 

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
				
				success = createSessionLdapAuthentication(user);
				
				sso(username, password, user);

				/** End create user session **/

			} else {
				if (this.getConfig().getEnvironment().equals("dev")
						|| (settings.getProperty("igrp.env.isNhaLogin") != null
								&& settings.getProperty("igrp.env.isNhaLogin").equals("true"))) { // Active Directory
																									// Ldap Server ...
																									// autoinvite the
																									// user for
																									// IgrpStudio 
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

					newUser = newUser.insert();

					if (newUser != null) {

						sso(username, password, newUser);

						Profile p1 = new Profile();
						p1.setUser(newUser);
						p1.setOrganization(new Organization().findOne(3));
						p1.setProfileType(new ProfileType().findOne(4));
						p1.setType("PROF");
						p1.setType_fk(4);

						Profile p2 = new Profile();
						p2.setUser(newUser);
						p2.setOrganization(new Organization().findOne(3));
						p2.setProfileType(new ProfileType().findOne(4));
						p2.setType("ENV");
						p2.setType_fk(3);

						Profile tutorialApp = new Profile();
						tutorialApp.setUser(newUser);
						tutorialApp.setOrganization(new Organization().findOne(2));
						tutorialApp.setProfileType(new ProfileType().findOne(3));
						tutorialApp.setType("ENV");
						tutorialApp.setType_fk(2);

						if (p1.insert() != null && p2.insert() != null && tutorialApp.insert() != null)
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
	
	private boolean authenticateThroughWso2(String username, String password, List<LdapPerson> personArray) {
		boolean flag = false;
			try {
				URL url = new URL(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"));
				WSO2UserStub.disableSSL();
				WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
				stub.applyHttpBasicAuthentication(settings.getProperty("ids.wso2.admin-usn"),
						settings.getProperty("ids.wso2.admin-pwd"), 2);
				
				flag = stub.getOperations().authenticate(username, password);

				String v = settings.getProperty("igrp.authentication.govcv.enbaled");

				if (v.equalsIgnoreCase("true"))
					username = "gov.cv/" + username;

				// Pesquisar user from Ids
				List<ClaimDTO> result = stub.getOperations().getUserClaimValues(username, "");
				LdapPerson ldapPerson = new LdapPerson();
				result.forEach(obj -> {
					switch (obj.getClaimUri().getValue()) {
					case "http://wso2.org/claims/displayName":
						ldapPerson.setDisplayName(obj.getValue().getValue());
						break;
					case "http://wso2.org/claims/givenname":
						ldapPerson.setGivenName(obj.getValue().getValue());
						break;
					case "http://wso2.org/claims/emailaddress":
						ldapPerson.setUid(obj.getValue().getValue());
						ldapPerson.setMail(obj.getValue().getValue());
						break;
					case "http://wso2.org/claims/fullname":
						ldapPerson.setFullName(obj.getValue().getValue());
						break;
					case "http://wso2.org/claims/lastname":
						ldapPerson.setLastName(obj.getValue().getValue());
						break;

					}
				});
				personArray.add(ldapPerson);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
		return flag;
	}
	
	
	private boolean sso(String username, String password, User dao) {
		// boolean flag = true;
		String client_id = settings.getProperty("ids.wso2.oauth2.client_id");
		String client_secret = settings.getProperty("ids.wso2.oauth2.client_secret");
		String endpoint = settings.getProperty("ids.wso2.oauth2.endpoint.token");
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

			if (code != 200) {
				return false;
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));

			String result = "";
			String token = "";

			result = br.lines().collect(Collectors.joining());

			JSONObject jToken = new JSONObject(result);

			token = (String) jToken.get("access_token");

			dao.setValid_until(token);
			dao = dao.update();

			System.out.println("DAO getId: " + dao.getId());

			System.out.println("DAO: " + dao.getValid_until());

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
			if (profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)) {
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
	
	private String oAuth2Wso2Swap() {
		
		try {
			String authCode = Core.getParam("code"); 
			
			if(authCode == null || authCode.isEmpty()) return null; 
			
			String client_id = settings.getProperty("ids.wso2.oauth2.client_id");
			String client_secret = settings.getProperty("ids.wso2.oaut4h2.client_secret");
			String endpoint = settings.getProperty("ids.wso2.oauth2.endpoint.token");
			String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri");
			
			String postData = "grant_type=authorization_code&code=" + authCode + "&redirect_uri=" + redirect_uri;

			HttpURLConnection curl = (HttpURLConnection) URI.create(endpoint).toURL().openConnection();
			curl.setDoOutput(true);
			curl.setDoInput(true);
			curl.setInstanceFollowRedirects(false);
			curl.setRequestMethod("POST");
			curl.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			curl.setRequestProperty("charset", "utf-8");
			curl.setRequestProperty("Content-Length", (postData.length()) + "");
			curl.setRequestProperty("Authorization", "Basic " + Base64.getEncoder().encodeToString((client_id + ":" + client_secret).getBytes()));
			curl.setUseCaches(false);
			curl.getOutputStream().write(postData.getBytes());

			curl.connect();

			int code = curl.getResponseCode();

			if (code != 200) return null;

			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));

			String result = "";
			String token = "";

			result = br.lines().collect(Collectors.joining());

			JSONObject jToken = new JSONObject(result);

			token = (String) jToken.get("access_token");
			
			System.out.println("Token: " + token);
			System.out.println("jToken: " + jToken);
			
			return token;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private String oAuth2Wso2GetUserInfoByToken(String token) {
		String uid = null; 
		try {
			
			String endpoint = settings.getProperty("ids.wso2.oauth2.endpoint.user");
			
			HttpURLConnection curl = (HttpURLConnection) URI.create(endpoint).toURL().openConnection();
			curl.setDoOutput(true);
			curl.setDoInput(true);
			curl.setInstanceFollowRedirects(false);
			curl.setRequestProperty("Authorization", "Bearer " + token);
			curl.setUseCaches(false);

			curl.connect();

			int code = curl.getResponseCode();

			if(code != 200) return uid; 

			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));

			String result = "";

			result = br.lines().collect(Collectors.joining());

			JSONObject jToken = new JSONObject(result); 
			
			System.out.println("uid: " + jToken);
			
			uid = jToken.getString("sub");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return uid;
	}
	
	private Response oAuth2Wso2() {
		
		String error = Core.getParam("error"); 
		
		if(error != null && !error.isEmpty()) {
			 try {
				 	Core.setMessageError("Ocorreu o seguinte erro: (" + error + ").");
					return redirect("igrp","Oauth2openidwso2","index&target=_blank&isPublic=1");
				} catch (IOException e) {
				} 
		}
		
		String token = oAuth2Wso2Swap();
		if(token != null) {
			String uid = oAuth2Wso2GetUserInfoByToken(token);
			if(uid != null) {
				
				User user = (User) new User().findIdentityByUsername(uid);
				if (user != null) {
					
					if(createSessionLdapAuthentication(user)) {
						try {
							user.setValid_until(token);
							user.update();
							return redirect("igrp", "home", "index"); 
						} catch (Exception e) {
						}
					}
					
				}else {
					
					// Caso utilizador não existir na base de dados 
					
				}
				
			}
		}
		
		String r = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
		if(r != null && r.equalsIgnoreCase("true")) {
			 try {
				return redirect("igrp","Oauth2openidwso2","index&target=_blank&isPublic=1");
			} catch (IOException e) {
			} 
		}
		
		return null;
	}
	
	private Response createResponseOauth2OpenIdWso2() {
		String r = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
		String url = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
		if(r != null && r.equalsIgnoreCase("true") && url != null && !url.isEmpty()) {
			String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
			String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
			url += "?response_type=code&client_id=" + client_id + "&scope=openid&state=TWILIGHT10&redirect_uri=" + redirect_uri;
		return redirectToUrl(url);
		}
		return null;
	}
	

	/*----#end-code----*/
}
