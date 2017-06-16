package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: abstract class to configure any field
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public abstract class AbstractField implements Field{

	private String name;
	private String tag_name;
	private Object value="";
	private String label = "";
	private String lookup = "";
	private boolean isVisible=true;
	private boolean isParam = false;
	
	public FieldProperties propertie;
	
	public FieldProperties propertie(){
		return this.propertie;
	}
	public AbstractField(){
		this.propertie = new FieldProperties();
	}
	public String getLabel() {
		label = label != ""?label:this.propertie.get("name").toString().toUpperCase();
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getTagName() {
		tag_name = this.propertie.get("tag")!=null?this.propertie.get("tag").toString().toLowerCase():tag_name;
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
	public boolean isVisible() {
		return isVisible;
	}
	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}
	public boolean isParam() {
		return isParam;
	}
	public void setParam(boolean isParam) {
		this.isParam = isParam;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	
	protected void configValue(Object model){
		if(model!=null){		
			this.value = "";
			Method[] allMethods = model.getClass().getDeclaredMethods();
		    for (Method m : allMethods) {
		    	String methodName = this.getName().substring(0, 1).toUpperCase()+this.getName().substring(1);
		    	if(m.getName().startsWith("get") && m.getName().equals("get"+methodName)){
			    	try {
			    		if(m.invoke(model)!=null)
			    			this.value = ""+ m.invoke(model);
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
					}                                                                     
		    	}
		    }
		}
	}
}
