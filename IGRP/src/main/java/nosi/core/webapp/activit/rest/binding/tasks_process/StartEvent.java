package nosi.core.webapp.activit.rest.binding.tasks_process;

import java.io.Serializable;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 * Emanuel 8 May 2018
 */

@XmlRootElement(name="startEvent")
@XmlAccessorType(XmlAccessType.FIELD)
public class StartEvent implements Serializable {
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

	// Getter Methods
	public String getOutgoing() {
		return outgoing;
	}

	public String getId() {
		return id;
	}

	// Setter Methods
	public void setOutgoing(String outgoing) {
		this.outgoing = outgoing;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

    public String getName ()
    {
        return name;
    }

    public void setName (String name)
    {
        this.name = name;
    }
}
