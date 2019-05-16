
package nosi.webapps.igrp.pages.detalhesprocesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.DeploymentService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.ProcessInstancesService;
import nosi.core.webapp.activit.rest.entities.ResourcesService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.services.DeploymentServiceRest;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
/*----#END-PRESERVED-AREA----*/

public class DetalhesProcessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
	
		DetalhesProcesso model = new DetalhesProcesso();
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);
		String process_definitionId = Core.getParam(BPMNConstants.PRM_DEFINITION_ID);
		boolean showView = Core.isNotNullMultiple(processId,process_definitionId);
		if(Core.isNotNull(taskId)) {
			TaskServiceIGRP taskQuery = new TaskServiceIGRP();
			taskQuery.addFilterBody("taskId", taskId);
			for(TaskServiceQuery task:taskQuery.queryHistoryTask()) {
				model.setNumero_de_processo(task.getProcessInstanceId());
				process_definitionId = task.getProcessDefinitionId();
				ProcessDefinitionService process = new ProcessDefinitionServiceRest().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstanceServiceRest().historicProcess(task.getProcessInstanceId());
				DeploymentService deploy = new DeploymentServiceRest().getDeployment(process.getDeploymentId());
				model.setData_criacao_de_processo(Core.isNotNull(deploy.getDeploymentTime())?Core.ToChar(deploy.getDeploymentTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setDescricao(Core.isNotNull(process.getDescription())?process.getDescription():process.getName());
				model.setData_inicio_de_processo(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setData_fim_processo(Core.isNotNull(history.getEndTime())?Core.ToChar(history.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				break;
			}
			processId = model.getNumero_de_processo();
		}
		DetalhesProcessoView view = new DetalhesProcessoView(model);
		ProcessDefinitionServiceRest processDefinitionRest =new ProcessDefinitionServiceRest();
		//Get Diagram in runtime
		String content = processDefinitionRest.getProcessDiagram(processId);
		if(content!=null) {
			view.img_1.setValue("data:image/png;base64,"+content);
		}else {
			//Get Diagram on historic
			ProcessDefinitionService p = processDefinitionRest.getProcessDefinition(process_definitionId);
			if(Core.isNotNull(p.getDiagramResource())) {
				ResourceServiceRest resource = new ResourceServiceRest();
				ResourcesService r = resource.getResource(p.getDiagramResource());
				if(Core.isNotNull(r.getContentUrl())) {
					content = resource.getResourceContent(r.getContentUrl());
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
