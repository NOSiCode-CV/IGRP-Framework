package nosi.webapps.igrp.pages.lista_terfa_de_processo;

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
import java.util.List;
import java.util.ArrayList;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
/*----#end-code----*/
		
public class Lista_terfa_de_processoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Lista_terfa_de_processo model = new Lista_terfa_de_processo();
		model.load();
		Lista_terfa_de_processoView view = new Lista_terfa_de_processoView();
		view.processdefinitionkey.setParam(true);
		view.taskdefinitionkey.setParam(true);
		view.prm_taskid.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as estado,'Perspiciatis deserunt officia sit adipiscing' as descricao_tarefa,'Magna aperiam ut sit unde' as data_inicio,'Doloremque officia sed rem ips' as data_fim,'Accusantium unde accusantium d' as n_tarefa,'Ut elit accusantium doloremque mollit' as atribuido_a,'hidden-0d55_fc51' as processdefinitionkey,'' as taskdefinitionkey,'hidden-1c5d_24d0' as prm_taskid "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String processInstanceId = Core.getParam(BPMNConstants.PRM_PROCESS_INSTANCE_ID);
		String processKey = Core.getParam(BPMNConstants.PRM_PROCESS_KEY);
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);
		if(Core.isNotNull(processInstanceId)) {
			TaskServiceIGRP taskQuery = new TaskServiceIGRP();
			taskQuery.addFilterBody("processInstanceId",processInstanceId);
			List<Lista_terfa_de_processo.Table_1> listTasks = new ArrayList<>();
			
			for(TaskServiceQuery task : taskQuery.queryHistoryTask()) {
				Lista_terfa_de_processo.Table_1 t = new Lista_terfa_de_processo.Table_1();
				t.setN_tarefa(task.getId());				
				t.setDescricao_tarefa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setData_inicio(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setData_fim(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setEstado(this.getStatusTask(task)); 
				t.setProcessdefinitionkey(task.getProcessDefinitionKey());
				t.setTaskdefinitionkey(task.getTaskDefinitionKey());
				t.setPrm_taskid(task.getId()); 
				t.setAtribuido_a(task.getAssignee());
				if(t.getEstado().equals("2")) 
					t.hiddenButton(view.btn_ver_detalhes); 
				listTasks.add(t);			
			} 
			view.table_1.addData(listTasks);
		}
		view.btn_voltar.addParameter(BPMNConstants.PRM_PROCESS_KEY, processKey).addParameter(BPMNConstants.PRM_PROCESS_ID, processId);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionVoltar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Lista_terfa_de_processo model = new Lista_terfa_de_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_processdefinitionkey",Core.getParam("p_processdefinitionkey"));
		  this.addQueryString("p_taskdefinitionkey",Core.getParam("p_taskdefinitionkey"));
		  this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		  return this.forward("igrp","Detalhes_dashboard_processo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(voltar)----*/
		 this.addQueryString("target", "_blank")
		 	.addQueryString(BPMNConstants.PRM_PROCESS_ID, Core.getParam(BPMNConstants.PRM_PROCESS_ID))
		 	.addQueryString(BPMNConstants.PRM_PROCESS_KEY, Core.getParam(BPMNConstants.PRM_PROCESS_KEY));
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_dashboard_processo","index", this.queryString());	
	}
	
	public Response actionVer_detalhes() throws IOException, IllegalArgumentException, IllegalAccessException{
		Lista_terfa_de_processo model = new Lista_terfa_de_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_processdefinitionkey",Core.getParam("p_processdefinitionkey"));
		 this.addQueryString("p_taskdefinitionkey",Core.getParam("p_taskdefinitionkey"));
		 this.addQueryString("p_prm_taskid",Core.getParam("p_prm_taskid"));
		 return this.forward("igrp","lista_terfa_de_processo","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(ver_detalhes)----*/
		 this.addQueryString(BPMNConstants.PRM_TASK_ID, Core.getParam("p_prm_taskid"));
		 this.addQueryString("p_" + BPMNConstants.PRM_PROCESS_DEFINITION_KEY, Core.getParam("p_processdefinitionkey"));
		 this.addQueryString("p_" + BPMNConstants.PRM_TASK_DEFINITION_KEY, Core.getParam("p_taskDefinitionKey"));
		
		/*----#end-code----*/
		
		return this.redirect("igrp","lista_terfa_de_processo","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	private String getStatusTask(TaskServiceQuery task) {
		if(Core.isNotNull(task.getEndTime()))
			return "1";//Terminado
		return "2";//Em execucao
	}
/*----#end-code----*/
}
