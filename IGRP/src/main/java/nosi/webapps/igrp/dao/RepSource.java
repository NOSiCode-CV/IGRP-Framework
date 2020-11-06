package nosi.webapps.igrp.dao;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

import nosi.core.webapp.Core;

@Entity
@Table(name = "tbl_rep_source")
public class RepSource extends IGRPBaseActiveRecord<RepSource> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7036375790328828424L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@Column(nullable = false)
	private String type;
	private Integer type_fk;
	private String type_name;
	@Type(type = "text")
	private String type_query;
	private int status;
	@Temporal(TemporalType.DATE)
	private Date dt_created;
	@Temporal(TemporalType.DATE)
	private Date dt_updated;

	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "env_fk", foreignKey = @ForeignKey(name = "REP_SOURCE_ENV_FK"), nullable = false)
	private Application application;

	@ManyToOne
	@JoinColumn(name = "env_source_fk", foreignKey = @ForeignKey(name = "REP_SOURCE_ENV_SOURCE_FK"))
	private Application application_source;

	@ManyToOne
	@JoinColumn(name = "user_created_fk", foreignKey = @ForeignKey(name = "REP_SOURCE_USER_CREATED_FK"), nullable = false)
	private User user_created;

	@ManyToOne
	@JoinColumn(name = "user_updated_fk", foreignKey = @ForeignKey(name = "REP_SOURCE_USER_UPDATED_FK"), nullable = false)
	private User user_updated;
	
	@ManyToOne
	@JoinColumn(name = "config_env_fk", foreignKey = @ForeignKey(name = "CRUD_REP_SOURCE_ENV_FK"), nullable = true)
	private Config_env config_env;
	@Column(length = 100)
	private String taskid;
	@Column(length = 100)
	private String processid;

	@Column(length = 100)
	private String formkey;
	private String source_identify = Core.getUUID();//Unique data source identify

	public RepSource() {
	}

	public RepSource(String name, String type, Integer type_fk, String type_name, String type_query, int status,
			Date dt_created, Date dt_updated, Application application, Application application_source,
			User user_created, User user_updated, Config_env config_env) {
		super();
		this.name = name;
		this.type = type;
		this.type_fk = type_fk;
		this.type_name = type_name;
		this.type_query = type_query;
		this.status = status;
		this.dt_created = dt_created;
		this.dt_updated = dt_updated;
		this.application = application;
		this.application_source = application_source;
		this.user_created = user_created;
		this.user_updated = user_updated;
		this.config_env = config_env;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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
		this.type_query = type_query.replaceAll(";", "");
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

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public Application getApplication_source() {
		return application_source;
	}

	public void setApplication_source(Application application_source) {
		this.application_source = application_source;
	}

	public User getUser_created() {
		return user_created;
	}

	public void setUser_created(User user_created) {
		this.user_created = user_created;
	}

	public User getUser_updated() {
		return user_updated;
	}

	public void setUser_updated(User user_updated) {
		this.user_updated = user_updated;
	}

	public Config_env getConfig_env() {
		return config_env;
	}

	public void setConfig_env(Config_env config_env) {
		this.config_env = config_env;
	}

	public String getFormkey() {
		return formkey;
	}

	public void setFormkey(String formkey) {
		this.formkey = formkey;
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

	public String getSource_identify() {
		return  Core.isNotNull(this.source_identify)?this.source_identify:Core.getUUID();
	}
	public void setSource_identify(String source_identify) {
		this.source_identify = source_identify;
	}
	@Override
	public String toString() {
		return "RepSource [id=" + id + ", name=" + name + ", type=" + type + ", type_fk=" + type_fk + ", type_name="
				+ type_name + ", type_query=" + type_query + ", status=" + status + ", dt_created=" + dt_created
				+ ", dt_updated=" + dt_updated + ", application=" + application + ", application_source="
				+ application_source + ", user_created=" + user_created + ", user_updated=" + user_updated
			    + ", config_env=" + config_env + "]";
	}

}
