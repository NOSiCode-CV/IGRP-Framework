package nosi.core.config;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
/**
 * Marcel Iekiny
 * May 15, 2017
 */

@XmlRootElement(name = "db")
@XmlAccessorType (XmlAccessType.FIELD)
public class DbInfo implements Serializable{
	
	@XmlElement(name = "connectionName")
	private String connectionName;
	
	@XmlElement(name = "dbmsName")
	private String dbmsName;
	
	@XmlElement(name = "dbName")
	private String dbName;
	
	@XmlElement(name = "user")
	private String user;
	
	@XmlElement(name = "password")
	private String password;
	
	public String getConnectionName() {
		return connectionName;
	}
	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}
	public String getDbmsName() {
		return dbmsName;
	}
	public void setDbmsName(String dbmsName) {
		this.dbmsName = dbmsName;
	}
	public String getDbName() {
		return dbName;
	}
	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "DbInfo [connectionName=" + connectionName + ", dbmsName=" + dbmsName + ", dbName=" + dbName
				+ ", user=" + user + ", password=" + password + "]";
	}
}
