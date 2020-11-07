package cv.nosi.core.webapp.workflow.bpmn;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.http.Part;

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.workflow.activit.rest.business.TaskServiceIGRP;
import cv.nosi.core.webapp.workflow.activit.rest.entities.FormDataService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.FormProperties;
import cv.nosi.core.webapp.workflow.activit.rest.entities.HistoricTaskService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.StartProcess;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskService;
import cv.nosi.core.webapp.workflow.activit.rest.services.FormDataServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessInstanceServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.TaskServiceRest;
import cv.nosi.webapps.igrp.dao.ActivityEcexuteType;
import cv.nosi.webapps.igrp.dao.ActivityExecute;
import cv.nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 17 May 2019
 */
public class BPMNExecution extends Controller{
	
	public Response startProcess(String processKey,String processDefinitionId) {
		if(Core.isNotNullMultiple(processKey,processDefinitionId)) {
			this.restartQueryString();
			this.addQueryString(BPMNConstants.PRM_DEFINITION_ID,processDefinitionId);
			return this.call(Core.getParam("dad"), BPMNConstants.PREFIX_START_PROCESS+processKey, "save", this.queryString());
		}
		return null;
	}
	
	public Response startProcess(String processKey, String processDefinitionId, Map<String, String> params) {
		if(Core.isNotNullMultiple(processKey,processDefinitionId)) {
			this.restartQueryString();
			if(params != null && !params.isEmpty()) { 
				for(Entry<String, String> param : params.entrySet())  
					if(param.getKey().startsWith(BPMNConstants.CUSTOM_PARAM_PREFIX)) 
						this.addQueryString(param.getKey(), param.getValue()); 
			}
			this.addQueryString(BPMNConstants.PRM_DEFINITION_ID,processDefinitionId);
			return this.call(Core.getParam("dad"), BPMNConstants.PREFIX_START_PROCESS+processKey, "save", this.queryString());
		}
		return null;
	}

