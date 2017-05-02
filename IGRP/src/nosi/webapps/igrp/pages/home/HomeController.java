package nosi.webapps.igrp.pages.home;

import java.io.IOException;

import nosi.core.webapp.Controller;

public class HomeController extends Controller {		

	public void actionIndex() throws IOException{
		HomeView view = new HomeView();
		this.renderView(view,true);
		//this.redirect("igrp", "login", "login");
	}
}
