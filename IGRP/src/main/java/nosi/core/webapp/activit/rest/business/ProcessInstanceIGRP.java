package nosi.core.webapp.activit.rest.business;

import nosi.core.webapp.activit.rest.entities.HistoricProcessInstance;
import nosi.core.webapp.activit.rest.entities.ProcessInstancesService;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.webapps.igrp.dao.TaskAccess;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Emanuel
 * 15 May 2019
 */
public class ProcessInstanceIGRP extends GenericActivitiIGRP {

    private final ProcessInstanceServiceRest processInstanceServiceRest = new ProcessInstanceServiceRest();

    public ProcessInstanceIGRP() {
        this.activitiRest = processInstanceServiceRest;
    }

    public ProcessInstanceServiceRest getProcessInstanceServiceRest() {
        return processInstanceServiceRest;
    }

    public List<ProcessInstancesService> getRuntimeProcessIntances(String processKey) {
        final List<ProcessInstancesService> list = this.processInstanceServiceRest.getRuntimeProcessIntances(processKey);
        final String[] filterThisProcessIDs = list.stream().map(ProcessInstancesService::getId).distinct().toArray(String[]::new);
        this.setMyProccessAccess(filterThisProcessIDs);
        return list.stream().filter(p -> this.myproccessId.contains(p.getId())).collect(Collectors.toList());
    }

    public List<HistoricProcessInstance> getHistoryOfProccessInstanceIdFinished(String processKey) {
        final List<HistoricProcessInstance> list = this.processInstanceServiceRest.getHistoryOfProccessInstanceIdFinished(processKey);
        final String[] filterThisProcessIDs = list.stream().map(HistoricProcessInstance::getId).distinct().toArray(String[]::new);
        this.setMyProccessAccess(filterThisProcessIDs);
        return list.stream().filter(p -> this.myproccessId.contains(p.getId())).collect(Collectors.toList());
    }

    public Integer totalProccesAtivos(String processKey) {
        final List<ProcessInstancesService> list = this.getRuntimeProcessIntances(processKey);
        return list != null ? list.size() : 0;
    }

    public Integer totalProccesTerminados(String processKey) {
        final List<HistoricProcessInstance> list = this.getHistoryOfProccessInstanceIdFinished(processKey);
        return list != null ? list.size() : 0;
    }

    public static boolean isStartPermission() {
        final List<TaskAccess> listTask = new TaskAccess().getTaskAccess();
        return listTask.stream()
                .anyMatch(t -> t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()));
    }


    public static boolean isStartPermission(String processKey) {
        final List<TaskAccess> listTask = new TaskAccess().getTaskAccess(processKey);
        return listTask.stream()
                .anyMatch(t -> t.getTaskName().equalsIgnoreCase("Start" + t.getProcessName()));
    }
}
