package cv.nosi.webapps.igrp.pages.addfiletask;

import java.io.IOException;

import org.apache.commons.text.StringEscapeUtils;
/*----#end-code----*/

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.workflow.activit.rest.services.TaskServiceRest;
import cv.nosi.core.webservices.rest.client.helpers.FileRest;
		
public class AddfiletaskController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Addfiletask model = new Addfiletask();
		model.load();
		AddfiletaskView view = new AddfiletaskView();
		/*----#start-code(index)----*/
		String taskId = Core.getParam("taskid");
		String fileName = Core.getParam("filename");
		if(Core.isNotNull(taskId) && Core.isNotNull(fileName)) {
			FileRest content = new TaskServiceRest().getFile(taskId,fileName);
			fileName = fileName.replaceAll("__SCAPE__", "\\\\");
			content.setFileName(StringEscapeUtils.unescapeJava(fileName));
			return this.xSend(content,fileName, content.getContentType(), true);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
