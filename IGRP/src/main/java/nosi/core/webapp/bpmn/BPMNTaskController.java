package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Model;
import nosi.core.webapp.QueryString;
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
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.ActivityEcexuteType;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import static nosi.core.i18n.Translator.gt;

/**
 * Emanuel
 * 7 May 2018
 */

public abstract class BPMNTaskController extends Controller implements InterfaceBPMNTask{
	private String page;
	private String myCustomPermission;
	
	@Override
	public Response index(String app,Model model,View view) throws IOException {
		view.setModel(model);
		this.page = this.getClass().getSimpleName().replaceAll("Controller", "");
		return this.renderView(app,model.getClass().getSimpleName(),view);
	}

	@Override
	public Response index(String app,Model model,View view,InterfaceBPMNTask bpmnTask) throws IOException {
		view.setModel(model);
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
			Action action = new Action().find().andWhere("application", "=",Core.toInt(appId)).andWhere("page", "=",formKey).one();
			Response resp = this.call(action.getApplication().getDad(), action.getPage(),"index",this.queryString());
			String content = BPMNButton.removeXMLButton(resp.getContent());
			XMLWritter xml = new XMLWritter("rows", this.getConfig().getResolveUrl("igrp","mapa-processo","get-xsl").replaceAll("&", "&amp;")+"&amp;page="+formKey+"&amp;app="+appId, "utf-8");
			xml.addXml(this.getConfig().getHeader(null));
			xml.startElement("content");
			xml.writeAttribute("type", "");
			if(Core.isNotNull(p_processId)) {
				xml.addXml(BPMNButton.generateButtonProcess(appDad,action.getApplication().getId(),this.getConfig().PREFIX_TASK_NAME+taskDefinition,"save",p_processId).toString());
			}
			if(Core.isNotNull(taskId)) {
				xml.addXml(BPMNButton.generateButtonTask(appDad,action.getApplication().getId(),this.getConfig().PREFIX_TASK_NAME+taskDefinition,"save", taskId).toString());
			}
			xml.addXml(content);
			xml.addXml(BPMNHelper.addFileSeparator(appDad,processDefinition,taskDefinition,null));
			IGRPMessage msg = new IGRPMessage();
			String m = msg.toString();
			if(m!=null){
				xml.addXml(m);
			}
			xml.endElement();
			return this.renderView(xml.toString());	
		}
		Core.setAttribute("javax.servlet.error.message", gt("Task não tem página associada!"));
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	//Save the task
	@Override
	public Response save() throws IOException, ServletException {
		String processDefinitionId = Core.getParam("p_prm_definitionid");
		String taskId = Core.getParamTaskId();
		if(Core.isNotNull(taskId)){
			List<Part> parts = (List<Part>) Igrp.getInstance().getRequest().getParts();
			TaskService task = new TaskService().getTask(taskId);	
			if(parts!=null && !ValidateInputDocument.validateRequiredDocument(this,parts)) {
				this.addQueryString("taskId",taskId)
		            .addQueryString("appId", Core.getParam("appId"))
		            .addQueryString("appDad",Core.getParam("appDad"))
		            .addQueryString("formKey",Core.getParam("formKey"))
		            .addQueryString("processDefinition", task.getProcessDefinitionKey())
		            .addQueryString("taskDefinition", task.getTaskDefinitionKey())
		            .addQueryString("previewTask", Core.getParam("previewTask"))
		            .addQueryString("preiviewApp", Core.getParam("preiviewApp"))
		            .addQueryString("preiviewProcessDefinition", Core.getParam("preiviewProcessDefinition"));
				return this.forward(task.getTenantId(), this.getConfig().PREFIX_TASK_NAME+task.getTaskDefinitionKey(), "index",this.queryString());
			}
			return this.saveTask(task,taskId,parts);
		}
		if(Core.isNotNull(processDefinitionId)){
			return this.startProcess(processDefinitionId);
		}		
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	private Response startProcess(String processDefinitionId) throws IOException, ServletException {
		String content = Core.getJsonParams();
		FormDataService formData = new FormDataService();
		formData.setProcessDefinitionId(processDefinitionId);
		ProcessInstancesService pi = new ProcessInstancesService();
		FormDataService properties = new FormDataService().getFormDataByProcessDefinitionId(processDefinitionId);
		
		if (properties != null && properties.getFormProperties() != null) {
			for (FormProperties prop : properties.getFormProperties()) {
				Object value = BPMNHelper.getValue(prop.getType(), prop.getId());
				if (!prop.getType().equalsIgnoreCase("binary") && prop.getWritable() && Core.isNotNull(value)) {
					formData.addVariable(prop.getId(), value);
				}
			}
		}
		formData.addVariable("baseHostNameIgrp", this.getConfig().getHostName());
		if (Core.isNotNull(content)) {
			formData.addVariable("customVariableIGRP", content);
		}
		StartProcess st = formData.submitFormByProcessDenifition();
		if (st != null) {
			pi.setId(st.getId());
			pi.setError(st.getError());
			pi.addVariable("p_process_id", "local", "string", pi.getId());
			pi.submitVariables();
		}
		if (Core.isNotNull(pi.getError())) {
			Core.setMessageError(pi.getError().getException());
			return this.redirect("igrp", "MapaProcesso", "openProcess&p_processId=" + processDefinitionId);
		}
		Core.setMessageSuccess();
		st.proccessDescription(st.getProcessDefinitionUrl());
		this.saveStartProcess(pi.getId(),st.getProcessDefinitionKey(),"start","start",st.getProcessName());
		TaskService task = new TaskService();
		task.addFilter("processDefinitionId", processDefinitionId);
		task.addFilter("processInstanceId", pi.getId());
		List<TaskService> tasks = task.getAvailableTasks();
		if (tasks != null && !tasks.isEmpty()) {
			return this.renderNextTask(task, tasks);
		} else {
			return this.forward("igrp", "MapaProcesso", "openProcess&p_processId=" + processDefinitionId);
		}
	}
	
	
	private Response saveTask(TaskService task,String taskId,List<Part> parts) throws IOException, ServletException {
		String content = Core.getJsonParams();
		FormDataService formData = new FormDataService();
		ProcessInstancesService p = new ProcessInstancesService();
		p.setId(task.getProcessInstanceId());
		formData.setTaskId(taskId);		
		FormDataService properties = new FormDataService().getFormDataByTaskId(taskId);
		if(properties!=null && properties.getFormProperties()!=null){
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
		formData.addVariable("userName", Core.getCurrentUser().getUser_name());
		formData.addVariable("profile", Core.getCurrentProfile());
		formData.addVariable("organization", Core.getCurrentOrganization());
		
		StartProcess st = formData.submitFormByTask();
		if((st!=null && st.getError()!=null)) {
			Core.setMessageError(st.getError().getException());
			return this.forward("igrp","MapaProcesso", "open-process&taskId="+taskId);
		}else {
			this.saveFiles(parts,taskId);
			task.proccessDescription(task.getProcessDefinitionUrl());
			this.saveExecuteTask(task.getProcessInstanceId(),task.getProcessDefinitionKey(),taskId,task.getTaskDefinitionKey(),task.getProcessName());
			Core.removeAttribute("taskId");
			Core.setMessageSuccess();
			task.addFilter("processDefinitionId",task.getProcessDefinitionId());
			task.addFilter("processInstanceId", task.getProcessInstanceId());
			List<TaskService> tasks = task.getAvailableTasks();
			if(tasks!=null  && !tasks.isEmpty()) {
				return this.renderNextTask(task,tasks);
			}else {
				return this.redirect("igrp","ExecucaoTarefas","index");
			}
		}
	}
	

	private void saveExecuteTask(String proc_id,String proccessKey,String taskId,String taskKey,String processName) {
		ActivityExecute activityExecute = new ActivityExecute().find()
				 .where("processid","=",proc_id)
				 .andWhere("proccessKey","=",proccessKey)
				 .andWhere("taskid","=","start")
				 .andWhere("taskKey","=","start")
				 .andWhere("organization","=",Core.getCurrentOrganization())
				 .one();
		if(activityExecute!=null) {
			if(Core.isNotNull(this.myCustomPermission)) { 
			 activityExecute.setCustomPermission(this.myCustomPermission);
		     activityExecute.update();
			}
		}
		this.saveStartProcess(proc_id, proccessKey, taskKey, taskId,processName);
	}
	
	private void saveStartProcess(String proc_id,String proccessKey,String taskKey,String taskId,String processName) {
		 ActivityExecute activityExecute = new ActivityExecute(proc_id, taskId,Core.getCurrentDad(), Core.getCurrentOrganization(), Core.getCurrentProfile(), Core.getCurrentUser(),ActivityEcexuteType.EXECUTE,proccessKey,taskKey,processName);
	     activityExecute.setCustomPermission(this.myCustomPermission);
	     activityExecute.insert();
	}


	private void saveFiles(List<Part> parts,String taskId) {
		Object[] id_tp_doc = Core.getParamArray("p_formlist_documento_id_tp_doc_fk");	
		if(id_tp_doc!=null && parts!=null) {
			try {
				id_tp_doc = Arrays.asList(id_tp_doc).stream().filter(value->Core.isNotNull(value)).toArray();
				
				Object[] doc_id = Core.getParamArray("p_formlist_documento_doc_id_fk");	
				doc_id = Arrays.asList(doc_id).stream().filter(value->Core.isNotNull(value)).toArray();
	
				Object[] input_type = Core.getParamArray("p_formlist_documento_task_documento_fk_desc");	
				input_type = Arrays.asList(input_type).stream().filter(value->Core.isNotNull(value)).toArray();
	
				parts = parts.stream().filter(p->p.getName().equalsIgnoreCase("p_formlist_documento_task_documento_fk")).collect(Collectors.toList());

				this.saveFiles(parts,id_tp_doc,doc_id,input_type,taskId);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
	}

	private void saveFiles(List<Part> parts,Object[] id_tp_doc,Object[] doc_id,Object[] input_type,String taskId) {
		Application app = Core.findApplicationByDad(Core.getCurrentDadParam());
		for(int i=0;i<id_tp_doc.length;i++) {
			Part part = parts.get(i);
			if(Core.isNotNullMultiple(part,part.getSubmittedFileName())) {
				try {
					byte[] bytes = FileHelper.convertInputStreamToByte(part.getInputStream());
					String file_id = doc_id[i].toString();
					CLob clob = null;
					if(Core.isNotNull(file_id) && !file_id.equals("-1")) {
						clob = new CLob().findOne(Core.toInt(file_id));
					}else {
						clob = new CLob(part.getSubmittedFileName(), part.getContentType(),bytes,new Date(System.currentTimeMillis()), app );
						clob.showMessage();
						clob = clob.insert();
					}
					this.saveTaskFile(clob,id_tp_doc,i,taskId);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(input_type[i].toString().equals("OUT")) {
				String file_id = doc_id[i].toString();
				if(Core.isNotNull(file_id) && !file_id.equals("-1")) {
					CLob clob = new CLob().findOne(Core.toInt(file_id));
					this.saveTaskFile(clob,id_tp_doc,i,taskId);
				}
			}
		}
	}
	

	private void saveTaskFile(CLob clob,Object[] id_tp_doc,int i,String taskId) {
		if(clob!=null && !clob.hasError()) {
			String tp_doc_id =id_tp_doc[i].toString();
			TipoDocumentoEtapa tpdoc = new TipoDocumentoEtapa().findOne(Core.toInt(tp_doc_id));
			if(tpdoc!=null) {
				nosi.webapps.igrp.dao.TaskFile taskFile = new nosi.webapps.igrp.dao.TaskFile(clob, tpdoc ,taskId);
				taskFile.insert();
			}
		}
	}

	


	private Response renderNextTask(TaskService task,List<TaskService> tasks) throws IOException {
		TaskService nextTask = tasks.get(tasks.size()-1);
		nextTask.claimTask(nextTask.getId(), Core.getCurrentUser().getUser_name());
		Application app = new Application().findByDad(nextTask.getTenantId());
		this.addQueryString("taskId",nextTask.getId())
        .addQueryString("appId", app.getId())
        .addQueryString("appDad", app.getDad())
        .addQueryString("formKey", nextTask.getFormKey())
        .addQueryString("processDefinition", nextTask.getProcessDefinitionKey())
        .addQueryString("processDefinitionId", nextTask.getProcessDefinitionId())
        .addQueryString("taskDefinition", nextTask.getTaskDefinitionKey())
        .addQueryString("previewTask", task.getTaskDefinitionKey())
        .addQueryString("preiviewApp", task.getTenantId())
        .addQueryString("preiviewProcessDefinition", task.getProcessDefinitionId())
        .addQueryString("showTimeLine", "true")
        .addQueryString("previewTaskId", task.getId());
		return this.redirect(app.getDad().toLowerCase(),this.config.PREFIX_TASK_NAME+nextTask.getTaskDefinitionKey(), "index",this.queryString());
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
		String previewTaskDefinition = Core.getParam("previewTask");
		String preiviewProcessDefinition = Core.getParam("preiviewProcessDefinition");	
		String currentTaskDefinition = Core.getParam("taskDefinition");
		String currentProcessDefinition = Core.getParam("processDefinition");	
		String currentTaskApp = Core.getParam("appDad");
		currentTaskApp = Core.isNotNull(currentTaskApp)?currentTaskApp:Core.getParam("preiviewApp");
		currentTaskDefinition = Core.isNotNull(currentTaskDefinition)?currentTaskDefinition:previewTaskDefinition;
		currentProcessDefinition = Core.isNotNull(currentProcessDefinition)?currentProcessDefinition:preiviewProcessDefinition;
		return BPMNHelper.getOutputDocumentType(currentTaskApp,currentProcessDefinition,currentTaskDefinition,preiviewProcessDefinition,previewTaskDefinition);
	}

	@Override
	public List<TipoDocumentoEtapa> getInputDocumentType() {
		String appDad = Core.getParam("appDad");
		String taskDefinition = Core.getParam("taskDefinition");
		String processDefinition = Core.getParam("processDefinition");	
		String isDetails = Core.getParam("isDetails",false);
		if(Core.isNotNull(isDetails)) {			
			return BPMNHelper.getInputDocumentTypeHistory(appDad,processDefinition, taskDefinition);
		}
		return BPMNHelper.getInputDocumentTypeHistory(appDad,processDefinition, taskDefinition);
	}


	@Override
	public String details(TaskServiceQuery task) throws IOException, ServletException {
		this.page = this.getConfig().PREFIX_TASK_NAME+task.getTaskDefinitionKey();
		Gson gson = new Gson();		
		Action action = new Action().find()
									.andWhere("page", "=",this.page)
									.andWhere("application.dad", "=",task.getTenantId())
									 .andWhere("processKey", "=", task.getProcessDefinitionKey().toLowerCase())
									.one();
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
	        .addQueryString("report_p_prm_definitionid", task.getProcessInstanceId())
	        //for output documents details
	        .addQueryString("preiviewApp",task.getTenantId())
	        .addQueryString("previewTask", task.getTaskDefinitionKey())
	        .addQueryString("preiviewProcessDefinition", task.getProcessDefinitionKey())
	        .addQueryString("overrided", "false")
	        .addQueryString("backButton", Core.getParam("backButton"))
	        .addQueryString("saveButton", "false")
	        .addQueryString("current_app_conn", task.getTenantId());
	        Core.setAttribute("taskObj", task);
		 Response resp = this.call(task.getTenantId(),this.page, "index",this.queryString());
		 String content = resp.getContent();
		 return content;
	}
	
	@Override
	public QueryString<String,Object> loadQueryString() {
		return 
				this.addQueryString("processDefinition",Core.getParam("processDefinition"))
					.addQueryString("taskDefinition",Core.getParam("taskDefinition"))
					.addQueryString("appDad",Core.getParam("appDad"))
					.addQueryString("formKey",Core.getParam("formKey"))
					.addQueryString("processDefinitionId",Core.getParam("processDefinitionId"))
					.addQueryString("taskDefinition",Core.getParam("taskDefinition"))
					.addQueryString("previewTask",Core.getParam("previewTask"))
					.addQueryString("preiviewApp",Core.getParam("preiviewApp"))
					.addQueryString("preiviewProcessDefinition",Core.getParam("preiviewProcessDefinition"))
					.addQueryString("showTimeLine","true")
					.addQueryString("previewTaskId",Core.getParam("previewTaskId"));
	}
	
	protected void setCustomPermission(String customPermission) {
		this.myCustomPermission = customPermission;
	}
}
