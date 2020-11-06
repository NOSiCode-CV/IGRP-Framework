package nosi.core.webapp.activit.rest.entities;

import java.util.List;

/**
 * Emanuel
 * 14 May 2019
 */
public class FormProperties  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String type;
	private String value;
	private Boolean readable;
	private Boolean writable;
	private Boolean required;
	private String datePattern;
	private List<Values> enumValues;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Boolean getReadable() {
		return readable;
	}

	public void setReadable(Boolean readable) {
		this.readable = readable;
	}

	public Boolean getWritable() {
		return writable;
	}

	public void setWritable(Boolean writable) {
		this.writable = writable;
	}

	public Boolean getRequired() {
		return required;
	}

	public void setRequired(Boolean required) {
		this.required = required;
	}

	public String getDatePattern() {
		return datePattern;
	}

	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	public List<Values> getEnumValues() {
		return enumValues;
	}

	public void setEnumValues(List<Values> enumValues) {
		this.enumValues = enumValues;
	}

	@Override
	public String toString() {
		return "FormProperties [id=" + id + ", name=" + name + ", type=" + type + ", value=" + value + ", readable="
				+ readable + ", writable=" + writable + ", required=" + required + ", datePattern=" + datePattern
				+ ", enumValues=" + enumValues + "]";
	}

}
