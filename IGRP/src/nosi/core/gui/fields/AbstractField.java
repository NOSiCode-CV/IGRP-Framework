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
import java.util.HashMap;
import java.util.Properties;

public abstract class AbstractField implements Field{

	private String tag_name;
	private Object value="";
	private String label = "";
	private String lookup = "";
	private boolean isVisible=true;
	
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
	public boolean isVisible() {
		return isVisible;
	}
	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}
	protected void configValue(Object model){
		if(model!=null){		
			this.value = "";
			Method[] allMethods = model.getClass().getDeclaredMethods();
		    for (Method m : allMethods) {
		    	String methodName = this.getTagName().substring(0, 1).toUpperCase()+this.getTagName().substring(1);
		    	if(m.getName().contains(methodName) && m.getName().startsWith("get")){
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
