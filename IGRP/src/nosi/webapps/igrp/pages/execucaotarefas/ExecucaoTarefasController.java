/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.execucaotarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
/*---- End ----*/

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Map<Object, Object> listProc = IgrpHelper.toMap(new ProcessDefinitionService().getProcessDefinitionsAtivos(), "id", "name", "--- Selecionar Processo ---");
		Map<String,String> listPrioridade = new HashMap<String,String>();
		listPrioridade.put(null, "--- Escolher Prioridade ---");
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("50", "M�dio");
		listPrioridade.put("0", "Normal");
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		TaskService objTask = new TaskService();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
			objTask.setFilter(model.getPrioridade_colaborador());
		}
		
		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage = new ArrayList<>();
		
		//Verifica se � perfil pai
		if(ProfileType.isPerfilPai()){
			for(TaskService task:objTask.getTasks()){
				ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
				t.setAtribuido_a(task.getAssignee());
				t.setAtribuido_por(task.getOwner());
				t.setData_entrada(task.getCreateTime().toString());
				t.setDesc_tarefa(task.getDescription()!=null?task.getDescription():task.getName());
				t.setNumero_processo_tabela(task.getProcessDefinitionId());
				t.setP_id(task.getId());
				t.setN_tarefa_g(task.getId());
				t.setTipo(task.getCategory());
				t.setData_fim_g(task.getDueDate()!=null?task.getDueDate().toString():"");
				taskManage.add(t);
			}
		}
				
		

		
		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks = new ArrayList<>();
		for(TaskService task:objTask.getMyTasks(this.getUser().getUser_name())){
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(task.getCreateTime().toString());
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription()!=null?task.getDescription():task.getName());
			t.setTipo_tabela_minhas_tarefas(task.getCategory());
			t.setP_id(task.getId());
			t.setN_tarefa_m(task.getId());
			t.setData_fim_m(task.getDueDate()!=null?task.getDueDate().toString():"");
			myTasks.add(t);
		}
		
		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		for(TaskService task:objTask.getUnassigedTasks()){
			ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
			t.setCategorias_processo_tabela_disponiveis(task.getCategory());
			t.setData_entrada_tabela_disponiveis(task.getCreateTime().toString());
			t.setP_id(task.getId());
			t.setN_tarefa_d(task.getId());
			t.setData_fim_d(task.getDueDate()!=null?task.getDueDate().toString():"");
			t.setTarefas_tabela_disponiveis(task.getDescription()!=null?task.getDescription():task.getName());
			tasksDisponiveis.add(t);
		}
		
		ExecucaoTarefasView view = new ExecucaoTarefasView(model);
		view.table_gerir_tarefas.addData(taskManage);
		view.table_disponiveis.addData(tasksDisponiveis);
		view.table_minhas_tarefas.addData(myTasks);
		view.p_id.setParam(true);
		view.organica_minhas_tarefas.setValue(new ProfileType().getListMyProfiles());
		view.organica_gerir_tarefa.setValue(new ProfileType().getListMyProfiles());
		view.organica_colaborador.setValue(new ProfileType().getListMyProfiles());
		view.organica_form_disponiveis.setValue(new ProfileType().getListMyProfiles());
		view.prioridade_colaborador.setValue(listPrioridade);
		view.prioridade_estatistica.setValue(listPrioridade);
		view.prioridade_minhas_tarefas.setValue(listPrioridade);
		view.prioridade_form_disponiveis.setValue(listPrioridade);
		view.prioridade_gerir_tarefa.setValue(listPrioridade);
		view.tipo_processo_colaborador.setValue(listProc);
		view.tipo_processo_form_disponiveis.setValue(listProc);
		view.tipo_processo_estatistica.setValue(listProc);
		view.tipo_processo_gerir_tarefa.setValue(listProc);
		view.tipo_processo_minhas_tarefas.setValue(listProc);
		
		view.btn_pesquisar_button_disponiveis.setLink("index");
		view.btn_pesquisar_button_minhas_tarefas.setLink("index");
		view.btn_pesquisar_colaborador.setLink("index");
		view.btn_pesquisar_estatistica.setLink("index");
		view.btn_pesquisar_tarefa.setLink("index");
		
		view.btn_alterar_prioridade_tarefa.setLink("index");
		view.btn_alterar_prioridade_tarefa.setPage("Alter_prioridade_tarefa");
		view.btn_detalhes_tarefa.setLink("index&type=view");
		view.btn_detalhes_tarefa.setPage("Alter_prioridade_tarefa");
		view.btn_transferir_tarefa.setLink("index");
		view.btn_transferir_tarefa.setPage("Transferir_tarefas");
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionPesquisar_tarefa() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar_colaborador() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar_button_minhas_tarefas() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar_button_disponiveis() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar_estatistica() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionVer_estatistica() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionVer_detalhes() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionEnviar_msg() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionExecutar_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null && !id.equals(""))
			return this.redirect("igrp","MapaProcesso","open-process&taskId="+id );
		else
			return this.redirect("igrp", "ErrorPage", "exception");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","DetalhesProcesso","index");
			/*---- End ----*/
	}
	

	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			TaskService task = new TaskService();
			if(task.freeTask(id)){
				Igrp.getInstance().getFlashMessage().addMessage("success","Tarefa liberada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionAssumir_button_tabela() throws IOException{
		/*---- Insert your code here... ----*/		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			TaskService task = new TaskService();
			if(task.claimTask(id, this.getUser().getUser_name())){
				Igrp.getInstance().getFlashMessage().addMessage("success","Tarefa assumido com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionTransferir_tarefa() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionDetalhes_tarefa() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	

	public Response actionDetalhes_processo() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","DetalhesProcesso","index");
			/*---- End ----*/
	}
	

	public Response actionAlterar_prioridade_tarefa() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
	private User getUser(){
		return new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
	}
	
	public Response actionProcessTask() throws IOException{
		String taskId = Igrp.getInstance().getRequest().getParameter("p_prm_taskid");
		String processDefinitionId = Igrp.getInstance().getRequest().getParameter("p_prm_definitionid");
		boolean result = false;
		if(taskId!=null && !taskId.equals("")){
			result = this.processTask(taskId);
			if(result){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MSG_SUCCESS);
				return this.redirect("igrp","ExecucaoTarefas", "index");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MSG_ERROR);
				return this.redirect("igrp","MapaProcesso", "open-process&taskId="+taskId);
			}
		}
		if(processDefinitionId!=null && !processDefinitionId.equals("")){
			result = this.processStartEvent(processDefinitionId);
			if(result){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MSG_SUCCESS);
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MSG_ERROR);
			}
			return this.redirect("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	private Object getValue(String type,String name){
		Object value = Igrp.getInstance().getRequest().getParameter("p_"+name.toLowerCase());
		switch (type) {
			case "date":
				return DateHelper.convertDate(value.toString(), "dd-MM-yyyy", "dd-MM-yyyy h:mm");
			case "long":
				return Long.parseLong(value.toString());
			case "boolean":
				return value.toString().equals("1");
			case "enum":
			case "string":
				return value.toString();
		}
		return null;
	}
	
	//Executa uma tarefa
	private boolean processTask(String p_prm_taskid){
		FormDataService formData = new FormDataService();
		FormDataService properties = null;
		if(p_prm_taskid!=null && !p_prm_taskid.equals("")){
			formData.setTaskId(p_prm_taskid);
			properties = new FormDataService().getFormDataByTaskId(p_prm_taskid);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					formData.addVariable(prop.getId(),this.getValue(prop.getType(), prop.getId()));
				}
			}
		}
		return (p_prm_taskid!=null && !p_prm_taskid.equals(""))?formData.submitFormByTask():false;
	}
	
	//Inicia tarefa de um processo
	private boolean processStartEvent(String processDefinitionId){
		FormDataService formData = new FormDataService();
		FormDataService properties = null;
		if(processDefinitionId!=null && !processDefinitionId.equals("")){
			formData.setProcessDefinitionId(processDefinitionId);
			properties = new FormDataService().getFormDataByProcessDefinitionId(processDefinitionId);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					formData.addVariable(prop.getId(),this.getValue(prop.getType(), prop.getId()));
				}
			}
		}
		return (processDefinitionId!=null && !processDefinitionId.equals(""))?formData.submitFormByProcessDenifition():false;
	}
	/*---- End ----*/
}
