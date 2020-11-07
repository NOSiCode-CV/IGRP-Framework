package cv.nosi.core.webapp.workflow.activit.rest.business;

import static cv.nosi.core.i18n.Translator.gt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskService;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessDefinitionServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.TaskServiceRest;

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
				.getProcessDefinitionsAtivos(dadApp);		
		list = list.stream().filter(p -> this.filterAccess(p)).collect(Collectors.toList());
		return list;
	}

	public Map<String, String> mapToComboBox(String dadApp) {
		List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
		Map<String, String> map = new HashMap<>();
		
		map.put(null, gt("-- Selecionar --"));
		map.putAll(list.stream()
				.collect(Collectors.toMap(ProcessDefinitionService::getId, ProcessDefinitionService::getName)));
		return map;
	}

	public Map<String, String> mapToComboBoxByKey(String dadApp) {
		List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
		Map<String, String> map = new HashMap<>();		
		map.put(null,gt("-- Selecionar --"));
		map.putAll(list.stream().collect(HashMap::new, (m,v)->m.put(v.getKey(), v.getName()), HashMap::putAll));
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
			Map<String, String> map = new HashMap<>();	
			map.put(null, gt("-- Selecionar --"));
			map.putAll(listDistint.stream()
					.collect(HashMap::new, (m,v)->m.put(v.getTaskDefinitionKey(), v.getName()), HashMap::putAll));
			return map;
		}
		return null;
	}
}
