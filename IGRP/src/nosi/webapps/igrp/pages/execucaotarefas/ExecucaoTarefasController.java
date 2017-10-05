/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.execucaotarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
/*---- End ----*/
import java.util.HashMap;

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		Map<Object, Object> listProc = IgrpHelper.toMap(new ProcessDefinitionService().getProcessDefinitionsAtivos(), "id", "name", "--- Selecionar Processo ---");
		Map<String,String> listPrioridade = new HashMap<String,String>();
		listPrioridade.put(null, "--- Escolher Prioridade ---");
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("50", "Médio");
		listPrioridade.put("0", "Normal");
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		TaskService objTask = new TaskService();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
//			model
			objTask.setFilter(model.getPrioridade_colaborador());
		}
		
		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage = new ArrayList<>();
		
		for(TaskService task:objTask.getTasks()){
			ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
			t.setAtribuido_a(task.getAssignee());
			t.setAtribuido_por(task.getOwner());
			t.setData_entrada(task.getCreateTime().toString());
			t.setDesc_tarefa(task.getDescription()!=null?task.getDescription():task.getName());
			t.setNumero_processo_tabela(task.getProcessDefinitionId());
			t.setP_id(task.getId());
			t.setTipo(task.getCategory());
			taskManage.add(t);
		}

		
		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks = new ArrayList<>();
		for(TaskService task:objTask.getMyTasks(this.getUser().getUser_name())){
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(task.getCreateTime().toString());
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription()!=null?task.getDescription():task.getName());
			t.setTipo_tabela_minhas_tarefas(task.getCategory());
			t.setP_id(task.getId());
			myTasks.add(t);
		}
		
		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		for(TaskService task:objTask.getUnassigedTasks()){
			ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
			t.setCategorias_processo_tabela_disponiveis(task.getCategory());
			t.setData_entrada_tabela_disponiveis(task.getCreateTime().toString());
			t.setP_id(task.getId());
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
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_colaborador() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_button_minhas_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_button_disponiveis() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_estatistica() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionTransferir_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionAlterar_prioridade_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
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
	

	public Response actionVer_estatistica() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionVer_detalhes() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionEnviar_msg() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionExecutar_button_minha_tarefas() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","MapaProcesso","open-process&taskId="+id );
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
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
	
	/*---- Insert your actions here... ----*/
	private User getUser(){
		return new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
	}
	
	public void processTask(){
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		if(taskId!=null && !taskId.equals("")){
			TaskService task = new TaskService();
			task.addVariable("n_filhos", "long",1);
			if(task.completeTask(taskId)){
				System.out.println("ok");
			}else{
				System.err.println("task:"+task.getError());
			}
		}
		
	}
	
	public void processStartEvent(){
		String p_processId = Igrp.getInstance().getRequest().getParameter("p_processId");
		if(p_processId!=null && !p_processId.equals("")){
			FormDataService formData = new FormDataService();
			formData.setTaskId(p_processId);
			formData.addVariable("customerName", "Ymac");
			formData.addVariable("potentialProfit", 100);
			formData.addVariable("details", "Cumi Bebi");
			if(formData.submitFormByTask()){
				System.out.println("Sumited success");
			}else{
				System.err.println("formData:"+formData.getError());
			}
		}
		
	}
	/*---- End ----*/
}
