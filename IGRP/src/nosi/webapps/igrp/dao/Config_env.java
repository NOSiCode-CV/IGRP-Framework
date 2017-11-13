package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import java.io.Serializable;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name="tbl_config_env")
public class Config_env extends BaseActiveRecord<Config_env> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4131198619248506773L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private int port;
	@Column(nullable=false)
	private String type_db;
	@Column(nullable=false)
	private String host;
	@Column(nullable=false)
	private String name_db;
	@Column(nullable=false)
	private String username;
	@Column(nullable=false)
	private String password;
	@Column(nullable=false)
	private String charset;
	@Column(nullable=false,unique=true)
	private String name;
	@ManyToOne
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="CONFIG_ENV_FK"),nullable=false)
	private Application application;
	
	public Config_env(){}
	
	public Config_env(int port, String type_db, String host, String name_db, String username,
			String password, String charset, String name, Application application) {
		super();
		this.port = port;
		this.type_db = type_db;
		this.host = host;
		this.name_db = name_db;
		this.username = username;
		this.password = password;
		this.charset = charset;
		this.name = name;
		this.application = application;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getType_db() {
		return type_db;
	}
	public void setType_db(String type_db) {
		this.type_db = type_db;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getName_db() {
		return name_db;
	}
	public void setName_db(String name_db) {
		this.name_db = name_db;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	
}