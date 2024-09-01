package nosi.core.webapp.activit.rest.entities;

/**
 * Emanuel
 * 13 Feb 2018
 */
public class HistoricVariablesService extends Activiti implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String processInstanceId;
	private String processInstanceUrl;
	private String taskId;
	private TaskVariables variable;

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
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String parentTaskId) {
		this.taskId = parentTaskId;
	}
	public TaskVariables getVariable() {
		return variable;
	}
	public void setVariables(TaskVariables variable) {
		this.variable = variable;
	}

	@Override
	public String toString() {
		return "HistoricTaskService [  processInstanceId=" + processInstanceId + ", processInstanceUrl="
				+ processInstanceUrl + ",  taskId=" + taskId
				+ ", variable=" + variable + "]";
	}
	
	
}
