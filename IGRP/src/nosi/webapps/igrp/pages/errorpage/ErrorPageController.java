/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.errorpage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;


public class ErrorPageController extends Controller {		

	public void actionNotFound() throws IOException{
		if(Igrp.getInstance().getUser().isAuthenticated()){
			Igrp.getInstance().getFlashMessage().addMessage("error", "Page not found");
			ErrorPage model = new ErrorPage();
			ErrorPageView view = new ErrorPageView(model);
			this.renderView(view);
		}
		else
			this.redirect("igrp", "login", "login");
	}
	
	public void actionException() throws IOException{
		if(Igrp.getInstance().getUser().isAuthenticated()){
			Igrp.getInstance().getFlashMessage().addMessage("error", "Error found");
			ErrorPage model = new ErrorPage();
			ErrorPageView view = new ErrorPageView(model);
			this.renderView(view);
		}
		else
			this.redirect("igrp", "login", "login");
	}
	
	public void actionPermission() throws IOException{
		if(Igrp.getInstance().getUser().isAuthenticated()){
			Igrp.getInstance().getFlashMessage().addMessage("error", "Sem permissao para aceder esta pagina");
			ErrorPage model = new ErrorPage();
			ErrorPageView view = new ErrorPageView(model);
			this.renderView(view);
		}
		else
			this.redirect("igrp", "login", "login");
	}
}
