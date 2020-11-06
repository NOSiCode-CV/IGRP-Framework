package nosi.core.webapp.import_export_v2.common.serializable.report;

import java.io.Serializable;
import java.util.List;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ReportSourceAssocSerializable implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String report;
	private String source;
	private List<ReportParamsSerializable> params;
	
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public List<ReportParamsSerializable> getParams() {
		return params;
	}
	public void setParams(List<ReportParamsSerializable> params) {
		this.params = params;
	}
	
}
