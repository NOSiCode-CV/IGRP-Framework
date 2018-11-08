
package nosi.webapps.igrp.pages.detalhesprocesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.DeploymentService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.ResourcesService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
/*----#END-PRESERVED-AREA----*/

public class DetalhesProcessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
	
		DetalhesProcesso model = new DetalhesProcesso();
		String taskId = Core.getParam("taskId");
		String processId = Core.getParam("process_id");
		String process_definitionId = Core.getParam("process_definitionId");
		boolean showView = Core.isNotNull(processId) && Core.isNotNull(process_definitionId);
		if(Core.isNotNull(taskId)) {
			TaskServiceQuery taskS = new TaskServiceQuery();
			taskS.addFilter("taskId", taskId);
			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
				model.setNumero_de_processo(task.getProcessInstanceId());
				process_definitionId = task.getProcessDefinitionId();
				ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstancesService().historicProcess(task.getProcessInstanceId());
				DeploymentService deploy = new DeploymentService().getDeployment(process.getDeploymentId());
				model.setData_criacao_de_processo(Core.isNotNull(deploy.getDeploymentTime())?Core.ToChar(deploy.getDeploymentTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setDescricao(Core.isNotNull(process.getDescription())?process.getDescription():process.getName());
				model.setData_inicio_de_processo(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setData_fim_processo(Core.isNotNull(history.getEndTime())?Core.ToChar(history.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				break;
			}
			processId = model.getNumero_de_processo();
		}
		DetalhesProcessoView view = new DetalhesProcessoView(model);
		ProcessDefinitionService p =new ProcessDefinitionService();
		//Get Diagram in runtime
		String content = p.getDiagram("runtime/process-instances/"+processId+"/diagram");
		if(content!=null) {
			view.img_1.setValue("data:image/png;base64,"+content);
		}else {
			//Get Diagram on historic
			p = p.getProcessDefinition(process_definitionId);
			if(Core.isNotNull(p.getDiagramResource())) {
				ResourcesService r = new ResourcesService().getResource(p.getDiagramResource());
				if(Core.isNotNull(r.getContentUrl())) {
					content = r.getResourceContent(r.getContentUrl());
					view.img_1.setValue("data:image/png;base64,"+content);
				}
			}
		}
		if(showView) {
			view.view_1.setVisible(false);
			view.sectionheader_1.setVisible(false);
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
