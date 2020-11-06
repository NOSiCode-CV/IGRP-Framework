package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.helpers.database.QueryInterface;
import nosi.core.webapp.util.helpers.database.ResultSet;
import nosi.core.webapp.workflow.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.workflow.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.workflow.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.workflow.activit.rest.helpers.DateHelper;
import nosi.core.webapp.workflow.activit.rest.helpers.StatusTask;
import nosi.core.webapp.workflow.bpmn.BPMNConstants;
import nosi.core.webapp.Response;

import java.io.IOException;//
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import nosi.webapps.igrp.dao.Application;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class _CONS_PROCController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		_CONS_PROCView view = new _CONS_PROCView();
		view.id_task.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as estado,'Magna voluptatem omnis elit ad' as num_processo,'Totam accusantium consectetur iste aliqua' as processo,'Sed perspiciatis elit omnis dolor' as eatapa,'Deserunt amet officia aliqua d' as dt_inicio_etapa,'Voluptatem magna unde rem labo' as dt_fim_etapa,'Ut dolor officia aliqua rem' as atribuido_a,'hidden-3bca_c03e' as id_task "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.cbx_utilizador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.status.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		model.setAplicacao(""+Core.getCurrentAppId());		
     	String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
        	view.aplicacao.propertie().add("disabled","true");     			
		}      
      	Application app = Core.findApplicationById(Core.toInt(model.getAplicacao()));
		List<_CONS_PROC.Table_1> data = new ArrayList<>();
		TaskServiceIGRP taskQuery = new TaskServiceIGRP();
		if(Core.isNotNull(model.getAplicacao())){			
			if(Core.isNotNull(model.getTipo_processo())){
				taskQuery.addFilterBody("processDefinitionKey", model.getTipo_processo());
			}if(Core.isNotNull(model.getNum())){
				taskQuery.addFilterBody("processInstanceId", model.getNum());
			}
			if(Core.isNotNull(model.getCbx_utilizador())){
				taskQuery.addFilterBody("taskAssignee", model.getCbx_utilizador());
			}
			if(Core.isNotNull(model.getStatus())) {
				taskQuery.addFilterBody("finished", model.getStatus());
			}
			if(Core.isNotNull(model.getAplicacao())) {
				taskQuery.addFilterBody("tenantId", app.getDad());
			}
			List<TaskServiceQuery> tasks = taskQuery.queryHistoryTask();

			if(Core.isNotNullMultiple(model.getDt_ini(),model.getDt_fim())) {
				tasks = tasks.stream()
							 .filter(t->DateHelper.compareDate(t.getStartTime(), model.getDt_ini(),(d1,d2)->d1.compareTo(d2)>=0))
							 .filter(t->DateHelper.compareDate(t.getEndTime(), model.getDt_fim(),(d1,d2)->d1.compareTo(d2)<=0))
							 .collect(Collectors.toList());
			}else {
				if(Core.isNotNull(model.getDt_ini())) {
					tasks = tasks.stream().filter(t->DateHelper.compareDate(t.getStartTime(), model.getDt_ini(),(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());
				}
				if(Core.isNotNull(model.getDt_fim())) {
					tasks = tasks.stream().filter(t->DateHelper.compareDate(t.getEndTime(), model.getDt_fim(),(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());
				}
			}
			
			for(TaskServiceQuery task:tasks ) {
				_CONS_PROC.Table_1 t = new _CONS_PROC.Table_1();
				t.setNum_processo(task.getProcessInstanceId());
				t.setProcesso(task.getProcessName());
				t.setEatapa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setDt_inicio_etapa(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setDt_fim_etapa(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setId_task(task.getId());
				t.setEstado(""+StatusTask.getStatusTaskValue(task.getEndTime(),task.getAssignee()));
				t.setAtribuido_a(Core.isNotNull(task.getAssignee())?task.getAssignee():"---");
				if(!t.getEstado().equalsIgnoreCase("1")) {
					t.hiddenButton(view.btn_ver_etapa);
				}
				data.add(t);
			}
		}
		
		view.aplicacao.setValue(new Application().getListApps());	
		if(app!=null) {
			view.tipo_processo.setValue(new ProcessDefinitionIGRP().mapToComboBoxByKey(app.getDad()));
		}

		view.requerente.setVisible(false);
		view.cbx_utilizador.setVisible(false);
		view.status.setValue(StatusTask.getStatus());
		view.btn_pesquisar.setLink("index");
		view.table_1.addData(data);
    	view.sectionheader_1_text.setValue("<p>"+gt("Consultar Processo")+"</p>");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_task",Core.getParam("p_id_task"));
		  return this.forward("igrp","_CONS_PROC","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
	return this.forward("igrp","_CONS_PROC","index",this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionVer_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_task",Core.getParam("p_id_task"));
		  return this.forward("igrp","Page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(ver_etapa)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_id_task")).addQueryString("target", "_blank");
        return this.redirect("igrp","Detalhes_tarefas","index", this.queryString());	
		/*----#end-code----*/
			
	}
	
	public Response actionVer_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_task",Core.getParam("p_id_task"));
		  return this.forward("igrp","DetalhesProcesso","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(ver_processo)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_id_task")).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionLock() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_task",Core.getParam("p_id_task"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(lock)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	
	/*----#end-code----*/
}
