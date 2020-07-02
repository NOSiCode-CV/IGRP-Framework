package nosi.webapps.igrp.pages.execucaotarefas;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.bpmn.BPMNExecution;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_disponiveis;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_gerir_tarefas;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_minhas_tarefas;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.helpers.DateHelper;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
/*----#end-code----*/
		
public class ExecucaoTarefasController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		model.setView_estatistica_img("../images/IGRP/IGRP2.3/assets/img/jon_doe.jpg");
		ExecucaoTarefasView view = new ExecucaoTarefasView();
		view.p_id_g.setParam(true);
		view.p_id_d.setParam(true);
		view.id.setParam(true);
		view.p_id_e.setParam(true);
		view.p_id_c.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_gerir_tarefas(Core.query(null,"SELECT '0' as prioridade_g,'Adipiscing accusantium mollit stract mollit' as n_tarefa_g,'Rem stract accusantium sit des' as desc_tarefa,'Accusantium officia iste elit' as tipo,'Unde totam perspiciatis elit r' as data_entrada,'06-01-2011' as data_fim_g,'Voluptatem accusantium labore' as atribuido_por,'Officia voluptatem accusantium' as atribuido_a,'hidden-3b6e_c0cf' as p_id_g,'hidden-940f_7879' as numero_processo_tabela "));
		model.loadTable_disponiveis(Core.query(null,"SELECT '25' as prioridade,'Sit natus rem ut deserunt' as n_tarefa_d,'Aperiam aliqua consectetur adi' as tarefas_tabela_disponiveis,'Mollit natus aliqua consectetu' as categorias_processo_tabela_disponiveis,'Labore laudantium adipiscing a' as data_entrada_tabela_disponiveis,'03-03-2016' as data_fim_d,'hidden-3d43_8629' as p_id_d "));
		model.loadTable_minhas_tarefas(Core.query(null,"SELECT '75' as prioridade_m,'Totam sit sed adipiscing ipsum' as n_tarefa_m,'Labore dolor magna elit lorem' as desc_tarefa_tabela_minhas_tarefas,'Perspiciatis voluptatem rem de' as tipo_tabela_minhas_tarefas,'Aperiam deserunt ipsum labore' as data_entrada_tabela_minhas_tarefas,'01-07-2016' as data_fim_m,'Unde natus aperiam ut stract' as atribuido_por_tabela_minhas_tarefas,'Magna sed omnis lorem amet' as espera_tabela_minhas_tarefas,'hidden-7dda_7d7c' as id "));
		model.loadTable_estatistica(Core.query(null,"SELECT 'Ut adipiscing aperiam aliqua r' as n_processo_estat_tabela,'Ut lorem totam labore ut' as desc_tarefa_estat_tabela,'Natus consectetur ut rem omnis' as tipo_estatistica_tabela,'Mollit perspiciatis sit aperia' as data_entrada_estat_tabela,'Lorem stract deserunt iste ut' as data_conclusao_estat_tabela,'hidden-3de6_a4bd' as p_id_e "));
		model.loadTable__colaboradores(Core.query(null,"SELECT 'Voluptatem officia iste mollit' as nome_colab_tabela,'Anim omnis accusantium unde de' as contacto_colab_tabela,'Lorem sed unde sit natus' as n_tarefas_colab_tabela,'Consectetur amet sit lorem adi' as n_atendimento_colab_tabela,'Iste doloremque magna adipisci' as media_tempo_colab_tabela,'Deserunt amet perspiciatis ut' as ranking_colab_tabela,'Natus labore lorem elit omnis' as percentagem_colab_tabela,'Stract voluptatem rem deserunt' as foto_colab_tabela,'Laudantium anim magna doloremq' as param_colab_tabela,'hidden-55d2_30c3' as p_id_c "));
		view.tipo_processo_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_etapa_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		this.showTabManage(view, false);// hide tab when user is not manager


		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage = this.getTaskManage(model, view);

		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks = this.getMyTasks(model, view);

		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = this.getAvailableTask(model, view);

		view.table_gerir_tarefas.addData(taskManage);
		view.table_disponiveis.addData(tasksDisponiveis);
		view.table_minhas_tarefas.addData(myTasks);
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

		view.btn_pesquisar_button_disponiveis.addParameter("btn_search", AVAILABLE).setLink("index");
		view.btn_pesquisar_button_minhas_tarefas.addParameter("btn_search", MY_TASK).setLink("index");
		view.btn_pesquisar_colaborador.addParameter("btn_search", CONTRIBUTOR).setLink("index");
		view.btn_pesquisar_estatistica.addParameter("btn_search", STATISTIC).setLink("index");
		view.btn_pesquisar_tarefa.addParameter("btn_search", MANAGE_TASK).setLink("index");
		view.btn_pesquisar_tarefa.setTarget("submit_ajax");

		view.btn_detalhes_minha_tarefa.setVisible(false);
		view.btn_detalhes_tarefa.setVisible(false);
		//view.numero_processo_tabela.setVisible(false);
		//view.btn_alterar_prioridade_tarefa.setVisible(false);
		
		//Due Date doesn't make sense
		view.data_fim_m.setVisible(false);
		view.data_fim_d.setVisible(false);
		view.data_fim_g.setVisible(false);
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar_button_disponiveis() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar_button_disponiveis)----*/
 return this.forward("igrp","ExecucaoTarefas","index",this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionPesquisar_button_minhas_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar_button_minhas_tarefas)----*/
 return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionPesquisar_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar_tarefa)----*/
 return this.forward("igrp","ExecucaoTarefas","index",this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionPesquisar_colaborador() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar_colaborador)----*/
 return this.forward("igrp","ExecucaoTarefas","index",this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionPesquisar_estatistica() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar_estatistica)----*/
