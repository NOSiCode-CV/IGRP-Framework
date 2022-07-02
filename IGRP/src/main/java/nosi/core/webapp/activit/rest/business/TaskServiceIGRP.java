package nosi.core.webapp.activit.rest.business;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.TaskAccess;

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
		taskServiceRest.addFilterUrl("assignee", Objects.requireNonNull(Core.getCurrentUser()).getUser_name());
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());
		return taskServiceRest.getTasks();
	}

	public List<TaskService> getAvailableTasks() {

		taskServiceRest.addFilterUrl("unassigned", "true");
		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());

		final List<TaskService> tasks = taskServiceRest.getTasks();

		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();

		return tasks.stream().filter(taskService -> this.filterAvailableTaskAccess(taskService, myTaskAccess))
				.filter(this::checkIfExistsNApplyCustomPermission)
				.collect(Collectors.toList());
	}

	public List<TaskService> getMabageTasks() {

		taskServiceRest.addFilterUrl("tenantId", Core.getCurrentDad());

		final List<TaskService> tasks = taskServiceRest.getTasks();

		final List<TaskAccess> myTaskAccess = new TaskAccess().getTaskAccess();

		final String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(tasks.stream()
				.filter(t -> this.filterAvailableTaskAccess(t, myTaskAccess))
				.map(TaskService::getProcessInstanceId)
				.distinct().toArray());

		this.setMyProccessAccess(filterThisProcessIDs);

		return tasks.stream().filter(t->this.filterAvailableTaskAccess(t, myTaskAccess ))
				.filter(t->this.myproccessId.contains(t.getProcessInstanceId()))
				.collect(Collectors.toList());
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
		final List<TaskAccess> taskAccessList = new TaskAccess().getTaskAccess();
		return taskAccessList != null
				&& taskAccessList.stream().anyMatch(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()));

	}

	public static boolean isTaskPermission(String processKey) {
		final List<TaskAccess> taskAccessList = new TaskAccess().getTaskAccess(processKey);
		return taskAccessList != null
				&& taskAccessList.stream().anyMatch(t -> !t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()));
	}

	public TaskService getCurrentTaskByProcessNr(String processNr) {
		return this.taskServiceRest.getCurrentTaskByProcessNr(processNr);
	}

	private boolean checkIfExistsNApplyCustomPermission(TaskService taskService) {
		final ActivityExecute activityExecute = new ActivityExecute().find()
				.andWhere("processid", "=", taskService.getProcessInstanceId())
				.keepConnection()
				.orderByDesc("id")
				.one();
		return activityExecute != null && this.allowTask(activityExecute.getProccessKey(), activityExecute);
	}
}
