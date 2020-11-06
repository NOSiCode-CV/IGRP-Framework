package nosi.core.webapp.workflow.bpmn;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

import nosi.core.webapp.Response;
import nosi.core.webapp.mvc.Model;
import nosi.core.webapp.mvc.View;
import nosi.core.webapp.workflow.activit.rest.entities.TaskServiceQuery;
//import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 7 May 2018
 */
public interface InterfaceBPMNTask {

	//Display task
	public Response index() throws IOException, ServletException;
	
	public Response index(String app,Model model,View view) throws IOException,ServletException;
	
	public Response index(String app,Model model,View view, InterfaceBPMNTask bpmnTask) throws IOException,ServletException;
	
	//Details of Task
	public String details(TaskServiceQuery task) throws IOException,ServletException;
	
	//Save task on activiti
	public Response save() throws IOException, ServletException;
	
	//Update task on activiti
	public Response update() throws IOException, ServletException;
	
	//List Output Document Type Associated with current task
	public List<TipoDocumentoEtapa> getOutputDocumentType();

	//List Input Document Type Associated with current task
	public List<TipoDocumentoEtapa> getInputDocumentType();
}
