package nosi.core.webapp.export.app;

import java.sql.Date;
import java.util.List;

/**
 * Emanuel
 * 3 Apr 2018
 */
public class StoredReports {
	private String code;
	private String name;
	private Date dt_created;
	private Date dt_updated;
	private int status;
	private StoredUser user_created;
	private StoredUser user_updated;	
	private StoredCLob xml_content;
	private StoredCLob xsl_content;
	private List<StoredRepTemplateParam> params;
	private List<StoredRepSource> reptemplatesources;
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
	public StoredUser getUser_created() {
		return user_created;
	}
	public void setUser_created(StoredUser user_created) {
		this.user_created = user_created;
	}
	public StoredUser getUser_updated() {
		return user_updated;
	}
	public void setUser_updated(StoredUser user_updated) {
		this.user_updated = user_updated;
	}
	public StoredCLob getXml_content() {
		return xml_content;
	}
	public void setXml_content(StoredCLob xml_content) {
		this.xml_content = xml_content;
	}
	public StoredCLob getXsl_content() {
		return xsl_content;
	}
	public void setXsl_content(StoredCLob xsl_content) {
		this.xsl_content = xsl_content;
	}
	public List<StoredRepTemplateParam> getParams() {
		return params;
	}
	public void setParams(List<StoredRepTemplateParam> params) {
		this.params = params;
	}
	public List<StoredRepSource> getReptemplatesources() {
		return reptemplatesources;
	}
	public void setReptemplatesources(List<StoredRepSource> reptemplatesources) {
		this.reptemplatesources = reptemplatesources;
	}
	@Override
	public String toString() {
		return "StoredReports [code=" + code + ", name=" + name + ", dt_created=" + dt_created + ", dt_updated="
				+ dt_updated + ", status=" + status + ", user_created=" + user_created + ", user_updated="
				+ user_updated + ", xml_content=" + xml_content + ", xsl_content=" + xsl_content + ", params=" + params
				+ ", reptemplatesources=" + reptemplatesources + "]";
	}
	
}
