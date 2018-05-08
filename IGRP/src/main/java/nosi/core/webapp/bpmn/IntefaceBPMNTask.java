package nosi.core.webapp.bpmn;

import java.io.IOException;

import javax.servlet.ServletException;

import nosi.core.webapp.Response;

/**
 * Emanuel
 * 7 May 2018
 */
public interface IntefaceBPMNTask {

	//Display task
	public Response index() throws IOException, ServletException;
	
	//Save task on activiti
	public Response save() throws IOException, ServletException;
	
	//Update task on activiti
	public Response update() throws IOException, ServletException;
	
}
