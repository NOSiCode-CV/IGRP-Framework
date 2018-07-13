package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
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
				xml.addXml(comp.generateButtonProcess(appDad,action.getApplication().getId(),Config.PREFIX_TASK_NAME+taskDefinition,"save",p_processId).toString());
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
		String processDefinitionId = Core.getParam("p_prm_definitionid");
		String taskId = Core.getParamTaskId();
		List<Part> parts = (List<Part>) Igrp.getInstance().getRequest().getParts();
		if(Core.isNotNull(taskId)){
			TaskService task = new TaskService().getTask(taskId);	
			if(!ValidateInputDocument.validateRequiredDocument(this,parts)) {
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
			return this.saveTask(task,taskId,parts);
		}
		if(Core.isNotNull(processDefinitionId)){
			if(!ValidateInputDocument.validateRequiredDocument(this,parts)) {
				return this.forward("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
			}
			return this.startProcess(processDefinitionId,parts);
		}		
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	private Response startProcess(String processDefinitionId,List<Part> parts) throws IOException, ServletException {
		String content = Core.getJsonParams();
		FormDataService formData = new FormDataService();
	      FormDataService properties = null;
	      ProcessInstancesService pi = new ProcessInstancesService();
	         formData.setProcessDefinitionId(processDefinitionId);
	         properties = new FormDataService().getFormDataByProcessDefinitionId(processDefinitionId);
	         if(formData!=null && properties!=null && properties.getFormProperties()!=null){
	            for(FormProperties prop:properties.getFormProperties()){
	               Object value = BPMNHelper.getValue(prop.getType(), prop.getId());
	               if(!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
	                  formData.addVariable(prop.getId(),value);
	               }
	            }
	         }
	      formData.addVariable("baseHostNameIgrp",this.getConfig().getHostName());
	      if(Core.isNotNull(content)) {
	         formData.addVariable("customVariableIGRP",content);         
	      }
	      StartProcess st = formData.submitFormByProcessDenifition();
	      if(st!=null){
	         pi.setId(st.getId());
	         pi.setError(st.getError());
	         pi.addVariable("p_process_id", "local", "string", pi.getId());
	         pi.submitVariables();
	 		parts = parts.stream().filter(file -> Core.isNotNull(file.getSubmittedFileName()))
					.filter(file -> Core.isNotNull(file.getName())).collect(Collectors.toList());
	         new TaskFile().addFile(pi,parts);
	      }
	      if(Core.isNotNull(pi.getError())){
            Core.setMessageError(pi.getError().getException());
            return this.redirect("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
         }
         Core.setMessageSuccess();
         TaskService task = new TaskService();
         task.addFilter("processDefinitionId",processDefinitionId);
         task.addFilter("processInstanceId", pi.getId());
         List<TaskService> tasks = task.getMyTasks();
         if(tasks!=null && !tasks.isEmpty()) {
            return this.redirect("igrp","ExecucaoTarefas","executar_button_minha_tarefas&p_id="+tasks.get(0).getId());
         }else {
            return this.forward("igrp","MapaProcesso", "openProcess&p_processId="+processDefinitionId);
         }
	}

	private Response saveTask(TaskService task,String taskId,List<Part> parts) throws IOException, ServletException {
		String content = Core.getJsonParams();
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
		if(Core.isNotNull(content)) {				
			Core.getParameters().entrySet().stream().forEach(param-> {
				task.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
				p.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
			});
			task.addVariable(task.getTaskDefinitionKey()+"_p_task_id", "local", "string",taskId);
			p.addVariable("customVariableIGRP_"+task.getId(),"string",content);
			p.submitVariables();
			task.submitVariables();
		}
		parts = parts.stream().filter(file -> Core.isNotNull(file.getSubmittedFileName()))
				.filter(file -> Core.isNotNull(file.getName())).collect(Collectors.toList());
		new TaskFile().addFile(p,parts);
		formData.addVariable("userName", Core.getCurrentUser().getUser_name());
		formData.addVariable("profile", Core.getCurrentProfile());
		formData.addVariable("organization", Core.getCurrentOrganization());
		
		StartProcess st = formData.submitFormByTask();
		if((st!=null && st.getError()!=null)) {
			Core.setMessageError(st.getError().getException());
			return this.forward("igrp","MapaProcesso", "open-process&taskId="+taskId);
		}else {
			Core.removeAttribute("taskId");
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
		this.page = Config.PREFIX_TASK_NAME+taskDefinition;
		this.app = preiviewApp;
		return BPMNHelper.getOutputDocumentType(processDefinition,taskDefinition,this.getAction().getApplication().getId());
	}

	@Override
	public List<TipoDocumentoEtapa> getInputDocumentType() {
		String taskDefinition = Core.getParam("taskDefinition");
		String processDefinition = Core.getParam("processDefinition");	
		String isDetails = Core.getParam("isDetails",false);
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
					if(!rows.getName().equalsIgnoreCase("page_igrp_ativiti") && !rows.getName().equalsIgnoreCase("app_igrp_ativiti")
							   && !rows.getName().equalsIgnoreCase("processDefinition") &&!rows.getName().equalsIgnoreCase("taskDefinition")
							   &&!rows.getName().equalsIgnoreCase("taskId") &&!rows.getName().equalsIgnoreCase("appId")) {
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
	        .addQueryString("preiviewProcessDefinition", task.getProcessDefinitionKey())
	        .addQueryString("overrided", "false")
	        .addQueryString("backButton", Core.getParam("backButton"))
	        .addQueryString("saveButton", "false");
	        Core.setAttribute("taskObj", task);

		 Response resp = this.call(task.getTenantId(),this.page, "index",this.queryString());
		 String content = resp.getContent();
		 return content;
	}
}
