package nosi.webapps.igrp.pages.login;
/*---- Import your packages here... ----*/

import nosi.core.config.Config;
import nosi.core.servlet.OAuth2;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;
import java.io.IOException;

/*---- End ----*/
public class LoginController extends Controller {

	public Response actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		String oauth2 = Igrp.getInstance().getRequest().getParameter("oauth");
		
		String response_type = Igrp.getInstance().getRequest().getParameter("response_type");
		String client_id = Igrp.getInstance().getRequest().getParameter("client_id");
		String redirect_uri = Igrp.getInstance().getRequest().getParameter("redirect_uri");
		String scope = Igrp.getInstance().getRequest().getParameter("scope");
		
		// first 
		if(Igrp.getInstance().getUser().isAuthenticated()){
			return this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
		}
		
		Login model = new Login();
		LoginView view = new LoginView(model);
		//Set user and password for demo
		view.user.setValue("demo");
		view.password.setValue("demo");
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			
			model.load();
			
			switch(Config.getAutenticationType()){
			
				case "db": 
					if(this.loginWithDb(model.getUser(), model.getPassword()))
						return this.redirect("igrp", "home", "index"); // always go to home index url
				break;
				
				case "ldap": this.loginWithLdap(); break;
				
				default:;
			}
		}
		
		return this.renderView(view,true);
	}
	
	// Use default connectionName "db1" and default igrp user table
	private boolean loginWithDb(String username, String password) throws IOException{
		boolean success = false;
		User user = (User) new User().findIdentityByUsername(username);
		if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(password, "MD5"))){
			if(user.getStatus() == 1){				
				Profile profile = new Profile().getByUser(user.getId());
					if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
						if(!Session.afterLogin(profile))
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Error no registo session ...");
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
						success = true;
					}
					else
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Login inválido ...");
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Utilizador desativado. Por favor contacte o Administrador.");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
		return success;
	}
	
	private void  loginWithDbForAuth2(String username, String password, String response_type, String client_id, String redirect_uri, String scope) throws IOException {
		
		User user = (User) new User().findIdentityByUsername(username);
		if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(password, "MD5"))){
			if(user.getStatus() == 1){
				Profile profile = new Profile().getByUser(user.getId());
					if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
						if(!Session.afterLogin(profile))
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Error no registo session ...");
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
						switch(response_type) {
						
							case "code":
								String authorizationCode = null;
								try {
									authorizationCode = OAuth2.getAuthorizationCode(user.getId() + "", response_type, client_id, redirect_uri, scope);
									if(authorizationCode != null)
										Igrp.getInstance().getResponse().sendRedirect(redirect_uri + "?code=" + authorizationCode);
									else {
										Igrp.getInstance().getResponse().sendRedirect(redirect_uri + "?error=Ocorreu um erro ! Access Denied ...");
										Igrp.getInstance().getUser().logout();
									}
								}catch(Exception e) {
									Igrp.getInstance().getResponse().sendRedirect(redirect_uri + "?error=" + e.getMessage());
									Igrp.getInstance().getUser().logout();
									return;
								}
							break;
							
							case "token": 
								String token = "";
								Igrp.getInstance().getResponse().sendRedirect(redirect_uri + "?token=" + token);
								break;
								
							default: Igrp.getInstance().getResponse().sendRedirect(redirect_uri + "?error=Ocorreu um erro ! Access Denied ...");
						
						}
						
					}
					else
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Login inválido ...");
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Utilizador desativado. Por favor contacte o Administrador.");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
	
	}
	
	// Use ldap protocol to make login
	private void loginWithLdap(){
		// Not set yet
	}
	
	public Response actionGoToLogin() throws IOException {
		return this.redirect("igrp", "login", "login");
	}
	
	public Response actionLogout() throws IOException{
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
		if(Igrp.getInstance().getUser().logout()){
			if(!Session.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Ocorreu um erro com registo session ...");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro no logout.");
		return this.redirect("igrp", "login", "login");
	}
}