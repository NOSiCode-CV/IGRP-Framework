package nosi.core.config;

import javax.xml.bind.annotation.XmlElement; 
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name ="config")
public class AppConfig {
	
	private String project_loc;
	private String authenticationType;
	
	@XmlElement (name = "project_loc")
	public String getProject_loc() {
		return project_loc;
	}
	
	@XmlElement (name = "authentication_type")
	public String getAuthenticationType(){
		return this.authenticationType;
	}
	
	public void  setAuthenticationType(String authenticationType){
		this.authenticationType = authenticationType;
	}

	public void setProject_loc(String project_loc) {
		this.project_loc = project_loc;
	}
	
}
