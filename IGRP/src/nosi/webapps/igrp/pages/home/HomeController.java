package nosi.webapps.igrp.pages.home;

import java.io.IOException;

import nosi.core.webapp.Controller;

public class HomeController extends Controller {		

	public void actionIndex() throws IOException{
		//if(Igrp.getInstance().getUser().isAuthenticated()){
			HomeView view = new HomeView();
			view.title = "Home";
			this.renderView(view,true);
		/*}else{
			this.redirect("igrp", "login","login");
		}*/
	}
}
