package nosi.core.config;
import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 * @author Marcel Iekiny
 * May 15, 2017
 */

@XmlRootElement(name = "config")
public class DbConfig implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
