package nosi.webapps.igrp.pages.login;

import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;
import nosi.core.webapp.helpers.Route;
import java.io.IOException;


public class LoginController extends Controller {		

	public void actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
		// first
		if(Igrp.getInstance().getUser().isAuthenticated()){
			this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
			return;
		}
		
		Login model = new Login();
		model.load();
		LoginView view = new LoginView(model);
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			User user = (User) new User().findIdentityByUsername(model.getUser());
			if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(model.getPassword(), "MD5"))){
				if(user.getStatus() == 1){
					Profile profile = (Profile) new Profile().getByUser(user.getId());
						if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30, profile.getProf_type_fk(),profile.getOrg_fk())){
							if(!Session.afterLogin())
								Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Error no registo session ...");
							String backUrl = Route.previous(); // remember the last url that was requested by the user
							if(backUrl != null)
								this.redirectToUrl(backUrl);
							else
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
			if(!Session.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Ocorreu um erro com registo session ...");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro no logout.");
		this.redirect("igrp", "login", "login");
	}
}