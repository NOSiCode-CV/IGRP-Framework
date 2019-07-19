package nosi.core.webapp.bpmn;
/**
 * Emanuel
 * 9 Jul 2018
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;

public class BPMNTimeLine {
	private int countTask=0;
	private String url = "";
	private Map<String,String> tasksSQ;
	
	public BPMNTimeLine() {
	}
	
	public IGRPTable get() {
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
			this.countTask=0;
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
	
	
	public List<TaskTimeLine> getTasks() {
		this.tasksSQ = new HashMap<>();
		this.url = new Config().getResolveUrl("igrp", "Detalhes_tarefas", "index");
		String processDefinition = Core.getParam("processDefinitionId");
		String taskId = Core.getParam("taskId");
		TaskService taskS = new TaskServiceIGRP().getTask(taskId);		
		ProcessDefinitionService p = new ProcessDefinitionServiceRest().getProcessDefinition(processDefinition);
		String link = p.getResource().replace("/resources/", "/resourcedata/");
		String resource = new ResourceServiceRest().getResourceData(link);
		TaskServiceRest taskSQ = new TaskServiceRest();
		taskSQ.addFilterBody("finished", "true");
		taskSQ.addFilterBody("processDefinitionId", processDefinition);
		if(taskS != null)
			taskSQ.addFilterBody("executionId", taskS.getExecutionId());
		try {
		taskSQ.queryHistoryTask()
					    .stream()
					    .forEach(task->{
					    	if(this.tasksSQ.size()==0) {
					    		this.tasksSQ.put(task.getTaskDefinitionKey(), task.getId());
					    	}else {
					    		if(!this.tasksSQ.containsKey(task.getTaskDefinitionKey())) {
					    			this.tasksSQ.put(task.getTaskDefinitionKey(), task.getId());
					    		}
					    	}
					    });
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(resource);
		List<TaskService> tasks = taskSQ.extractTasks(resource,false);
		List<TaskTimeLine> list = new ArrayList<>();
		tasks.stream().forEach(task->{
			TaskTimeLine t = new TaskTimeLine();
			t.setTaskId(task.getId());
			t.setName(task.getName());
			if(taskS!=null && task.getTaskDefinitionKey().equalsIgnoreCase(taskS.getTaskDefinitionKey())) {
				url = "#";
				t.setType("curent");
			}else {
				url +="&taskId="+this.tasksSQ.get(task.getId());//+"&backButton=true";
				t.setType("stage");
			}
			t.setUrl(url);
			list.add(t);
		});		
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
