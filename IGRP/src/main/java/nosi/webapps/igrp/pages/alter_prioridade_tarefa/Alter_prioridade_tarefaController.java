/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.alter_prioridade_tarefa;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskService;

import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class Alter_prioridade_tarefaController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Map<String,String> listPrioridade = new HashMap<String,String>();
		listPrioridade.put(null, gt("--- Escolher Prioridade ---"));
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("50", "Médio");
		listPrioridade.put("0", "Normal");
		TaskServiceIGRP taskRest = new TaskServiceIGRP();
		Alter_prioridade_tarefa model = new Alter_prioridade_tarefa();
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		if(id!=null && !id.equals("")){
			TaskService task = taskRest.getTask(id);
			if(task!=null){
				model.setData_criacao_da_tarefa(task.getCreateTime().toString());
				model.setData_inicio_da_tarefa(task.getCreateTime().toString());
				model.setDescricao_da_tarefa(task.getDescription());
				model.setPrioridade_da_tarefa(listPrioridade.get(""+task.getPriority()).toString());
				model.setTarefa_atribuida_a(task.getAssignee());
				model.setTarefa_atribuida_por(task.getOwner());
				model.setTipo_da_tarefa(task.getCategory());
				model.setNumero_de_processo(task.getProcessDefinitionId());
				model.setTipo_de_processo(task.getName());
				model.setData_criacao_do_processo(task.getCreateTime().toString());
				model.setP_id(id);
			}
		}
		Alter_prioridade_tarefaView view = new Alter_prioridade_tarefaView(model);
		view.target = "_blank";
		view.btn_salvar.setLink("index");
		view.nova_prioridade.setValue(listPrioridade);
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
			TaskService task = taskRest.getTask(model.getP_id());
			if(task!=null){
				task.setPriority(Integer.parseInt(model.getNova_prioridade()));
				task = taskRest.getTaskServiceRest().update(task);
				if(task!=null){
					Igrp.getInstance().getFlashMessage().addMessage("success",gt("Prioridade da tarefa alterada com sucesso"));
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));				
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));				
			}
		}
		if(type!=null && type.equalsIgnoreCase("view")){
			view.btn_salvar.setTitle("Fechar");
			view.btn_salvar.setLink("");
			view.btn_salvar.setPage("");
			view.btn_salvar.setImg("danger|fa-close");
			view.btn_salvar.setTarget("_close");
			view.nova_prioridade.setVisible(false);
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionSalvar() throws IOException{
		/*----#START-PRESERVED-AREA(SALVAR)----*/				
		return this.redirect("igrp","alter_prioridade_tarefa","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
