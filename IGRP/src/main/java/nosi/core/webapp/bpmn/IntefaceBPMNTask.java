package nosi.core.webapp.bpmn;

import java.io.IOException;

import javax.servlet.ServletException;

import nosi.core.webapp.Model;
import nosi.core.webapp.Response;
import nosi.core.webapp.View;

/**
 * Emanuel
 * 7 May 2018
 */
public interface IntefaceBPMNTask {

	//Display task
	public Response index() throws IOException, ServletException;
	
	public Response index(String app,Model model,View view) throws IOException,ServletException;
	
	//Save task on activiti
	public Response save() throws IOException, ServletException;
	
	//Update task on activiti
	public Response update() throws IOException, ServletException;
	
}
