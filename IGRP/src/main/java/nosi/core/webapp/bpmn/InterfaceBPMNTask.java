package nosi.core.webapp.bpmn;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;

import nosi.core.webapp.Model;
import nosi.core.webapp.Response;
import nosi.core.webapp.View;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 7 May 2018
 */
public interface InterfaceBPMNTask {

	//Display task
    Response index() throws IOException, ServletException;
	
	Response index(String app, Model model, View view) throws IOException,ServletException;
	
	Response index(String app, Model model, View view, InterfaceBPMNTask bpmnTask) throws IOException,ServletException;
	
	//Details of Task
    String details(TaskServiceQuery task) throws IOException,ServletException;
	
	//Save task on activiti
    Response save() throws IOException, ServletException;
	
	//Update task on activiti
    Response update() throws IOException, ServletException;
	
	//List Output Document Type Associated with current task
    List<TipoDocumentoEtapa> getOutputDocumentType();

	//List Input Document Type Associated with current task
    List<TipoDocumentoEtapa> getInputDocumentType();
}
