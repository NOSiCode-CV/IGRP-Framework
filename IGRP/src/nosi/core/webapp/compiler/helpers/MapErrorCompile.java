package nosi.core.webapp.compiler.helpers;
/**
 * Yma
 * 12 Nov 2017
 */

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class MapErrorCompile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1172458585074132006L;
	private String msg;
	private Map<String, List<ErrorCompile>> errors;
	
	public MapErrorCompile(String msg, Map<String, List<ErrorCompile>> errors) {
		super();
		this.msg = msg;
		this.errors = errors;
	}
	
	public String getMsg() {
		return msg;
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, List<ErrorCompile>> getErrors() {
		return errors;
	}
	public void setErrors(Map<String, List<ErrorCompile>> errors) {
		this.errors = errors;
	}
	
	
}
