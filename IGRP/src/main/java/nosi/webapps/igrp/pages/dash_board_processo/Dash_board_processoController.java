package nosi.webapps.igrp.pages.dash_board_processo;

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
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;

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
		model.loadTable_2(Core.query(null,"SELECT 'Sit ut elit aperiam sit' as nome_processo,'hidden-a896_15c6' as process_id,'hidden-8373_28c6' as process_key "));
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
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(iniciar_processo)----*/
	
		 this.addQueryString(BPMNConstants.PRM_DEFINITION_ID,Core.getParam(BPMNConstants.PRM_PROCESS_ID));
		 this.addQueryString(BPMNConstants.PRM_PROCESS_KEY,Core.getParam(BPMNConstants.PRM_PROCESS_KEY));
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
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
		  return this.forward("igrp","Detalhes_dashboard_processo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(detalhes_processo)----*/
		 this.addQueryString(BPMNConstants.PRM_PROCESS_ID,Core.getParam("p_process_id"));
		 this.addQueryString(BPMNConstants.PRM_PROCESS_KEY,Core.getParam("p_process_key"));
		
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_dashboard_processo","index", this.queryString());	
	}
	
	public Response actionEliminar_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_process_id",Core.getParam("p_process_id"));
		  this.addQueryString("p_process_key",Core.getParam("p_process_key"));
		  return this.forward("igrp","Dash_board_processo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(eliminar_processo)----*/
	
		try {
			String processId = Core.getParam("p_process_id"); 
			ProcessDefinitionService process = new ProcessDefinitionServiceRest().getProcessDefinition(processId); 
			if(new ProcessDefinitionServiceRest().delete(process.getDeploymentId())) 
				Core.setMessageSuccess(); 
			else 
				Core.setMessageError(); 
		} catch (Exception e) {
			Core.setMessageError(); 
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","Dash_board_processo","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	private List<Table_2> getRepositoryProcess() {
		List<Dash_board_processo.Table_2> listProcess = new ArrayList<>();
		for(ProcessDefinitionService process:new ProcessDefinitionIGRP().getMyProcessDefinitions()){
			Dash_board_processo.Table_2 t2 = new Dash_board_processo.Table_2();
			t2.setNome_processo(process.getName()+" (v."+process.getVersion()+")");
			t2.setProcess_id(process.getId());
			t2.setProcess_key(process.getKey());
			listProcess.add(t2);
		}
		return listProcess;
	}
	
/*----#end-code----*/
}
