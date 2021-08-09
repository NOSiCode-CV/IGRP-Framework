package nosi.core.webapp.activit.rest.business;

import java.util.List;
import java.util.stream.Collectors;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.ActivityExecute;
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
		return taskServiceRest.getTasks();
	}
	
	public List<TaskService> getAvailableTasks() {
		taskServiceRest.addFilterUrl("unassigned", "true");
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		List<TaskService> tasks =  taskServiceRest.getTasks();
		List<TaskAccess> myTasAccess = new TaskAccess().getTaskAccess();
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTasAccess ))
							  .filter(t->checkIfExistsNApplyCustomPermission(t))
							  .collect(Collectors.toList());		
		
		return tasks;
	}
	
	public List<TaskService> getMabageTasks() {
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		List<TaskService> tasks =  taskServiceRest.getTasks();
		List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();
		String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
											.filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
											.map(TaskService::getProcessInstanceId)
											.distinct()
											.collect(Collectors.toList()).toArray());		
		this.setMyProccessAccess(filterThisProcessIDs);
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
							 .filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
							 .collect(Collectors.toList());
		return tasks;
	}
	
	
	private boolean filterAvailableTaskAccess(TaskService t,List<TaskAccess> myTaskAccess) {
		return !myTaskAccess
						.stream()
						.filter(a->Core.isNotNull(t.getProcessDefinitionKey()) && a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
						.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
						.collect(Collectors.toList()).isEmpty()
						;
	}

	public List<TaskServiceQuery> queryHistoryTask() {		
		List<TaskServiceQuery> tasks =  taskServiceRest.queryHistoryTask();
		List<TaskAccess> myTasAccess = new TaskAccess().getTaskAccess();
		String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
				.map(TaskService::getProcessInstanceId)
				.distinct()
				.collect(Collectors.toList()).toArray());		
		this.setMyProccessAccess(filterThisProcessIDs);
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTasAccess ))
				 .filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
				 .collect(Collectors.toList());
		return tasks;
	}
	
	
	public static boolean isTaskPermission() {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess();
	return listTask != null
				&& !listTask.stream().filter(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
						.collect(Collectors.toList()).isEmpty();
				
	}

	public static boolean isTaskPermission(String processKey) {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess(processKey);
		return listTask != null
				&& !listTask.stream().filter(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
						.collect(Collectors.toList()).isEmpty();
	
	}
	
	public TaskService getCurrentTaskByProcessNr(String processNr) {
		return this.taskServiceRest.getCurrentTaskByProcessNr(processNr);
	}
	
	private boolean checkIfExistsNApplyCustomPermission(TaskService taskService) {
		ActivityExecute activityExecute = new ActivityExecute().find()
					.andWhere("processid", "=", taskService.getProcessInstanceId())
					.keepConnection()
					.orderByDesc("id")
					.one();
		return activityExecute != null && this.allowTask(activityExecute.getProccessKey(), activityExecute);
	}
}
