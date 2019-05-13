package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.bpmn.BPMNConstants;
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.igrp.pages.dash_board_processo.Dash_board_processo.Table_2;
/*----#end-code----*/
		
public class Dash_board_processoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		Dash_board_processoView view = new Dash_board_processoView();
		view.process_id.setParam(true);
		view.process_key.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_2(Core.query(null,"SELECT 'Stract sit sit natus accusanti' as nome_processo,'hidden-f4c4_5b1b' as process_id,'hidden-66a4_cd22' as process_key "));
		  ----#gen-example */
		/*----#start-code(index)----*/	
		view.btn_iniciar_processo.setPage("ExecucaoTarefas");
		view.btn_iniciar_processo.setLink("process-task");
		view.table_2.addData(this.getRepositoryProcess());	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionIniciar_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_process_id",Core.getParam("p_process_id"));
		 this.addQueryString("p_process_key",Core.getParam("p_process_key"));
		 return this.forward("igrp","Startprocess","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(iniciar_processo)----*/
	
		 this.addQueryString(BPMNConstants.PRM_DEFINITION_ID,Core.getParam(BPMNConstants.PRM_PROCESS_ID));
		 this.addQueryString(BPMNConstants.PRM_PROCESS_KEY,Core.getParam(BPMNConstants.PRM_PROCESS_KEY));
		/*----#end-code----*/
		return this.redirect("igrp","Startprocess","index", this.queryString());	
	}
	
	public Response actionDetalhes_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_process_id",Core.getParam("p_process_id"));
		 this.addQueryString("p_process_key",Core.getParam("p_process_key"));
		 return this.forward("igrp","Detalhes_dashboard_processo","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(detalhes_processo)----*/
		 this.addQueryString(BPMNConstants.PRM_PROCESS_ID,Core.getParam("p_process_id"));
		 this.addQueryString(BPMNConstants.PRM_PROCESS_KEY,Core.getParam("p_process_key"));
		
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_dashboard_processo","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private List<Table_2> getRepositoryProcess() {
		List<Dash_board_processo.Table_2> listProcess = new ArrayList<>();
		for(ProcessDefinitionService process:new ProcessDefinitionService().getMyProcessDefinitions(Core.getCurrentApp().getDad())){
			Dash_board_processo.Table_2 t2 = new Dash_board_processo.Table_2();
			t2.setNome_processo(process.getName());
			t2.setProcess_id(process.getId());
			t2.setProcess_key(process.getKey());
			listProcess.add(t2);
		}
		return listProcess;
	}
	
/*----#end-code----*/
}
