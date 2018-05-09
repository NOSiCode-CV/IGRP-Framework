/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nosi.core.webapp.activit.rest.binding.tasks_process;
import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Emanuel
 */
@XmlRootElement(name="process")
public class ProcessType implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
    private String isExecutable;
    private String name;
    private SubProcess subProcess;
    private List<UserTask> userTask;
    private List<StartEvent> startEventObject;

    @XmlAttribute	
    public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
    }


    @XmlElement(name="subProcess")
    public SubProcess getSubProcess ()
    {
        return subProcess;
    }

    public void setSubProcess (SubProcess subProcess)
    {
        this.subProcess = subProcess;
    }

    @XmlAttribute
    public String getName ()
    {
        return name;
    }
	
    public void setName (String name)
    {
        this.name = name;
    }

    
    @XmlElement(name="userTask")
    public List<UserTask> getUserTask ()
    {
        return userTask;
    }

    public void setUserTask (List<UserTask> userTask)
    {
        this.userTask = userTask;
    }

    @XmlElement(name="startEvent")    
    public List<StartEvent> getStartEventObject() {
		return startEventObject;
	}

	public void setStartEventObject(List<StartEvent> startEventObject) {
		this.startEventObject = startEventObject;
	}

	@XmlAttribute	
    public String getIsExecutable ()
    {
        return isExecutable;
    }

    public void setIsExecutable (String isExecutable)
    {
        this.isExecutable = isExecutable;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [id = "+id+", subProcess = "+subProcess+", name = "+name+", userTask = "+userTask+", isExecutable = "+isExecutable+"]";
    }

}
