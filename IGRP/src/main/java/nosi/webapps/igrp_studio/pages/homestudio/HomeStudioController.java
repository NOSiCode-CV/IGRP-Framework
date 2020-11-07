
package nosi.webapps.igrp_studio.pages.homestudio;

import java.io.IOException;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;

public class HomeStudioController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		HomeStudio model = new HomeStudio();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load(); 
		}
		HomeStudioView view = new HomeStudioView(model);
		view.form_1.setTitle("Minhas Aplicaões");
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
		return this.redirect("igrp_studio","WebReport","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	
	public Response actionCrud_gen() throws IOException {
		return this.redirect("igrp_studio", "CRUDGenerator", "index");
	}
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	/*----#END-PRESERVED-AREA----*/
}
