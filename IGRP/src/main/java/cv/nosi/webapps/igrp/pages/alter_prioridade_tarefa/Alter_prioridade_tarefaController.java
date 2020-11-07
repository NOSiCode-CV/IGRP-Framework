package cv.nosi.webapps.igrp.pages.alter_prioridade_tarefa;

import static cv.nosi.core.i18n.Translator.gt;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import cv.nosi.core.webapp.Igrp;
import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.QueryInterface;
import cv.nosi.core.webapp.util.helpers.database.ResultSet;
import cv.nosi.core.webapp.workflow.activit.rest.business.ProcessDefinitionIGRP;
import cv.nosi.core.webapp.workflow.activit.rest.business.TaskServiceIGRP;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessInstancesService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskService;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessInstanceServiceRest;
import cv.nosi.core.webapp.workflow.bpmn.BPMNConstants;
import cv.nosi.webapps.igrp.dao.User;


/*----#end-code----*/
		
public class Alter_prioridade_tarefaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Alter_prioridade_tarefa model = new Alter_prioridade_tarefa();
		model.load();
		Alter_prioridade_tarefaView view = new Alter_prioridade_tarefaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.nova_prioridade.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		Map<String,String> listPrioridade = new LinkedHashMap<String,String>();		
		listPrioridade.put("100", "Urgente");
      	listPrioridade.put("75", "Alta");
		listPrioridade.put("50", "Normal");
     	listPrioridade.put("25", "Baixa");
		listPrioridade.put("0", "Muito baixa");
		TaskServiceIGRP taskRest = new TaskServiceIGRP();
		String id = Core.getParam(BPMNConstants.PRM_TASK_ID);
		String type = Core.getParam("type");
		if(id!=null && !id.equals("")){
			TaskService task = taskRest.getTask(id); 
			if(task != null){
				ProcessDefinitionService process = new ProcessDefinitionIGRP().getProcessDefinitionServiceRest().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstanceServiceRest().historicProcess(task.getProcessInstanceId());
				model.setData_inicio_da_tarefa(Core.isNotNull(task.getCreateTime())?Core.dateToString(task.getCreateTime(),"yyyy-MM-dd HH:mm:ss"):"");
				model.setDescricao_da_tarefa(Core.getSwitchNotNullValue(task.getDescription(),task.getName()));
				model.setPrioridade_da_tarefa(listPrioridade.get(""+task.getPriority()).toString());
				model.setTarefa_atribuida_a(task.getAssignee());
				model.setTarefa_atribuida_por(task.getOwner());
				
				model.setNumero_de_processo(task.getProcessInstanceId());
				model.setTipo_de_processo(process.getName());
          		model.setData_inicio_do_processo(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				
				model.setId(id);
              
              model.setNova_prioridade(task.getPriority());
			}
		}
		view.target = "_blank";
		view.nova_prioridade.setValue(listPrioridade);
		
		if(type!=null && type.equalsIgnoreCase("view")){
			view.btn_salvar.setTitle("Fechar");
			view.btn_salvar.setLink("");
			view.btn_salvar.setPage("");
			view.btn_salvar.setImg("danger|fa-close");
			view.btn_salvar.setTarget("_close");
			view.nova_prioridade.setVisible(false);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Alter_prioridade_tarefa model = new Alter_prioridade_tarefa();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Alter_prioridade_tarefa","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(salvar)----*/			
		TaskServiceIGRP taskRest = new TaskServiceIGRP();
		TaskService task = taskRest.getTask(model.getId());
		if(task != null){
			task.setPriority(model.getNova_prioridade());
			task = taskRest.getTaskServiceRest().changePriority(task);
			if(task != null) 
				Core.setMessageSuccess(gt("Prioridade da tarefa alterada com sucesso")); 
			else 
				Core.setMessageError(gt("Falha ao tentar efetuar esta operação")); 
		}else 
			Core.setMessageError(gt("Falha ao tentar efetuar esta operação")); 
		
		this.addQueryString(BPMNConstants.PRM_TASK_ID, model.getId()); 
		/*----#end-code----*/
		return this.redirect("igrp","Alter_prioridade_tarefa","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


	/*----#end-code----*/
}
