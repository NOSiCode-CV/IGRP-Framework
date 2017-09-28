package nosi.core.webapp.activit.rest;
/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class TaskVariables {

	private String name;
	private String scope;
	private String type;
	private String value;
	private String valueUrl;
	
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	public String getValueUrl() {
		return valueUrl;
	}
	public void setValueUrl(String valueUrl) {
		this.valueUrl = valueUrl;
	}

}
