package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import java.util.List;
import java.util.ArrayList;
/*----#end-code----*/
		
public class Lista_terfa_de_processoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Lista_terfa_de_processo model = new Lista_terfa_de_processo();
		model.load();
		Lista_terfa_de_processoView view = new Lista_terfa_de_processoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'n_tarefa' as n_tarefa,'descricao_tarefa' as descricao_tarefa,'data_inicio' as data_inicio,'data_fim' as data_fim,'estado' as estado "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String processInstanceId = Core.getParam("processInstanceId");
		if(Core.isNotNull(processInstanceId)) {
			TaskServiceQuery taskS = new TaskServiceQuery();
			taskS.addFilter("processInstanceId",processInstanceId);
			List<Lista_terfa_de_processo.Table_1> listTasks = new ArrayList<>();
			
			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
				Lista_terfa_de_processo.Table_1 t = new Lista_terfa_de_processo.Table_1();
				t.setN_tarefa(task.getId());				
				t.setDescricao_tarefa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setData_inicio(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setData_fim(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setEstado(this.getStatusTask(task));
				listTasks.add(t);			}
			view.table_1.addData(listTasks);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/

	private String getStatusTask(TaskServiceQuery task) {
		if(Core.isNotNull(task.getEndTime()))
			return "1";//Terminado
		return "2";//Em execucao
	}
/*----#end-code----*/
}
