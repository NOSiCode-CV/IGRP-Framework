
package nosi.webapps.igrp.pages.execucaotarefas;

import nosi.core.webapp.Controller;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.core.webapp.activit.rest.TaskFile;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.StartProcess;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.bpmn.BPMNHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ProfileType;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import java.util.ArrayList;
import java.util.HashMap;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/


public class ExecucaoTarefasController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		ExecucaoTarefasView view = new ExecucaoTarefasView();
		view.p_id_g.setParam(true);
		view.p_id_c.setParam(true);
		view.p_id_e.setParam(true);
		view.id.setParam(true);
		view.p_id_d.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		model.loadTable_gerir_tarefas(Core.query(null,"SELECT 'numero_processo_tabela' as numero_processo_tabela,'n_tarefa_g' as n_tarefa_g,'tipo' as tipo,'desc_tarefa' as desc_tarefa,'atribuido_por' as atribuido_por,'atribuido_a' as atribuido_a,'data_entrada' as data_entrada,'data_fim_g' as data_fim_g,'p_id_g' as p_id_g "));
		model.loadTable__colaboradores(Core.query(null,"SELECT 'nome_colab_tabela' as nome_colab_tabela,'contacto_colab_tabela' as contacto_colab_tabela,'n_tarefas_colab_tabela' as n_tarefas_colab_tabela,'n_atendimento_colab_tabela' as n_atendimento_colab_tabela,'media_tempo_colab_tabela' as media_tempo_colab_tabela,'ranking_colab_tabela' as ranking_colab_tabela,'percentagem_colab_tabela' as percentagem_colab_tabela,'foto_colab_tabela' as foto_colab_tabela,'param_colab_tabela' as param_colab_tabela,'p_id_c' as p_id_c "));
		model.loadTable_estatistica(Core.query(null,"SELECT 'n_processo_estat_tabela' as n_processo_estat_tabela,'tipo_estatistica_tabela' as tipo_estatistica_tabela,'desc_tarefa_estat_tabela' as desc_tarefa_estat_tabela,'data_entrada_estat_tabela' as data_entrada_estat_tabela,'data_conclusao_estat_tabela' as data_conclusao_estat_tabela,'p_id_e' as p_id_e "));
		model.loadTable_minhas_tarefas(Core.query(null,"SELECT 'n_tarefa_m' as n_tarefa_m,'tipo_tabela_minhas_tarefas' as tipo_tabela_minhas_tarefas,'desc_tarefa_tabela_minhas_tarefas' as desc_tarefa_tabela_minhas_tarefas,'atribuido_por_tabela_minhas_tarefas' as atribuido_por_tabela_minhas_tarefas,'data_entrada_tabela_minhas_tarefas' as data_entrada_tabela_minhas_tarefas,'data_fim_m' as data_fim_m,'espera_tabela_minhas_tarefas' as espera_tabela_minhas_tarefas,'id' as id "));
		model.loadTable_disponiveis(Core.query(null,"SELECT 'n_tarefa_d' as n_tarefa_d,'tarefas_tabela_disponiveis' as tarefas_tabela_disponiveis,'categorias_processo_tabela_disponiveis' as categorias_processo_tabela_disponiveis,'data_entrada_tabela_disponiveis' as data_entrada_tabela_disponiveis,'data_fim_d' as data_fim_d,'p_id_d' as p_id_d "));
		view.tipo_processo_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_gerir_tarefa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_etapa_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_colaborador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_minhas_tarefas.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_form_disponiveis.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.prioridade_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado_estatistica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/      
      Map<String,String> listPrioridade = new HashMap<String,String>();
      listPrioridade.put(null, gt("-- Escolher Prioridade --"));
      listPrioridade.put("100", "Urgente");
      listPrioridade.put("50", "Médio");
      listPrioridade.put("0", "Normal");
      
      Map<String, String> listProc = new ProcessDefinitionService().mapToComboBox(Core.getCurrentDad());
      TaskService objTask = new TaskService();

   
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
            t.setP_id_g(task.getId());
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
         t.setId(task.getId());
         t.setN_tarefa_m(task.getProcessInstanceId());
         t.setData_fim_m(task.getDueDate()!=null?task.getDueDate().toString():"");
         myTasks.add(t);
      }
      
      List<ExecucaoTarefas.Table_disponiveis> tasksDisponiveis = new ArrayList<>();
      for(TaskService task:objTask.getUnassigedTasks()){
         ExecucaoTarefas.Table_disponiveis t = new ExecucaoTarefas.Table_disponiveis();
         t.setCategorias_processo_tabela_disponiveis(task.getCategory());
         t.setData_entrada_tabela_disponiveis(task.getCreateTime().toString());
         t.setP_id_d(task.getId());
         t.setN_tarefa_d(task.getProcessInstanceId());
         t.setData_fim_d(task.getDueDate()!=null?task.getDueDate().toString():"");
         t.setTarefas_tabela_disponiveis(task.getDescription()!=null?task.getDescription():task.getName());
         tasksDisponiveis.add(t);
      }
      
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
      /*
      view.pesquisa_gerir_tarefa.setVisible(false);
      view.pesquisa_minhas_tarefas.setVisible(false);
      view.pesquisar_form_disponiveis.setVisible(false);
      view.tipo_etapa_colaborador.setVisible(false);
      view.organica_colaborador.setVisible(false);
      view.organica_form_disponiveis.setVisible(false);
      view.organica_gerir_tarefa.setVisible(false);
      view.organica_minhas_tarefas.setVisible(false);
      view.estado_estatistica.setValue(this.getStatus());
        */
      /*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar_tarefa)----*/    
      
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionPesquisar_colaborador() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar_colaborador)----*/     
      
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionPesquisar_button_minhas_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar_button_minhas_tarefas)----*/ 
      
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionPesquisar_button_disponiveis() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar_button_disponiveis)----*/    
      
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionPesquisar_estatistica() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar_estatistica)----*/     
      
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionTransferir_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Transferir_tarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(transferir_tarefa)----*/      
      this.addQueryString("p_id", Core.getParam("p_id_g"));
      /*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(detalhes_tarefa)----*/     
		String id =  Core.getParam("p_id_g");
		if(Core.isNotNull(id)) {
			this.addQueryString("taskId", id).addQueryString("target", "_blank");
			return this.redirect("igrp","Detalhes_tarefas","index", this.queryString());	
		}	
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","DetalhesProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(detalhes_processo)----*/   
      this.addQueryString("taskId", Core.getParam("p_id")).addQueryString("target", "_blank");
      /*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionAlterar_prioridade_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Alter_prioridade_tarefa","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(alterar_prioridade_tarefa)----*/    
      this.addQueryString("p_id", Core.getParam("p_id_g"));
      /*----#end-code----*/
		return this.redirect("igrp","Alter_prioridade_tarefa","index", this.queryString());	
	}
	
	public Response actionVer_estatistica() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Transferir_tarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(ver_estatistica)----*/     
      this.addQueryString("p_id", Core.getParam("p_id_c"));
      /*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionVer_detalhes() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Transferir_tarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(ver_detalhes)----*/     
      this.addQueryString("p_id", Core.getParam("p_id_g")).addQueryString("type", "view");
      /*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionEnviar_msg() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Transferir_tarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(enviar_msg)----*/    
		 this.addQueryString("p_id", Core.getParam("p_id_g"));
      /*----#end-code----*/
		return this.redirect("igrp","Transferir_tarefas","index", this.queryString());	
	}
	
	public Response actionExecutar_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(executar_button_minha_tarefas)----*/
      String id = Core.getParam("p_id");
      if(Core.isNotNull(id)) {
         TaskService task = new TaskService().getTask(id);
         if(task!=null) {
            List<HistoricTaskService> hts = new HistoricTaskService().getHistoryOfProccessInstanceId(task.getProcessInstanceId());
            hts = hts.stream().filter(h->!h.getTaskDefinitionKey().equals(task.getTaskDefinitionKey())).collect(Collectors.toList());
            String previewTask = (hts!=null && hts.size() > 0)?hts.get(hts.size()-1).getTaskDefinitionKey():"";
            String preiviewProcessDefinition = (hts!=null && hts.size() > 0)?hts.get(hts.size()-1).getProcessDefinitionId():"";
            String preiviewApp = (hts!=null && hts.size() > 0)?hts.get(hts.size()-1).getTenantId():"";
            Application app = new Application().findByDad(task.getTenantId());
            if(app!=null) {
               this.addQueryString("taskId",id)
                  .addQueryString("appId", app.getId())
                  .addQueryString("appDad", app.getDad())
                  .addQueryString("formKey", task.getFormKey())
                  .addQueryString("processDefinition", task.getProcessDefinitionKey())
                  .addQueryString("processDefinitionId", task.getProcessDefinitionId())
                  .addQueryString("taskDefinition", task.getTaskDefinitionKey())
                  .addQueryString("previewTask", previewTask)
                  .addQueryString("preiviewApp", preiviewApp)
                  .addQueryString("preiviewProcessDefinition", preiviewProcessDefinition)
                  .addQueryString("showTimeLine", "true");
               return this.redirect(app.getDad().toLowerCase(),Config.PREFIX_TASK_NAME+task.getTaskDefinitionKey(), "index",this.queryString());
            }
         }
         throw new IOException(Core.NO_PERMITION_MSG);
      }
      //return this.redirect("igrp", "ErrorPage", "exception");
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_minha_tarefa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(detalhes_minha_tarefa)----*/
		String id =  Core.getParam("p_id");
		if(Core.isNotNull(id)) {
			this.addQueryString("taskId", id).addQueryString("target", "_blank");
			return this.redirect("igrp","Detalhes_tarefas","index", this.queryString());	
		}		
		/*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","DetalhesProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(detalhes_processos_button_minha_tarefas)----*/  
      this.addQueryString("taskId", Core.getParam("p_id")).addQueryString("target", "_blank");
      /*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(leberar_tarefa_button_minha_tarefas)----*/      
      String id = Core.getParam("p_id");
      TaskService task = new TaskService();
      if(task.freeTask(id)){
         Core.setMessageSuccess(gt("Tarefa liberada com sucesso"));
      }else{
         Core.setMessageError();       
      }
      //return this.redirect("igrp","ExecucaoTarefas","index");
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	public Response actionAssumir_button_tabela() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ExecucaoTarefas model = new ExecucaoTarefas();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ExecucaoTarefas","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(assumir_button_tabela)----*/
      String id = Core.getParam("p_id_d");
      TaskService task = new TaskService();
      if(task.claimTask(id, Core.getCurrentUser().getUser_name())){
         Core.setMessageSuccess(gt("Tarefa assumido com sucesso"));
      }else{
         Core.setMessageError();          
      }     
      /*----#end-code----*/
		return this.redirect("igrp","ExecucaoTarefas","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/

   public Response actionProcessTask() throws IOException, ServletException{
      String taskId = Core.getParam("p_prm_taskid");
      String processDefinitionId = Core.getParam("p_prm_definitionid");
      if(Core.isNotNull(taskId)){
         return this.processTask(taskId);
      }
      if(Core.isNotNull(processDefinitionId)){
         ProcessInstancesService pi = this.processStartEvent(processDefinitionId);
         if(Core.isNotNull(pi.getError())){
            Core.setMessageError(pi.getError().getException());
            return this.redirect("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
         }
         Core.setMessageSuccess();
         TaskService task = new TaskService();
         task.addFilter("processDefinitionId",processDefinitionId);
         task.addFilter("processInstanceId", pi.getId());
         List<TaskService> tasks = task.getMyTasks();
         if(tasks!=null && !tasks.isEmpty()) {
            return this.redirect("igrp","ExecucaoTarefas","executar_button_minha_tarefas&p_id="+tasks.get(0).getId());
         }else {
            return this.forward("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
         }
      }
      return this.redirect("igrp", "ErrorPage", "exception");
   }
   
   private Response processTask(String taskId) {
      TaskService task = new TaskService().getTask(taskId);
      this.addQueryString("taskId",taskId);
      Application app = new Application().findByDad(task.getTenantId());
      return this.call(app.getDad().toLowerCase(),task.getTaskDefinitionKey(), "save",this.queryString());
   }

   //Inicia tarefa de um processo
   private ProcessInstancesService processStartEvent(String processDefinitionId) throws IOException, ServletException{
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
      formData.addVariable("baseHostNameIgrp",this.getConfig().getHostName());
      StartProcess st = formData.submitFormByProcessDenifition();
      if(st!=null){
         pi.setId(st.getId());
         pi.setError(st.getError());
         pi.addVariable("p_process_id", "local", "string", pi.getId());
         pi.submitVariables();
         new TaskFile().addFile(pi);
      }
      return pi;
   }
   
   /*----#end-code----*/
	}
