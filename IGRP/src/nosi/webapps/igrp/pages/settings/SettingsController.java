/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.settings;
import nosi.core.webapp.Controller;
import java.io.IOException;



public class SettingsController extends Controller {		

	public void actionIndex() throws IOException{
		Settings model = new Settings();
		SettingsView view = new SettingsView(model);
		this.renderView(view);
	}

	public void actionAplicar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
}
