
package nosi.webapps.igrp.pages._cons_proc;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class _CONS_PROCController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		_CONS_PROC model = new _CONS_PROC();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		_CONS_PROCView view = new _CONS_PROCView(model);
		
		/*Specify your connection name in first parameter*/
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		/*Specify your connection name in first parameter*/
		view.organica.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		/*Specify your connection name in first parameter*/
		view.area_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		/*Specify your connection name in first parameter*/
		view.proc_tp_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		/*Specify your connection name in first parameter*/
		view.user_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		/*Specify your connection name in first parameter*/
		view.status.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionItem1() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ITEM1)----*/
		_CONS_PROC model = new _CONS_PROC();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if(model.save(model)){
				Core.setMessageSuccess(gt("Mesagem de Sucesso"));
			 }else{
				Core.setMessageError(gt("Mesagem de Erro"));
			 return this.forward("igrp","_CONS_PROC","index");
			}
		}
		return this.redirect("igrp","_CONS_PROC","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
