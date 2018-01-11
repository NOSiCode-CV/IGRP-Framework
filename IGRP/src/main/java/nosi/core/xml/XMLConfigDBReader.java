package nosi.core.xml;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
import nosi.webapps.igrp.dao.Config_env;


/**
 * @author: Emanuel Pereira
 * 9 Nov 2017
 */
@XmlRootElement(name="rows")
public class XMLConfigDBReader implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Config_env> row;
	
	public List<Config_env> getRow() {
		return row;
	}
	public void setRow(List<Config_env> row) {
		this.row = row;
	}
	
	
}
