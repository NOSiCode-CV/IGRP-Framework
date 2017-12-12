
package nosi.webapps.igrp_studio.pages.homestudio;
import nosi.core.config.Config;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;

/*----#END-PRESERVED-AREA----*/

public class HomeStudioController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		if(Igrp.getInstance().getRequest().getServerName().equalsIgnoreCase("10.4.2.94")) {
			User user = (User)Igrp.getInstance().getUser().getIdentity();
			String username = user.getUser_name();
			String password = user.getPass_hash();
			String url = "http://" + username + ":" + password + "@" + "10.4.2.93/IGRP/igrpsso" + "?_url=igrp_studio/HomeStudio/index";
			return this.redirectToUrl(url);
		}
		HomeStudio model = new HomeStudio();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load(); 
		}
		HomeStudioView view = new HomeStudioView(model);
		Config.type_header = "home";
		Config.LINK_MY_APPS = "webapps?r=igrp/env/myApps&amp;type=dev";
		view.form_1.setTitle("Minhas Aplicações");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionGestao_de_paginas() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GESTAO_DE_PAGINAS)----*/
		return this.redirect("igrp","ListaPage","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionImportjar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(IMPORTJAR)----*/
		return this.redirect("igrp_studio","ImportArquivo","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionReport_design() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(REPORT_DESIGN)----*/
		return this.redirect("igrp","WebReport","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	
	public Response actionCrud_gen() throws IOException {
		return this.redirect("igrp_studio", "CRUDGenerator", "index");
	}
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
