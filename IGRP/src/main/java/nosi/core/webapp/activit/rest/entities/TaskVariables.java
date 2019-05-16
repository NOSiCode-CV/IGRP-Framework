package nosi.core.webapp.activit.rest.entities;
/**
 * Emanuel
 * 14 May 2019
 */
public class TaskVariables  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String scope;
	private String type;
	private Object value;
	private String valueUrl;
	
	public TaskVariables(String name, String scope, String type, Object value, String valueUrl) {
		super();
		this.name = name;
		this.scope = scope;
		this.type = type;
		this.value = value;
		this.valueUrl = valueUrl;
	}
	
	public TaskVariables() {
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public Object getValue() {
		return value;
	}
	
	public void setValue(Object value) {
		this.value = value;
	}

	public String getValueUrl() {
		return valueUrl;
	}
	public void setValueUrl(String valueUrl) {
		this.valueUrl = valueUrl;
	}
	
	@Override
	public String toString() {
		return "TaskVariables [name=" + name + ", scope=" + scope + ", type=" + type + ", value=" + value
				+ ", valueUrl=" + valueUrl + "]";
	}
}
