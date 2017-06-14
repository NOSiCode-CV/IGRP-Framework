package nosi.core.config;

import javax.xml.bind.annotation.XmlElement; 
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name ="Config")
public class AppConfig {
	
	private String project_loc;
	private String authenticationType;
	
	@XmlElement (name = "ProjectLoc")
	public String getProject_loc() {
		return project_loc;
	}
	
	@XmlElement (name = "AuthenticationType")
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
