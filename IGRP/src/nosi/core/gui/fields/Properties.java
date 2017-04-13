package nosi.core.gui.fields;

import nosi.core.xml.XMLWritter;

public class Properties {

	private boolean right = false;
	private boolean disabled = false;
	private boolean readonly = false;
	private boolean change = false;
	private boolean required = false;
	private int maxlength=30;
	private String type;
	private String name;
	private String placeholder="";
	
	public boolean isRight() {
		return right;
	}
	public void setRight(boolean right) {
		this.right = right;
	}
	public boolean isDisabled() {
		return disabled;
	}
	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}
	public boolean isReadonly() {
		return readonly;
	}
	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}
	public boolean isChange() {
		return change;
	}
	public void setChange(boolean change) {
		this.change = change;
	}
	public boolean isRequired() {
		return required;
	}
	public void setRequired(boolean required) {
		this.required = required;
	}
	public int getMaxlength() {
		return maxlength;
	}
	public void setMaxlength(int maxlength) {
		this.maxlength = maxlength;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPlaceholder() {
		return placeholder;
	}
	public void setPlaceholder(String placeholder) {
		this.placeholder = placeholder;
	}
	
	public static void getXML(XMLWritter xml, Field field){
		xml.writeAttribute("name", field.propertie().getName());
		xml.writeAttribute("type", field.propertie().getType());
		xml.writeAttribute("maxlength", ""+field.propertie().getMaxlength());
		xml.writeAttribute("placeholder", ""+field.propertie().getPlaceholder());
		xml.writeAttribute("required", ""+field.propertie().isRequired());
		xml.writeAttribute("change", ""+field.propertie().isChange());
		xml.writeAttribute("readonly", ""+field.propertie().isReadonly());
		xml.writeAttribute("disabled", ""+field.propertie().isDisabled());
		xml.writeAttribute("right", ""+field.propertie().isRight());
	}
}
