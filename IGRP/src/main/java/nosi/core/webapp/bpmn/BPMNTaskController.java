package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Model;
import nosi.core.webapp.Response;
import nosi.core.webapp.View;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.StartProcess;
import nosi.core.webapp.activit.rest.TaskFile;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import static nosi.core.i18n.Translator.gt;

/**
 * Emanuel
 * 7 May 2018
 */

public abstract class BPMNTaskController extends Controller implements InterfaceBPMNTask{

	private String app;
	private String page;
	private Action action;
	
	@Override
	public Response index(String app,Model model,View view) throws IOException {
		view.setModel(model);
		this.app = app;
		this.page = this.getClass().getSimpleName().replaceAll("Controller", "");
		return this.renderView(app,model.getClass().getSimpleName(),view);
	}

	@Override
	public Response index(String app,Model model,View view,InterfaceBPMNTask bpmnTask) throws IOException {
		view.setModel(model);
		this.app = app;
		this.page = this.getClass().getSimpleName().replaceAll("Controller", "");
		return this.renderView(app,model.getClass().getSimpleName(),view,bpmnTask);
	}
	
	@Override
	public Response index() throws IOException, ServletException {
		String appId = Core.getParam("appId");
		String formKey = Core.getParam("formKey");
		String processDefinition = Core.getParam("processDefinition");
		String taskDefinition = Core.getParam("taskDefinition");
		String taskId = Core.getParamTaskId();
		String appDad = Core.getParam("appDad");
		String p_processId = Core.getParam("p_processId");		
		
		if(Core.isNotNull(appId) && Core.isNotNull(formKey)) {
			XMLExtractComponent comp = new XMLExtractComponent();
			Action action = new Action().find().andWhere("application", "=",Core.toInt(appId)).andWhere("page", "=",formKey).one();
			Response resp = this.call(action.getApplication().getDad(), action.getPage(),"index",this.queryString());
			String content = comp.removeXMLButton(resp.getContent());
			XMLWritter xml = new XMLWritter("rows", this.getConfig().getResolveUrl("igrp","mapa-processo","get-xsl").replaceAll("&", "&amp;")+"&amp;page="+formKey+"&amp;app="+appId, "utf-8");
			xml.addXml(this.getConfig().getHeader(null));
			xml.startElement("content");
			xml.writeAttribute("type", "");
			if(Core.isNotNull(p_processId)) {
				xml.addXml(comp.generateButtonProcess(p_processId).toString());
			}
			if(Core.isNotNull(taskId)) {
				xml.addXml(comp.generateButtonTask(appDad,action.getApplication().getId(),Config.PREFIX_TASK_NAME+taskDefinition,"save", taskId).toString());
			}
			xml.addXml(content);
			xml.addXml(BPMNHelper.addFileSeparator(processDefinition,taskDefinition,action.getApplication().getId(),null));
			IGRPMessage msg = new IGRPMessage();
			String m = msg.toString();
			if(m!=null){
				xml.addXml(m);
			}
			xml.endElement();
			return this.renderView(xml.toString());	
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	//Save the task
	@Override
	public Response save() throws IOException, ServletException {
		String taskId = Core.getParamTaskId();
		TaskService task = new TaskService().getTask(taskId);	
		if(task!=null){
			//Validate if required document is uploaded
			if(!ValidateInputDocument.validateRequiredDocument(this)) {
				this.addQueryString("taskId",taskId)
                .addQueryString("appId", Core.getParam("appId"))
                .addQueryString("appDad",Core.getParam("appDad"))
                .addQueryString("formKey",Core.getParam("formKey"))
                .addQueryString("processDefinition", task.getProcessDefinitionKey())
                .addQueryString("taskDefinition", task.getTaskDefinitionKey())
                .addQueryString("previewTask", Core.getParam("previewTask"))
                .addQueryString("preiviewApp", Core.getParam("preiviewApp"))
                .addQueryString("preiviewProcessDefinition", Core.getParam("preiviewProcessDefinition"));
				return this.forward(task.getTenantId(), Config.PREFIX_TASK_NAME+task.getTaskDefinitionKey(), "index",this.queryString());
			}
			String customForm = Core.getParam("customForm");
			String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
			FormDataService formData = new FormDataService();
			FormDataService properties = null;
			ProcessInstancesService p = new ProcessInstancesService();
			p.setId(task.getProcessInstanceId());	
			formData.setTaskId(taskId);
			properties = new FormDataService().getFormDataByTaskId(taskId);
			if(formData!=null && properties!=null && properties.getFormProperties()!=null){
				for(FormProperties prop:properties.getFormProperties()){
					Object value = BPMNHelper.getValue(prop.getType(), prop.getId());
					if(!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
						formData.addVariable(prop.getId(),value);
					}
				}
			}
			if(Core.isNotNull(customForm) && Core.isNotNull(content)) {				
				Core.getParameters().entrySet().stream().forEach(param-> {
					task.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
					p.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
				});
				task.addVariable(task.getTaskDefinitionKey()+"_p_task_id", "local", "string",taskId);
				p.addVariable("customVariableIGRP_"+task.getId(),"string",content);
				p.submitVariables();
				task.submitVariables();
			}
			new TaskFile().addFile(p);
			
			StartProcess st = formData.submitFormByTask();
			if((st!=null && st.getError()!=null)) {
				Core.setMessageError(st.getError().getException());
				return this.forward("igrp","MapaProcesso", "open-process&taskId="+taskId);
			}else {
				Core.setMessageSuccess();
				task.addFilter("processDefinitionId",task.getProcessDefinitionId());
				task.addFilter("processInstanceId", task.getProcessInstanceId());
				List<TaskService> tasks = task.getMyTasks();
				if(tasks!=null && !tasks.isEmpty()) {
					return this.redirect("igrp","ExecucaoTarefas","executar_button_minha_tarefas&p_id="+tasks.get(0).getId());
				}else {
					return this.redirect("igrp","Detalhes_tarefas", "index&taskId="+taskId);
				}
			}
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	@Override
	public Response update() throws IOException, ServletException{
		String taskId = Core.getParamTaskId();
		String customForm = Core.getParam("customForm");
		String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
		boolean result = false;
		if(Core.isNotNull(taskId)){
			TaskServiceQuery taskS = new TaskServiceQuery();
			taskS.addFilter("taskId", taskId);
			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
				ProcessInstancesService p = new ProcessInstancesService();
				p.setId(task.getProcessInstanceId());
				Core.getParameters().entrySet().stream().forEach(param-> {
					p.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
				});	
				p.addVariable("customVariableIGRP_"+task.getId(),"string",content);
				result = p.submitVariables();
				new TaskFile().addFile(p);
				if(result){
					Core.setMessageSuccess();
				}else{
					Core.setMessageError();
				}
				return this.redirect("igrp","Detalhes_tarefas", "index&taskId="+taskId);
			}
		}		
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	@Override
	public List<TipoDocumentoEtapa> getOutputDocumentType() {
		String taskDefinition = Core.getParam("previewTask");
		String processDefinition = Core.getParam("preiviewProcessDefinition");	
		String preiviewApp = Core.getParam("preiviewApp");	
		String isDetails = Core.getParam("isDetails");
		this.page = Config.PREFIX_TASK_NAME+taskDefinition;
		this.app = preiviewApp;
		if(Core.isNotNull(isDetails)) {
			return BPMNHelper.getOutputDocumentType(processDefinition, taskDefinition,this.getAction().getApplication().getId());
		}
		return BPMNHelper.getOutputDocumentType(processDefinition,taskDefinition,this.getAction().getApplication().getId());
	}

	@Override
	public List<TipoDocumentoEtapa> getInputDocumentType() {
		String taskDefinition = Core.getParam("taskDefinition");
		String processDefinition = Core.getParam("processDefinition");	
		String isDetails = Core.getParam("isDetails");
		if(Core.isNotNull(isDetails)) {
			HistoricTaskService history = new HistoricTaskService();
			history.setFilter("processFinished=true");	
			List<HistoricTaskService> taskHistories = history.getHistory(Core.getParam("taskId"));	
			return BPMNHelper.getInputDocumentTypeHistory(processDefinition, taskDefinition,taskHistories, this.getAction().getApplication().getId());
		}
		return BPMNHelper.getInputDocumentType(processDefinition, taskDefinition, this.getAction().getApplication().getId());
	}

	
	private Action getAction() {
		if(this.action!=null)
			return this.action;
		return new Action().find().andWhere("page", "=",this.page).andWhere("application.dad", "=",this.app).one();
	}

	@Override
	public String details(TaskServiceQuery task) throws IOException, ServletException {
		this.page = Config.PREFIX_TASK_NAME+task.getTaskDefinitionKey();
		Gson gson = new Gson();		
		XMLExtractComponent comp = new XMLExtractComponent();
		Action action = new Action().find().andWhere("page", "=",this.page).andWhere("application.dad", "=",task.getTenantId()).one();
		String json = "";
		if(task.getVariables()!=null) {
			List<TaskVariables> var = task.getVariables().stream().filter(v->v.getName().equalsIgnoreCase("customVariableIGRP_"+task.getId())).collect(Collectors.toList());
			json = (var!=null && var.size() >0)?var.get(0).getValue().toString():"";
		}
		if(Core.isNotNull(json)) {
			CustomVariableIGRP custom = gson.fromJson(json, CustomVariableIGRP.class);
			if(custom!=null){
				for(Rows rows:custom.getRows()) {
					if(!rows.getName().equalsIgnoreCase("page_igrp_ativiti") && !rows.getName().equalsIgnoreCase("app_igrp_ativiti")) {
						for(Object obj:(Object[])rows.getValue()) {
							this.addQueryString(rows.getName(), obj.toString());
						}
					}
				}
			}
		}		
		this.addQueryString("taskId",task.getId())
			.addQueryString("isDetails", "true")
	        .addQueryString("appId", action.getApplication().getId())
	        .addQueryString("appDad", task.getTenantId())
	        .addQueryString("formKey", task.getFormKey())
	        .addQueryString("processDefinition", task.getProcessDefinitionKey())
	        .addQueryString("taskDefinition", task.getTaskDefinitionKey())
	        //for output documents details
	        .addQueryString("preiviewApp",task.getTenantId())
	        .addQueryString("previewTask", task.getTaskDefinitionKey())
	        .addQueryString("preiviewProcessDefinition", task.getProcessDefinitionKey());
		 Core.setMessageInfo(gt("Detalhes de Tarefa")+":<br/> "
		 										+ gt("Nº Processo")+" : "+task.getProcessInstanceId() + "<br/>"
		 										+ gt("Nº Tarefa")  +" : "+task.getId() + "<br/>"
		 										+ gt("Nome Processo")+" : "+task.getProcessDefinitionKey() + "<br/>"
		 										+ gt("Nome Tarefa")+" : "+task.getName() + "<br/>"
												+ gt("Data Inicio")+" : "+task.getStartTime() +"<br/>"
												+ gt("Data de fim")+" : "+task.getEndTime() +"<br/>"
		 					);
		 Response resp = this.call(task.getTenantId(),this.page, "index",this.queryString());
		 String content = resp.getContent();
		 content = comp.removeXMLButton(content);
		 return content;
	}
}
