package nosi.core.webapp.activit.rest.entities;

import java.util.List;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 2 Oct 2017
 */

public class FormDataService  implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String formKey;
	private String deploymentId;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String taskId;
	private String taskUrl;
	@Expose(serialize=false,deserialize=false)
	private String businessKey;
	@Expose(serialize=false,deserialize=false)
	private List<FormProperties> formProperties;
	
	public String getFormKey() {
		return formKey;
	}
	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}
	public String getDeploymentId() {
		return deploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
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
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskUrl() {
		return taskUrl;
	}
	public void setTaskUrl(String taskUrl) {
		this.taskUrl = taskUrl;
	}
	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}	
	public List<FormProperties> getFormProperties() {
		return formProperties;
	}
	public void setFormProperties(List<FormProperties> formProperties) {
		this.formProperties = formProperties;
	}
	@Override
	public String toString() {
		return "FormDataService [formKey=" + formKey + ", deploymentId=" + deploymentId + ", processDefinitionId="
				+ processDefinitionId + ", processDefinitionUrl=" + processDefinitionUrl + ", taskId=" + taskId
				+ ", taskUrl=" + taskUrl + ", businessKey=" + businessKey + "]";
	}
}
