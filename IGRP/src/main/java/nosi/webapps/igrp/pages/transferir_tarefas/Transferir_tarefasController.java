package nosi.webapps.igrp.pages.transferir_tarefas;

import java.io.IOException;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.ProcessInstancesService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.webapps.igrp.dao.User;
		
public class Transferir_tarefasController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Transferir_tarefas model = new Transferir_tarefas();
		model.load();
		Transferir_tarefasView view = new Transferir_tarefasView();
		/*----#start-code(index)----*/				

		String id = Core.getParam(BPMNConstants.PRM_TASK_ID);
		view.novo_utilizador.setLookup("igrp","LookupListUser","index");	
		if(Core.isNotNull(id)){
			TaskService task = new TaskServiceIGRP().getTask(id);
			if(task!=null){
				ProcessDefinitionService process = new ProcessDefinitionIGRP().getProcessDefinitionServiceRest().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstanceServiceRest().historicProcess(task.getProcessInstanceId());
				model.setData_inicio(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setCriado_por_(history.getStartUserId());
				model.setId(id);
				model.setAtribuido_a(task.getAssignee());
				model.setDescricao_de_tarefa(Core.getSwitchNotNullValue(task.getDescription(),task.getName()));
				model.setN_tarefa(task.getId());
				model.setNumero_processo(task.getProcessInstanceId());
				model.setTipo_processo(process.getName());
				view.novo_utilizador.addParam("p_process_name", task.getProcessDefinitionKey());
				view.novo_utilizador.addParam("p_task_name", task.getTaskDefinitionKey());
			}
		}		
			
		
		view.novo_utilizador.addParam("type", "my_user");

		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Transferir_tarefas model = new Transferir_tarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		
		String taskId = model.getId();
		Integer userNameId = model.getId_utilizador();

		if (Core.isNotNullMultiple(userNameId, taskId)) {
			User user = new User().findIdentityById(userNameId);
			if (user != null) {
				if (new TaskServiceIGRP().getTaskServiceRest().delegateTask(taskId, user.getUser_name())) {
					Core.setMessageSuccess(
							Core.gt("Tarefa transferida para ") + user.getName() + Core.gt(" com sucesso"));
				} else {
					Core.setMessageError(Core.gt("Nao foi possivel transferir a tarefa para ") + user.getName());
				}
				this.addQueryString(BPMNConstants.PRM_TASK_ID, taskId);
			} else {
				Core.setMessageError(Core.gt("Utilizador não encontrado."));
			}
		} else {
			Core.setMessageError(Core.gt("Adicione um novo utilizador."));
		}


		
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
