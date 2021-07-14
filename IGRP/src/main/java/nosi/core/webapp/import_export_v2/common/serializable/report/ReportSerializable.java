package nosi.core.webapp.import_export_v2.common.serializable.report;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class ReportSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String code;
	private String name;
	private Date dt_created;
	private Date dt_updated;
	private int status;
	private String username_created;
	private String username_updated;	
	private String dad;
	private CLobSerializable xml_content;
	private CLobSerializable xsl_content;
	private List<ReportSourceAssocSerializable> sourcesReportAssoc;
	private List<ReportSourcesSerializable> sources;
	private String report_identify;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDt_created() {
		return dt_created;
	}
	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}
	public Date getDt_updated() {
		return dt_updated;
	}
	public void setDt_updated(Date dt_updated) {
		this.dt_updated = dt_updated;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUsername_created() {
		return username_created;
	}
	public void setUsername_created(String username_created) {
		this.username_created = username_created;
	}
	public String getUsername_updated() {
		return username_updated;
	}
	public void setUsername_updated(String username_updated) {
		this.username_updated = username_updated;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public CLobSerializable getXml_content() {
		return xml_content;
	}
	public void setXml_content(CLobSerializable xml_content) {
		this.xml_content = xml_content;
	}
	public CLobSerializable getXsl_content() {
		return xsl_content;
	}
	public void setXsl_content(CLobSerializable xsl_content) {
		this.xsl_content = xsl_content;
	}	
	public List<ReportSourceAssocSerializable> getSourcesReportAssoc() {
		return sourcesReportAssoc;
	}
	public void setSourcesReportAssoc(List<ReportSourceAssocSerializable> sourcesReportAssoc) {
		this.sourcesReportAssoc = sourcesReportAssoc;
	}
	public List<ReportSourcesSerializable> getSources() {
		return sources;
	}
	public void setSources(List<ReportSourcesSerializable> sources) {
		this.sources = sources;
	}
	public String getReport_identify() {
		return report_identify;
	}
	public void setReport_identify(String report_identify) {
		this.report_identify = report_identify;
	}
	
}
