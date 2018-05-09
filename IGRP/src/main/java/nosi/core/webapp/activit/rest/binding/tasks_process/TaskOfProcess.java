/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nosi.core.webapp.activit.rest.binding.tasks_process;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Emanuel
 */
@XmlRootElement(name="definitions")
@XmlAccessorType(XmlAccessType.FIELD)
public class TaskOfProcess implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@XmlElement(name="process")
    private List<ProcessType> process;
    @XmlAttribute
    private String targetNamespace;
    @XmlAttribute
    private String xmlns;

    public List<ProcessType> getProcess() {
        return process;
    }

    public void setProcess(List<ProcessType> process) {
        this.process = process;
    }

    public String getTargetNamespace() {
        return targetNamespace;
    }

    public void setTargetNamespace(String targetNamespace) {
        this.targetNamespace = targetNamespace;
    }

    public String getXmlns() {
        return xmlns;
    }

    public void setXmlns(String xmlns) {
        this.xmlns = xmlns;
    }

    @Override
    public String toString() {
        return "TaskOfProcess{" + "process=" + process + ", targetNamespace=" + targetNamespace + ", xmlns=" + xmlns + '}';
    }
    
    
}
