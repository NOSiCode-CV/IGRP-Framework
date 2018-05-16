/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.execucaotarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.TaskFile;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.StartProcess;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.bpmn.BPMNHelper;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import java.util.ArrayList;
import java.util.HashMap;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/		
		Map<String,String> listPrioridade = new HashMap<String,String>();
		listPrioridade.put(null, gt("-- Escolher Prioridade --"));
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("50", "Médio");
		listPrioridade.put("0", "Normal");
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		Map<String, String> listProc = new ProcessDefinitionService().mapToComboBox(Core.getCurrentDad());
		TaskService objTask = new TaskService();

		model.load();
		
		String proc_tp = Core.getSwitchNotNullValue(model.getTipo_processo_colaborador(), model.getTipo_processo_estatistica(),model.getTipo_processo_form_disponiveis(), model.getTipo_processo_gerir_tarefa() ,model.getTipo_processo_minhas_tarefas());
		String num_proc = Core.getSwitchNotNullValue(model.getNumero_processo_colaborador(),model.getNumero_processo_estatistica(),model.getNumero_processo_form_disponiveis(),model.getNumero_processo_gerir_tarefa(),model.getNumero_processo_minhas_tarefas());
		String status = Core.getSwitchNotNullValue(model.getEstado_estatistica());
		String data_inicio = Core.getSwitchNotNullValue(model.getData_inicio_colaborador(),model.getData_inicio_estatistica(),model.getData_inicio_form_disponiveis(),model.getData_inicio_gerir_tarefa(),model.getData_inicio_minhas_tarefas());
		String data_fim = Core.getSwitchNotNullValue(model.getData_fim_colaborador(),model.getData_fim_estatistica(),model.getData_fim_form_disponiveis(),model.getData_fim_gerir_tarefa(),model.getData_fim_minhas_tarefas());
		String prioridade = Core.getSwitchNotNullValue(model.getPrioridade_colaborador(),model.getPrioridade_estatistica(),model.getPrioridade_form_disponiveis(),model.getPrioridade_gerir_tarefa(),model.getPrioridade_minhas_tarefas());
	
		if(Core.isNotNull(proc_tp)){
			objTask.addFilter("processDefinitionKey",proc_tp);
		}
		if(Core.isNotNull(num_proc)){
			objTask.addFilter("processInstanceId",num_proc);
		}
		if(Core.isNotNull(status)) {
			objTask.addFilter("finished",status);
		}
		if(Core.isNotNull(data_inicio)) {
			objTask.addFilter("taskCompletedAfter",Core.ToChar(Core.ToChar(data_inicio, "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
		}
		if(Core.isNotNull(data_fim)) {
			objTask.addFilter("taskCompletedBefore",Core.ToChar(Core.ToChar(data_fim, "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
		}
		if(Core.isNotNull(prioridade)) {
			objTask.addFilter("taskPriority", prioridade);
		}
		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage = new ArrayList<>();
		
		//Verifica se é perfil pai
		if(ProfileType.isPerfilPai()){
			for(TaskService task:objTask.getTasks()){
				ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
				t.setAtribuido_a(task.getAssignee());
				t.setAtribuido_por(task.getOwner());
				t.setData_entrada(task.getCreateTime().toString());
				t.setDesc_tarefa(task.getDescription()!=null?task.getDescription():task.getName());
				t.setNumero_processo_tabela(task.getProcessDefinitionId());
				t.setP_id(task.getId());
				t.setN_tarefa_g(task.getProcessInstanceId());
				t.setTipo(task.getCategory());
				t.setData_fim_g(task.getDueDate()!=null?task.getDueDate().toString():"");
				taskManage.add(t);
			}
		}
		
		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks = new ArrayList<>();
		for(TaskService task:objTask.getMyTasks()){
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(task.getCreateTime().toString());
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription()!=null?task.getDescription():task.getName());
			t.setTipo_tabela_minhas_tarefas(task.getCategory());
			t.setP_id(task.getId());
			t.setN_tarefa_m(task.getProcessInstanceId());
			t.setData_fim_m(task.getDueDate()!=null?task.getDueDate().toString():"");
			myTasks.add(t);
		}
		
		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		for(TaskService task:objTask.getUnassigedTasks()){
			ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
			t.setCategorias_processo_tabela_disponiveis(task.getCategory());
			t.setData_entrada_tabela_disponiveis(task.getCreateTime().toString());
			t.setP_id(task.getId());
			t.setN_tarefa_d(task.getProcessInstanceId());
			t.setData_fim_d(task.getDueDate()!=null?task.getDueDate().toString():"");
			t.setTarefas_tabela_disponiveis(task.getDescription()!=null?task.getDescription():task.getName());
			tasksDisponiveis.add(t);
		}
		
		ExecucaoTarefasView view = new ExecucaoTarefasView(model);
		view.table_gerir_tarefas.addData(taskManage);
		view.table_disponiveis.addData(tasksDisponiveis);
		view.table_minhas_tarefas.addData(myTasks);
		view.p_id.setParam(true);
//		view.organica_minhas_tarefas.setValue(new ProfileType().getListMyProfiles());
//		view.organica_gerir_tarefa.setValue(new ProfileType().getListMyProfiles());
//		view.organica_colaborador.setValue(new ProfileType().getListMyProfiles());
//		view.organica_form_disponiveis.setValue(new ProfileType().getListMyProfiles());
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
		view.btn_transferir_tarefa.setLink("index");
		view.btn_transferir_tarefa.setPage("Transferir_tarefas");
		view.n_tarefa_d.setLabel("Número Processo");
		view.n_tarefa_g.setLabel("Número Processo");
		view.n_tarefa_m.setLabel("Número Processo");
		
		view.pesquisa_gerir_tarefa.setVisible(false);
		view.pesquisa_minhas_tarefas.setVisible(false);
		view.pesquisar_form_disponiveis.setVisible(false);
		view.tipo_etapa_colaborador.setVisible(false);
		view.organica_colaborador.setVisible(false);
		view.organica_form_disponiveis.setVisible(false);
		view.organica_gerir_tarefa.setVisible(false);
		view.organica_minhas_tarefas.setVisible(false);
		view.estado_estatistica.setValue(this.getStatus());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionPesquisar_tarefa() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR_TAREFA)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPesquisar_colaborador() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR_COLABORADOR)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPesquisar_button_minhas_tarefas() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR_BUTTON_MINHAS_TAREFAS)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPesquisar_button_disponiveis() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR_BUTTON_DISPONIVEIS)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPesquisar_estatistica() throws IOException{
		/*----#START-PRESERVED-AREA(PESQUISAR_ESTATISTICA)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVer_estatistica() throws IOException{
		/*----#START-PRESERVED-AREA(VER_ESTATISTICA)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVer_detalhes() throws IOException{
		/*----#START-PRESERVED-AREA(VER_DETALHES)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEnviar_msg() throws IOException{
		/*----#START-PRESERVED-AREA(ENVIAR_MSG)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionExecutar_button_minha_tarefas() throws IOException{
		/*----#START-PRESERVED-AREA(EXECUTAR_BUTTON_MINHA_TAREFAS)----*/
		String id = Core.getParam("p_id");
		if(Core.isNotNull(id)) {
			TaskService task = new TaskService().getTask(id);
			Application app = new Application().findByDad(task.getTenantId());
			if(app!=null) {
				this.addQueryString("taskId",id)
					.addQueryString("appId", app.getId())
					.addQueryString("appDad", app.getDad())
					.addQueryString("formKey", task.getFormKey())
					.addQueryString("processDefinition", task.getProcessDefinitionKey())
					.addQueryString("taskDefinition", task.getTaskDefinitionKey())
					.addQueryString("taskName", task.getName());
				return this.call(app.getDad().toLowerCase(),task.getTaskDefinitionKey(), "index",this.queryString());
			}
		}
		return this.redirect("igrp", "ErrorPage", "exception");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException{
		/*----#START-PRESERVED-AREA(DETALHES_PROCESSOS_BUTTON_MINHA_TAREFAS)----*/	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp","DetalhesProcesso","index&target=_blank&taskId="+id);
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException{
		/*----#START-PRESERVED-AREA(LEBERAR_TAREFA_BUTTON_MINHA_TAREFAS)----*/		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			TaskService task = new TaskService();
			if(task.freeTask(id)){
				Core.setMessageSuccess(gt("Tarefa liberada com sucesso"));
			}else{
				Core.setMessageError();			
			}
		}
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionAssumir_button_tabela() throws IOException{
		/*----#START-PRESERVED-AREA(ASSUMIR_BUTTON_TABLE)----*/		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			TaskService task = new TaskService();
			if(task.claimTask(id, this.getUser().getUser_name())){
				Core.setMessageSuccess(gt("Tarefa assumido com sucesso"));
			}else{
				Core.setMessageError();				
			}
		}
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionTransferir_tarefa() throws IOException{
		/*----#START-PRESERVED-AREA(TRANSFERIR_TAREFA)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionDetalhes_tarefa() throws IOException{
		/*----#START-PRESERVED-AREA(DETALHES_TAREFA)----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp","Detalhes_tarefas","index&target=_blank&taskId="+id);
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionDetalhes_processo() throws IOException{
		/*----#START-PRESERVED-AREA(DETALHES_PROCESSO)----*/	
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("igrp","DetalhesProcesso","index&target=_blank&taskId="+id);
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionAlterar_prioridade_tarefa() throws IOException{
		/*----#START-PRESERVED-AREA(ALTERAR_PRIORIDADE_TAREFA)----*/		
		return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private User getUser(){
		return new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
	}

	public Response actionProcessTask() throws IOException, ServletException{
		String taskId = Igrp.getInstance().getRequest().getParameter("p_prm_taskid");
		String processDefinitionId = Igrp.getInstance().getRequest().getParameter("p_prm_definitionid");
		String customForm = Igrp.getInstance().getRequest().getParameter("customForm");
		String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
		ResponseError result = null;
		if(Core.isNotNull(taskId)){
			return this.processTask(taskId,customForm,content);
		}
		if(Core.isNotNull(processDefinitionId)){
			result = this.processStartEvent(processDefinitionId,customForm,content);
			if(result==null){
				Core.setMessageSuccess();
				return this.forward("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
			}else{
				Core.setMessageError(result.getException());
				return this.redirect("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
			}
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	private Response processTask(String taskId, String customForm, String content) {
		TaskService task = new TaskService().getTask(taskId);
		this.addQueryString("taskId",taskId);
		Application app = new Application().findByDad(task.getTenantId());
		return this.call(app.getDad().toLowerCase(),task.getTaskDefinitionKey(), "save",this.queryString());
	}

	//Inicia tarefa de um processo
	private ResponseError processStartEvent(String processDefinitionId,String customForm,String content) throws IOException, ServletException{
		FormDataService formData = new FormDataService();
		FormDataService properties = null;
		ProcessInstancesService pi = new ProcessInstancesService();
		if(processDefinitionId!=null && !processDefinitionId.equals("")){
			formData.setProcessDefinitionId(processDefinitionId);
			properties = new FormDataService().getFormDataByProcessDefinitionId(processDefinitionId);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					Object value = BPMNHelper.getValue(prop.getType(), prop.getId());
					if(!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
						formData.addVariable(prop.getId(),value);
					}
				}
			}
		}
		if(Core.isNotNull(customForm) && Core.isNotNull(content)) {
			formData.addVariable("baseHostNameIgrp",this.getConfig().getHostName());
			formData.addVariable(Core.isNotNull(formData.getFormKey())?formData.getFormKey():"customVariableIGRP",content);
		}
		StartProcess st = formData.submitFormByProcessDenifition();

		if(st!=null){
			pi.setId(st.getId());
			new TaskFile().addFile(pi);
		}
		return (st!=null && st.getError()!=null)?st.getError():null;
	}
	
	private Map<String,String> getStatus() {
		Map<String,String> status = new HashMap<String,String>();
		status.put(null, "--- Selecionar Estado ---");
        status.put("false","Ativo");
        status.put("true","Terminado");
		return status;
	}

	/*----#END-PRESERVED-AREA----*/
}