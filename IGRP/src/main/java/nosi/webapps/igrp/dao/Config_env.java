package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import static nosi.core.i18n.Translator.gt;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.IgrpHelper;

@Entity
@Table(name="tbl_config_env")
public class Config_env extends IGRPBaseActiveRecord<Config_env> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4131198619248506773L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String port;
	private String host;
	private String name_db;
	private String charset;
	@Column(nullable=false)
	private String type_db;
	@Column(nullable=false)
	private String username;
	@Column(nullable=false)
	private String password;
	@Column(nullable=false)
	private String name;
	@Column(nullable=false)
	private String url_connection;
	@Column(nullable=false)
	private String driver_connection;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="CONFIG_ENV_FK"),nullable=false)
	private Application application;
	
	private short isdefault = 0; // 0 -> false; 1 -> true 
	private String connection_identify = Core.getUUID();
	
	public Config_env(){}
	
	public Config_env(String port, String type_db, String host, String name_db, String username,
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
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
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
	
	public String getUrl_connection() {
		return url_connection;
	}

	public void setUrl_connection(String url_connection) {
		this.url_connection = url_connection;
	}

	public String getDriver_connection() {
		return driver_connection;
	}

	public void setDriver_connection(String driver_connection) {
		this.driver_connection = driver_connection;
	}
	
	public String getConnection_identify() {
		return Core.isNotNull(this.connection_identify)?this.connection_identify:Core.getUUID();
	}

	public void setConnection_identify(String connection_identify) {
		this.connection_identify = connection_identify;
	}

	public  Map<Object, Object> getListDSbyEnv(int idEnv) {
		final List<Config_env> findall = this.find().andWhere("application", "=",idEnv).all();
		return IgrpHelper.toMap(findall, "id", "name", findall.size()!=0 ?gt("-- Selecionar --"):gt("++ Add a datasource ++"));
	}

	public short getIsDefault() {
		return isdefault;
	}

	public void setIsDefault(short isdefault) {
		this.isdefault = isdefault;
	}

	@Override
	public String toString() {
		return "Config_env [id=" + id + ", port=" + port + ", host=" + host + ", name_db=" + name_db + ", charset="
				+ charset + ", type_db=" + type_db + ", username=" + username + ", password=" + password + ", name="
				+ name + ", url_connection=" + url_connection + ", driver_connection=" + driver_connection
				+ ", application=" + application + ", isdefault=" + isdefault + "]";
	}
	
}