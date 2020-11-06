/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nosi.core.webapp.activit.rest.binding.tasks_process;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author Emanuel
 */
@XmlRootElement(name="userTask")
@XmlAccessorType(XmlAccessType.FIELD)
public class UserTask implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@XmlAttribute
    private String id;
    @XmlAttribute
    private String name;
    @XmlAttribute(name="formKey")
    private String formKey;
    @XmlElement
    private String outgoing;


    public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getId ()
    {
        return id;
    }

    public void setId (String id)
    {
        this.id = id;
    }

    public String getName ()
    {
        return name;
    }

    public void setName (String name)
    {
        this.name = name;
    }

    public String getOutgoing ()
    {
        return outgoing;
    }

    public void setOutgoing (String outgoing)
    {
        this.outgoing = outgoing;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [id = "+id+", name = "+name+", outgoing = "+outgoing+"]";
    }
}
