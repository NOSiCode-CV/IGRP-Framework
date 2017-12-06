package nosi.core.xml;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import nosi.webapps.igrp.dao.Application;

/**
 * Isaias.Nunes
 * Oct 18, 2017
 */
@XmlRootElement(name = "rows")
public class XMLApplicationReader implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Application> row;

	@XmlElement(name = "row")
	public List<Application> getRow() {
		return row;
	}

	public void setRow(List<Application> row) {
		this.row = row;
	}	

}
