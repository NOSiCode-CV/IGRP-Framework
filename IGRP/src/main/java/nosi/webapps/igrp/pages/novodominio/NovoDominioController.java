package nosi.webapps.igrp.pages.novodominio;

import java.io.IOException;
import java.util.List;
/*----#end-code----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.webapps.igrp.dao.Domain;
		
public class NovoDominioController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoDominio model = new NovoDominio();
		model.load();
		NovoDominioView view = new NovoDominioView();
		/*----#start-code(index)----*/
       

		
		view.sectionheader_1_text.setValue("Gestão de Dominio - Editar");
		
		String id_dom = Core.getParam("p_id_dom");
		
		view.btn_gravar.addParameter("p_id_dom", id_dom);
		
		if(Core.isNotNull(id_dom)) {
			Domain domain = new Domain().find().andWhere("dominio","=",Core.getParam("p_id_dom")).one();
			model.setDominio(domain.getDominio());
		}
		
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoDominio model = new NovoDominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","NovoDominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		boolean dom = false;
		List<Domain> list_domain = new Domain().find().andWhere("dominio","=",Core.getParam("p_id_dom")).all();
 		String geral_dom = "";
 		for(Domain d : list_domain) {
 			d.setDominio(model.getDominio());
 			geral_dom = d.getDominio();
			d.update();
			if(!d.hasError()) {
				dom = true;
			}
 		}

		if(dom) {
			Core.setMessageSuccess();
		}else {
			Core.setMessageError();
		}
		
		
		if(Core.isNotNull(Core.getParam("p_id_dom"))) {
			this.addQueryString("p_id_dom",geral_dom );
			return this.forward("igrp","NovoDominio","index",this.queryString());
		}
		
		
		/*----#end-code----*/
		return this.redirect("igrp","NovoDominio","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
}
