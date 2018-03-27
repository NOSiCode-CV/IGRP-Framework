
package nosi.webapps.igrp_studio.pages.partilha_geral;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/

/*----#end-code----*/



public class Partilha_geralController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Partilha_geral model = new Partilha_geral();
		Partilha_geralView view = new Partilha_geralView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		model.loadTable_1( Core.query( "SELECT 'estado' as estado,'descricao' as descricao " ) );
		view.aplicacao_origem.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.elemento.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.aplicacao_destino.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */
		
		/*----#start-code(index)----*/
		view.aplicacao_origem.setSqlQuery(null,"(SELECT 'id' as ID,'name' as NAME union all (SELECT 'PAGE' as ID,'PAGE' as NAME)) ");
		
		/*view.elemento.setSqlQuery(null,"(((((SELECT '' as ID,'-- Elemento --' as NAME) union all (SELECT 'PAGE' as ID,'PAGE' as NAME)) union all (SELECT 'WORKFLOW' as ID,'WORKFLOW' as NAME)) "
				+ "union all (SELECT 'SERVICE' as ID,'SERVICE' as NAME)) union all (SELECT 'REPORT' as ID,'REPORT' as NAME))");*/
		
		view.aplicacao_destino.setSqlQuery(null,"(SELECT 'id' as ID,'name' as NAME union all (SELECT 'PAGE' as ID,'PAGE' as NAME)) ");
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionPartilhar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Partilha_geral model = new Partilha_geral();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","Partilha_geral","index");
		}
		
		----#gen-example */
		
		/*----#start-code(partilhar)----*/
		
		/*----#end-code----*/
		
		return this.redirect("igrp_studio","Partilha_geral","index");
		
	}
	
	/*----#start-code(custom_actions)----*/

		/*----#end-code----*/
	
	
	
	
}
