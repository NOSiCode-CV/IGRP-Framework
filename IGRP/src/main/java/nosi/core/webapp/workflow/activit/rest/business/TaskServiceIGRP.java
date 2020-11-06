package nosi.core.webapp.workflow.activit.rest.business;

import java.util.List;
import java.util.stream.Collectors;

import nosi.core.webapp.util.Core;
import nosi.core.webapp.workflow.activit.rest.entities.TaskService;
import nosi.core.webapp.workflow.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.workflow.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.TaskAccess;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class TaskServiceIGRP extends GenericActivitiIGRP{

	private TaskServiceRest taskServiceRest=new TaskServiceRest();
	
	public TaskServiceIGRP() {
		this.activitiRest = taskServiceRest;
	}

	public TaskServiceRest getTaskServiceRest() {
		return taskServiceRest;
	}
	
	
	public TaskService getTaskByExecutionId(String id){
		return taskServiceRest.getTaskByExecutionId(id);
	}
	
	public TaskService getTask(String id){
		return taskServiceRest.getTask(id);
	}
	
	public List<TaskService> getMyTasks(){
		taskServiceRest.addFilterUrl("assignee", Core.getCurrentUser().getUser_name());
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		List<TaskService> tasks = taskServiceRest.getTasks(); 
		this.setMyProccessAccess();
		tasks = tasks.stream().filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
							  .collect(Collectors.toList());
		return tasks; 
	}
	


	public List<TaskService> getAvailableTasks() {
		taskServiceRest.addFilterUrl("unassigned", "true");
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		List<TaskService> tasks =  taskServiceRest.getTasks();
		List<TaskAccess> myTasAccess = new TaskAccess().getTaskAccess();
		this.setMyProccessAccess();
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTasAccess ))
							  .filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
							  .collect(Collectors.toList());
		return tasks;
	}
	
	
	public List<TaskService> getMabageTasks() {
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		List<TaskService> tasks =  taskServiceRest.getTasks();
		List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();
		this.setMyProccessAccess();
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
							 .filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
							 .collect(Collectors.toList());
		return tasks;
	}
	
	
	private boolean filterAvailableTaskAccess(TaskService t,List<TaskAccess> myTaskAccess) {
		return myTaskAccess
						.stream()
						.filter(a->Core.isNotNull(t.getProcessDefinitionKey()) && a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
						.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
						.collect(Collectors.toList())
						.size() > 0;
	}

	public List<TaskServiceQuery> queryHistoryTask() {
		this.setMyProccessAccess();
		List<TaskServiceQuery> tasks =  taskServiceRest.queryHistoryTask();
		List<TaskAccess> myTasAccess = new TaskAccess().getTaskAccess();
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTasAccess ))
				 .filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
				 .collect(Collectors.toList());
		return tasks;
	}
	
	
	public static boolean isTaskPermission() {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess();
		boolean isTask = listTask != null
				? listTask.stream().filter(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
						.collect(Collectors.toList()).size() > 0
				: false;
		return isTask;
	}

	public static boolean isTaskPermission(String processKey) {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess(processKey);
		boolean isTask = listTask != null
				? listTask.stream().filter(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
						.collect(Collectors.toList()).size() > 0
				: false;
		return isTask;
	}
	
	public TaskService getCurrentTaskByProcessNr(String processNr) {
		return this.taskServiceRest.getCurrentTaskByProcessNr(processNr);
	}
}
