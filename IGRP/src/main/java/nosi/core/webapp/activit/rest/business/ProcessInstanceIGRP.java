package nosi.core.webapp.activit.rest.business;

import java.util.List;
import java.util.stream.Collectors;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.HistoricProcessInstance;
import nosi.core.webapp.activit.rest.entities.ProcessInstancesService;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.webapps.igrp.dao.TaskAccess;
/**
 * Emanuel
 * 15 May 2019
 */
public class ProcessInstanceIGRP extends GenericActivitiIGRP {

	private ProcessInstanceServiceRest processInstanceServiceRest = new ProcessInstanceServiceRest();

	public ProcessInstanceIGRP() {
		this.activitiRest = processInstanceServiceRest;
	}

	public ProcessInstanceServiceRest getProcessInstanceServiceRest() {
		return processInstanceServiceRest;
	}

	public List<ProcessInstancesService> getRuntimeProcessIntances(String processKey) {
		List<ProcessInstancesService> list = this.processInstanceServiceRest.getRuntimeProcessIntances(processKey);
		String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(list.stream().map(ProcessInstancesService::getId).distinct().collect(Collectors.toList()).toArray());		
		this.setMyProccessAccess(filterThisProcessIDs);
		list = list.stream().filter(p -> this.myproccessId.contains(p.getId())).collect(Collectors.toList());
		return list;
	}

	public List<HistoricProcessInstance> getHistoryOfProccessInstanceIdFinished(String processKey) {
		List<HistoricProcessInstance> list = this.processInstanceServiceRest.getHistoryOfProccessInstanceIdFinished(processKey);
		String[] filterThisProcessIDs = Core.convertArrayObjectToArrayString(list.stream().map(HistoricProcessInstance::getId).distinct().collect(Collectors.toList()).toArray());		
		this.setMyProccessAccess(filterThisProcessIDs);
		list = list.stream().filter(p -> this.myproccessId.contains(p.getId())).collect(Collectors.toList());
		return list;
	}

	public Integer totalProccesAtivos(String processKey) {	
		List<ProcessInstancesService> list = this.getRuntimeProcessIntances(processKey);
		return list!=null?list.size():0;
	}

	public Integer totalProccesTerminados(String processKey) {
		List<HistoricProcessInstance> list = this.getHistoryOfProccessInstanceIdFinished(processKey);
		return list!=null?list.size():0;
	}

	public static boolean isStartPermission() {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess();
		List<TaskAccess> listStartProc = listTask.stream()
				.filter(t -> t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
				.collect(Collectors.toList());
		return  listStartProc != null && !listStartProc.isEmpty();
	}
	

	public static boolean isStartPermission(String processKey) {
		List<TaskAccess> listTask = new TaskAccess().getTaskAccess(processKey);
		List<TaskAccess> listStartProc = listTask.stream()
				.filter(t -> t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()))
				.collect(Collectors.toList());
		return  listStartProc != null && !listStartProc.isEmpty();
	}
}
