package nosi.core.webapp.activit.rest;

import java.io.Serializable;
import java.util.HashMap;

/**
 * Emanuel
 * 8 Feb 2018
 */
public class ContextVarActiviIGRP  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private CustomActivitVariable<String,String[]> value;
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CustomActivitVariable<String, String[]> getValue() {
		return value;
	}

	public void setValue(CustomActivitVariable<String, String[]> value) {
		this.value = value;
	}

	public static class CustomActivitVariable<K,V> extends HashMap<String, String[]> implements Serializable{
		private static final long serialVersionUID = 1L;
		
		public Object get(String taskKey,String variableName) {
				return super.get(taskKey+"_"+variableName)[0];
		}		
	}
}