return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionTransferir_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(transferir_tarefa)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g"));
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(detalhes_tarefa)----*/
		String id = Core.getParam("p_p_id_g");
		if (Core.isNotNull(id)) {
			this.addQueryString(BPMNConstants.PRM_TASK_ID, id).addQueryString("target", "_blank");
			return this.redirect("igrp", "Detalhes_tarefas", "index", this.queryString());
		}
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","DetalhesProcesso","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(detalhes_processo)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g")).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionAlterar_prioridade_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","Alter_prioridade_tarefa","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(alterar_prioridade_tarefa)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g"));
		/*----#end-code----*/
		return this.redirect("igrp","Alter_prioridade_tarefa","index", this.queryString());	
	}
	
	public Response actionAssumir_button_tabela() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(assumir_button_tabela)----*/
		String id = Core.getParam("p_p_id_d");
		if (Core.isNotNull(id) && new TaskServiceRest().claimTask(id, Core.getCurrentUser().getUser_name())) {
			Core.setMessageSuccess(Core.gt("Tarefa assumido com sucesso"));
		} else {
			Core.setMessageError();
		}
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionExecutar_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(executar_button_minha_tarefas)----*/
		
		String taskId = Core.getParam("p_id");
		if (Core.isNotNull(taskId)) {
			BPMNExecution bpmn = new BPMNExecution();
			return bpmn.openTask(taskId);
		}
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_minha_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(detalhes_minha_tarefa)----*/
		String id = Core.getParam("p_id");
		if (Core.isNotNull(id)) {
			this.addQueryString(BPMNConstants.PRM_TASK_ID, id).addQueryString("target", "_blank");
			return this.redirect("igrp", "Detalhes_tarefas", "index", this.queryString());
		}
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","DetalhesProcesso","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(detalhes_processos_button_minha_tarefas)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_id")).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(leberar_tarefa_button_minha_tarefas)----*/
		String id = Core.getParam("p_id");
		if (Core.isNotNull(id) && new TaskServiceRest().freeTask(id)) {
			Core.setMessageSuccess(Core.gt("Tarefa liberada com sucesso"));
		} else {
			Core.setMessageError();
		}
		// return this.redirect("igrp","ExecucaoTarefas","index");
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionVer_detalhes() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(ver_detalhes)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g")).addQueryString("type", "view");
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionVer_estatistica() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(ver_estatistica)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_c"));
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionEnviar_msg() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(enviar_msg)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g"));
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	public Response actionProcessTask() throws IOException, ServletException {
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);		
		String processKey = Core.getParam(BPMNConstants.PRM_PROCESS_KEY);
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);
		if (Core.isNotNull(taskId)) {
			return this.processTask(taskId);
		}
		if (Core.isNotNullMultiple(processId,processKey)) {
			return this.startProccess(processId,processKey);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	/**
	 * Start proccess
	 * @param processDefinitionId
	 * @return
	 * @throws IOException 
	 */
	private Response startProccess(String processDefinitionId,String processKey) throws IOException {
		BPMNExecution bpmn = new BPMNExecution();
		return bpmn.startProcess(processKey, processDefinitionId);
	}

	/**
	 * Execute task
	 * @param taskId
	 * @return
	 * @throws IOException 
	 */
	private Response processTask(String taskId) throws IOException {
		BPMNExecution bpmn = new BPMNExecution();
		return bpmn.executeTask(taskId);
	}

	private List<TaskService> applyFiler(ExecucaoTarefas model,int type) {
		String proc_tp = null, num_proc = null, status = null, data_inicio = null, data_fim = null, prioridade = null;
		int btn_search = Core.getParamInt("btn_search");
		TaskServiceIGRP taskServiceBO = new TaskServiceIGRP();
		switch (btn_search) {
			case AVAILABLE:
				proc_tp = model.getTipo_processo_form_disponiveis();
				num_proc = model.getNumero_processo_form_disponiveis();
				data_inicio = model.getData_inicio_form_disponiveis();
				data_fim = model.getData_fim_form_disponiveis();
				prioridade = model.getPrioridade_form_disponiveis();
				break;
			case CONTRIBUTOR:
				proc_tp = model.getTipo_processo_colaborador();
				num_proc = model.getNumero_processo_colaborador();
				data_inicio = model.getData_inicio_colaborador();
				data_fim = model.getData_fim_colaborador();
				prioridade = model.getPrioridade_colaborador();
				break;
			case MANAGE_TASK:
				proc_tp = model.getTipo_processo_gerir_tarefa();
				num_proc = model.getNumero_processo_gerir_tarefa();
				data_inicio = model.getData_inicio_gerir_tarefa();
				data_fim = model.getData_fim_gerir_tarefa();
				prioridade = model.getPrioridade_gerir_tarefa();
				break;
			case MY_TASK:
				proc_tp = model.getTipo_processo_minhas_tarefas();
				num_proc = model.getNumero_processo_minhas_tarefas();
				data_inicio = model.getData_inicio_minhas_tarefas();
				data_fim = model.getData_fim_minhas_tarefas();
				prioridade = model.getPrioridade_minhas_tarefas();
				break;
			case STATISTIC:
				status = model.getEstado_estatistica();
				proc_tp = model.getTipo_processo_estatistica();
				num_proc = model.getNumero_processo_estatistica();
				data_inicio = model.getData_inicio_estatistica();
				data_fim = model.getData_fim_estatistica();
				prioridade = model.getPrioridade_estatistica();
				break;
		}
		if (Core.isNotNull(proc_tp)) {
			taskServiceBO.addFilterUrl("processDefinitionKey", proc_tp);
		}
		if (Core.isNotNull(num_proc)) {
			taskServiceBO.addFilterUrl("processInstanceId", num_proc);
		}
		if (Core.isNotNull(status)) {
			taskServiceBO.addFilterUrl("finished", status);
		}
		if (Core.isNotNull(prioridade)) {
			taskServiceBO.addFilterUrl("taskPriority", prioridade);
		}
		List<TaskService> tasks = null;
		switch (type) {
			case AVAILABLE:
				tasks = taskServiceBO.getAvailableTasks();
				break;
			case CONTRIBUTOR:
				tasks = taskServiceBO.getMabageTasks();
				break;
			case MANAGE_TASK:
				tasks = taskServiceBO.getMabageTasks();
				break;
			case MY_TASK:
				tasks = taskServiceBO.getMyTasks();
				break;
			case STATISTIC:
				//por implementar
				break;
		}
		if(Core.isNotNullMultiple(data_inicio,data_fim)) {
			final String d_i = data_inicio;
			final String d_f = data_fim;
			tasks = tasks.stream()
						 .filter(t->DateHelper.compareDate(t.getCreateTime(), d_i,(d1,d2)->d1.compareTo(d2)>=0))
						 .filter(t->DateHelper.compareDate(t.getCreateTime(), d_f,(d1,d2)->d1.compareTo(d2)<=0))
						 .collect(Collectors.toList());
		}else {
			if(Core.isNotNull(data_inicio)) {
				final String d_i = data_inicio;
				tasks = tasks.stream()
						.filter(t->DateHelper.compareDate(t.getCreateTime(), d_i,(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());				
			}
			if(Core.isNotNull(data_fim)) {
				final String d_f = data_fim;
				tasks = tasks.stream().filter(t->DateHelper.compareDate(t.getDueDate(), d_f,(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());
			}
		}
		return tasks ;
	}

	private void showTabManage(ExecucaoTarefasView view, boolean isVisible) {
		final String getConfig = Core.getConfig("SPS_available_profs");
		if(Core.isNotNull(getConfig) && getConfig.contains(Core.getCurrentProfileCode()))
			view.disponiveis.setVisible(isVisible);
		view.gerir_tarefas.setVisible(isVisible);
		view.colaboradores.setVisible(false);
		view.estatistica.setVisible(false);
	}

	private static Map<String, String> listPrioridade = new HashMap<String, String>();
	static {
		listPrioridade.put(null, Core.gt("-- Escolher Prioridade --"));
		listPrioridade.put("100", "Urgente");
      	listPrioridade.put("75", "Alta");
		listPrioridade.put("50", "Normal");
     	listPrioridade.put("25", "Baixa");
		listPrioridade.put("0", "Muito baixa");
	}

	// Get tasks for user manager
	private List<Table_gerir_tarefas> getTaskManage(ExecucaoTarefas model, ExecucaoTarefasView view) {
		List<Table_gerir_tarefas> taskManage = new ArrayList<>();
		// Verifica se é perfil pai
		if (ProfileType.isPerfilPai()) {
			List<TaskService> tasks = this.applyFiler(model,MANAGE_TASK); // apply new filter
			for (TaskService task : tasks) {
				ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
				t.setAtribuido_a(task.getAssignee());
				t.setAtribuido_por(task.getOwner());
				t.setData_entrada(Core.isNotNull(task.getCreateTime())
						? Core.dateToString(task.getCreateTime(), "yyyy-MM-dd HH:mm:ss"): "");
				t.setDesc_tarefa(task.getDescription() != null ? task.getDescription() : task.getName());
				t.setNumero_processo_tabela(task.getProcessDefinitionId());
				t.setP_id_g(task.getId());
				t.setN_tarefa_g(task.getProcessInstanceId());
				t.setTipo(task.getProcessName()+getVersion(task));
				t.setData_fim_g(Core.isNotNull(task.getDueDate())
						? Core.dateToString(task.getDueDate(), "yyyy-MM-dd HH:mm:ss"): "");
				t.setPrioridade_g(""+task.getPriority());
				taskManage.add(t);
			}
			this.showTabManage(view, true);// show tab when user is manager
		}
		return taskManage;
	}

	// Get all tasks of current user
	private List<Table_minhas_tarefas> getMyTasks(ExecucaoTarefas model, ExecucaoTarefasView view) {
		List<Table_minhas_tarefas> myTasks = new ArrayList<>();
		List<TaskService> tasks = this.applyFiler(model,MY_TASK); // apply new filter
		for (TaskService task : tasks) {
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(Core.isNotNull(task.getCreateTime())
					? Core.dateToString(task.getCreateTime(), "yyyy-MM-dd HH:mm:ss"): "");
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription() != null ? task.getDescription() : task.getName());
			t.setTipo_tabela_minhas_tarefas(task.getProcessName()+getVersion(task));
			t.setId(task.getId());
			t.setN_tarefa_m(task.getProcessInstanceId());
			t.setData_fim_m(Core.isNotNull(task.getDueDate())
					? Core.dateToString(task.getDueDate(), "yyyy-MM-dd HH:mm:ss"): "");
			t.setPrioridade_m(""+task.getPriority());
			t.setEspera_tabela_minhas_tarefas(task.getSuspended()?"Sim":"");
			myTasks.add(t);
		}
		return myTasks;
	}

	// Get all available task
	private List<Table_disponiveis> getAvailableTask(ExecucaoTarefas model, ExecucaoTarefasView view) {
		List<Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		List<TaskService> tasks = this.applyFiler(model,AVAILABLE); // apply new filter
		for (TaskService task : tasks) {
			ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
			t.setCategorias_processo_tabela_disponiveis(task.getProcessName()+getVersion(task));
			t.setData_entrada_tabela_disponiveis(Core.isNotNull(task.getCreateTime())
					? Core.dateToString(task.getCreateTime(), "yyyy-MM-dd HH:mm:ss"): "");
			t.setP_id_d(task.getId());
			t.setN_tarefa_d(task.getProcessInstanceId());
			t.setData_fim_d(Core.isNotNull(task.getDueDate())
					? Core.dateToString(task.getDueDate(), "yyyy-MM-dd HH:mm:ss"): "");
			t.setTarefas_tabela_disponiveis(task.getDescription() != null ? task.getDescription() : task.getName());
			t.setPrioridade(""+task.getPriority());
			tasksDisponiveis.add(t);
		}
		return tasksDisponiveis;
	}
	
	private String getVersion(TaskService task) {
		String [] taskS=task.getProcessDefinitionId().split(":");
		if(taskS.length==3) {
			return " v."+taskS[1];
		}
		return "";
	}

	private Map<String, String> listProc = new ProcessDefinitionIGRP().mapToComboBoxByKey(Core.getCurrentDad());
	private static final int MANAGE_TASK = 0;
	private static final int CONTRIBUTOR = 1;
	private static final int STATISTIC = 2;
	private static final int MY_TASK = 3;
	private static final int AVAILABLE = 4;
	

	/*----#end-code----*/
}
