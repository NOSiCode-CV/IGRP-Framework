package nosi.webapps.igrp.pages.addfiletask;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import org.apache.commons.text.StringEscapeUtils;
/*----#end-code----*/
		
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
