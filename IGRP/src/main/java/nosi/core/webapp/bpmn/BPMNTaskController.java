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
import nosi.core.webapp.Response;
import nosi.core.webapp.View;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.entities.FormDataService;
import nosi.core.webapp.activit.rest.entities.FormProperties;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.Rows;
import nosi.core.webapp.activit.rest.entities.StartProcess;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.entities.TaskVariables;
import nosi.core.webapp.activit.rest.services.FormDataServiceRest;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.helpers.FileHelper;
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
	private RuntimeTask runtimeTask;
	
	public BPMNTaskController() {
		this.runtimeTask = RuntimeTask.getRuntimeTask();
	}
	@Override
	public Response index(String app,Model model,View view) throws IOException {
		view.setModel(model);
		this.page = this.getClass().getSimpleName().replaceAll("Controller", "");
		return this.renderView(app,model.getClass().getSimpleName(),view,this,this.runtimeTask);
	}

	@Override
	public Response index(String app,Model model,View view,InterfaceBPMNTask bpmnTask) throws IOException {
		view.setModel(model);
		this.page = this.getClass().getSimpleName().replaceAll("Controller", "");
		return this.renderView(app,model.getClass().getSimpleName(),view,bpmnTask,this.runtimeTask);
	}
	
	@Override
	public Response index() throws IOException, ServletException {	
		if(Core.isNotNull(this.runtimeTask)) {
			Action action = new Action().find().andWhere("application", "=",this.runtimeTask.getAppId())
					.andWhere("page", "=",this.runtimeTask.getTask().getFormKey()).one();
			Response resp = this.call(action.getApplication().getDad(), action.getPage(),"index",this.queryString());
			String content = BPMNButton.removeXMLButton(resp.getContent());
			XMLWritter xml = new XMLWritter("rows", this.getConfig().getResolveUrl("igrp","mapa-processo","get-xsl").replaceAll("&", "&amp;")
					+"&amp;page="+this.runtimeTask.getTask().getFormKey()+"&amp;app="+this.runtimeTask.getAppId(), "utf-8");
			xml.addXml(this.getConfig().getHeader(null));
			xml.startElement("content");
			xml.writeAttribute("type", "");
			if(Core.isNotNull(this.runtimeTask.getTask().getProcessInstanceId())) {
				xml.addXml(BPMNButton.generateButtonProcess(this.runtimeTask.getTask().getTenantId(),action.getApplication().getId(),
						BPMNConstants.PREFIX_TASK+this.runtimeTask.getTask().getTaskDefinitionKey(),"save",this.runtimeTask.getTask().getProcessInstanceId()).toString());
			}
			if(Core.isNotNull(this.runtimeTask.getTask().getId())) {
				xml.addXml(BPMNButton.generateButtonTask(this.runtimeTask.getTask().getTenantId(),action.getApplication().getId(),
						BPMNConstants.PREFIX_TASK+this.runtimeTask.getTask().getTaskDefinitionKey(),"save", this.runtimeTask.getTask().getTenantId()).toString());
			}
			xml.addXml(content);
			xml.addXml(BPMNHelper.addFileSeparator(this.runtimeTask.getTask().getTenantId(),this.runtimeTask.getTask().getProcessDefinitionId(),this.runtimeTask.getTask().getTaskDefinitionKey(),null));
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
		String processDefinitionId = Core.getParam(BPMNConstants.PRM_DEFINITION_ID);
		String taskId = Core.getParamTaskId();
		if(Core.isNotNullMultiple(this.runtimeTask,taskId)){
			List<Part> parts = (List<Part>) Igrp.getInstance().getRequest().getParts();
			if(parts!=null && !ValidateInputDocument.validateRequiredDocument(this,parts,this.runtimeTask)) {
				Core.setAttribute(BPMNConstants.PRM_RUNTIME_TASK, this.runtimeTask);
				return this.forward(this.runtimeTask.getTask().getTenantId(), BPMNConstants.PREFIX_TASK+this.runtimeTask.getTask().getTaskDefinitionKey(), "index",this.queryString());
			}
			return this.saveTask(this.runtimeTask.getTask(),taskId,parts);
		}
		if(Core.isNotNull(processDefinitionId)){
			return this.startProcess(processDefinitionId);
		}		
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	private Response startProcess(String processDefinitionId) throws IOException, ServletException {
		String content = Core.getJsonParams();
		FormDataServiceRest formData = new FormDataServiceRest();
		ProcessDefinitionService processDefinition = new ProcessDefinitionService();
		processDefinition.setId(processDefinitionId);
		FormDataService properties = formData.getFormDataByProcessDefinitionId(processDefinitionId);
		
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
			formData.addVariable(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI, content);
		}
		StartProcess st = formData.submitFormByProcessDenifition(processDefinition);
		if (st != null) {
			ProcessInstanceServiceRest processInstanceRest = new ProcessInstanceServiceRest();
			processInstanceRest.addVariable("p_process_id", "local", "string", st.getId());
			processInstanceRest.submitVariables(st.getId());
		}
		if (Core.isNotNull(formData.getError())) {
			Core.setMessageError(formData.getError().getException());
			return this.redirect("igrp", "Dash_board_processo", "index");
		}
		Core.setMessageSuccess();
		this.saveStartProcess(st.getId(),st.getProcessDefinitionKey(),"start","start",st.getProcessDefinitionId());
		TaskServiceIGRP task = new TaskServiceIGRP();
		task.addFilterUrl("processDefinitionId", processDefinitionId);
		task.addFilterUrl("processInstanceId", st.getId());
		List<TaskService> tasks = task.getAvailableTasks();
		if (tasks != null && !tasks.isEmpty()) {
			return this.renderNextTask(tasks);
		} else {
			return this.redirect("igrp", "Dash_board_processo", "index");
		}
	}
	
	
	private Response saveTask(TaskService task,String taskId,List<Part> parts) throws IOException, ServletException {
		FormDataServiceRest formData = new FormDataServiceRest();
		ProcessInstanceServiceRest processServiceRest = new ProcessInstanceServiceRest();	
		TaskServiceIGRP taskServiceRest = new TaskServiceIGRP();
		String content = Core.getJsonParams();
		FormDataService properties = formData.getFormDataByTaskId(taskId);
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
				taskServiceRest.getTaskServiceRest().addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
				processServiceRest.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
			});
			taskServiceRest.getTaskServiceRest().addVariable(task.getTaskDefinitionKey()+"_p_task_id", "local", "string",taskId);
			processServiceRest.addVariable(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI+"_"+task.getId(),"string",content);
			processServiceRest.submitVariables(task.getProcessInstanceId());
			taskServiceRest.getTaskServiceRest().submitVariables(task.getId());
		}
		formData.addVariable("userName", Core.getCurrentUser().getUser_name());
		formData.addVariable("profile", Core.getCurrentProfile());
		formData.addVariable("organization", Core.getCurrentOrganization());
		
		StartProcess st = formData.submitFormByTask(task);
		if((st!=null && formData.getError()!=null)) {
			Core.setMessageError(formData.getError().getException());
			return this.forward("igrp","MapaProcesso", "open-process&taskId="+taskId);
		}else {
			this.saveFiles(parts,taskId);
			this.saveExecuteTask(task.getProcessInstanceId(),task.getProcessDefinitionKey(),taskId,task.getTaskDefinitionKey(),task.getProcessDefinitionId());
			Core.removeAttribute("taskId");
			Core.setMessageSuccess();
			taskServiceRest.addFilterUrl("processDefinitionId",task.getProcessDefinitionId());
			taskServiceRest.addFilterUrl("processInstanceId", task.getProcessInstanceId());
			List<TaskService> tasks = taskServiceRest.getTaskServiceRest().getAvailableTasks();
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

	
	private Response renderNextTask(List<TaskService> tasks) throws IOException {
		return renderNextTask(null,tasks);
	}

	private Response renderNextTask(TaskService task,List<TaskService> tasks) throws IOException {
		TaskService nextTask = tasks.get(tasks.size()-1);
		new TaskServiceRest().claimTask(nextTask.getId(), Core.getCurrentUser().getUser_name());
		Application app = new Application().findByDad(nextTask.getTenantId());
		this.runtimeTask = new RuntimeTask();
		this.runtimeTask.setTask(nextTask);
		this.runtimeTask.setAppId(app.getId());
		if(task!=null) {
			this.runtimeTask.setPreiviewApp(task.getTenantId());
			this.runtimeTask.setPreiviewProcessDefinition(task.getProcessDefinitionId());
			this.runtimeTask.setPreviewTask(task.getTaskDefinitionKey());
			this.runtimeTask.setPreviewTaskId(task.getId());
		}
		this.runtimeTask.setShowTimeLine("true");
		this.runtimeTask.setSaveButton(true);
		Core.setAttribute(BPMNConstants.PRM_RUNTIME_TASK, this.runtimeTask);
		return this.forward(app.getDad().toLowerCase(),BPMNConstants.PREFIX_TASK+nextTask.getTaskDefinitionKey(), "index",this.queryString());
	}

	@Override
	public Response update() throws IOException, ServletException{
//		String taskId = Core.getParamTaskId();
//		String customForm = Core.getParam("customForm");
//		String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
//		boolean result = false;
//		if(Core.isNotNull(taskId)){
//			TaskServiceQuery taskS = new TaskServiceQuery();
//			taskS.addFilter("taskId", taskId);
//			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
//				ProcessInstancesService p = new ProcessInstancesService();
//				p.setId(task.getProcessInstanceId());
//				Core.getParameters().entrySet().stream().forEach(param-> {
//					p.addVariable(task.getTaskDefinitionKey()+"_"+param.getKey(), "local", "string", param.getValue()[0]);
//				});	
//				p.addVariable("customVariableIGRP_"+task.getId(),"string",content);
//				result = p.submitVariables();
//				new TaskFile().addFile(p);
//				if(result){
//					Core.setMessageSuccess();
//				}else{
//					Core.setMessageError();
//				}
//				return this.redirect("igrp","Detalhes_tarefas", "index&taskId="+taskId);
//			}
//		}		
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	@Override
	public List<TipoDocumentoEtapa> getOutputDocumentType() {
		String previewTaskDefinition = this.runtimeTask.getPreviewTask();
		String preiviewProcessDefinition = this.runtimeTask.getPreiviewProcessDefinition();
		String currentTaskDefinition = this.runtimeTask.getTask().getTaskDefinitionKey();
		String currentProcessDefinition = this.runtimeTask.getTask().getProcessDefinitionKey();
		String currentTaskApp = this.runtimeTask.getTask().getTenantId();
		currentTaskApp = Core.isNotNull(currentTaskApp)?currentTaskApp:this.runtimeTask.getPreiviewApp();
		currentTaskDefinition = Core.isNotNull(currentTaskDefinition)?currentTaskDefinition:previewTaskDefinition;
		currentProcessDefinition = Core.isNotNull(currentProcessDefinition)?currentProcessDefinition:preiviewProcessDefinition;
		return BPMNHelper.getOutputDocumentType(currentTaskApp,currentProcessDefinition,currentTaskDefinition,preiviewProcessDefinition,previewTaskDefinition);
	}

	@Override
	public List<TipoDocumentoEtapa> getInputDocumentType() {
		String appDad = this.runtimeTask.getTask().getTenantId();
		String taskDefinition = this.runtimeTask.getTask().getTaskDefinitionKey();
		String processDefinition = this.runtimeTask.getTask().getProcessDefinitionKey();	
		boolean isDetails = this.runtimeTask.isDetails();
		if(isDetails) {			
			return BPMNHelper.getInputDocumentTypeHistory(appDad,processDefinition, taskDefinition);
		}
		return BPMNHelper.getInputDocumentTypeHistory(appDad,processDefinition, taskDefinition);
	}


	@Override
	public String details(TaskServiceQuery task) throws IOException, ServletException {
		this.page = BPMNConstants.PREFIX_TASK+task.getTaskDefinitionKey();
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
		this.runtimeTask = new RuntimeTask(task, action.getApplication().getId(), task.getTaskDefinitionKey(), task.getTenantId(),
				task.getProcessDefinitionKey(), "false", task.getId());
		this.runtimeTask.setSaveButton(false);
		this.runtimeTask.setDetails(true);
		
		this.addQueryString("report_p_prm_definitionid", task.getProcessInstanceId())
	        .addQueryString("current_app_conn", task.getTenantId());
	        Core.setAttribute(BPMNConstants.PRM_RUNTIME_TASK, this.runtimeTask);
	        Core.setAttribute(BPMNConstants.PRM_TASK_OBJ, task);
		 Response resp = this.call(task.getTenantId(),this.page, "index",this.queryString());
		 String content = resp.getContent();
		 return content;
	}
	
	protected void setCustomPermission(String customPermission) {
		this.myCustomPermission = customPermission;
	}
}
