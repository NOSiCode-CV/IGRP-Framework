package nosi.core.webapp.bpmn;

/**
 * cvt00957 Oct 24, 2020
 */
public class LockProcess {

	private String codeOrg;
	private String codeProf;
	private String procId;
	private String taskKey;
	private String userName;
	public LockProcess() {
		
	}
	public LockProcess(String codeOrg, String codeProf, String procId, String taskKey) {
		super();
		this.codeOrg = codeOrg;
		this.codeProf = codeProf;
		this.procId = procId;
		this.taskKey = taskKey;
	}

	public LockProcess(String codeOrg, String codeProf, String procId, String taskKey, String userName) {
		super();
		this.codeOrg = codeOrg;
		this.codeProf = codeProf;
		this.procId = procId;
		this.taskKey = taskKey;
		this.userName = userName;
	}
	public String getCodeOrg() {
		return codeOrg;
	}
	public void setCodeOrg(String codeOrg) {
		this.codeOrg = codeOrg;
	}
	public String getCodeProf() {
		return codeProf;
	}
	public void setCodeProf(String codeProf) {
		this.codeProf = codeProf;
	}
	public String getProcId() {
		return procId;
	}
	public void setProcId(String procId) {
		this.procId = procId;
	}
	public String getTaskKey() {
		return taskKey;
	}
	public void setTaskKey(String taskKey) {
		this.taskKey = taskKey;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "LockProcess [codeOrg=" + codeOrg + ", codeProf=" + codeProf + ", procId=" + procId + ", taskKey="
				+ taskKey + ", userName=" + userName + "]";
	}
	
	
}