	public StartProcess executeStartProcess(String processDefinitionId, String myCustomPermission) {
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
			processInstanceRest.addVariable(BPMNConstants.PRM_PROCESS_ID, "local", "string", st.getId());
			processInstanceRest.submitVariables(st.getId());
		}		
		if (Core.isNotNull(formData.getError())) {
			Core.setMessageError(formData.getError().getException());
			return null;
		}
		if(st!=null)
			this.saveIGRPStartProcess(st.getId(), st.getProcessDefinitionKey(), "start", "start", st.getProcessDefinitionId(), myCustomPermission);
		return st;
	}
	
	public StartProcess executeStartProcess(String processDefinitionId) {
		return this.executeStartProcess(processDefinitionId, null);
	}

	public StartProcess exeuteTask(TaskService task, List<Part> parts, String myCustomPermission) {
		FormDataServiceRest formData = new FormDataServiceRest();
		ProcessInstanceServiceRest processServiceRest = new ProcessInstanceServiceRest();	
		TaskServiceIGRP taskServiceRest = new TaskServiceIGRP();
		String content = Core.getJsonParams();
		FormDataService properties = formData.getFormDataByTaskId(task.getId());
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
			taskServiceRest.getTaskServiceRest().addVariable(task.getTaskDefinitionKey()+"_p_task_id", "local", "string",task.getId());
			processServiceRest.addVariable(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI+"_"+task.getId(),"string",content);
			processServiceRest.submitVariables(task.getProcessInstanceId());
			taskServiceRest.getTaskServiceRest().submitVariables(task.getId());
		}
		formData.addVariable("userName", Core.getCurrentUser().getUser_name());
		formData.addVariable("profile", Core.getCurrentProfile());
		formData.addVariable("organization", Core.getCurrentOrganization());
		
		StartProcess st = formData.submitFormByTask(task);
		if (Core.isNotNull(formData.getError())) {
			Core.setMessageError(formData.getError().getException());
			return null;
		}
		st = new StartProcess();
		st.setId(task.getProcessInstanceId());
		st.setProcessDefinitionKey(task.getProcessDefinitionKey());
		this.saveIGRPActivitiTask(task.getProcessInstanceId(),task.getProcessDefinitionKey(),task.getId(),task.getTaskDefinitionKey(),
				task.getProcessDefinitionId(),myCustomPermission);
		return st;
	}
	
	public StartProcess exeuteTask(TaskService task,List<Part> parts) {
		return this.exeuteTask(task, parts,null);
	}
	
	
	public Response openTask(String taskId) throws IOException {
		if (Core.isNotNull(taskId)) {
			RuntimeTask runtime = this.getRuntimeTask(taskId);
			if (runtime != null) {
				this.restartQueryString();
				Core.setAttribute(BPMNConstants.PRM_RUNTIME_TASK, runtime);
				Core.setAttribute(BPMNConstants.PRM_TASK_EXECUTION_ID, runtime.getTask().getExecutionId());				
				this.addQueryString(BPMNConstants.PRM_TASK_ID, taskId);
				return this.forward(runtime.getTask().getTenantId(),
						BPMNConstants.PREFIX_TASK + runtime.getTask().getTaskDefinitionKey(), "index",
						this.queryString());
			}
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	public Response executeTask(String taskId) throws IOException {
			if (Core.isNotNull(taskId)) {
				RuntimeTask runtime = this.getRuntimeTask(taskId);
				if (runtime != null && runtime.getTask()!=null) {
					this.restartQueryString();
					Core.setAttribute(BPMNConstants.PRM_RUNTIME_TASK, runtime);
					Core.setAttribute(BPMNConstants.PRM_TASK_EXECUTION_ID, runtime.getTask().getExecutionId());	
					this.addQueryString(BPMNConstants.PRM_TASK_ID, taskId);
					return this.forward(runtime.getTask().getTenantId(),
							BPMNConstants.PREFIX_TASK + runtime.getTask().getTaskDefinitionKey(), "save",
							this.queryString());
				}
			}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	public RuntimeTask getRuntimeTask(String taskId) {
		TaskService task = new TaskServiceIGRP().getTask(taskId);
		if (task != null) {
			List<HistoricTaskService> hts = new TaskServiceRest()
					.getHistoryOfProccessInstanceId(task.getProcessInstanceId());
			hts = hts.stream().filter(h -> !h.getTaskDefinitionKey().equals(task.getTaskDefinitionKey()))
					.collect(Collectors.toList());
			String previewTask = (hts != null && hts.size() > 0) ? hts.get(hts.size() - 1).getTaskDefinitionKey() : "";
			String preiviewProcessDefinition = (hts != null && hts.size() > 0)
					? hts.get(hts.size() - 1).getProcessDefinitionId()
					: "";
			String preiviewApp = (hts != null && hts.size() > 0) ? hts.get(hts.size() - 1).getTenantId() : "";
			String previewTaskId = (hts != null && hts.size() > 0) ? hts.get(hts.size() - 1).getId() : "";
			Application app = new Application().findByDad(task.getTenantId());
			if (app != null) {
				RuntimeTask runtimeTask = new RuntimeTask(task, app.getId(), previewTask, preiviewApp,
						preiviewProcessDefinition, true, previewTaskId);
				runtimeTask.setSaveButton(true);
				return runtimeTask;
			}
		}
		return null;
	}
	
	public void saveIGRPActivitiTask(String proc_id,String proccessKey,String taskId,String taskKey,String processName,String myCustomPermission) {
		ActivityExecute activityExecute = new ActivityExecute().find()
				 .where("processid","=",proc_id)
				 .andWhere("proccessKey","=",proccessKey)
				 .andWhere("taskid","=","start")
				 .andWhere("taskKey","=","start")
				 .andWhere("organization","=",Core.getCurrentOrganization())
				 .one();
		if(activityExecute!=null) {
			if(Core.isNotNull(myCustomPermission)) { 
			 activityExecute.setCustomPermission(myCustomPermission);
		     activityExecute.update();
			}
		}
		this.saveIGRPStartProcess(proc_id, proccessKey, taskKey, taskId,processName,myCustomPermission);
	}
	
	public void saveIGRPStartProcess(String proc_id,String proccessKey,String taskKey,String taskId,String processName,String myCustomPermission) {
		 ActivityExecute activityExecute = new ActivityExecute(proc_id, taskId,Core.getCurrentDad(), Core.getCurrentOrganization(), Core.getCurrentProfile(), Core.getCurrentUser(),ActivityEcexuteType.EXECUTE,proccessKey,taskKey,processName);
	     activityExecute.setCustomPermission(myCustomPermission);
	     activityExecute.insert();
	}

}
