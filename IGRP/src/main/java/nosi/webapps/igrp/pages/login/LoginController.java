package nosi.webapps.igrp.pages.login;


import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.helpers.Route;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.UserRole;
import nosi.webapps.igrp.dao.OAuthClient;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Session;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.bind.JAXB;

import static nosi.core.i18n.Translator.gt;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import java.util.Properties;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.Adler32;
import java.util.zip.CheckedOutputStream;

import javax.xml.ws.BindingProvider;
import javax.xml.ws.WebServiceException;

import org.apache.openjpa.lib.util.Files;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerServicePortType;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerServiceUserStoreException_Exception;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;
import service.client.WSO2UserStub;
/**
 * Marcel Iekiny
 * Oct 4, 2017
 */
public class LoginController extends Controller {	
	
	public Response actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
	
		String oauth2 = Igrp.getInstance().getRequest().getParameter("oauth");
		String response_type = Igrp.getInstance().getRequest().getParameter("response_type");
		String client_id = Igrp.getInstance().getRequest().getParameter("client_id"); 
		String redirect_uri = Igrp.getInstance().getRequest().getParameter("redirect_uri"); 
		String scope = Igrp.getInstance().getRequest().getParameter("scope");
		
		
		// Activation key 
		String activation_key = Igrp.getInstance().getRequest().getParameter("activation_key");
		if(activation_key != null && !activation_key.trim().isEmpty()) {
			try {
				User user = new User().find().andWhere("activation_key", "=", activation_key).one();
				activation_key = new String(Base64.getUrlDecoder().decode(activation_key));
				if(user != null && activation_key.compareTo(System.currentTimeMillis() + "") > 0 && user.getStatus() == 0) {
					user.setStatus(1);
					user = user.update();
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Ativação bem sucedida. Faça o login !!!"));
				}else {
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Ocorreu um erro na activação."));
				}
			}catch(Exception e) {
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Ocorreu um erro na activação."));
			}
			return redirect("igrp", "login", "login");
		}
		
		// first 
		if(Igrp.getInstance().getUser().isAuthenticated()){
			if(oauth2 != null && oauth2.equalsIgnoreCase("1")) {
				StringBuilder oauth2ServerUrl = new StringBuilder();
				User user = (User) Igrp.getInstance().getUser().getIdentity();
				if(generateOauth2Response(oauth2ServerUrl, user, response_type, client_id, redirect_uri, scope))
					return this.redirectToUrl(oauth2ServerUrl.toString());
				else
					;// Go to error page 
			}
			
			String destination = Route.previous();
			if(destination != null) {
				String qs = URI.create(destination).getQuery();
				qs.indexOf("r=");
				qs = qs.substring(qs.indexOf("r=") + "r=".length());
				String param[] = qs.split("/");
				new Permission().changeOrgAndProfile(param[0]);
				return this.redirectToUrl(destination);
			}
			return this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
		}
		
		Login model = new Login();
		LoginView view = new LoginView(model);
		
		if(oauth2 != null && oauth2.equalsIgnoreCase("1") && !validateOAuth2Parameters(response_type, client_id, redirect_uri, scope)) {
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ocorreu um erro ... Autenticação OAuth2 falhada !"));
			/*return redirect("igrp", "login", "login", 
					new String[] {"oauth", "response_type", "client_id", "redirect_uri", "scope"}, 
					new String[] {"1",response_type, client_id, redirect_uri, scope}); */
		}
		
			if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
				
				model.load();
				
