
package nosi.webapps.igrp.pages.task;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
/*----#END-PRESERVED-AREA----*/

public class TaskController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Task model = new Task();
		model.load();
		TaskView view = new TaskView(model);
		
		view.processo.setValue(new ProcessDefinitionService().mapToComboBox(Core.isNotNull(model.getAplicacao())?new Integer(model.getAplicacao()):0));
		view.aplicacao.setValue(new Application().getListApps());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Task model = new Task();
		model.load();
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("igrp","Task","index");
		}
		return this.redirect("igrp","Task","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
