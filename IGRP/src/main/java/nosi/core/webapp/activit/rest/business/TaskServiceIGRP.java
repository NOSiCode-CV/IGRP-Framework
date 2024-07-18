package nosi.core.webapp.activit.rest.business;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.TaskAccess;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class TaskServiceIGRP extends GenericActivitiIGRP {

	private final TaskServiceRest taskServiceRest = new TaskServiceRest();

	public TaskServiceIGRP() {
		this.activitiRest = taskServiceRest;
	}

	public TaskServiceRest getTaskServiceRest() {
		return taskServiceRest;
	}

	public TaskService getTaskByExecutionId(String id) {
		return taskServiceRest.getTaskByExecutionId(id);
	}

	public TaskService getTask(String id) {
		return taskServiceRest.getTask(id);
	}

	public List<TaskService> getMyTasks() {
		taskServiceRest.addFilterBody("assignee", Objects.requireNonNull(Core.getCurrentUser()).getUser_name());
		taskServiceRest.addFilterBody("tenantId", Core.getCurrentDad());
		return taskServiceRest.queryTasks();
	}

	public List<TaskService> getAvailableTasks() {

		taskServiceRest.addFilterBody("unassigned", "true");
		taskServiceRest.addFilterBody("tenantId", Core.getCurrentDad());

		return getFilterAccessTask();
	}
	

	public List<TaskService> getManageTasks() {
		taskServiceRest.addFilterBody("tenantId", Core.getCurrentDad());
		
		return getFilterAccessTask();
	}

	/**
	 * @return
	 */
	private List<TaskService> getFilterAccessTask() {

		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();

		 List<TaskService> tasks  = new ArrayList<>(); 
		 if(myTaskAccess==null)
			 return tasks; 
		if(myTaskAccess.size()<3) {
			for(TaskAccess t:myTaskAccess) {
				long tim = System.currentTimeMillis();
				if(t.getTaskName().equals("Start"+t.getProcessName()))
					continue;
				taskServiceRest.addFilterBody("taskDefinitionKey", t.getTaskName());
				tasks.addAll(taskServiceRest.queryTasks());
				System.out.println(this.getClass().getSimpleName()+" "+t.getTaskName()+" postbdTimee time: " + ( System.currentTimeMillis()-tim) + " milliseconds "+tasks.size());
			}
		}else {
			tasks  = taskServiceRest.queryTasks(); 
		}
		 //Collects all the ID of the executed process going on on the server filter by the user acess management list
		final String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
					.filter(t -> this.filterAvailableTaskAccess(t, myTaskAccess))
					.map(TaskService::getProcessInstanceId)
					.distinct().toArray());
			
		//Checks if the user is allow in the activity executed table that has Custom Permissions
		this.setMyProccessAccess(filterThisProcessIDs);
			
		//Creates the final list of task for the user to use
		List<TaskService> list=tasks.stream()
				.filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
				.collect(Collectors.toList());

			return list;
	}



	private boolean filterAvailableTaskAccess(TaskService taskService, List<TaskAccess> myTaskAccess) {
		return myTaskAccess
				.stream()
				.anyMatch(taskAccess -> Core.isNotNull(taskService.getProcessDefinitionKey())
						&& taskAccess.getProcessName().equals(taskService.getProcessDefinitionKey())
						&& taskAccess.getTaskName().equals(taskService.getTaskDefinitionKey()));
	}

	public List<TaskServiceQuery> queryHistoryTask() {
		final List<TaskServiceQuery> tasks = taskServiceRest.queryHistoryTask();
		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();

		final String[] processInstanceIds = tasks.stream()
				.filter(tsq -> this.filterAvailableTaskAccess(tsq, myTaskAccess))
				.map(TaskService::getProcessInstanceId)
				.distinct()
				.toArray(String[]::new);

		this.setMyProccessAccess(processInstanceIds);
		return tasks.stream()
				.filter(t -> this.myproccessId.contains(t.getProcessInstanceId()))
				.sorted(Comparator.comparing(TaskServiceQuery::getId))
				.collect(Collectors.toList());
	}


	public static boolean isTaskPermission() {
		return new TaskAccess().hasNoStartTaskAccess();

	}

	public static boolean isTaskPermission(String processKey) {
		return new TaskAccess().hasNoStartTaskAccess(processKey);
	}

	public TaskService getCurrentTaskByProcessNr(String processNr) {
		return this.taskServiceRest.getCurrentTaskByProcessNr(processNr);
	}


}
