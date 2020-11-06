package nosi.core.webapp.import_export_v2.common.serializable.report;

import java.io.Serializable;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ReportParamsSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String parameter;
	private String parameter_type;
	
	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}
	public String getParameter_type() {
		return parameter_type;
	}
	public void setParameter_type(String parameter_type) {
		this.parameter_type = parameter_type;
	}
}
