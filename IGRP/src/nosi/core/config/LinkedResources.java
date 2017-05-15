package nosi.core.config;
import javax.xml.bind.annotation.XmlElement; 
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name ="LinkedResources")
public class LinkedResources {
	private String project_loc;

	@XmlElement (name = "ProjectLoc")
	public String getProject_loc() {
		return project_loc;
	}

	public void setProject_loc(String project_loc) {
		this.project_loc = project_loc;
	}	

}
