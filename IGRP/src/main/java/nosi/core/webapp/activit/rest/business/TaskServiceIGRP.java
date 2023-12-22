package nosi.core.webapp.activit.rest.business;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.TaskAccess;

import java.sql.Timestamp;
import java.util.ArrayList;
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

		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();

		 List<TaskService> tasks  = taskServiceRest.queryTasks();

		return tasks.stream()
				.filter(taskService -> this.filterAvailableTaskAccess(taskService, myTaskAccess))
				.filter(this::checkIfExistsNApplyCustomPermission)
				.collect(Collectors.toList());
	}

	public List<TaskService> getManageTasks() {

//		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
//
//		final List<TaskService> tasks = taskServiceRest.getTasks();
//
//		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();
//
//		final String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
//				.filter(t -> this.filterAvailableTaskAccess(t, myTaskAccess))
//				.map(TaskService::getProcessInstanceId)
//				.distinct().toArray());
//
//		this.setMyProccessAccess(filterThisProcessIDs);
//
//		return tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
//				.filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
//				.collect(Collectors.toList());
		 final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();
		
		 
		long startTime = System.currentTimeMillis();
		long postbdTime = 0 ;
		taskServiceRest.addFilterBody("tenantId", Core.getCurrentDad());
//		 List<TaskService> tasks = new ArrayList<>(); //taskServiceRest.queryTasks();
		 List<TaskService> tasks = taskServiceRest.queryTasks();
				
//		for(TaskAccess t:myTaskAccess) {
//			if(t.getTaskName().equals("Start"+t.getProcessName()))
//				continue;
//			taskServiceRest.addFilterBody("taskDefinitionKey", t.getTaskName());
//			tasks.addAll(taskServiceRest.queryTasks());
//		}
		
		postbdTime = System.currentTimeMillis(); 
		
		
//		final String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
//				.filter(t -> this.filterAvailableTaskAccess(t, myTaskAccess))
//				.map(TaskService::getProcessInstanceId)
//				.distinct().toArray());
		//this.setMyProccessAccess(filterThisProcessIDs);
		
		List<TaskService> list=tasks.stream()
				.filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
				.filter(this::checkIfExistsNApplyCustomPermission)
				//.filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
				.collect(Collectors.toList());
		
		 long endTime = System.currentTimeMillis();
			long postbdTimee= postbdTime - startTime;
			long elapsedTime = endTime - startTime;
			System.out.println(this.getClass().getSimpleName()+" postbdTimee time: " + postbdTimee + " milliseconds");
			System.out.println(this.getClass().getSimpleName()+" Elapsed time: " + elapsedTime + " milliseconds\n");
			
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
				.map(TaskService::getProcessInstanceId)
				.distinct()
				.toArray(String[]::new);

		this.setMyProccessAccess(processInstanceIds);

		return tasks.stream().filter(tsq -> this.filterAvailableTaskAccess(tsq, myTaskAccess))
				.filter(t -> this.myproccessId.contains(t.getProcessInstanceId()))
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

	private boolean checkIfExistsNApplyCustomPermission(TaskService taskService) {
//		final ActivityExecute activityExecute = new ActivityExecute().find()
//				.andWhere("processid", "=", taskService.getProcessInstanceId())
//				.keepConnection()
//				.orderByDesc("id")
//				.one();
		return this.allowTask(taskService.getProcessDefinitionKey(), taskService);
	}
}
