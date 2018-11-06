package nosi.core.webapp.import_export_v2.common.serializable.connection;

import java.io.Serializable;


/**
 * Emanuel
 * 31 Oct 2018
 */
public class ConnectionSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String port;
	private String host;
	private String name_db;
	private String charset;
	private String type_db;
	private String username;
	private String name;
	private String url_connection;
	private String driver_connection;
	private String dad;	
	private short isdefault = 0; // 0 -> false; 1 -> true 
	private String connection_identify;
	private ConnectionFIleNameSerializable fileName;
	
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
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getType_db() {
		return type_db;
	}
	public void setType_db(String type_db) {
		this.type_db = type_db;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public short getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(short isdefault) {
		this.isdefault = isdefault;
	}
	public String getConnection_identify() {
		return connection_identify;
	}
	public void setConnection_identify(String connection_identify) {
		this.connection_identify = connection_identify;
	}
	public ConnectionFIleNameSerializable getFileName() {
		return fileName;
	}
	public void setFileName(ConnectionFIleNameSerializable fileName) {
		this.fileName = fileName;
	}
	
	
}
