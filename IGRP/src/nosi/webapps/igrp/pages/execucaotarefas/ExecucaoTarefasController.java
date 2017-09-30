/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.execucaotarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.webapps.igrp.dao.User;

import java.util.List;
import java.util.ArrayList;
/*---- End ----*/

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		ExecucaoTarefas model = new ExecucaoTarefas();
		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage = new ArrayList<>();
		for(TaskService task:new TaskService().getAllTasks()){
			ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
			t.setAtribuido_a(task.getAssignee());
			t.setAtribuido_por(task.getOwner());
			t.setData_entrada(task.getCreateTime().toString());
			t.setDesc_tarefa(task.getDescription());
			t.setNumero_processo_tabela(task.getProcessDefinitionId());
			t.setP_id(task.getId());
			t.setTipo(task.getCategory());
			taskManage.add(t);
		}

		
		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks = new ArrayList<>();
		for(TaskService task:new TaskService().getMyTasks(this.getUser().getUser_name())){
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(task.getCreateTime().toString());
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription());
			t.setTipo_tabela_minhas_tarefas(task.getCategory());
			myTasks.add(t);
		}
		
		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		for(TaskService task:new TaskService().getTasksDisponiveis(this.getUser().getUser_name())){
			ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
			t.setCategorias_processo_tabela_disponiveis(task.getCategory());
			t.setData_entrada_tabela_disponiveis(task.getCreateTime().toString());
			t.setP_id(task.getId());
			t.setTarefas_tabela_disponiveis(task.getDescription());
			tasksDisponiveis.add(t);
		}
		ExecucaoTarefasView view = new ExecucaoTarefasView(model);
		view.table_gerir_tarefas.addData(taskManage);
		view.table_disponiveis.addData(tasksDisponiveis);
		view.table_minhas_tarefas.addData(myTasks);
		view.p_id.setParam(true);
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
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
	private User getUser(){
		return new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
	}
	/*---- End ----*/
}
