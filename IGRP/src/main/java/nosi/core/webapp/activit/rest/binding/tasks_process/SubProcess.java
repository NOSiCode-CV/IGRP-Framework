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
@XmlRootElement(name="subProcess")
public class SubProcess implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;	  
    private List<UserTask> userTask;

    @XmlAttribute
    public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
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

    @Override
    public String toString()
    {
        return "ClassPojo [id = "+id+", userTask = "+userTask+"]";
    }
}
