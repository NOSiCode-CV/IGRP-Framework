package nosi.core.config;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 * Marcel Iekiny
 * May 15, 2017
 */

@XmlRootElement(name = "Config")
public class DbConfig implements Serializable{
	
	private List<DbInfo> dbInfo;
	
	@XmlElement(name = "db")
	public List<DbInfo> getDbInfo() {
		return dbInfo;
	}

	public void setDbInfo(List<DbInfo> dbInfo) {
		this.dbInfo = dbInfo;
	}
	
	@Override
	public String toString() {
		return "DbConfig [dbInfo=" + dbInfo + "]";
	}
}
