
package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.Igrp;

/*----#end-code----*/


public class _CONS_PROCController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		_CONS_PROCView view = new _CONS_PROCView();
		view.id_task.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		model.loadTable_1(Core.query(null,"SELECT 'num_processo' as num_processo,'processo' as processo,'eatapa' as eatapa,'dt_inicio_etapa' as dt_inicio_etapa,'dt_fim_etapa' as dt_fim_etapa,'estado' as estado,'id_task' as id_task "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo_processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.cbx_utilizador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.status.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
		List<_CONS_PROC.Table_1> data = new ArrayList<>();
		if(Core.isNotNull(model.getAplicacao())){
			TaskServiceQuery taskS = new TaskServiceQuery();
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
			if(Core.isNotNull(model.getDt_ini())) {
				taskS.addFilter("taskCompletedAfter",Core.ToChar(Core.ToChar(model.getDt_ini(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			if(Core.isNotNull(model.getDt_fim())) {
				taskS.addFilter("taskCompletedBefore",Core.ToChar(Core.ToChar(model.getDt_fim(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			if(Core.isNotNull(model.getDt_ini()) && !Core.isNotNull(model.getDt_fim())) {
				taskS.addFilter("taskCompletedOn",Core.ToChar(Core.ToChar(model.getDt_ini(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
				_CONS_PROC.Table_1 t = new _CONS_PROC.Table_1();
				t.setNum_processo(task.getProcessInstanceId());
				t.setProcesso(task.getProcessDefinitionKey());
				t.setEatapa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setDt_inicio_etapa(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setDt_fim_etapa(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setId_task(task.getId());
				t.setEstado(""+this.getStatusTask(task));
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
		view.status.setValue(this.getStatus());
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
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","_CONS_PROC","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/

		/*----#end-code----*/
		return this.redirect("igrp","_CONS_PROC","index", this.queryString());	
	}
	
	public Response actionVer_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","DetalhesProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(ver_etapa)----*/
		String p_id_task = Igrp.getInstance().getRequest().getParameter("p_id_task");
		this.addQueryString("taskId", p_id_task).addQueryString("target", "_blank");
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_tarefas","index", this.queryString());	
	}
	
	public Response actionVer_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","DetalhesProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(ver_processo)----*/
		String p_id_task = Igrp.getInstance().getRequest().getParameter("p_id_task");
		this.addQueryString("taskId", p_id_task).addQueryString("target", "_blank");
		
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	private Map<String,String> getStatus() {
		Map<String,String> status = new HashMap<String,String>();
		status.put(null, "--- Selecionar Estado ---");
        status.put("false","Ativo");
        status.put("true","Terminado");
		return status;
	}
	private int getStatusTask(TaskServiceQuery task) {
		if(Core.isNotNull(task.getEndTime()))
			return 1;//Terminado
		if(Core.isNotNull(task.getAssignee()))
			return 2;//Não iniciado
		return 3;//"Não Atribuido"
	}
	
	/*----#end-code----*/
	}
