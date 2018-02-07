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
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/		
		Application app = new Application().find().andWhere("dad", "=",Permission.getCurrentEnv()).one();
		Map<Object, Object> listProc = IgrpHelper.toMap(new ProcessDefinitionService().getProcessDefinitionsAtivos(app.getId()), "id", "name", gt("-- Selecionar Processo --"));
		Map<String,String> listPrioridade = new HashMap<String,String>();
		listPrioridade.put(null, gt("-- Escolher Prioridade --"));
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("50", "Médio");
		listPrioridade.put("0", "Normal");
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		TaskService objTask = new TaskService();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
			objTask.setFilter(model.getPrioridade_colaborador());
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
		for(TaskService task:objTask.getMyTasks(this.getUser().getUser_name())){
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
		view.btn_transferir_tarefa.setLink("index");
		view.btn_transferir_tarefa.setPage("Transferir_tarefas");
		view.n_tarefa_d.setLabel("Número Processo");
		view.n_tarefa_g.setLabel("Número Processo");
		view.n_tarefa_m.setLabel("Número Processo");
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
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null && !id.equals(""))
			return this.redirect("igrp","MapaProcesso","open-process&taskId="+id );
		else
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
		Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
		String[] p_prm_file_name_fk = Igrp.getInstance().getRequest().getParameterValues("p_prm_file_name_fk");
		String[] p_prm_file_description_fk = Igrp.getInstance().getRequest().getParameterValues("p_prm_file_description_fk");
		if(Core.isNotNull(taskId)){
			result = this.processTask(taskId,customForm,content,parts,p_prm_file_name_fk,p_prm_file_description_fk);
			if(result==null){
				Core.setMessageSuccess();
				return this.redirect("igrp","ExecucaoTarefas", "index");
			}else{
				Core.setMessageError(result.getException());
				return this.redirect("igrp","MapaProcesso", "open-process&taskId="+taskId);
			}
		}
		if(Core.isNotNull(processDefinitionId)){
			result = this.processStartEvent(processDefinitionId,customForm,content,parts,p_prm_file_name_fk,p_prm_file_description_fk);
			if(result==null){
				Core.setMessageSuccess();
			}else{
				Core.setMessageError(result.getException());
			}
			return this.redirect("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	private Object getValue(String type,String name){
		Object value = Igrp.getInstance().getRequest().getParameter("p_"+name.toLowerCase());
		try {
			switch (type.toLowerCase()) {
				case "date":
					return DateHelper.convertDate(value.toString(), "dd-MM-yyyy", "dd-MM-yyyy h:mm");
				case "long":
					if(Core.isNotNull(value))
						return Long.parseLong(value.toString());
					return 0;
				case "double":
					if(Core.isNotNull(value))
						return Double.parseDouble(value.toString());
					return 0;
				case "float":
					if(Core.isNotNull(value))
						return Float.parseFloat(value.toString());
					return 0;
				case "boolean":
					return value.toString().equals("1");
				case "enum":
				case "string":
					return value.toString();
			}
		}catch(NullPointerException e) {}
		return "";
	}
	
	//Executa uma tarefa
	private ResponseError processTask(String p_prm_taskid,String customForm,String content,Collection<Part> parts,String [] p_prm_file_name_fk,String [] p_prm_file_description_fk){
		FormDataService formData = new FormDataService();
		TaskService task = new TaskService().getTask(p_prm_taskid);
		FormDataService properties = null;
		ProcessInstancesService p = new ProcessInstancesService();
		p.setId(task.getProcessInstanceId());
		CustomVariable<String[]> customVariable = new CustomVariable<>();
		Map<String, String[]> map = new HashMap<>();
		
		if(p_prm_taskid!=null && !p_prm_taskid.equals("")){
			formData.setTaskId(p_prm_taskid);
			properties = new FormDataService().getFormDataByTaskId(p_prm_taskid);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					Object value =this.getValue(prop.getType(), prop.getId());
					if(!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
						formData.addVariable(prop.getId(),value);
					}
				}
			}
			if(Core.isNotNull(customForm) && Core.isNotNull(content)) {
				formData.addVariable("customVariableIGRP",content);
				String[] total = new String[1];
				Core.getParameters().entrySet().stream()
						.filter(param->param.getKey().endsWith("_fk"))
						.forEach(param->{
							for(String v:param.getValue()) {
								try {
									int x = Integer.parseInt(v);
									if(Core.isNotNull(total[0]))
										x += Double.parseDouble(total[0]);
									total[0] = ""+x;
								}catch(NumberFormatException e) {}
							}
						});
				map.put("total", total);
				
				Core.getParameters().entrySet().stream().forEach(param->{
					map.put(param.getKey(), param.getValue());
				});				
				customVariable.setName("igrp");
				customVariable.setValue(map);
				p.submitProcessObject(customVariable, "v_serial", "local");
			}
		}
		
		new TaskFile().addFile(task, parts, p_prm_file_name_fk, p_prm_file_description_fk);
		StartProcess st = formData.submitFormByTask();
		return (st!=null && st.getError()!=null)?st.getError():null;
	}
	

	//Inicia tarefa de um processo
	private ResponseError processStartEvent(String processDefinitionId,String customForm,String content,Collection<Part> parts,String [] p_prm_file_name_fk,String [] p_prm_file_description_fk){
		FormDataService formData = new FormDataService();
		FormDataService properties = null;
		ProcessDefinitionService task = new ProcessDefinitionService();
		if(processDefinitionId!=null && !processDefinitionId.equals("")){
			formData.setProcessDefinitionId(processDefinitionId);
			properties = new FormDataService().getFormDataByProcessDefinitionId(processDefinitionId);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					Object value =this.getValue(prop.getType(), prop.getId());
					if(!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
						formData.addVariable(prop.getId(),value);
					}
				}
			}
		}
		if(Core.isNotNull(customForm) && Core.isNotNull(content)) {
			formData.addVariable("customVariableIGRP",content);
		}
		StartProcess st = formData.submitFormByProcessDenifition();
		
		if(st!=null){
			task.setId(st.getId());
			new TaskFile().addFile(task, parts, p_prm_file_name_fk, p_prm_file_description_fk);
		}
		return (st!=null && st.getError()!=null)?st.getError():null;
	}
	/*----#END-PRESERVED-AREA----*/
}