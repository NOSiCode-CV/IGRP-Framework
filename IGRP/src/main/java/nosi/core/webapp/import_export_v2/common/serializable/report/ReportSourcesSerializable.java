package nosi.core.webapp.import_export_v2.common.serializable.report;

import java.io.Serializable;
import java.sql.Date;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ReportSourcesSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String type;
	private Integer type_fk;
	private String type_name;
	private String type_query;
	private int status;
	private Date dt_created;
	private Date dt_updated;
	private String username_created;
	private String username_updated;
	private String connection_name_identify;
	private String dad;
	private String source_identify;//Unique data source identify
	private String taskid;
	private String processid;
	private String formkey;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getType_fk() {
		return type_fk;
	}
	public void setType_fk(Integer type_fk) {
		this.type_fk = type_fk;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getType_query() {
		return type_query;
	}
	public void setType_query(String type_query) {
		this.type_query = type_query;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public String getConnection_name_identify() {
		return connection_name_identify;
	}
	public void setConnection_name_identify(String connection_name_identify) {
		this.connection_name_identify = connection_name_identify;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public String getSource_identify() {
		return source_identify;
	}
	public void setSource_identify(String source_identify) {
		this.source_identify = source_identify;
	}
	public String getTaskid() {
		return taskid;
	}
	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}
	public String getProcessid() {
		return processid;
	}
	public void setProcessid(String processid) {
		this.processid = processid;
	}
	public String getFormkey() {
		return formkey;
	}
	public void setFormkey(String formkey) {
		this.formkey = formkey;
	}
}
