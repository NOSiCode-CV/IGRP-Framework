package cv.nosi.core.webapp.ie.import_export_v2.common.serializable.bpmn;

import java.io.Serializable; 
/**
 * Iekiny Marcel
 * Jun 20, 2020
 */
public class BPMNTipoDocEtapaSerializable implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String processId;
	private String tipo;
	private String taskId;
	private int status;
	private int required; 
	private String appCode;
	private String reportCode; 
	private String tipoDocCode; 
	
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRequired() {
		return required;
	}
	public void setRequired(int required) {
		this.required = required;
	}
	public String getAppCode() {
		return appCode;
	}
	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}
	public String getReportCode() {
		return reportCode;
	}
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	public String getTipoDocCode() {
		return tipoDocCode;
	}
	public void setTipoDocCode(String tipoDocCode) {
		this.tipoDocCode = tipoDocCode;
	}
} 
