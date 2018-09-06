
package nosi.webapps.igrp.pages.detalhes_tarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException, InstantiationException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Core.getParam("taskId");
		String processDefinitionKey = Core.getParam("processDefinitionKey");
		String taskDefinitionKey = Core.getParam("taskDefinitionKey");
		TaskServiceQuery taskS = new TaskServiceQuery();
		if(Core.isNotNull(taskId)) {
			taskS.addFilter("taskId", taskId);
		}
		if(Core.isNotNull(processDefinitionKey)) {
			taskS.addFilter("processDefinitionKey", processDefinitionKey);
		}
		if(Core.isNotNull(taskDefinitionKey)) {
			taskS.addFilter("taskDefinitionKey", taskDefinitionKey);
		}
		taskS.addFilter("includeProcessVariables", "true");
		String content = "";
		for(TaskServiceQuery task:taskS.queryHistoryTask()) {
			content = generateCustomFormTask(task);
			break;//because for unique task
		}
		return this.renderView(content);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	private String generateCustomFormTask(TaskServiceQuery task) throws InstantiationException {	
		String content = "";
		try {
			String packageName =  "nosi.webapps."+task.getTenantId().toLowerCase()+".process."+task.getProcessDefinitionKey().toLowerCase();
			Class<?> c = Class.forName(packageName+"."+this.config.PREFIX_TASK_NAME+task.getTaskDefinitionKey()+"Controller");
			Method method = c.getMethod("details",TaskServiceQuery.class);
			content = (String) method.invoke(c.newInstance(), task);
		} catch (ClassNotFoundException | NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return content;
	}
	
	
	/*----#END-PRESERVED-AREA----*/

}
