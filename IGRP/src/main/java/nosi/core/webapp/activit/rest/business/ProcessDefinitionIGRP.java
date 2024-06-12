package nosi.core.webapp.activit.rest.business;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;

import java.util.*;

import static nosi.core.i18n.Translator.gt;

/**
 * Emanuel 15 May 2019
 */
public class ProcessDefinitionIGRP extends GenericActivitiIGRP {

   private final ProcessDefinitionServiceRest processDefinitionServiceRest = new ProcessDefinitionServiceRest();

   public ProcessDefinitionIGRP() {
      this.activitiRest = processDefinitionServiceRest;
   }

   public List<ProcessDefinitionService> getMyProcessDefinitions() {
      return this.getMyProcessDefinitions(Core.getCurrentDad());
   }

   public List<ProcessDefinitionService> getMyProcessDefinitions(String dadApp) {
      return processDefinitionServiceRest.getProcessDefinitionsAtivos(dadApp).stream().filter(this::filterAccess).toList();
   }

   public Map<String, String> mapToComboBox(String dadApp) {
      List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
      Map<String, String> map = new HashMap<>(list.size() + 1);
      map.put(null, gt("-- Selecionar --"));
      list.forEach(obj -> map.put(obj.getId(), obj.getName()));
      return map;
   }

   public Map<String, String> mapToComboBoxByKey(String dadApp) {
      List<ProcessDefinitionService> list = this.getMyProcessDefinitions(dadApp);
      Map<String, String> map = new HashMap<>(list.size() + 1);
      map.put(null, gt("-- Selecionar --"));
      map.putAll(list.stream().collect(HashMap::new, (m, v) -> m.put(v.getKey(), v.getName()), HashMap::putAll));
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
         Set<TaskService> listDistint = new HashSet<>(list);// Remove Duplicate
         Map<String, String> map = new HashMap<>();
         map.put(null, gt("-- Selecionar --"));
         map.putAll(listDistint.stream()
                 .collect(HashMap::new, (m, v) -> m.put(v.getTaskDefinitionKey(), v.getName()), HashMap::putAll));
         return map;
      }
      return null;
   }

   public boolean hasBPMN(String dad) {
      return !processDefinitionServiceRest.getProcessDefinitionsAtivos(dad).isEmpty();
   }
}
