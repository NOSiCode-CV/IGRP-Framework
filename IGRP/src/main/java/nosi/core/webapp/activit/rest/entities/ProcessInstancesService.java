package nosi.core.webapp.activit.rest.entities;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;

/**
 * Emanuel
 * 7 Feb 2018
 */
public class ProcessInstancesService extends Activiti implements java.io.Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String businessKey;
    private String processDefinitionId;
    private String processDefinitionUrl;
	private String startTime;
	private String endTime;
	private String durationInMillis;
	private String startUserId;
	private String startActivityId;
	private String endActivityId;
	private String deleteReason;
	private String superProcessInstanceId;
	@Expose(serialize=false,deserialize=false)
	private List<TaskVariables> variables = new ArrayList<>();
	private String tenantId;
	
	public ProcessInstancesService() {
	}
	
	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
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

	public String getStartUserId() {
		return startUserId;
	}
	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}
	public String getStartActivityId() {
		return startActivityId;
	}
	public void setStartActivityId(String startActivityId) {
		this.startActivityId = startActivityId;
	}
	public String getEndActivityId() {
		return endActivityId;
	}
	public void setEndActivityId(String endActivityId) {
		this.endActivityId = endActivityId;
	}
	public String getDeleteReason() {
		return deleteReason;
	}
	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}
	public String getSuperProcessInstanceId() {
		return superProcessInstanceId;
	}
	public void setSuperProcessInstanceId(String superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}
	public List<TaskVariables> getVariables() {
		return variables;
	}
	public void setVariables(List<TaskVariables> variables) {
		this.variables = variables;
	}
	public String getDurationInMillis() {
		return durationInMillis;
	}
	public void setDurationInMillis(String durationInMillis) {
		this.durationInMillis = durationInMillis;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	
	@Override
	public String toString() {
		return "ProcessInstancesService [businessKey=" + businessKey + ", processDefinitionId=" + processDefinitionId
				+ ", processDefinitionUrl=" + processDefinitionUrl + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", durationInMillis=" + durationInMillis + ", startUserId=" + startUserId + ", startActivityId="
				+ startActivityId + ", endActivityId=" + endActivityId + ", deleteReason=" + deleteReason
				+ ", superProcessInstanceId=" + superProcessInstanceId + ", variables=" + variables + ", tenantId="
				+ tenantId + ", name=" + this.getName() + "]";
	}
	
	
}
