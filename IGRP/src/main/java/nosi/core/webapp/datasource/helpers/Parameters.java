package nosi.core.webapp.datasource.helpers;

import java.io.Serializable;

/**
 * Emanuel
 * 29 Aug 2018
 */
public class Parameters implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String type;
	
	public Parameters() {
		
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Parameters [name=" + name + ", type=" + type + "]";
	}
	
	
}
