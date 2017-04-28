/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class LoginController extends Controller {		

	public void actionLogin() throws IOException{
		Login model = new Login();
		LoginView view = new LoginView(model);
		this.renderView(view,true);
	}

	public void actionLogout() throws IOException{
		this.redirect("igrp", "login", "login");
	}
}
