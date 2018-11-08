package nosi.webapps.igrp.pages.transferir_tarefas;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.webapps.igrp.dao.User;
/*----#end-code----*/
		
public class Transferir_tarefasController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Transferir_tarefas model = new Transferir_tarefas();
		model.load();
		Transferir_tarefasView view = new Transferir_tarefasView();
		/*----#start-code(index)----*/				

		String id = Igrp.getInstance().getRequest().getParameter("p_p_id_g");
		if(Core.isNotNull(id)){
			TaskService task = new TaskService().getTask(id);
			if(task!=null){
				ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstancesService().historicProcess(task.getProcessInstanceId());
				model.setData_inicio(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setCriado_por_(history.getStartUserId());
				model.setId(id);
				model.setAtribuido_a(task.getAssignee());
				model.setDescricao_de_tarefa(Core.getSwitchNotNullValue(task.getDescription(),task.getName()));
				model.setN_tarefa(task.getId());
				model.setNumero_processo(task.getProcessInstanceId());
				model.setTipo_processo(process.getName());
			}
		}		
		view.novo_utilizador.setLookup("igrp","LookupListUser","index&dad="+Core.getCurrentDad()+"&type=my_user");
		view.novo_utilizador.addParam("p_prm_target","_blank");
		view.novo_utilizador.addParam("p_id_utilizador", "p_id");
		view.novo_utilizador.addParam("p_novo_utilizador", "login_1");

		view.target = "_blank";
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
		 return this.forward("igrp","Transferir_tarefas","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/				
		String userName = Core.getParam("p_novo_utilizador");
		String taskId = Core.getParam("p_id");
		User user = new User().findIdentityByUsername(userName);
		if(Core.isNotNullMultiple(userName,taskId) && user!=null) {
			 if(new TaskService().claimTask(taskId,userName)){
				 Core.setMessageSuccess(Core.gt("Tarefa transferida para ")+user.getName()+Core.gt(" com sucesso"));
		     }else {
		    	 Core.setMessageError(Core.gt("Nao foi possivel transferir a tarefa para ")+user.getName());
		     }
			this.addQueryString("p_p_id_g", taskId);
		}else {
	    	 Core.setMessageError(Core.gt("User invalido"));
	     }
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
