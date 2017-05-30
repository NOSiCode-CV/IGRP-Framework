package nosi.webapps.igrp.pages.home;

import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.helpers.Permission;

public class HomeController extends Controller {		

	public void actionIndex() throws IOException{
		Permission.changeOrgAndProfile("igrp");
		HomeView view = new HomeView();
		view.title = "Home";
		this.renderView(view,true);
	}
}
