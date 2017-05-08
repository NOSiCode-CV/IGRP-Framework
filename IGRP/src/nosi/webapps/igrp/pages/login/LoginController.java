/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Profile;

import java.io.IOException;


public class LoginController extends Controller {		

	public void actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
		// first
		if(Igrp.getInstance().getUser().isAuthenticated()){
			this.redirect("igrp", "home", "index"); // go to home (Bug here)
			return;
		}
		
		Login model = new Login();
		model.load();
		LoginView view = new LoginView(model);
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			User user = (User) new User().findIdentityByUsername(model.getUser());
			if(user != null && user.validate(model.getPassword())){
				if(user.getStatus() == 1){
					Profile profile = (Profile) new Profile().getByUser(user.getId());
						if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30, profile.getProf_type_fk()))
							this.redirect("igrp", "home", "index");
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
		Igrp.getInstance().getUser().logout();
		this.redirect("igrp", "login", "login");
	}
}
