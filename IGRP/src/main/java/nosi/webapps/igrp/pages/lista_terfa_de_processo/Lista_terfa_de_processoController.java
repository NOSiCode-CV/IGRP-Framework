package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
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
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Rem labore sit perspiciatis do' as n_tarefa,'Aliqua labore sit ipsum sit' as descricao_tarefa,'Doloremque magna elit stract d' as data_inicio,'Deserunt sit deserunt mollit u' as data_fim,'2' as estado "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String processInstanceId = Core.getParam(BPMNConstants.PRM_PROCESS_INSTANCE_ID);
		String processKey = Core.getParam(BPMNConstants.PRM_PROCESS_KEY);
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);
		if(Core.isNotNull(processInstanceId)) {
			TaskServiceIGRP taskQuery = new TaskServiceIGRP();
			taskQuery.addFilterBody("processInstanceId",processInstanceId);
			List<Lista_terfa_de_processo.Table_1> listTasks = new ArrayList<>();
			
			for(TaskServiceQuery task:taskQuery.queryHistoryTask()) {
				Lista_terfa_de_processo.Table_1 t = new Lista_terfa_de_processo.Table_1();
				t.setN_tarefa(task.getId());				
				t.setDescricao_tarefa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setData_inicio(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setData_fim(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setEstado(this.getStatusTask(task));
				listTasks.add(t);			}
			view.table_1.addData(listTasks);
		}
		view.btn_voltar.addParameter(BPMNConstants.PRM_PROCESS_KEY, processKey)
						.addParameter(BPMNConstants.PRM_PROCESS_ID, processId);
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
		 return this.forward("igrp","Detalhes_dashboard_processo","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(voltar)----*/
		 this.addQueryString("target", "_blank")
		 	.addQueryString(BPMNConstants.PRM_PROCESS_ID, Core.getParam(BPMNConstants.PRM_PROCESS_ID))
		 	.addQueryString(BPMNConstants.PRM_PROCESS_KEY, Core.getParam(BPMNConstants.PRM_PROCESS_KEY));
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_dashboard_processo","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private String getStatusTask(TaskServiceQuery task) {
		if(Core.isNotNull(task.getEndTime()))
			return "1";//Terminado
		return "2";//Em execucao
	}
/*----#end-code----*/
}