				if(model.getPassword() ==  null || model.getPassword().isEmpty()) {
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("A sua conta ou palavra-passe está incorreta."));
					return this.renderView(view,true);
				}
				
				switch(this.getConfig().getAutenticationType()){
					case "db":
						if(this.loginWithDb(model.getUser(), model.getPassword())) {
							if(oauth2 != null && oauth2.equalsIgnoreCase("1")) {
								StringBuilder oauth2ServerUrl = new StringBuilder();
								User user = (User) Igrp.getInstance().getUser().getIdentity();
								if(generateOauth2Response(oauth2ServerUrl, user, response_type, client_id, redirect_uri, scope)) {
									return this.redirectToUrl(oauth2ServerUrl.toString());
								}
								else
									;// Go to error page 
							}else {
								String destination = Route.previous();
								if(destination != null) {
									String qs = URI.create(destination).getQuery();
									qs.indexOf("r=");
									qs = qs.substring(qs.indexOf("r=") + "r=".length());
									String param[] = qs.split("/");
									new Permission().changeOrgAndProfile(param[0]);
									return this.redirectToUrl(destination);
								}
								return this.redirect("igrp", "home", "index"); // For default go to home index url 
							}
						}
					break;
					
					case "ldap":{
						if(this.loginWithLdap(model.getUser(), model.getPassword())) {
							if(oauth2 != null && oauth2.equalsIgnoreCase("1")) {
								StringBuilder oauth2ServerUrl = new StringBuilder();
								User user = (User) Igrp.getInstance().getUser().getIdentity();
								if(generateOauth2Response(oauth2ServerUrl, user, response_type, client_id, redirect_uri, scope)) {
									return this.redirectToUrl(oauth2ServerUrl.toString());
								}
								else 
									;// Go to error page 
							}else {
								String destination = Route.previous();
								if(destination != null) {
									String qs = URI.create(destination).getQuery();
									qs.indexOf("r=");
									qs = qs.substring(qs.indexOf("r=") + "r=".length());
									String param[] = qs.split("/");
									new Permission().changeOrgAndProfile(param[0]);
									return this.redirectToUrl(destination);
								}
								return this.redirect("igrp", "home", "index");
							}
							
						}
				}
					break;
					
					default:;
				}
			}
		return this.renderView(view,true);
	}
	
	public Response actionLogout() throws IOException{
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
		if(Igrp.getInstance().getUser().logout()){
			if(!Session.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Ocorreu um erro com registo session ..."));
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ocorreu um erro no logout."));
		return this.redirect("igrp", "login", "login");
	}
	
	// Dont delete this method  
	public Response actionGoToLogin() throws IOException {
		return this.redirect("igrp", "login", "login");
	}
	
	/*
	 * The following methods are all encapsulate (private) ... Those methods encapsulate the specific IGRP login and
	 * authentication business logic ...
	 * Your never call those methods out of this class ... Those methods are not a action of IGRP Controller !
	 * */
	
	// Use default connectionName "db1" and default igrp user table
	private boolean loginWithDb(String username, String password) throws IOException{
		boolean success = false;
		User user = (User) new User().findIdentityByUsername(username);
		if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(password, "SHA-256"))){
			if(user.getStatus() == 1){				
				Profile profile = new Profile().getByUser(user.getId());
					if(profile != null && Igrp.getInstance().getUser().login(user, 60*60/*1h*/)){ // 3600 * 24 * 30
						if(!Session.afterLogin(profile))
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Error no registo session ..."));
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
						success = true;
					}
					else
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Ocorreu um INTERNAL_ERROR ... Login inválido."));
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Utilizador desativado. Por favor contacte o Administrador."));
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador."));
		return success;
	}
	
	// Use ldap protocol to make login 
	
	private boolean authenticate_(String username, String password, boolean viaIds, Object ...objects) {
		ArrayList<LdapPerson> personArray = (ArrayList<LdapPerson>) objects[1];
		if(viaIds) {
			Properties settings = (Properties) objects[0];
			boolean flag = false;
			try {
	           URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
	           WSO2UserStub.disableSSL();
	           WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	           stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);
	           flag = stub.getOperations().authenticate(username, password);
	          
	           //System.out.println("Success: " + flag);
	           
	           // Pesquisar user from Ids 
	           List<ClaimDTO> result = stub.getOperations().getUserClaimValues(username, "");
	           LdapPerson ldapPerson = new LdapPerson();
	            result.forEach(obj -> {
	            	switch(obj.getClaimUri().getValue()){
	            		case "http://wso2.org/claims/displayName": ldapPerson.setDisplayName(obj.getValue().getValue()); break;
	            		case "http://wso2.org/claims/givenname": ldapPerson.setGivenName(obj.getValue().getValue()); break;
	            		case "http://wso2.org/claims/emailaddress": 
	            			ldapPerson.setUid(obj.getValue().getValue());
	            			ldapPerson.setMail(obj.getValue().getValue()); 
	            		break;
	            		case "http://wso2.org/claims/fullname": ldapPerson.setFullName(obj.getValue().getValue()); break;
	            		case "http://wso2.org/claims/lastname": ldapPerson.setLastName(obj.getValue().getValue()); break;
	            		
	            	}
	               // System.out.println(obj.getClaimUri().getValue() + " = " + obj.getValue().getValue());
	            });
	            personArray.add(ldapPerson);
	            
	        } catch (Exception ex) {
	        	flag = false;
	            ex.printStackTrace();
	        }
			return flag;
		}
		
		NosiLdapAPI ldap = (NosiLdapAPI) objects[0];
		return ldap.validateLogin(username, password, personArray);
	}
	
	private boolean loginWithLdap(String username, String password){
		boolean success = false;
		
		Properties settings = loadIdentityServerSettings();
		
		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		
		if(settings.getProperty("enabled") != null && settings.getProperty("enabled").equalsIgnoreCase("true")) {
			success = authenticate_(username, password, true, settings, personArray);
		}else {
			success = authenticate_(username, password, false, ldap, personArray);
			//System.out.println(ldap.getError()); 
		}
		
		if(success) {
			// Verify if this credentials exist in DB 
			User user = (User) new User().findIdentityByUsername(username);
			if(user != null) {
				/*password = nosi.core.webapp.User.encryptToHash(password, "SHA-256");
				if((user.getPass_hash() == null) || (user.getPass_hash() != null && !user.getPass_hash().equals(password))) {
					user.setPass_hash(password); // Anyway !!! update the user's password and encrypt it ...
					user.update();
				}*/
				/** Begin create user session **/
				success = createSessionLdapAuthentication(user);
				/** End create user session **/ 
				
			}else {
				
				if(this.getConfig().getEnvironment().equals("dev") && ldapinfo.getAuthenticationFilter().contains("SAMAccountName")) { // Active Directory Ldap Server ... autoinvite the user for IgrpStudio 
					
					User newUser = new User();
					newUser.setUser_name(username);
					
					if (personArray != null && personArray.size() > 0) 
						for(int i = 0; i < personArray.size(); i++) {
							LdapPerson p = personArray.get(i);
							
							if(p.getName() != null && !p.getName().isEmpty())
								newUser.setName(p.getName());
							else
								if(p.getDisplayName() != null && !p.getDisplayName().isEmpty())
									newUser.setName(p.getDisplayName());
								else
									newUser.setName(p.getFullName());
							
							newUser.setEmail(p.getMail().toLowerCase());
						}
					
					newUser.setStatus(1);
					//newUser.setPass_hash(nosi.core.webapp.User.encryptToHash(password, "SHA-256"));
					newUser.setCreated_at(System.currentTimeMillis());
					newUser.setUpdated_at(System.currentTimeMillis());
					newUser.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
					newUser.setActivation_key(nosi.core.webapp.User.generateActivationKey());
					newUser = newUser.insert();
					
					if(newUser != null) {
						
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
						
						if(p1.insert() != null && p2.insert() != null && tutorialApp.insert() != null) {
							UserRole role = new UserRole(); // For SSO via ApacheRealm 
							String role_name = Igrp.getInstance().getServlet().getInitParameter("role_name");
							role.setRole_name(role_name != null && !role_name.trim().isEmpty() ? role_name : "IGRP_ADMIN");
							role.setUser(newUser);
							role = role.insert();
							return createSessionLdapAuthentication(newUser);
						}
						
					}
					
				}else {
					success = false;
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Esta conta não tem acesso ao IGRP. Por favor, contacte o Administrador."));
				}
				
			}
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("A sua conta ou palavra-passe está incorreta."));
		
		return success;
	}
	
	private boolean createSessionLdapAuthentication(User user) {
		boolean result = true;
		if(user.getStatus() == 1){				
			Profile profile = new Profile().getByUser(user.getId());
				if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
					if(!Session.afterLogin(profile)) {
						result = false;
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Error no registo session ..."));
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
					}
				}
				else {
					result = false;
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Login inválido ..."));
				}
		}
		else {
			result = false;
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Utilizador desativado. Por favor contacte o Administrador."));
		}
		return result;
	}
	
	private Properties loadIdentityServerSettings() {
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/") + "ids";
		String fileName = "wso2-ids.xml";
		File file = new File(path + File.separator + fileName);
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}
	
	
	/** **/
	
	private boolean generateOauth2Response(StringBuilder oauth2ServerUrl/*INOUT var*/, User user, String response_type, String client_id, String redirect_uri, String scope ) {
		boolean result = true;
		
		String url_ = Igrp.getInstance().getRequest().getRequestURL().toString().replace(Igrp.getInstance().getRequest().getRequestURI() + "", "");
		url_ += "/igrp-rest/rs/oauth2/authorization";
		String queryString = "?";
		queryString += "authorize=1";
		queryString += "&response_type=" + response_type.replaceAll(" ", "%20");
		queryString += "&client_id=" + client_id;
		queryString += (redirect_uri != null && !redirect_uri.trim().isEmpty() ? "&redirect_uri=" + redirect_uri : "");
		queryString += (scope != null && !scope.trim().isEmpty() ? "&scope=" + scope : "");
		queryString += "&userId=" + Base64.getEncoder().encodeToString(user.getUser_name().getBytes());
		
		oauth2ServerUrl.append(url_.concat(queryString));
		
		return result;
	}
	
	private boolean validateOAuth2Parameters(String response_type, String client_id, String redirect_uri, String scope ) {
		boolean result = true;
		// Validate parameters 
		try {
			OAuthClient client = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
			result = !(!validateScope(scope, client) 
						||  
						(!client.getGrant_types().equalsIgnoreCase("authorization_code") && !client.getGrant_types().equalsIgnoreCase("implicit")) 
						|| 
						(!response_type.equalsIgnoreCase("token") && !response_type.equalsIgnoreCase("code")));
		}catch(Exception e) {
			//e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	private boolean validateScope(String scopes, OAuthClient client) { // Ex.: scope1,scope2,...,scopeN 
		if(scopes == null || scopes.isEmpty()) 
			return true; // scopes is optional in this case
		String []aux = scopes.split(",");
		for(String obj : aux)
			if(!client.getScope().contains(obj))
				return false;
		return true;
	}
	
}
