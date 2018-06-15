package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Model;
import nosi.core.webapp.Response;
import nosi.core.webapp.View;
import nosi.core.webapp.activit.rest.FormDataService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.StartProcess;
import nosi.core.webapp.activit.rest.TaskFile;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.core.webapp.activit.rest.FormDataService.FormProperties;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;

/**
 * Emanuel
 * 7 May 2018
 */

public class BPMNTaskController extends Controller implements IntefaceBPMNTask{

	@Override
	public Response index(String app,Model model,View view) throws IOException {
		view.setModel(model);
		return this.renderView(app,model.getClass().getSimpleName(),view);
	}
	
	@Override
	public Response index() throws IOException, ServletException {
		String appId = Core.getParam("appId");
		String formKey = Core.getParam("formKey");
		String processDefinition = Core.getParam("processDefinition");
		String taskDefinition = Core.getParam("taskDefinition");
		String taskName = Core.getParam("taskName");
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
			xml.setElement("title", taskName+" - Nº "+taskId);
			if(Core.isNotNull(p_processId)) {
				xml.addXml(comp.generateButtonProcess(p_processId).toString());
			}
			if(Core.isNotNull(taskId)) {
				xml.addXml(comp.generateButtonTask(appDad,Config.PREFIX_TASK_NAME+taskDefinition,"save", taskId).toString());
			}
			xml.addXml(content);
			xml.addXml(comp.extractXML(BPMNHelper.addFileSeparator(this,processDefinition,taskDefinition,action.getApplication().getId(),null)));
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
		String customForm = Core.getParam("customForm");
		String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
		FormDataService formData = new FormDataService();
		TaskService task = new TaskService().getTask(taskId);	
		if(task!=null){
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
}
