package nosi.webapps.igrp.pages.execucaotarefas;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.*;

import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.helpers.DateHelper;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.bpmn.BPMNExecution;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_disponiveis;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_gerir_tarefas;
import nosi.webapps.igrp.pages.execucaotarefas.ExecucaoTarefas.Table_minhas_tarefas;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class ExecucaoTarefasController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		model.setView_estatistica_img("../images/IGRP/IGRP2.3/assets/img/jon_doe.jpg");
		ExecucaoTarefasView view = new ExecucaoTarefasView();
		view.p_id_d.setParam(true);
		view.prm_taskid.setParam(true);
		view.p_id_c.setParam(true);
		view.p_id_e.setParam(true);
		view.p_id_g.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_disponiveis(Core.query(null,"SELECT '75' as prioridade,'Amet adipiscing mollit sit perspiciatis' as n_tarefa_d,'Elit lorem iste aperiam unde' as tarefas_tabela_disponiveis,'Perspiciatis aperiam officia a' as categorias_processo_tabela_disponiveis,'Accusantium ipsum natus magna' as data_entrada_tabela_disponiveis,'07-06-2014' as data_fim_d,'hidden-c116_0e97' as p_id_d "));
		model.loadTable_minhas_tarefas(Core.query(null,"SELECT '50' as prioridade_m,'Laudantium lorem perspiciatis voluptatem lorem' as n_tarefa_m,'Accusantium aliqua consectetur' as desc_tarefa_tabela_minhas_tarefas,'Iste laudantium officia magna' as tipo_tabela_minhas_tarefas,'Accusantium stract ipsum offic' as data_entrada_tabela_minhas_tarefas,'06-07-2015' as data_fim_m,'Stract natus doloremque dolor' as atribuido_por_tabela_minhas_tarefas,'Mollit amet labore iste rem' as espera_tabela_minhas_tarefas,'hidden-016d_a418' as prm_taskid "));
		model.loadTable__colaboradores(Core.query(null,"SELECT 'Ipsum laudantium lorem iste st' as nome_colab_tabela,'Sit sed adipiscing stract accu' as contacto_colab_tabela,'Adipiscing officia omnis deser' as n_tarefas_colab_tabela,'Mollit unde dolor doloremque l' as n_atendimento_colab_tabela,'Voluptatem mollit officia aliq' as media_tempo_colab_tabela,'Mollit deserunt adipiscing lau' as ranking_colab_tabela,'Mollit natus lorem consectetur' as percentagem_colab_tabela,'Sed iste rem elit rem' as foto_colab_tabela,'Unde dolor doloremque mollit r' as param_colab_tabela,'hidden-6325_aa47' as p_id_c "));
		model.loadTable_estatistica(Core.query(null,"SELECT 'Ut amet iste sit consectetur' as n_processo_estat_tabela,'Consectetur adipiscing amet si' as desc_tarefa_estat_tabela,'Ut magna perspiciatis sit elit' as tipo_estatistica_tabela,'Omnis lorem consectetur sed ac' as data_entrada_estat_tabela,'Stract amet sed ipsum perspici' as data_conclusao_estat_tabela,'hidden-9b3b_7a8f' as p_id_e "));
		model.loadTable_gerir_tarefas(Core.query(null,"SELECT '50' as prioridade_g,'Totam aliqua totam iste mollit' as n_tarefa_g,'Doloremque stract iste volupta' as desc_tarefa,'Laudantium anim stract sed omn' as tipo,'Stract mollit ipsum labore str' as data_entrada,'06-05-2015' as data_fim_g,'Lorem unde elit deserunt strac' as atribuido_por,'Rem dolor sed natus deserunt' as atribuido_a,'hidden-4120_a0df' as p_id_g,'hidden-9a98_6d41' as numero_processo_tabela "));
		view.tipo_processo_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tarefa_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.atribuido_por_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.atribuido_a_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_etapa_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		this.showTabManage(view, ProfileType.isPerfilPai());// hide tab when user is not manager
		List<ExecucaoTarefas.Table_gerir_tarefas> taskManage =  new ArrayList<>();
		List<ExecucaoTarefas.Table_minhas_tarefas> myTasks =  new ArrayList<>();
		List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis =  new ArrayList<>(); 
		int btn_search = Core.getParamInt("btn_search");
		
		switch (btn_search) {
		case AVAILABLE:
			tasksDisponiveis = this.getAvailableTask(model, view);
			break;
		case MANAGE_TASK:
			taskManage = this.getTaskManage(model, view);
			break;
		case MY_TASK:
			myTasks = this.getMyTasks(model);
			break;
		default:
			if(view.gerir_tarefas.isVisible()) {
				Core.setMessageInfo("Em <b>Gerir tarefas</b> usar o filtro e pesquisar por favor porque a lista é só de disponíveis e minhas.");
				model.setLimite_maximo_de_registos_gerir_tarefa(1000);
			}
			myTasks = this.getMyTasks(model);
			if(view.gerir_tarefas.isVisible())
				addTaskManage(taskManage);
			
			tasksDisponiveis = this.getAvailableTask(model, view);
			if(view.gerir_tarefas.isVisible())
				addTaskManage(taskManage);

		}
		
		myTasks.sort(Comparator.comparing((Table_minhas_tarefas t) -> Integer.parseInt(t.getPrioridade_m())).reversed());
		tasksDisponiveis.sort(Comparator.comparing((Table_disponiveis t) -> Integer.parseInt(t.getPrioridade())).reversed());
		taskManage.sort(Comparator.comparing((Table_gerir_tarefas t) -> Integer.parseInt(t.getPrioridade_g())).reversed());

		view.table_gerir_tarefas.addData(taskManage);
		view.table_disponiveis.addData(tasksDisponiveis);
		view.table_minhas_tarefas.addData(myTasks);

		final var listPrioridade = buildPriorityMap();
		view.prioridade_colaborador.setValue(listPrioridade);
		view.prioridade_estatistica.setValue(listPrioridade);
		view.prioridade_minhas_tarefas.setValue(listPrioridade);
		view.prioridade_form_disponiveis.setValue(listPrioridade);
		view.prioridade_gerir_tarefa.setValue(listPrioridade);

		final var listProc = new ProcessDefinitionIGRP().mapToComboBoxByKey(Core.getCurrentDad());
		view.tipo_processo_colaborador.setValue(listProc);
		view.tipo_processo_form_disponiveis.setValue(listProc);
		view.tipo_processo_estatistica.setValue(listProc);
		view.tipo_processo_gerir_tarefa.setValue(listProc);
		view.tipo_processo_minhas_tarefas.setValue(listProc);

		final Map<Object, Object> tasksMap =  Core.toMap(new TaskAccess().getTaskAccess(), "taskName", "taskDescription","-- Selecionar --");
		view.tarefa_gerir_tarefa.setValue(tasksMap);

		final Map<Object, Object> userAtrib = Core.toMap(Core.getUsersByApplication(Core.getCurrentDad()), "user_name", "name","-- Selecionar --");
		view.atribuido_por_gerir_tarefa.setValue(userAtrib);
		view.atribuido_a_gerir_tarefa.setValue(userAtrib);

		view.atribuido_a_gerir_tarefa.setValue(((Map<String, String>) view.atribuido_a_gerir_tarefa.getListOptions()).put("false", gt("-x Ninguém x-")));

		view.btn_detalhes_minha_tarefa.setVisible(false);
		view.btn_detalhes_tarefa.setVisible(false);
		view.numero_processo_tabela.setVisible(false);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar_button_disponiveis)  *//* End-Code-Block  */
		/*----#start-code(pesquisar_button_disponiveis)----*/
		this.addQueryString("btn_search", AVAILABLE);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar_button_minhas_tarefas)  *//* End-Code-Block  */
		/*----#start-code(pesquisar_button_minhas_tarefas)----*/

		this.addQueryString("btn_search", MY_TASK);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar_tarefa)  *//* End-Code-Block  */
		/*----#start-code(pesquisar_tarefa)----*/
 
		this.addQueryString("btn_search", MANAGE_TASK);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar_colaborador)  *//* End-Code-Block  */
		/*----#start-code(pesquisar_colaborador)----*/
		this.addQueryString("btn_search", CONTRIBUTOR);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar_estatistica)  *//* End-Code-Block  */
		/*----#start-code(pesquisar_estatistica)----*/
		this.addQueryString("btn_search", STATISTIC);
		return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionAssumir_button_tabela() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assumir_button_tabela)  *//* End-Code-Block  */
		/*----#start-code(assumir_button_tabela)----*/
		String id = Core.getParam("p_p_id_d");
		if (Core.isNotNull(id) && new TaskServiceRest().claimTask(id, Objects.requireNonNull(Core.getCurrentUser()).getUser_name())) {
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (executar_button_minha_tarefas)  *//* End-Code-Block  */
		/*----#start-code(executar_button_minha_tarefas)----*/
		
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (detalhes_minha_tarefa)  *//* End-Code-Block  */
		/*----#start-code(detalhes_minha_tarefa)----*/
		String id = Core.getParam(BPMNConstants.PRM_TASK_ID); 
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","DetalhesProcesso","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (detalhes_processos_button_minha_tarefas)  *//* End-Code-Block  */
		/*----#start-code(detalhes_processos_button_minha_tarefas)----*/
		String id = Core.getParam(BPMNConstants.PRM_TASK_ID); 
		System.out.println("Detalhes Minhas Tarefas: " + id);
		this.addQueryString(BPMNConstants.PRM_TASK_ID, id).addQueryString("target", "_blank");
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (leberar_tarefa_button_minha_tarefas)  *//* End-Code-Block  */
		/*----#start-code(leberar_tarefa_button_minha_tarefas)----*/
		String id = Core.getParam(BPMNConstants.PRM_TASK_ID);
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (ver_detalhes)  *//* End-Code-Block  */
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (ver_estatistica)  *//* End-Code-Block  */
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (enviar_msg)  *//* End-Code-Block  */
		/*----#start-code(enviar_msg)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g"));
		/*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionTransferir_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","Transferir_tarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (transferir_tarefa)  *//* End-Code-Block  */
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","ExecucaoTarefas","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (detalhes_tarefa)  *//* End-Code-Block  */
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","DetalhesProcesso","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (detalhes_processo)  *//* End-Code-Block  */
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
		  this.addQueryString("p_p_id_d",Core.getParam("p_p_id_d"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  this.addQueryString("p_p_id_c",Core.getParam("p_p_id_c"));
		  this.addQueryString("p_p_id_e",Core.getParam("p_p_id_e"));
		  this.addQueryString("p_p_id_g",Core.getParam("p_p_id_g"));
		  return this.forward("igrp","Alter_prioridade_tarefa","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (alterar_prioridade_tarefa)  *//* End-Code-Block  */
		/*----#start-code(alterar_prioridade_tarefa)----*/
		
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_p_id_g"));
		/*----#end-code----*/
		return this.redirect("igrp","Alter_prioridade_tarefa","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/

	
	//Tab availables not showing if you have the dad_hide_tab_d in the config file
	final String getConfig = Core.getConfig(Core.getCurrentDad()+"_hide_tab_d");
	
	public Response actionProcessTask() throws IOException {
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
	
	public Response actionStep() throws IOException {
		ExecucaoTarefasView view = new ExecucaoTarefasView();
		Map<Object, Object> tasksMapP =  Core.toMap(new TaskAccess().getTaskAccess(Core.getParam(view.tipo_processo_gerir_tarefa.getParamTag())), "taskName", "taskDescription","-- Selecionar --");
		return this.renderView(Core.remoteComboBoxXml(tasksMapP, view.tarefa_gerir_tarefa, null));
	}

	/**
	 * Start proccess
	 * @param processDefinitionId
	 * @return
	 * @throws IOException 
	 */
	private Response startProccess(String processDefinitionId,String processKey) {
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
		String proc_tp = null,
				num_proc = null, 
				status = null, 
				data_inicio = null,
				data_fim = null, 
				prioridade = null;
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
			default:
				//In load, without the press of the search button
			if(type==AVAILABLE){
				proc_tp = model.getTipo_processo_form_disponiveis();
				num_proc = model.getNumero_processo_form_disponiveis();
				data_inicio = model.getData_inicio_form_disponiveis();
				data_fim = model.getData_fim_form_disponiveis();
				prioridade = model.getPrioridade_form_disponiveis();
				}else
			if(type==CONTRIBUTOR){
				proc_tp = model.getTipo_processo_colaborador();
				num_proc = model.getNumero_processo_colaborador();
				data_inicio = model.getData_inicio_colaborador();
				data_fim = model.getData_fim_colaborador();
				prioridade = model.getPrioridade_colaborador();
				}else
			if(type==MANAGE_TASK){
				proc_tp = model.getTipo_processo_gerir_tarefa();
				num_proc = model.getNumero_processo_gerir_tarefa();
				data_inicio = model.getData_inicio_gerir_tarefa();
				data_fim = model.getData_fim_gerir_tarefa();
				prioridade = model.getPrioridade_gerir_tarefa();
				}else
			if(type==MY_TASK){
				proc_tp = model.getTipo_processo_minhas_tarefas();
				num_proc = model.getNumero_processo_minhas_tarefas();
				data_inicio = model.getData_inicio_minhas_tarefas();
				data_fim = model.getData_fim_minhas_tarefas();
				prioridade = model.getPrioridade_minhas_tarefas();
				}else
			if(type==STATISTIC){
				status = model.getEstado_estatistica();
				proc_tp = model.getTipo_processo_estatistica();
				num_proc = model.getNumero_processo_estatistica();
				data_inicio = model.getData_inicio_estatistica();
				data_fim = model.getData_fim_estatistica();
				prioridade = model.getPrioridade_estatistica();
				}
				
		}
		if (Core.isNotNull(proc_tp)) {
			taskServiceBO.addFilterBody("processDefinitionKey", proc_tp);
		}
		if (Core.isNotNull(num_proc)) {
			taskServiceBO.addFilterBody("processInstanceId", num_proc);
		}
		if (Core.isNotNull(status)) {
			taskServiceBO.addFilterBody("finished", status);
		}
		if (Core.isNotNull(prioridade)) {
			taskServiceBO.addFilterBody("priority", prioridade);
		}
		if(Core.isNotNull(data_fim)) 				
			taskServiceBO.addFilterBody("createdBefore", DateHelper.toDateTime(data_fim, 1));
		
		if(Core.isNotNull(data_inicio)) 			
			taskServiceBO.addFilterBody("createdAfter", DateHelper.toDateTime(data_inicio));
		
		if(Core.isNotNull(model.getAtribuido_a_gerir_tarefa())) {
			if(model.getAtribuido_a_gerir_tarefa().equals("false"))
				taskServiceBO.addFilterBody("unassigned","false");
			else
				taskServiceBO.addFilterBody("assignee", model.getAtribuido_a_gerir_tarefa());
			
		}
	
		if(Core.isNotNull(model.getAtribuido_por_gerir_tarefa())) {
			taskServiceBO.addFilterBody("owner", model.getAtribuido_por_gerir_tarefa());
		}
		
		if(Core.isNotNull(model.getTarefa_gerir_tarefa()))
			taskServiceBO.addFilterBody("taskDefinitionKey", model.getTarefa_gerir_tarefa());
		
		if(Core.isNotNullOrZero(model.getLimite_maximo_de_registos_gerir_tarefa()))
			taskServiceBO.addFilterBody("size", ""+model.getLimite_maximo_de_registos_gerir_tarefa());
	
		
		List<TaskService> tasksF = new ArrayList<>();
		switch (type) {
			case AVAILABLE:
				tasksF = taskServiceBO.getAvailableTasks();
				break;
			case CONTRIBUTOR, MANAGE_TASK:
				tasksF = taskServiceBO.getManageTasks();
				break;
           case MY_TASK:
				tasksF = taskServiceBO.getMyTasks();
				break;
			case STATISTIC:
				//por implementar
				break;
		}

		return tasksF ;
	}

	private void showTabManage(ExecucaoTarefasView view, boolean isVisible) {
		
		//Tab availables not showing if you have the dad_hide_tab_d in the config file
		if(Core.isNotNull(getConfig) && getConfig.contains(Core.getCurrentProfileCode()))
			view.disponiveis.setVisible(isVisible);
		view.gerir_tarefas.setVisible(isVisible);
		view.colaboradores.setVisible(false);
		view.estatistica.setVisible(false);
	}

	// Get tasks for user manager
	private List<Table_gerir_tarefas> getTaskManage(ExecucaoTarefas model, ExecucaoTarefasView view) {
		List<Table_gerir_tarefas> taskManage = new ArrayList<>();
		// Verifica se é perfil pai
		if (view.gerir_tarefas.isVisible()) {
			tasks = this.applyFiler(model,MANAGE_TASK); // apply new filter
			addTaskManage(taskManage);
			//this.showTabManage(view, true);// show tab when user is manager
		}
		return taskManage;
	}

	/**
	 * @param taskManage
	 */
	private void addTaskManage(List<Table_gerir_tarefas> taskManage) {
		
		for (TaskService task : tasks) {
			ExecucaoTarefas.Table_gerir_tarefas t = new ExecucaoTarefas.Table_gerir_tarefas();
			t.setAtribuido_a(task.getAssignee());
			t.setAtribuido_por(task.getOwner());
			t.setData_entrada(Core.isNotNull(task.getCreateTime())
					? Core.dateToString(task.getCreateTime(), DATE_HOUR_PATTERN): "");
			t.setDesc_tarefa(task.getDescription() != null ? task.getDescription() : task.getName());
			t.setNumero_processo_tabela(task.getProcessDefinitionId());
			t.setP_id_g(task.getId());
			t.setN_tarefa_g(task.getProcessInstanceId());
			t.setTipo(task.getProcessName()+getVersion(task));
			t.setData_fim_g(Core.isNotNull(task.getDueDate())
					? Core.dateToString(task.getDueDate(), DATE_HOUR_PATTERN): "");
			t.setPrioridade_g(""+task.getPriority());
			taskManage.add(t);
		}
	}

	// Get all tasks of current user
	private List<Table_minhas_tarefas> getMyTasks(ExecucaoTarefas model) {
		List<Table_minhas_tarefas> myTasks = new ArrayList<>();
		 tasks = this.applyFiler(model,MY_TASK); // apply new filter
 		for (TaskService task : tasks) {
			ExecucaoTarefas.Table_minhas_tarefas t = new ExecucaoTarefas.Table_minhas_tarefas();
			t.setAtribuido_por_tabela_minhas_tarefas(task.getOwner());
			t.setData_entrada_tabela_minhas_tarefas(Core.isNotNull(task.getCreateTime())
					? Core.dateToString(task.getCreateTime(), DATE_HOUR_PATTERN): "");
			t.setDesc_tarefa_tabela_minhas_tarefas(task.getDescription() != null ? task.getDescription() : task.getName());
			t.setTipo_tabela_minhas_tarefas(task.getProcessName()+getVersion(task));
			t.setPrm_taskid(task.getId());
			t.setN_tarefa_m(task.getProcessInstanceId());
			t.setData_fim_m(Core.isNotNull(task.getDueDate())
					? Core.dateToString(task.getDueDate(), DATE_HOUR_PATTERN): "");
			t.setPrioridade_m(""+task.getPriority());
			t.setEspera_tabela_minhas_tarefas(Boolean.TRUE.equals(task.getSuspended())?"Sim":"");
			myTasks.add(t);
		}
		return myTasks;
	}

	// Get all available task
	private List<Table_disponiveis> getAvailableTask(ExecucaoTarefas model, ExecucaoTarefasView view) {
		List<Table_disponiveis> tasksDisponiveis = new ArrayList<>();
		if(view.disponiveis.isVisible()) {
			tasks = this.applyFiler(model,AVAILABLE); // apply new filter
			for (TaskService task : tasks) {
				ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
				t.setCategorias_processo_tabela_disponiveis(task.getProcessName()+getVersion(task));
				t.setData_entrada_tabela_disponiveis(Core.isNotNull(task.getCreateTime())
						? Core.dateToString(task.getCreateTime(), DATE_HOUR_PATTERN): "");
				t.setP_id_d(task.getId());
				t.setN_tarefa_d(task.getProcessInstanceId());
				t.setData_fim_d(Core.isNotNull(task.getDueDate())
						? Core.dateToString(task.getDueDate(), DATE_HOUR_PATTERN): "");
				t.setTarefas_tabela_disponiveis(task.getDescription() != null ? task.getDescription() : task.getName());
				t.setPrioridade(""+task.getPriority());
				tasksDisponiveis.add(t);
			}
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

	private Map<String, String> buildPriorityMap(){
		final var listPrioridade = new HashMap<String, String>();
		listPrioridade.put(null, Core.gt("-- Escolher Prioridade --"));
		listPrioridade.put("100", "Urgente");
		listPrioridade.put("75", "Alta");
		listPrioridade.put("50", "Normal");
		listPrioridade.put("25", "Baixa");
		listPrioridade.put("0", "Muito baixa");
		return listPrioridade;
	}

	private static final String DATE_HOUR_PATTERN = "yyyy-MM-dd HH:mm:ss";

	List<TaskService> tasks;
	private static final int CONTRIBUTOR = 1;
	private static final int STATISTIC = 2;
	private static final int MY_TASK = 3;
	private static final int AVAILABLE = 4;
	private static final int MANAGE_TASK = 5;

	/*----#end-code----*/
}
