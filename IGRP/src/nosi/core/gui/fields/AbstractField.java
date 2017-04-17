package nosi.core.gui.fields;

import java.util.HashMap;
import java.util.Properties;

public abstract class AbstractField implements Field{

	private String tag_name;
	private Object value="";
	private String label = "";
	private String lookup = "";
	
	public Properties propertie;
	
	public Properties propertie(){
		return this.propertie;
	}
	public AbstractField(){
		this.propertie = new Properties();
	}
	public String getLabel() {
		label = label != ""?label:this.propertie.get("name").toString().toUpperCase();
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getTagName() {
		return tag_name;
	}
	public void setTagName(String tag_name) {
		this.tag_name = tag_name;
	}	
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public void addOption(Object name, Object value) {
	}	
	public HashMap<Object,Object> getOptions(){
		return null;
	}	
	public void setValue(int value) {
		this.value = value;
	}	
	public void setValue(float value) {
		this.value = value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public String getLookup() {
		return lookup;
	}
	public void setLookup(String lookup) {
		this.lookup = lookup;
	}	
}
