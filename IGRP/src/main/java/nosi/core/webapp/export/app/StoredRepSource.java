package nosi.core.webapp.export.app;

import java.sql.Date;

/**
 * Emanuel
 * 3 Apr 2018
 */
public class StoredRepSource {
	private String name;
	private String type;
	private Integer type_fk;
	private String type_name;
	private String type_query;
	private int status;
	private Date dt_created;
	private Date dt_updated;
	private StoredUser user_created;
	private StoredUser user_updated;
	private StoredConfigDB config_env;
	
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
	public StoredConfigDB getConfig_env() {
		return config_env;
	}
	public void setConfig_env(StoredConfigDB config_env) {
		this.config_env = config_env;
	}
	
	@Override
	public String toString() {
		return "StoredRepSource [name=" + name + ", type=" + type + ", type_fk=" + type_fk + ", type_name=" + type_name
				+ ", type_query=" + type_query + ", status=" + status + ", dt_created=" + dt_created + ", dt_updated="
				+ dt_updated + ", user_created=" + user_created + ", user_updated=" + user_updated + ", config_env="
				+ config_env + "]";
	}
}
