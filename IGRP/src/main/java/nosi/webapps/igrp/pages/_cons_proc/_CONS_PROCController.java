package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.DataFormatter;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.helpers.DateHelper;
import nosi.core.webapp.activit.rest.helpers.StatusTask;
import nosi.core.webapp.bpmn.BPMNConstants;

import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;

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
		model.loadTable_1(Core.query(null,"SELECT '2' as estado,'Voluptatem sed labore accusant' as num_processo,'Sit mollit anim aperiam perspiciatis' as processo,'Stract adipiscing labore unde omnis' as eatapa,'Perspiciatis sit perspiciatis' as dt_inicio_etapa,'Perspiciatis sit iste mollit d' as dt_fim_etapa,'Lorem ut labore aperiam sit' as atribuido_a,'hidden-551d_0ac2' as id_task "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.cbx_utilizador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.status.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_de.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		model.setAplicacao(""+Core.getCurrentAppId());		
     	String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
			view.aplicacao.propertie().add("disabled","true");     			
		}      
      	Application app = Core.findApplicationById(Core.toInt(model.getAplicacao()));
      	
      	if(!Core.getParam("btnPesq").equals("true")){ 
      		model.setData_de("DI");
      		model.setDt_ini(LocalDate.now().minusMonths(1).format(DateTimeFormatter.ofPattern(Core.DD_MM_YYYY)));
			Core.setMessageWarning("Atenção! Etapas desde: "+model.getDt_ini()+". Modificar o filtro em ''Intervalo de datas - De'' para mais etapas de processos.");
      	}else
      		Core.setMessageSuccess();
      		
       	
		List<_CONS_PROC.Table_1> data = new ArrayList<>();
		TaskServiceIGRP taskQuery = new TaskServiceIGRP();
		if(Core.isNotNull(model.getAplicacao()) ){			
			if(Core.isNotNull(model.getTipo_processo()))
				taskQuery.addFilterBody("processDefinitionKey", model.getTipo_processo());
			
			if(Core.isNotNull(model.getNum()))
				taskQuery.addFilterBody("processInstanceId", model.getNum());
			
			if(Core.isNotNull(model.getCbx_utilizador()))
				taskQuery.addFilterBody("taskAssignee", model.getCbx_utilizador());
			
			if(Core.isNotNull(model.getStatus())) 
				taskQuery.addFilterBody("finished", model.getStatus());
			
			if(Core.isNotNull(model.getAplicacao())) 
				taskQuery.addFilterBody("tenantId", app.getDad());
			
			if(Core.isNotNull(model.getDt_ini())) 			
				taskQuery.addFilterBody(model.getData_de().equals("DI")?"taskCreatedAfter":"taskCompletedAfter", DateHelper.toDateTime(model.getDt_ini())); 
						
			if(Core.isNotNull(model.getDt_fim())) 				
				taskQuery.addFilterBody(model.getData_de().equals("DI")?"taskCreatedBefore":"taskCompletedBefore", DateHelper.toDateTime(model.getDt_fim())); 
			
			List<TaskServiceQuery> tasks = taskQuery.queryHistoryTask();		
			
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
			view.cbx_utilizador.setValue(Core.toMap(Core.getUsersByApplication(app.getDad()), "user_name", "name"));
			((Map<String,String>) view.cbx_utilizador.getListOptions()).put("", gt("-- Selecionar --"));
		}
		
		
		view.requerente.setVisible(false);
		view.status.setValue(StatusTask.getStatus());
		view.data_de.setValue(DateHelper.getDateFilter());
		view.btn_pesquisar.addParameter("btnPesq", "true").setLink("index");
		view.table_1.addData(data);
    
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
		/* Start-Code-Block (pesquisar)  *//* End-Code-Block  */
		/*----#start-code(pesquisar)----*/
		this.addQueryString("filtro","true");
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
		/* Start-Code-Block (ver_etapa)  *//* End-Code-Block  */
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
		/* Start-Code-Block (ver_processo)  *//* End-Code-Block  */
		/*----#start-code(ver_processo)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_id_task")).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	
	/*----#end-code----*/
}
