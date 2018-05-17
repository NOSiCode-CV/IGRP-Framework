package nosi.core.webapp.bpmn;

import java.io.IOException;
import javax.servlet.ServletException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
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
	public Response index() throws IOException, ServletException {
		String appId = Core.getParam("appId");
		String formKey = Core.getParam("formKey");
		String processDefinition = Core.getParam("processDefinition");
		String taskDefinition = Core.getParam("taskDefinition");
		String taskName = Core.getParam("taskName");
		String taskId = Core.getParam("taskId");
		String appDad = Core.getParam("appDad");
		
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
			xml.addXml(comp.generateButtonTask(appDad,taskDefinition,"save", taskId).toString());
			xml.addXml(content);
			xml.addXml(comp.extractXML(BPMNHelper.addFileSeparator(this,processDefinition,taskDefinition,action.getApplication().getId(),null)));
			xml.endElement();
			return this.renderView(xml.toString());	
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	//Save the task
	@Override
	public Response save() throws IOException, ServletException {
		String taskId = Core.getParam("taskId");
		String customForm = Core.getParam("customForm");
		String content = Core.isNotNull(customForm)?Core.getJsonParams():"";
		FormDataService formData = new FormDataService();
		TaskService task = new TaskService().getTask(taskId);
		FormDataService properties = null;
		ProcessInstancesService p = new ProcessInstancesService();
		p.setId(task.getProcessInstanceId());		
		
		if(Core.isNotNull(taskId)){
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
				p.addVariable("customVariableIGRP_"+task.getId(),"string",content);
				p.submitVariables();
				task.submitVariables();
			}
		}
		
		new TaskFile().addFile(p);
		StartProcess st = formData.submitFormByTask();
		if((st!=null && st.getError()!=null)) {
			Core.setMessageError(st.getError().getException());
			return this.forward("igrp","MapaProcesso", "open-process&taskId="+taskId);
		}else {
			Core.setMessageSuccess();
			return this.redirect("igrp","Detalhes_tarefas", "index&taskId="+taskId);
		}
	}

	@Override
	public Response update() throws IOException, ServletException{
		String taskId = Core.getParam("taskId");
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
