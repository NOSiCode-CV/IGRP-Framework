
package nosi.webapps.igrp.pages.task;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import java.util.List;
import java.util.ArrayList;
/*----#END-PRESERVED-AREA----*/

public class TaskController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Task model = new Task();
		model.load();
		TaskView view = null;
		List<Task.Table_1> data = new ArrayList<>();
		if (Core.isNotNull(model.getAplicacao())) {
			Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
			if (Core.isNotNull(model.getProcesso())) {
				new TaskServiceRest().getTasksByProcessKey(model.getProcesso(),app.getDad()).stream().forEach(t -> {
					Task.Table_1 t1 = new Task.Table_1();
					t1.setSelecionar(t.getProcessDefinitionId() + "_" + t.getId());
					t1.setDescricao(t.getName());
					data.add(t1);
				});
			}
			view = new TaskView(model);
			view.table_1.addData(data);
			if (app != null) {
				view.processo.setValue(new ProcessDefinitionIGRP().mapToComboBoxByKey(app.getDad()));
			}
			view.aplicacao.setValue(new Application().getListApps());
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Task model = new Task();
		model.load();
		
		return this.redirect("igrp","Task","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
