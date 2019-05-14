package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.webapps.igrp.dao.Application;

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
		model.loadTable_1(Core.query(null,"SELECT 'Aperiam anim consectetur strac' as num_processo,'Magna voluptatem sit stract aliqua' as processo,'Sit magna voluptatem anim sit' as eatapa,'Mollit adipiscing omnis deseru' as dt_inicio_etapa,'Unde iste consectetur rem sit' as dt_fim_etapa,'Elit sed labore natus omnis' as atribuido_a,'3' as estado,'hidden-6b66_e9cc' as id_task "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.cbx_utilizador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.status.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
		List<_CONS_PROC.Table_1> data = new ArrayList<>();
		TaskServiceQuery taskS = new TaskServiceQuery();
		if(Core.isNotNull(model.getAplicacao())){			
			if(Core.isNotNull(model.getTipo_processo())){
				taskS.addFilter("processDefinitionId", model.getTipo_processo());
			}if(Core.isNotNull(model.getNum())){
				taskS.addFilter("processInstanceId", model.getNum());
			}
			if(Core.isNotNull(model.getCbx_utilizador())){
				taskS.addFilter("taskAssignee", model.getCbx_utilizador());
			}
			if(Core.isNotNull(model.getStatus())) {
				taskS.addFilter("finished", model.getStatus());
			}
			if(Core.isNotNull(model.getAplicacao())) {
				taskS.addFilter("tenantId", app.getDad());
			}
			List<TaskServiceQuery> tasks = taskS.queryHistoryTask();

			if(Core.isNotNullMultiple(model.getDt_ini(),model.getDt_fim())) {
				tasks = tasks.stream()
							 .filter(t->t.compareDate(t.getStartTime(), model.getDt_ini(),(d1,d2)->d1.compareTo(d2)>=0))
							 .filter(t->t.compareDate(t.getEndTime(), model.getDt_fim(),(d1,d2)->d1.compareTo(d2)<=0))
							 .collect(Collectors.toList());
			}else {
				if(Core.isNotNull(model.getDt_ini())) {
					tasks = tasks.stream().filter(t->t.compareDate(t.getStartTime(), model.getDt_ini(),(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());
				}
				if(Core.isNotNull(model.getDt_fim())) {
					tasks = tasks.stream().filter(t->t.compareDate(t.getEndTime(), model.getDt_fim(),(d1,d2)->d1.compareTo(d2)==0)).collect(Collectors.toList());
				}
			}
			
			for(TaskServiceQuery task:tasks ) {
				task.proccessDescription(task.getProcessDefinitionUrl());
				_CONS_PROC.Table_1 t = new _CONS_PROC.Table_1();
				t.setNum_processo(task.getProcessInstanceId());
				t.setProcesso(task.getProcessName());
				t.setEatapa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setDt_inicio_etapa(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setDt_fim_etapa(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setId_task(task.getId());
				t.setEstado(""+task.getStatusTaskValue());
				t.setAtribuido_a(Core.isNotNull(task.getAssignee())?task.getAssignee():"---");
				if(!t.getEstado().equalsIgnoreCase("1")) {
					t.hiddenButton(view.btn_ver_etapa);
				}
				data.add(t);
			}
		}
		
		view.aplicacao.setValue(new Application().getListApps());	

		if(app!=null) {
			view.tipo_processo.setValue(new ProcessDefinitionService().mapToComboBox(app.getDad()));
		}

		view.requerente.setVisible(false);
		view.cbx_utilizador.setVisible(false);
		view.status.setValue(taskS.getStatus());
		view.btn_pesquisar.setLink("index");
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
		 return this.forward("igrp","_CONS_PROC","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/

		/*----#end-code----*/
		return this.redirect("igrp","_CONS_PROC","index", this.queryString());	
	}
	
	public Response actionVer_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_task",Core.getParam("p_id_task"));
		 return this.forward("igrp","Page","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
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
		 return this.forward("igrp","DetalhesProcesso","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(ver_processo)----*/
		this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_id_task")).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	
	/*----#end-code----*/
}
