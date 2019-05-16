package nosi.core.webapp.activit.rest.business;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import java.util.Set;
/**
 * Emanuel 15 May 2019
 */
public class ProcessDefinitionIGRP extends GenericActivitiIGRP {

	private ProcessDefinitionServiceRest processDefinitionServiceRest = new ProcessDefinitionServiceRest();

	public ProcessDefinitionIGRP() {
		this.activitiRest = processDefinitionServiceRest;
	}

	public List<ProcessDefinitionService> getMyProcessDefinitions() {
		return this.getMyProcessDefinitions(Core.getCurrentApp().getDad());
	}
	
	public List<ProcessDefinitionService> getMyProcessDefinitions(String dadApp) {
		List<ProcessDefinitionService> list = processDefinitionServiceRest
				.getProcessDefinitionsAtivos(Core.getCurrentApp().getDad());
		list = list.stream().filter(p -> this.filterAccess(p)).collect(Collectors.toList());
		return list;
	}

	public Map<String, String> mapToComboBox(String dadApp) {
		List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
		Map<String, String> map = new HashMap<>();
		map.put(null, "--- Selecionar Processo ----");
		map.putAll(list.stream()
				.collect(Collectors.toMap(ProcessDefinitionService::getId, ProcessDefinitionService::getName)));
		return map;
	}

	public Map<String, String> mapToComboBoxByKey(String dadApp) {
		List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
		Map<String, String> map = new HashMap<>();
		map.put(null, "--- Selecionar Processo ----");
		map.putAll(list.stream()
				.collect(Collectors.toMap(ProcessDefinitionService::getKey, ProcessDefinitionService::getName)));
		return map;
	}

	public ProcessDefinitionServiceRest getProcessDefinitionServiceRest() {
		return processDefinitionServiceRest;
	}

	public List<ProcessDefinitionService> getProcessDefinitionsForCreated(String dadApp) {
		return processDefinitionServiceRest.getProcessDefinitionsAtivos(dadApp);
	}

	public Map<String, String> mapToComboBoxByProcessKey(String processKey, String tenantId) {
		if (Core.isNotNull(processKey)) {
			List<TaskService> list = new TaskServiceRest().getTasksByProcessKey(processKey, tenantId);
			Set<TaskService> listDistint = list.stream().distinct().collect(Collectors.toSet());// Remove Duplicate
			Map<String, String> map = listDistint.stream()
					.collect(Collectors.toMap(TaskService::getTaskDefinitionKey, TaskService::getName));
			return map;
		}
		return null;
	}
}
