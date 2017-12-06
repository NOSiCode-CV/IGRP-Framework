package nosi.webapps.igrp.pages.login;

import nosi.core.config.Config;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;

import java.io.File;
import java.io.IOException;

import javax.xml.bind.JAXB;

import static nosi.core.i18n.Translator.gt;
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
			
			String destination = Igrp.getInstance().getRequest().getParameter("_url");
			if(destination != null ) {
				try {
					String []aux = destination.split("/");
					if(aux.length != 3)
						throw new ServerErrorHttpException();
				return redirect(aux[0], aux[1], aux[2]);
				}catch(Exception e) {
					
				}
			}
			
			return this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
		}
		Login model = new Login();
		LoginView view = new LoginView(model);
		//Set user and password for demo
		view.user.setValue("demo");
		view.password.setValue("demo");
		
			if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
				model.load();
				switch(Config.getAutenticationType()){//generateOauth2Response
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
							}else
								return this.redirect("igrp", "home", "index"); // always go to home index url
						}
					break;
					
					case "ldap":
						if(this.loginWithLdap(model.getUser(), model.getPassword()))
							return this.redirect("igrp", "home", "index");
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
		String aux = Igrp.getInstance().getRequest().getParameter("_url");
		if(aux != null && !aux.isEmpty())
			return this.redirect("igrp", "login", "login", new String[] {"_url"}, new String[] {aux});
		else
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
		if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(password, "MD5"))){
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
	private boolean loginWithLdap(String username, String password){
		boolean success = false;
		
		/** Begin ldap AD logic here **/ 
		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase());
		
		success = ldap.validateLogin(username, password);
		/** End **/ 
		
		if(success) {
			// Verify if this credentials exist in DB
			User user = (User) new User().findIdentityByUsername(username);
			if(user != null) {
				password = nosi.core.webapp.User.encryptToHash(password, "MD5");
				if((user.getPass_hash() == null) || (user.getPass_hash() != null && !user.getPass_hash().equals(password))) {
					user.setPass_hash(password); // Anyway !!! update the user's password and encrypt it ...
					user.update();
				}
				/** Begin create user session **/
				if(user.getStatus() == 1){				
					Profile profile = new Profile().getByUser(user.getId());
						if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
							if(!Session.afterLogin(profile)) {
								success = false;
								Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Error no registo session ..."));
								//String backUrl = Route.previous(); // remember the last url that was requested by the user
							}
						}
						else {
							success = false;
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ooops !!! Login inválido ..."));
						}
				}
				else {
					success = false;
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Utilizador desativado. Por favor contacte o Administrador."));
				}
				/** End create user session **/
				
			}else {
				success = false;
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Esta conta não tem acesso ao IGRP. Por favor, contacte o Administrador."));
			}
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Comunicação LDAP falhada ou a sua conta ou palavra-passe está incorreta."));
		
		return success;
	}
	
	private boolean generateOauth2Response(StringBuilder oauth2ServerUrl/*INOUT var*/, User user, String response_type, String client_id, String redirect_uri, String scope ) {
		boolean result = true;
		
		String url_ = "http://localhost:8080/igrp-rest/rs/oauth2/authorization";
		String queryString = "?";
		queryString += "authorize=1";
		queryString += "&response_type=" + response_type;
		queryString += "&client_id=" + client_id;
		queryString += "&redirect_uri=" + redirect_uri;
		queryString += "&scope=" + scope;
		
		oauth2ServerUrl.append(url_.concat(queryString));
		
		return result;
	}
	
}
