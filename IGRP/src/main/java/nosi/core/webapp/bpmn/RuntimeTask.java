package nosi.core.webapp.bpmn;

import java.io.Serializable;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.TaskService;

/**
 * Emanuel
 * 9 May 2019
 */
public class RuntimeTask implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TaskService task;
	private Integer appId;
	private String previewTask;
	private String preiviewApp;
	private String preiviewProcessDefinition;
	private String showTimeLine;
	private String previewTaskId;
	private boolean saveButton;
	private boolean isDetails;
	
	public RuntimeTask() {
		
	}
	
	public RuntimeTask(TaskService task,Integer appId, String previewTask, String preiviewApp, String preiviewProcessDefinition,
			String showTimeLine, String previewTaskId) {
		super();
		this.task = task;
		this.appId = appId;
		this.previewTask = previewTask;
		this.preiviewApp = preiviewApp;
		this.preiviewProcessDefinition = preiviewProcessDefinition;
		this.showTimeLine = showTimeLine;
		this.previewTaskId = previewTaskId;
	}

	public TaskService getTask() {
		return task;
	}

	public void setTask(TaskService task) {
		this.task = task;
	}

	public Integer getAppId() {
		return appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}

	public String getPreviewTask() {
		return previewTask;
	}

	public void setPreviewTask(String previewTask) {
		this.previewTask = previewTask;
	}

	public String getPreiviewApp() {
		return preiviewApp;
	}

	public void setPreiviewApp(String preiviewApp) {
		this.preiviewApp = preiviewApp;
	}

	public String getPreiviewProcessDefinition() {
		return preiviewProcessDefinition;
	}

	public void setPreiviewProcessDefinition(String preiviewProcessDefinition) {
		this.preiviewProcessDefinition = preiviewProcessDefinition;
	}

	public String getShowTimeLine() {
		return showTimeLine;
	}

	public void setShowTimeLine(String showTimeLine) {
		this.showTimeLine = showTimeLine;
	}

	public String getPreviewTaskId() {
		return previewTaskId;
	}

	public void setPreviewTaskId(String previewTaskId) {
		this.previewTaskId = previewTaskId;
	}

	public boolean isSaveButton() {
		return saveButton;
	}

	public void setSaveButton(boolean saveButton) {
		this.saveButton = saveButton;
	}

	public boolean isDetails() {
		return isDetails;
	}

	public void setDetails(boolean isDetails) {
		this.isDetails = isDetails;
	}

	@Override
	public String toString() {
		return "RuntimeTask [task=" + task + ", appId=" + appId + ", previewTask=" + previewTask + ", preiviewApp="
				+ preiviewApp + ", preiviewProcessDefinition=" + preiviewProcessDefinition + ", showTimeLine="
				+ showTimeLine + ", previewTaskId=" + previewTaskId + ", saveButton=" + saveButton + ", isDetails="
				+ isDetails + "]";
	}

	public static RuntimeTask getRuntimeTask() {
		return  (RuntimeTask) Core.getAttributeObject(BPMNConstants.PRM_RUNTIME_TASK, false);
	}
}
