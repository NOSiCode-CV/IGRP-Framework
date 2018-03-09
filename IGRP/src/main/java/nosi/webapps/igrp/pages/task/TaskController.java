
package nosi.webapps.igrp.pages.task;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import java.util.List;
import java.util.ArrayList;
/*----#END-PRESERVED-AREA----*/

public class TaskController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Task model = new Task();
		model.load();
		List<Task.Table_1> data = new ArrayList<>();
		if(Core.isNotNull(model.getProcesso())) {
			new ProcessDefinitionService().getTasks(model.getProcesso()).stream().forEach(t->{
				Task.Table_1 t1 = new Task.Table_1();
				t1.setSelecionar(t.getId());
				t1.setDescricao(t.getName());
				data.add(t1);
			});
		}
		TaskView view = new TaskView(model);
		view.table_1.addData(data);
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
