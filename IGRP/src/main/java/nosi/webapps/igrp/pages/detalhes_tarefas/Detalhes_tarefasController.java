
package nosi.webapps.igrp.pages.detalhes_tarefas;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.bpmn.BPMNConstants;
/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException, InstantiationException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
		String processDefinitionKey = Core.getParam(BPMNConstants.PRM_PROCESS_DEFINITION_KEY);
		String taskDefinitionKey = Core.getParam(BPMNConstants.PRM_TASK_DEFINITION_KEY);

		TaskServiceIGRP taskQuery = new TaskServiceIGRP();
		if(Core.isNotNull(taskId)) {
			taskQuery.addFilterBody("taskId", taskId);
		}
		if(Core.isNotNull(processDefinitionKey)) {
			taskQuery.addFilterBody("processDefinitionKey", processDefinitionKey);
		}
		if(Core.isNotNull(taskDefinitionKey)) {
			taskQuery.addFilterBody("taskDefinitionKey", taskDefinitionKey);
		}
		taskQuery.addFilterBody("includeProcessVariables", "true");
		String content = "";
		for(TaskServiceQuery task:taskQuery.queryHistoryTask()) {
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
			Class<?> c = Class.forName(packageName+"."+BPMNConstants.PREFIX_TASK+task.getTaskDefinitionKey()+"Controller");
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
