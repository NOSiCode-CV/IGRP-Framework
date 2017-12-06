
package nosi.webapps.igrp_studio.pages.homestudio;
import nosi.core.config.Config;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class HomeStudioController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
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
		return this.redirect("igrp","ImportArquivo","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionReport_design() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(REPORT_DESIGN)----*/
		return this.redirect("igrp","WebReport","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
