package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.http.Part;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;
import nosi.webapps.igrp.dao.TaskAccess;
import nosi.webapps.igrp.dao.TaskUnassigned;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class TaskService extends Activit{

	private String owner;
	private String assignee;
	private String delegationState;
	private String description;
	private Date createTime;
	private Date dueDate;
	private Integer priority;
	private Boolean suspended;
	private String taskDefinitionKey;
	private String tenantId;
	private String formKey;
	private String parentTaskId;
	private String parentTaskUrl;
	private String executionId;
	private String executionUrl;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String processInstanceId;
	private List<TaskVariables> variables;
	
	public TaskService() {
		this.variables = new ArrayList<>();
	}
	
	@SuppressWarnings("unchecked")
	public TaskService getTaskByExecutionId(String id){
		TaskService t = new TaskService();
		Response response = new RestRequest().get("runtime/tasks?executionId="+id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				t = ((List<TaskService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskService>>(){}.getType())).get(0);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}
	
	public TaskService getTask(String id){
		TaskService t = this.getTaskWhidoutFilterAccess(id);
		List<TaskAccess> myTasAccess = new TaskAccess().getCurrentMyTaskAccess();
		List<TaskAccess> taskUnassigneds = new TaskAccess().getCurrentTaskUnassigned();	
		return this.filterMyTaskAccess(t,myTasAccess,taskUnassigneds)? t:null;
	}
	
	public TaskService getTaskWhidoutFilterAccess(String id){
		TaskService t = new TaskService();
		Response response = new RestRequest().get("runtime/tasks",id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				t = (TaskService) ResponseConverter.convertJsonToDao(contentResp,TaskService.class);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}
	
	public List<TaskService> getMyTasks(){
		List<TaskService> tasks =  this.getTasks();
		List<TaskAccess> myTasAccess = new TaskAccess().getCurrentMyTaskAccess();
		List<TaskAccess> taskUnassigneds = new TaskAccess().getCurrentTaskUnassigned();		
		tasks = tasks.stream().filter(t->this.filterMyTaskAccess(t,myTasAccess,taskUnassigneds)).collect(Collectors.toList());
		return tasks;
	}
	
	private boolean filterMyTaskAccess(TaskService t,List<TaskAccess> myTasAccess,List<TaskAccess> taskUnassigneds) {	
		return myTasAccess
							.stream()
							.filter(a->a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
							.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
							.collect(Collectors.toList())
							.size() > 0 
				&& taskUnassigneds
							.stream()
							.filter(a->a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
							.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
							.filter(a->a.getTaskId().compareTo(t.getId())==0)
							.collect(Collectors.toList())
							.size() == 0;
	}
	
	public List<TaskService> getAvailableTasks(){
		List<TaskService> tasks =  this.getTasks();
		List<TaskAccess> myTasAccess = new TaskAccess().getCurrentAvailableTaskAccess();
		List<TaskAccess> taskUnassigneds = new TaskAccess().getCurrentTaskUnassigned();	
		tasks = tasks.stream().filter(t->this.filterAvailableTaskAccess(t,myTasAccess,taskUnassigneds)).collect(Collectors.toList());
		return tasks;
	}

	private boolean filterAvailableTaskAccess(TaskService t,List<TaskAccess> myTasAccess,List<TaskAccess> taskUnassigneds) {	
		boolean x = myTasAccess
						.stream()
						.filter(a->a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
						.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
						.collect(Collectors.toList())
						.size() > 0;
				x = taskUnassigneds
						.stream()
						.filter(a->a.getProcessName().compareTo(t.getProcessDefinitionKey())==0)
						.filter(a->a.getTaskName().compareTo(t.getTaskDefinitionKey())==0)
						.filter(a->a.getTaskId().compareTo(t.getId())==0)
						.collect(Collectors.toList())
						.size() > 0;
		return x;
	}
	
	public List<TaskService> getUnassigedTasks(){
		return this.getTasks();
	}
	
	@SuppressWarnings("unchecked")	
	public List<TaskService> getTasks(){
		List<TaskService> d = new ArrayList<>();
		Response response = new RestRequest().get("runtime/tasks?size=100000000"+this.getFilter());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				TaskService dep = (TaskService) ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<TaskService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskService>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	
	public TaskService create(TaskService task){
		TaskService t = new TaskService();
		Response response = new RestRequest().post("runtime/tasks",ResponseConverter.convertDaoToJson(task));
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==201){
				t = (TaskService) ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
			}else{
				t.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}
	

	public TaskService update(TaskService task){
		TaskService t = new TaskService();
		Response response = new RestRequest().put("runtime/tasks",ResponseConverter.convertDaoToJson(task),task.getId());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				t = (TaskService) ResponseConverter.convertJsonToDao(contentResp,TaskService.class);
			}else{
				t.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}
	
	public FileRest getFile(String url){
		RestRequest request = new RestRequest();
		FileRest f = new FileRest();
		request.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = request.get(url);	
		if(response!=null){
			if(response.getStatus()==200) {
				f.setContent((InputStream) response.getEntity());
				f.setSize(response.getLength());
				f.setContentType(response.getMediaType().toString());
				return f;
			}
		}
		return f;
	}
	
	public boolean submitTaskFile(Part file,String taskId,String file_desc) throws IOException{
		try {
			Response response = new RestRequest().post("runtime/tasks/"+taskId+"/variables?name="+file_desc+"&type=binary&scope=local", file);
			file.delete();
			return response.getStatus() == 201;
		} catch (IOException e) {
			e.printStackTrace();
		}
		file.delete();
		return false;
	}
	
	public boolean delete(String id){
		Response response = new RestRequest().delete("runtime/tasks",id);
		return response.getStatus()==204;
	}
	
	//Assumir tarefa
	public boolean claimTask(String id) {
		TaskService task = this.getTaskWhidoutFilterAccess(id);
		/*TaskAccess ta = new TaskAccess().find()
										.andWhere("processName","=", task.getProcessDefinitionKey())
										.andWhere("taskName", "=",task.getTaskDefinitionKey())
										.andWhere("organization", "=",Core.getCurrentOrganization())
										.andWhere("profileType", "=",Core.getCurrentProfile())
										.andWhere("user_fk","isnull")
										.one();
		ta.setUser_fk(Core.getCurrentUser().getId());	
		*/	
		TaskUnassigned tu = new TaskUnassigned().find()
												.andWhere("taskId", "=",id)
												.andWhere("processKey", "=",task.getProcessDefinitionKey())
												.andWhere("taskKey", "=",task.getTaskDefinitionKey())
												.andWhere("user", "=",Core.getCurrentUser().getId())
												.one();
		tu.setNoAssumed(false);
		return tu.update()!=null;
	}
	
	//Transferir Tarefa
	public boolean delegateTask(String id,String assignee){
		return this.taskAction(id, "delegate", assignee);
	}
	
	//Devolve a tarefa de volta para o proprietario, se houver 
	public boolean resolveTask(String id,String assignee){
		return this.taskAction(id, "resolve", assignee);
	}

	//Libera a tarefa
	public boolean freeTask(String id){
		TaskService task = this.getTaskWhidoutFilterAccess(id);
		/*TaskAccess ta = new TaskAccess().find()
										.andWhere("processName","=", task.getProcessDefinitionKey())
										.andWhere("taskName", "=",task.getTaskDefinitionKey())
										.andWhere("organization", "=",Core.getCurrentOrganization())
										.andWhere("profileType", "=",Core.getCurrentProfile())
										.andWhere("user_fk","=",Core.getCurrentUser().getId())
										.one();
		ta.setUser_fk(null);	*/
		TaskUnassigned tu = new TaskUnassigned(id, task.getProcessDefinitionKey(),task.getTaskDefinitionKey(), Core.getCurrentUser());
		return tu.insert()!=null;
	}
	
	//Completar Tarefa
	public boolean completeTask(String id,List<TaskVariables> variables){
		this.variables = variables;
		return this.completeTask(id);
	}
	
	public boolean completeTask(String id) {
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action" ,"complete");
			jobj.put("variables", this.variables);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = new RestRequest().post("runtime/tasks",jobj.toString(),id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError(response.getStatus()!=200?(ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class):null);
			return response.getStatus()==200;
		}
		return false;
	}

	//Adiciona variaveis para completar tarefa
	public void addVariable(String name, String scope, String type, Object value, String valueUrl){
		this.variables.add(new TaskVariables(name, scope, type, value, valueUrl));
	}

	public void addVariable(String name, String scope, String type, Object value){
		this.variables.add(new TaskVariables(name, scope, type, value, ""));
	}

	public void addVariable(String name, String type, Object value){
		this.variables.add(new TaskVariables(name, "local", type, value, ""));
	}
	
	public boolean deleteVariable(String variableName) {
		Response response = new RestRequest().delete("runtime/process-instances/"+this.getProcessInstanceId()+"/variables", variableName);
		return response.getStatus() == 201;
	}
	
	
	public boolean submitVariables() {
		Response response = new RestRequest().post("runtime/tasks/"+this.getId()+"/variables", ResponseConverter.convertDaoToJson(this.variables));
		return response.getStatus() == 201;
	}
	
	private boolean taskAction(String id,String action,String assignee){
		/*JSONObject jobj = new JSONObject();
		try {
			jobj.put("action" ,action);
			if(!action.equalsIgnoreCase("resolve"))
				jobj.put("assignee" , assignee);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = new RestRequest().post("runtime/tasks",jobj.toString(),id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError(response.getStatus()!=200?(ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class):null);
			return response.getStatus()==200;
		}*/
		return false;
	}
	
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getDelegationState() {
		return delegationState;
	}

	public void setDelegationState(String delegationState) {
		this.delegationState = delegationState;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Boolean getSuspended() {
		return suspended;
	}

	public void setSuspended(Boolean suspended) {
		this.suspended = suspended;
	}

	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}

	public void setTaskDefinitionKey(String taskDefinitionKey) {
		this.taskDefinitionKey = taskDefinitionKey;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	
	public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getParentTaskId() {
		return parentTaskId;
	}

	public void setParentTaskId(String parentTaskId) {
		this.parentTaskId = parentTaskId;
	}

	public String getParentTaskUrl() {
		return parentTaskUrl;
	}

	public void setParentTaskUrl(String parentTaskUrl) {
		this.parentTaskUrl = parentTaskUrl;
	}

	public String getExecutionId() {
		return executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getExecutionUrl() {
		return executionUrl;
	}

	public void setExecutionUrl(String executionUrl) {
		this.executionUrl = executionUrl;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

	public String getProcessDefinitionUrl() {
		return processDefinitionUrl;
	}

	public void setProcessDefinitionUrl(String processDefinitionUrl) {
		this.processDefinitionUrl = processDefinitionUrl;
	}

	public List<TaskVariables> getVariables() {
		return variables;
	}

	public void setVariables(List<TaskVariables> variables) {
		this.variables = variables;
	}
	
	
	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	@Override
	public String toString() {
		return "Task [owner=" + owner + ", assignee=" + assignee + ", delegationState=" + delegationState
				+ ", description=" + description + ", createTime=" + createTime + ", dueDate=" + dueDate + ", priority="
				+ priority + ", suspended=" + suspended + ", taskDefinitionKey=" + taskDefinitionKey + ", tenantId="
				+ tenantId + ", formKey=" + formKey + ", parentTaskId=" + parentTaskId + ", parentTaskUrl="
				+ parentTaskUrl + ", executionId=" + executionId + ", executionUrl=" + executionUrl
				+ ", processDefinitionId=" + processDefinitionId + ", processDefinitionUrl=" + processDefinitionUrl
				+ ", variables=" + variables + ", Id=" + getId() + ", Category=" + getCategory()
				+ ", name=" + getName() + ", url=" + getUrl() + "]";
	}

	public void addFilter(String paramName, String value) {
		this.setFilter(this.getFilter()+("&"+paramName+"="+value));
	}

	public String getProcessDefinitionKey() {
		if(this.getProcessDefinitionUrl()!=null) {
			RestRequest req = new RestRequest();
			req.setBase_url("");
			Response response = req.get(this.getProcessDefinitionUrl());
			ProcessDefinitionService process = new ProcessDefinitionService();
			if(response!=null){
				String contentResp = "";
				InputStream is = (InputStream) response.getEntity();
				try {
					contentResp = FileHelper.convertToString(is);
				} catch (IOException e) {
					e.printStackTrace();
				}
				if(response.getStatus()==200){
					process = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,ProcessDefinitionService.class);
				}else{
					this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
				}
			}
			return process.getKey();
		}
		return "";
	}

	public Map<String, String> mapToComboBox(String processo) {
		if(Core.isNotNull(processo)) {
			List<TaskService> list = new ProcessDefinitionService().getTasks(processo);
			Set<TaskService> listDistint = list.stream().distinct().collect(Collectors.toSet());//Remove Duplicate
			Map<String, String> map = listDistint.stream().collect(Collectors.toMap(TaskService::getTaskDefinitionKey, TaskService::getName));
			return map;
		}
		return null;
	}
	
}
