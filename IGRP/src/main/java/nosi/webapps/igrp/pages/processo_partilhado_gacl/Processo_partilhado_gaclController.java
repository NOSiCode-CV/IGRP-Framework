package nosi.webapps.igrp.pages.processo_partilhado_gacl;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Processo_partilhado_gaclController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processo_partilhado_gacl model = new Processo_partilhado_gacl();
		model.load();
		Processo_partilhado_gaclView view = new Processo_partilhado_gaclView();
		view.processoetapa.setParam(true);
		view.run.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Accusantium laudantium ipsum adipiscing perspiciatis deserunt aperiam laudantium officia mollit sit' as processoetapa,'Mollit sed omnis aliqua accusantium omnis ut stract aliqua rem sit accusantium ipsum natus omnis natus sit laudantium doloremque sit consectetur officia consectetur lorem doloremque' as run "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionExecutar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processo_partilhado_gacl model = new Processo_partilhado_gacl();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_processoetapa",Core.getParam("p_processoetapa"));
		  this.addQueryString("p_run",Core.getParam("p_run"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(executar)----*/
		String p_processoetapa = Core.getParam("p_processoetapa"); 
      	String p_run = Core.getParam("p_run"); 
      	System.out.println(p_processoetapa); 
      System.out.println(p_run); 
       	return redirect("igrp", "Processo_partilhado_gacl", "index"); //if submit, loads the values
		
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
