package nosi.core.webapp.datasource.helpers;

import java.io.Serializable;
import java.util.List;

/**
 * Emanuel
 * 29 Aug 2018
 */
public class DataSourceParam implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private List<Parameters> parameters;
	
	public DataSourceParam() {
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<Parameters> getParameters() {
		return parameters;
	}
	public void setParameters(List<Parameters> parameters) {
		this.parameters = parameters;
	}

	@Override
	public String toString() {
		return "DataSourceParam [id=" + id + ", parameters=" + parameters + "]";
	}
	
	
	
}
