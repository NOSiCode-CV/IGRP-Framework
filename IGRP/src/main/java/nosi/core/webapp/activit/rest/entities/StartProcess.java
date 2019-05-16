package nosi.core.webapp.activit.rest.entities;
/**
 * Emanuel
 * 26 Jan 2018
 */

import java.util.List;

public class StartProcess extends Activiti implements java.io.Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String businessKey;
	private boolean suspended;
	private boolean ended;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String processDefinitionKey;
	private String activityId;
	private List<TaskVariables> variables;
	private String tenantId;
	private boolean completed;
	

	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	public boolean isSuspended() {
		return suspended;
	}
	public void setSuspended(boolean suspended) {
		this.suspended = suspended;
	}
	public boolean isEnded() {
		return ended;
	}
	public void setEnded(boolean ended) {
		this.ended = ended;
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
	public String getProcessDefinitionKey() {
		return processDefinitionKey;
	}
	public void setProcessDefinitionKey(String processDefinitionKey) {
		this.processDefinitionKey = processDefinitionKey;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
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
	public boolean isCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	@Override
	public String toString() {
		return "StartProcess [businessKey=" + businessKey + ", suspended=" + suspended + ", ended=" + ended
				+ ", processDefinitionId=" + processDefinitionId + ", processDefinitionUrl=" + processDefinitionUrl
				+ ", processDefinitionKey=" + processDefinitionKey + ", activityId=" + activityId + ", variables="
				+ variables + ", tenantId=" + tenantId + ", completed=" + completed + ", getId()=" + getId()
				+ ", getName()=" + getName() + ", getUrl()=" + getUrl() + "]";
	}
	
	
}
