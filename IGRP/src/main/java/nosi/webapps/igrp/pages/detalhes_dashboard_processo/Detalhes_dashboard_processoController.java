package nosi.webapps.igrp.pages.detalhes_dashboard_processo;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.activit.rest.HistoricProcessInstance;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.bpmn.BPMNConstants;

/*----#end-code----*/
		
public class Detalhes_dashboard_processoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Detalhes_dashboard_processo model = new Detalhes_dashboard_processo();
		model.load();
		Detalhes_dashboard_processoView view = new Detalhes_dashboard_processoView();
		view.id.setParam(true);
		view.process_definition.setParam(true);
		view.process_key.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '/IGRP/images/IGRP/IGRP2.3/app/igrp/lista_terfa_de_processo/Lista_terfa_de_processo.xml' as n_processo,'Sit natus sed sit iste' as descricao,'Doloremque mollit rem sed aliq' as iniciado_em,'2' as estado,'hidden-e74b_5386' as id,'hidden-cbf3_9846' as process_definition,'hidden-6af7_5c44' as process_key "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);		
		String processKey = Core.getParam(BPMNConstants.PRM_PROCESS_KEY);
		
		if(Core.isNotNullMultiple(processId,processKey)) {	
			ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(processId);
			ProcessInstancesService p = new ProcessInstancesService();
			Integer totalProcAtivos = p.totalProccesAtivos(process.getKey());
			Integer totalProcFinished = p.totalProccesTerminados(process.getKey());
			model.setTotal_proc_finished_val(""+totalProcFinished);
			model.setTotal_proc_em_execucao_val(""+totalProcAtivos);
			view.sectionheader_1_text.setValue("Detalhes de Processo: "+process.getName());
			model.setTable_1(this.getProcessInstances(processId,processKey,view));
		}
		model.setTotal_proc_em_execucao_title("Total de processos em execução");
		model.setTotal_proc_finished_title("Total de processos executados");
		model.setTotal_proc_finished_bg("cp-cyan");
		model.setTotal_proc_em_execucao_bg("cp-electric");
		model.setTotal_proc_em_execucao_icn("fa-check");
		model.setTotal_proc_finished_icn("fa-check");
		view.total_proc_em_execucao_url.setValue("#");
		view.total_proc_finished_url.setValue("#");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionShow_diagram() throws IOException, IllegalArgumentException, IllegalAccessException{
		Detalhes_dashboard_processo model = new Detalhes_dashboard_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 this.addQueryString("p_process_definition",Core.getParam("p_process_definition"));
		 this.addQueryString("p_process_key",Core.getParam("p_process_key"));
		 return this.forward("igrp","DetalhesProcesso","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(show_diagram)----*/
		
		String process_id = Core.getParam("p_id");
		String process_definitionId = Core.getParam("p_process_definition");
		if(Core.isNotNullMultiple(process_id,process_definitionId)) {
			this.addQueryString(BPMNConstants.PRM_PROCESS_ID, process_id)
				.addQueryString(BPMNConstants.PRM_DEFINITION_ID, process_definitionId);
			return this.redirect("igrp","DetalhesProcesso", "index",this.queryString());
		}
		/*----#end-code----*/
		return this.redirect("igrp","DetalhesProcesso","index", this.queryString());	
	}
	
	public Response actionCancelar_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		Detalhes_dashboard_processo model = new Detalhes_dashboard_processo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 this.addQueryString("p_process_definition",Core.getParam("p_process_definition"));
		 this.addQueryString("p_process_key",Core.getParam("p_process_key"));
		 return this.forward("igrp","Detalhes_dashboard_processo","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(cancelar_processo)----*/
		
		String process_id = Core.getParam("p_id");
		String processKey = Core.getParam("p_process_key");
		
		if(Core.isNotNullMultiple(process_id)) {
			if(new ProcessInstancesService().delete(process_id)) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
			}
		}
		this.addQueryString(BPMNConstants.PRM_PROCESS_ID, process_id)
			.addQueryString(BPMNConstants.PRM_PROCESS_KEY, processKey);
		/*----#end-code----*/
		return this.redirect("igrp","Detalhes_dashboard_processo","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private List<Detalhes_dashboard_processo.Table_1> getProcessInstances(String processId,String processKey,Detalhes_dashboard_processoView view) {
		List<Detalhes_dashboard_processo.Table_1> listProcess = new ArrayList<>();
			//Get process in execution
			for(ProcessInstancesService pis:new ProcessInstancesService().getRuntimeProcessIntances(processKey)) {
				ProcessDefinitionService pds = new ProcessDefinitionService().getProcessDefinition(pis.getProcessDefinitionId());
				Detalhes_dashboard_processo.Table_1 table1 = new Detalhes_dashboard_processo.Table_1();
				table1.setDescricao(pds.getName());
				table1.setIniciado_em("       ---");
				table1.setN_processo_desc(pis.getId());
				table1.setN_processo("igrp", "Lista_terfa_de_processo", "index")
						.addParam("target", "_blank")
						.addParam(BPMNConstants.PRM_PROCESS_INSTANCE_ID, pis.getId())
						.addParam(BPMNConstants.PRM_PROCESS_KEY, processKey)
						.addParam(BPMNConstants.PRM_PROCESS_ID, processId);
				table1.setEstado("2");
				table1.setId(pis.getId());
				table1.setProcess_definition(pis.getProcessDefinitionId());
				table1.setProcess_key(pds.getKey());
				listProcess.add(table1);
			}
			//Get all terminate process
			for(HistoricProcessInstance hpi:new HistoricProcessInstance().getHistoryOfProccessInstanceIdFinished(processKey)) {
				ProcessDefinitionService pds = new ProcessDefinitionService().getProcessDefinition(hpi.getProcessDefinitionId());
				Detalhes_dashboard_processo.Table_1 table1 = new Detalhes_dashboard_processo.Table_1();
				table1.setDescricao(pds.getName());
				table1.setIniciado_em(Core.ToChar(hpi.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				table1.setN_processo_desc(hpi.getId());
				table1.setN_processo("igrp", "Lista_terfa_de_processo", "index")
						.addParam("target", "_blank")
						.addParam(BPMNConstants.PRM_PROCESS_INSTANCE_ID, hpi.getId())
						.addParam(BPMNConstants.PRM_PROCESS_KEY, processKey)
						.addParam(BPMNConstants.PRM_PROCESS_ID, processId);
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
