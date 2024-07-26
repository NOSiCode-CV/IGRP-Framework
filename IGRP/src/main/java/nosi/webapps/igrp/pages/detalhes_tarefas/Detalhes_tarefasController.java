package nosi.webapps.igrp.pages.detalhes_tarefas;

/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.bpmn.BPMNConstants;


/*----#end-code----*/

public class Detalhes_tarefasController extends Controller {

	public Response actionIndex() throws IOException, InstantiationException{
		/*----#start-code(index)----*/
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
		String processDefinitionKey = Core.getParam("p_" + BPMNConstants.PRM_PROCESS_DEFINITION_KEY);
		String taskDefinitionKey = Core.getParam("p_" + BPMNConstants.PRM_TASK_DEFINITION_KEY);
		
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
	//	taskQuery.addFilterBody("includeProcessVariables", "true");
		String content = "";

		List<TaskServiceQuery> queryHistoryTask = taskQuery.queryHistoryTask(processDefinitionKey);
		if(!queryHistoryTask.isEmpty())
			content = generateCustomFormTask(queryHistoryTask.get(0));//because for unique task

		/*----#end-code----*/
		return this.renderView(content);
	}

	/*----#start-code(custom_actions)----*/

	private String generateCustomFormTask(TaskServiceQuery task) throws InstantiationException {
		String content = "";
		try {
			String packageName = String.format("nosi.webapps.%s.process.%s",
					task.getTenantId().toLowerCase(),
					task.getProcessDefinitionKey().toLowerCase());
			String className = String.format("%s.%s%sController",
					packageName,
					BPMNConstants.PREFIX_TASK,
					task.getTaskDefinitionKey());
			Class<?> c = Class.forName(className);
			Method method = c.getMethod("details", TaskServiceQuery.class);
			content = (String) method.invoke(c.getDeclaredConstructor().newInstance(), task);
		} catch (ClassNotFoundException | NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | InstantiationException e) {
			e.printStackTrace();
		}
		return content;
	}
	
	
	/*----#end-code----*/

}
