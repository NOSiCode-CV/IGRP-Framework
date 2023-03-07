package nosi.core.webapp.bpmn;
/**
 * Emanuel
 * 9 Jul 2018
 */

import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.xml.stream.XMLInputFactory;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.bpmn.model.StartEvent;
import org.activiti.bpmn.model.UserTask;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.ResourceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;

public class BPMNTimeLine {
	private int countTask=0;
	private RuntimeTask runtimeTask;
	private int order = 0;
	List<TaskTimeLine> taskTimeline;
	
	public BPMNTimeLine() {
		this.runtimeTask = RuntimeTask.getRuntimeTask();
	}
	
	public IGRPTable get() {
		IGRPTable table = new IGRPTable("table");
		if(this.runtimeTask.getShowTimeLine()) {
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
	
	private void recursiveTask(List<UserTask> userTasks,Map<String,String> refs,String taskSearch) {
		final String next = refs.get(taskSearch);
		userTasks.stream()
			.filter(t->(t.getId().compareTo(""+taskSearch) == 0) && next!=null)
			.forEach(t->{
				TaskTimeLine tt = new TaskTimeLine();
				tt.setTaskId(t.getId());
				tt.setName(t.getName());
				tt.setOrder((++order));
				taskTimeline.add(tt);
			});
		
		refs.remove(taskSearch,next);
		if(refs != null && !refs.isEmpty()) {
			if(next!=null)
				recursiveTask(userTasks,refs,next);
			else {
				String next_ = refs.entrySet().stream().findFirst().get().getKey();
				recursiveTask(userTasks,refs,next_);
			}
		}
	}
	
	public List<TaskTimeLine> getTasks() {		
		this.taskTimeline = new ArrayList<>();
		Map<String,String> tasksSQ = new HashMap<String, String>();
		String processDefinition = runtimeTask.getTask().getProcessDefinitionId();
		TaskServiceRest taskSQ = new TaskServiceRest();
		taskSQ.addFilterBody("finished", "true");
		taskSQ.addFilterBody("processDefinitionId", processDefinition);
		if(taskSQ != null)
			taskSQ.addFilterBody("executionId", runtimeTask.getTask().getExecutionId());
		try {
			taskSQ.queryHistoryTask()
			    .stream()
			    .forEach(task->{
			    	if(tasksSQ.size()==0) {
			    		tasksSQ.put(task.getTaskDefinitionKey(), task.getId());
			    	}else {
			    		if(!tasksSQ.containsKey(task.getTaskDefinitionKey())) {
			    			tasksSQ.put(task.getTaskDefinitionKey(), task.getId());
			    		}
			    	}
			    });
		}catch(Exception e) {
			e.printStackTrace();
		}
		ProcessDefinitionService p = new ProcessDefinitionServiceRest().getProcessDefinition(processDefinition);
		String link = p.getResource().replace("/resources/", "/resourcedata/");	
		String resource = new ResourceServiceRest().getResourceData(link);
		BpmnXMLConverter bpmn = new BpmnXMLConverter();
		XMLInputFactory xif = XMLInputFactory.newInstance();
		try {
			List<StartEvent> startEvent = bpmn.convertToBpmnModel(xif.createXMLStreamReader(new StringReader(resource))).getMainProcess()
					.findFlowElementsOfType(StartEvent.class);
			List<UserTask> userTasks = bpmn.convertToBpmnModel(xif.createXMLStreamReader(new StringReader(resource))).getMainProcess()
					.findFlowElementsOfType(UserTask.class);
			List<SequenceFlow> sequenceFlows = bpmn
					.convertToBpmnModel(xif.createXMLStreamReader(new StringReader(resource))).getMainProcess()
					.findFlowElementsOfType(SequenceFlow.class);
			Map<String,String> refs = new HashMap<String, String>();
			int i=0;
			for(SequenceFlow sf:sequenceFlows) {
				if(!refs.containsKey(sf.getSourceRef())) {
					refs.put(sf.getSourceRef(), sf.getTargetRef());
				}else {
					refs.put(sf.getSourceRef()+"_"+(++i), sf.getTargetRef());					
				}
			}
			String start = startEvent.stream().findFirst().get().getId();
			this.recursiveTask(userTasks,refs, start);
			taskTimeline.stream()
			.forEach(t->{
				if(t.getName().equalsIgnoreCase(runtimeTask.getTask().getName())) {
					t.setType("curent");
					t.setUrl("#");
				}else {
					t.setType("stage");
					if(tasksSQ.containsKey(t.getTaskId())) {
						String url = new Config().getResolveUrl("igrp", "Detalhes_tarefas", "index");
						url += "&"+BPMNConstants.PRM_TASK_ID+"="+tasksSQ.get(t.getTaskId());
						t.setUrl(url);
					}else {
						t.setUrl("#");
					}
				}
			});
			Collections.sort(taskTimeline);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return taskTimeline ;
	}
	
	public static class TaskTimeLine  implements Comparable<TaskTimeLine>{
		private String taskId;
		private String name;
		private String url = "#";
		private String type;
		private int order;
		
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
		public int getOrder() {
			return order;
		}
		public void setOrder(int order) {
			this.order = order;
		}
		@Override
		public int compareTo(TaskTimeLine t) {
			return (""+this.getOrder()).compareTo(""+t.getOrder());
		}
		@Override
		public String toString() {
			return "TaskTimeLine [taskId=" + taskId + ", name=" + name + ", url=" + url + ", type=" + type + ", order="
					+ order + "]";
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
