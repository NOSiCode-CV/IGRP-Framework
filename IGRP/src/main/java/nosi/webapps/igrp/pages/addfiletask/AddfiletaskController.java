
package nosi.webapps.igrp.pages.addfiletask;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.activit.rest.TaskService;
import org.apache.commons.text.StringEscapeUtils;
/*----#end-code----*/


public class AddfiletaskController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Addfiletask model = new Addfiletask();
		model.load();
		AddfiletaskView view = new AddfiletaskView();
		/*----#start-code(index)----*/
		String taskId = Core.getParam("amp;taskid");
		String fileName = Core.getParam("amp;filename");
		if(Core.isNotNull(taskId) && Core.isNotNull(fileName)) {
			String url = "history/historic-task-instances/"+taskId+"/variables/"+fileName+"/data";
			FileRest content = new TaskService().getFile(url);
			fileName = fileName.replaceAll("_____", "\\\\");
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
