package nosi.core.webapp.bpmn;
/**
 * Emanuel
 * 9 Jul 2018
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourceService;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;

public class BPMNTimeLine {
	private static int countTask=0;
	private static String url = "";
	private static Map<String,String> tasksSQ = new HashMap<>();
	
	public static IGRPTable get() {
		String showTimeLine = Core.getParam("showTimeLine");
		IGRPTable table = new IGRPTable("table");
		if(showTimeLine.equalsIgnoreCase("true")) {
			table.getProperties().put("type", "workflow");
			Field title = new TextField(null,"title");
			Field type = new TextField(null,"type");
			Field link = new LinkField(null,"link");
			
			table.addField(title);
			table.addField(type);
			table.addField(link);
			
			List<TimeLine> list = new ArrayList<>();
			List<TaskTimeLine> tasks = getTasks();
			countTask=0;
			tasks.stream().forEach(task->{
				TimeLine t = new TimeLine();
				t.setTitle((++countTask)+" - "+task.getName());
				t.setType(task.getType());
				t.setLink(task.getUrl());
				list.add(t);
			});		
			
			table.addData(list);	
		}	
		return table;
	}
	
	
	public static List<TaskTimeLine> getTasks() {
		url = new Config().getResolveUrl("igrp", "Detalhes_tarefas", "index");
		String processDefinition = Core.getParam("processDefinitionId");
		String taskId = Core.getParam("taskId");
		TaskService taskS = new TaskService().getTask(taskId);		
		ProcessDefinitionService p = new ProcessDefinitionService().getProcessDefinition(processDefinition);
		String link = p.getResource().replace("/resources/", "/resourcedata/");
		String resource = new ResourceService().getResourceData(link);
		TaskServiceQuery taskSQ = new TaskServiceQuery();
		taskSQ.addFilter("finished", "true");
		taskSQ.addFilter("processDefinitionId", processDefinition);
		taskSQ.addFilter("executionId", taskS.getExecutionId());
		try {
			tasksSQ = taskSQ.queryHistoryTask()
					    .stream()
					    .peek(t->{
					    })
				        .collect(Collectors.toMap(TaskServiceQuery::getTaskDefinitionKey,TaskServiceQuery::getId));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		List<TaskService> tasks = p.extractTasks(resource,false);
		List<TaskTimeLine> list = new ArrayList<>();
		tasks.stream().forEach(task->{
			TaskTimeLine t = new TaskTimeLine();
			t.setTaskId(task.getId());
			t.setName(task.getName());
			if(task.getTaskDefinitionKey().equalsIgnoreCase(taskS.getTaskDefinitionKey())) {
				url = "#";
				t.setType("curent");
			}else {
				url +="&taskId="+tasksSQ.get(task.getId());//+"&backButton=true";
				t.setType("stage");
			}
			t.setUrl(url);
			list.add(t);
		});		
		tasksSQ = null;
		url= null;
		return list ;
	}
	
	public static class TaskTimeLine{
		private String taskId;
		private String name;
		private String url = "#";
		private String type;
		
		public String getTaskId() {
			return taskId;
		}
		public void setTaskId(String taskId) {
			this.taskId = taskId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}			
	}
	
	public static class TimeLine{
		private String title;
		private String type;
		private String link;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
	}
}
