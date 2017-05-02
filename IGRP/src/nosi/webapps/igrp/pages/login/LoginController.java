/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;

import java.io.IOException;


public class LoginController extends Controller {		

	public void actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
		Login model = new Login();
		LoginView view = new LoginView(model);
		
		if(Igrp.getInstance().getRequest().getMethod() == "POST"){
			model.load();
			User user = (User) new User().findIdentityByUsername(model.getUser());
			if(user != null && user.validate(model.getPassword())){
				if(user.getStatus() == 1)
					System.out.println("Go to home page.");
				else
					System.out.println("Utilizador desativado. Por favor contacte o Administrador");
				/*if(Igrp.getInstance().getUser().login(user, 3600 * 24 * 30))
					System.out.println("Ok");
				else
					System.out.println("Ooops !!! Login inválido ...");*/
			}else
				System.out.println("A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
		}
		
		this.renderView(view,true);
	}

	public void actionLogout() throws IOException{
		//Igrp.getInstance().getUser().logout();
		this.redirect("igrp", "login", "login");
	}
}
