package nosi.webapps.igrp.pages.home;

import java.io.IOException;

import nosi.core.webapp.Controller;
import nosi.webapps.igrp.pages.page.Page;
import nosi.webapps.igrp.pages.page.PageView;

public class HomeController extends Controller {		

	public void actionIndex() throws IOException{
		/*Page model = new Page();
		PageView view = new PageView(model);
		view.env_fk.addOption("--- Selecionar Página ---",null);
		view.env_fk.addOption("IGRP", 1);
		this.renderView(view);*/
		this.redirect("igrp", "login", "login");
	}
}
