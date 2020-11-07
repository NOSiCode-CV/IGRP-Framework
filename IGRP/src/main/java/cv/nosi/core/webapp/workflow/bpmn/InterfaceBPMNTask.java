package cv.nosi.core.webapp.workflow.bpmn;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.mvc.View;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskServiceQuery;
import cv.nosi.webapps.igrp.dao.TipoDocumentoEtapa;

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
