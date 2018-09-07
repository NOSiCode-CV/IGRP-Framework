package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.igrp.pages.dash_board_processo.Dash_board_processo.Table_1;
import nosi.webapps.igrp.pages.dash_board_processo.Dash_board_processo.Table_2;
import nosi.core.webapp.activit.rest.HistoricProcessInstance;
/*----#end-code----*/
		
public class Dash_board_processoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		Dash_board_processoView view = new Dash_board_processoView();
		view.id.setParam(true);
		view.process_definition.setParam(true);
		view.process_key.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_2(Core.query(null,"SELECT 'nome_processo' as nome_processo,'process_id' as process_id "));
		model.loadTable_1(Core.query(null,"SELECT 'n_processo' as n_processo,'descricao' as descricao,'iniciado_em' as iniciado_em,'estado' as estado,'id' as id,'process_definition' as process_definition,'process_key' as process_key "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String processId = Core.getParam("process_id");		
		String processKey = Core.getParam("processKey");
		
		Integer totalProcAtivos = 0,totalProcFinished = 0;
		ProcessDefinitionService process = null;	
		
		view.tabcontent_1.setVisible(false);
		view.toolsbar_1.setVisible(false);
		List<Dash_board_processo.Table_2> listProcess = new ArrayList<>();
		List<Dash_board_processo.Table_1> listProcessInstances = new ArrayList<>();
		listProcess = this.getRepositoryProcess();
		
		if(Core.isNotNull(processId) && Core.isNotNull(processKey)) {
			process = new ProcessDefinitionService().getProcessDefinition(processId);
			ProcessInstancesService p = new ProcessInstancesService();
			totalProcAtivos = p.totalProccesAtivos(process.getKey());
			totalProcFinished = p.totalProccesTerminados(process.getKey());
			view.sectionheader_1_text.setLabel(process.getName());
			view.sectionheader_1_text.setValue(process.getName());
			
			view.total_proc_finished_val.setValue(totalProcFinished);
			view.total_proc_em_execucao_val.setValue(totalProcAtivos);
			model.setTotal_proc_em_execucao_url("#");
			model.setTotal_proc_finished_url("#");
			view.total_proc_em_execucao_title.setValue("Total de processos executados");
			view.total_proc_finished_title.setValue("Total de processos em execução");
			
			view.tabcontent_1.setVisible(true);			
			view.toolsbar_1.setVisible(true);
			view.btn_iniciar_novo_processo.setPage("ExecucaoTarefas");
			view.btn_iniciar_novo_processo.setLink("process-task&p_prm_definitionid="+processId+"&processKey="+processKey);
			view.btn_cancelar_processo.setLink("cancelar_processo&process_id="+processId+"&processKey="+processKey);
			listProcessInstances = this.getProcessInstances(processKey,view);
			view.table_1.addData(listProcessInstances);
		}			
		view.table_2.addData(listProcess);	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionIniciar_novo_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","MapaProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(iniciar_novo_processo)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","MapaProcesso","index", this.queryString());	
	}
	
	public Response actionShow_diagram() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","DetalhesProcesso","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(show_diagram)----*/
		String process_id = Core.getParam("p_id");
		String process_definitionId = Core.getParam("p_process_definition");
		if(Core.isNotNull(process_id) && Core.isNotNull(process_definitionId)) {
			this.addQueryString("process_id", process_id)
				.addQueryString("process_definitionId", process_definitionId);
			return this.redirect("igrp","DetalhesProcesso", "index",this.queryString());
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionCancelar_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dash_board_processo model = new Dash_board_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dash_board_processo","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(cancelar_processo)----*/
		String process_id = Core.getParam("process_id");
		String processKey = Core.getParam("processKey");
		String process_definitionId = Core.getParam("p_id");
		if(Core.isNotNull(processKey) && Core.isNotNull(process_id)) {
			if(new ProcessInstancesService().delete(process_definitionId)) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
			}
		}
		this.addQueryString("process_id", process_id)
			.addQueryString("processKey", processKey);
		/*----#end-code----*/
		return this.redirect("igrp","Dash_board_processo","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private List<Table_2> getRepositoryProcess() {
		List<Dash_board_processo.Table_2> listProcess = new ArrayList<>();
		for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos(Core.getCurrentApp().getDad())){
			Dash_board_processo.Table_2 table2 = new Dash_board_processo.Table_2();
			table2.setNome_processo("igrp", "Dash_board_processo", "index").addParam("process_id", process.getId()).addParam("processKey", process.getKey());
			table2.setNome_processo_desc(process.getName());
			table2.setProcess_id(process.getId());
			listProcess.add(table2 );
		}
		return listProcess;
	}
	

	private List<Table_1> getProcessInstances(String processKey,Dash_board_processoView view) {
		List<Dash_board_processo.Table_1> listProcess = new ArrayList<>();
			//Get process in execution
			for(ProcessInstancesService pis:new ProcessInstancesService().getRuntimeProcessIntances(processKey)) {
				ProcessDefinitionService pds = new ProcessDefinitionService().getProcessDefinition(pis.getProcessDefinitionId());
				Table_1 table1 = new Table_1();
				table1.setDescricao(pds.getName());
				table1.setIniciado_em("       ---");
				table1.setN_processo_desc(pis.getId());
				table1.setN_processo("igrp", "Lista_terfa_de_processo", "index").addParam("processInstanceId", pis.getId());
				table1.setEstado("2");
				table1.setId(pis.getId());
				table1.setProcess_definition(pis.getProcessDefinitionId());
				listProcess.add(table1);
			}
			//Get all terminate process
			for(HistoricProcessInstance hpi:new HistoricProcessInstance().getHistoryOfProccessInstanceIdFinished(processKey)) {
				ProcessDefinitionService pds = new ProcessDefinitionService().getProcessDefinition(hpi.getProcessDefinitionId());
				Table_1 table1 = new Table_1();
				table1.setDescricao(pds.getName());
				table1.setIniciado_em(Core.ToChar(hpi.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				table1.setN_processo_desc(hpi.getId());
				table1.setN_processo("igrp", "Lista_terfa_de_processo", "index").addParam("processInstanceId", hpi.getId());
				table1.setEstado("1");
				table1.setId(hpi.getId());
				table1.setProcess_definition(hpi.getProcessDefinitionId());
				listProcess.add(table1);
				table1.hiddenButton(view.btn_cancelar_processo);
			}
		return listProcess;
	}

/*----#end-code----*/
}
