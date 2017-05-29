package nosi.core.ldap;

/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;

@XmlRootElement(name = "ldap")
@XmlAccessorType(XmlAccessType.FIELD)
public class LdapInfo implements Serializable {

	@XmlElement(name = "url")
	private String url;

	@XmlElement(name = "username")
	private String username;

	@XmlElement(name = "password")
	private String password;

	@XmlElement(name = "base")
	private String base;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}
	
	

}
