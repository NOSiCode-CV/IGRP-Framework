
package nosi.webapps.igrp.pages.detalhesprocesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class DetalhesProcessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		
		DetalhesProcesso model = new DetalhesProcesso();
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		TaskServiceQuery taskS = new TaskServiceQuery();
		taskS.addFilter("includeProcessVariables", "true");
		taskS.addFilter("taskId", taskId);
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			model.setNumero_de_processo(task.getProcessInstanceId());
			ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(task.getProcessDefinitionId());
			model.setDescricao(process.getDescription());
			TaskServiceQuery instanceS = new TaskServiceQuery();
			taskS.addFilter("processVariables", "true");
			taskS.addFilter("processInstanceId", task.getProcessInstanceId());
			for(TaskServiceQuery instance:instanceS.queryHistoryProcessInstance()) {
				model.setData_criacao_de_processo(instance.getDueDate()!=null?instance.getDueDate().toString():"");
				model.setData_fim_processo(Core.isNotNull(instance.getStartTime())?Core.ToChar(instance.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setData_inicio_de_processo(Core.isNotNull(instance.getEndTime())?Core.ToChar(instance.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
			}
		}
		DetalhesProcessoView view = new DetalhesProcessoView(model);
		String content = new ProcessDefinitionService().getDiagram(model.getNumero_de_processo());
		if(content!=null) {
			view.img_1.setValue("data:image/png;base64,"+content);
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	/*----#END-PRESERVED-AREA----*/
}
