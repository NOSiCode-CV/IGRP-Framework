
package nosi.webapps.igrp.pages.detalhesprocesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourcesService;
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
		String processDefinition = "";
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			model.setNumero_de_processo(task.getProcessInstanceId());
			processDefinition = task.getProcessDefinitionId();
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
		ProcessDefinitionService p =new ProcessDefinitionService();
		//Get Diagram in runtime
		String content = p.getDiagram("runtime/process-instances/"+model.getNumero_de_processo()+"/diagram");
		if(content!=null) {
			view.img_1.setValue("data:image/png;base64,"+content);
		}else {
			//Get Diagram on historic
			p = p.getProcessDefinition(processDefinition);
			ResourcesService r = new ResourcesService().getResource(p.getDiagramResource());
			content = r.getResourceContent(r.getContentUrl());
			view.img_1.setValue("data:"+r.getMediaType()+";base64,"+content);
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	/*----#END-PRESERVED-AREA----*/
}
