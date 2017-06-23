package nosi.webapps.igrp.pages.home;

import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;

public class HomeController extends Controller {		

	public Response actionIndex() throws IOException{
		Permission.changeOrgAndProfile("igrp");
		HomeView view = new HomeView();
		view.title = "Home";
		return this.renderView(view,true);
	}
}
