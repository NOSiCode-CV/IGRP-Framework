/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class LoginController extends Controller {		

	public void actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException, NoSuchAlgorithmException{
		// first
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, "Login com Utilizador: demo e Password: demo");
		if(Igrp.getInstance().getUser().isAuthenticated()){
			this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
			return;
		}
		
		Login model = new Login();
		model.load();
		LoginView view = new LoginView(model);
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			User user = (User) new User().findIdentityByUsername(model.getUser());
			
			MessageDigest m = MessageDigest.getInstance("MD5");
			byte[] password = model.getPassword().getBytes();
			byte[] thedigest = m.digest(password);
			BigInteger password_bi = new BigInteger(1, thedigest);
			
			if(user != null && user.validate(password_bi.toString(16))){
				if(user.getStatus() == 1){
					Profile profile = (Profile) new Profile().getByUser(user.getId());
						if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30, profile.getProf_type_fk(),profile.getOrg_fk())){
							Session.afterLogin();
							this.redirect("igrp", "home", "index");
							return;
						}
						else
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Login inválido ...");
				}
				else
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Utilizador desativado. Por favor contacte o Administrador.");
			}else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
		}
		
		this.renderView(view,true);
	}

	public void actionLogout() throws IOException{
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
		if(Igrp.getInstance().getUser().logout()){
			Session.afterLogout(currentSessionId);
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro no logout.");
		this.redirect("igrp", "login", "login");
	}
}