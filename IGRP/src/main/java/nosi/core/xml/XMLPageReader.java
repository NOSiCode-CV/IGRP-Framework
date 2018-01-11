
package nosi.core.xml;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import nosi.webapps.igrp.dao.Action;
import java.io.Serializable;
import java.util.List;
/**
 * @author Isaias.Nunes
 *
 */
@XmlRootElement(name="rows")
public class XMLPageReader implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Action> row;

	@XmlElement(name = "row")
	public List<Action> getRow() {
		return row;
	}
	
	public void setRow(List<Action> row) {
		this.row = row;
	}

	@Override
	public String toString() {
		return "XMLPageReader [row=" + row + "]";
	}
	
}
