package nosi.webapps.testephp.pages.defaultpage;

import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

public class DefaultPageController extends Controller {	
	
	public Response actionIndex() throws IOException{
		/*HomeAppView view = new HomeAppView();
		view.title = "teste_php";*/
		User user = (User) Igrp.getInstance().getUser().getIdentity();
		String username = user.getUser_name();
		String password = user.getPass_hash();
		String result = java.util.Base64.getEncoder().encodeToString((username + ":" + password).getBytes());
	return this.redirectToUrl("http://localhost/tests/new.php" + "?_u=" + result);//http://localhost/tests/new.php
	}
}