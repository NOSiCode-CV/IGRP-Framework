
package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Domain;
/*----#end-code----*/



public class DominioController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Dominio model = new Dominio();
		DominioView view = new DominioView();
		model.load();

		/*----#start-code(index)----*/
		model.loadTable_1(Core.query( "SELECT dominio,description,valor,status as estado,ordem,id as p_id FROM tbl_domain"));
      	view.p_id.setParam(true);
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Dominio model = new Dominio();
		model.load();
		
		/*----#start-code(novo)----*/
		
		
		/*----#end-code----*/
		
		return this.redirect("igrp","NovoDominio","index");
		
	}
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Dominio model = new Dominio();
		model.load();
		
		/*----#start-code(editar)----*/
		
		this.addQueryString("isEdit", "true").addQueryString("p_id",Core.getParam("p_id")).addQueryString("target", "_blank");
		/*----#end-code----*/
		
		return this.redirect("igrp","NovoDominio","index",this.queryString());
		
	}
	public Response actionDesativar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Dominio model = new Dominio();
		model.load();
		
		/*----#start-code(desativar)----*/
		Integer id = Core.getParamInt("p_id");
		if(id!=0) {
			Domain d = new Domain().findOne(id);
			d.setStatus("INATIVE");
			if(d.update() != null)
                Core.setMessageSuccess();
        	else
                Core.setMessageError();
		}
		/*----#end-code----*/
		
		return this.redirect("igrp","Dominio","index");
		
	}
	
	/*----#start-code(custom_actions)----*/
		
		
		/*----#end-code----*/
	
	
	
	
}
