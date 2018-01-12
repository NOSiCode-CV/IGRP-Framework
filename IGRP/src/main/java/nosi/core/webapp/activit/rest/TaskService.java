package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;
import nosi.webapps.igrp.dao.User;

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
	
	public TaskService getTask(String id){
		TaskService d = new TaskService();
		ClientResponse response = new RestRequest().get("runtime/tasks",id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (TaskService) new RestRequest().convertJsonToDao(contentResp, TaskService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public List<TaskService> getMyTasks(String user){
		this.setFilter("assignee="+user);
		return this.getTasks();
	}
	

	public List<TaskService> getUnassigedTasks(){
		this.setFilter("unassigned=true&candidateUser="+new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId()).getUser_name());
		return this.getTasks();
	}
	
	@SuppressWarnings("unchecked")	
	public List<TaskService> getTasks(){
		List<TaskService> d = new ArrayList<>();
		ClientResponse response = new RestRequest().get("runtime/tasks?"+this.getFilter());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				TaskService dep = (TaskService) new RestRequest().convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<TaskService>) new RestRequest().convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskService>>(){}.getType());
			}else{
				this.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	
	public TaskService create(TaskService task){
		TaskService d = new TaskService();
		ClientResponse response = new RestRequest().post("runtime/tasks",new RestRequest().convertDaoToJson(task));
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==201){
				d = (TaskService) new RestRequest().convertJsonToDao(contentResp, TaskService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public TaskService update(TaskService task){
		TaskService d = new TaskService();
		ClientResponse response = new RestRequest().put("runtime/tasks",new RestRequest().convertDaoToJson(task),task.getId());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (TaskService) new RestRequest().convertJsonToDao(contentResp, TaskService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	
	
	public boolean delete(String id){
		ClientResponse response = new RestRequest().delete("runtime/tasks",id);
		return response.getStatus()==204;
	}
	
	//Assumir tarefa
	public boolean claimTask(String id,String assignee){
		return this.taskAction(id, "claim", assignee);
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
		return this.taskAction(id, "claim",null);
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
		System.out.println(jobj.toString());
		ClientResponse response = new RestRequest().post("runtime/tasks",jobj.toString(),id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			this.setError(response.getStatus()!=200?(ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class):null);
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
	
	private boolean taskAction(String id,String action,String assignee){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action" ,action);
			if(!action.equalsIgnoreCase("resolve"))
				jobj.put("assignee" , assignee);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		ClientResponse response = new RestRequest().post("runtime/tasks",jobj.toString(),id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			this.setError(response.getStatus()!=200?(ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class):null);
			return response.getStatus()==200;
		}
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
	
}
