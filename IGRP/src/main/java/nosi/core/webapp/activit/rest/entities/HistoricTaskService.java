package nosi.core.webapp.activit.rest.entities;

import java.util.List;

/**
 * Emanuel
 * 13 Feb 2018
 */
public class HistoricTaskService extends Activiti implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String processInstanceId;
	private String processInstanceUrl;
	private String executionId;
	private String description;
	private String deleteReason;
	private String owner;
	private String assignee;
	private String startTime;
	private String endTime;
	private String durationInMillis;
	private String workTimeInMillis;
	private String claimTime;
	private String taskDefinitionKey;
	private String formKey;
	private Integer priority;
	private String dueDate;
	private String parentTaskId;
    private List<TaskVariables> variables;
    private String tenantId;
    
  
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
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getProcessInstanceUrl() {
		return processInstanceUrl;
	}
	public void setProcessInstanceUrl(String processInstanceUrl) {
		this.processInstanceUrl = processInstanceUrl;
	}
	public String getExecutionId() {
		return executionId;
	}
	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDeleteReason() {
		return deleteReason;
	}
	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDurationInMillis() {
		return durationInMillis;
	}
	public void setDurationInMillis(String durationInMillis) {
		this.durationInMillis = durationInMillis;
	}
	public String getWorkTimeInMillis() {
		return workTimeInMillis;
	}
	public void setWorkTimeInMillis(String workTimeInMillis) {
		this.workTimeInMillis = workTimeInMillis;
	}
	public String getClaimTime() {
		return claimTime;
	}
	public void setClaimTime(String claimTime) {
		this.claimTime = claimTime;
	}
	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}
	public void setTaskDefinitionKey(String taskDefinitionKey) {
		this.taskDefinitionKey = taskDefinitionKey;
	}
	public String getFormKey() {
		return formKey;
	}
	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}
	public Integer getPriority() {
		return priority;
	}
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getParentTaskId() {
		return parentTaskId;
	}
	public void setParentTaskId(String parentTaskId) {
		this.parentTaskId = parentTaskId;
	}
	public List<TaskVariables> getVariables() {
		return variables;
	}
	public void setVariables(List<TaskVariables> variables) {
		this.variables = variables;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}


	@Override
	public String toString() {
		return "HistoricTaskService [processDefinitionId=" + processDefinitionId + ", processDefinitionUrl="
				+ processDefinitionUrl + ", processInstanceId=" + processInstanceId + ", processInstanceUrl="
				+ processInstanceUrl + ", executionId=" + executionId + ", taskDefinitionKey=" + taskDefinitionKey
				+ ", variables=" + variables + ", tenantId=" + tenantId + "]";
	}
	
	
}
