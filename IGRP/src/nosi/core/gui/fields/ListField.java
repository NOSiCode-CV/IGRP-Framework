package nosi.core.gui.fields;

import java.util.HashMap;

public class ListField extends AbstractField {
	
	private HashMap<Object,Object> list;
	public Object value = null;
	
	public ListField(String name){
		this.list = new HashMap<>();
		this.setType("select");
		this.setName("p_"+name);
		this.setTagName(name);
	}
	
	public void addOption(Object name, Object value){
		list.put(name, value);
	}
	
	public HashMap<Object,Object> getOptions(){
		return this.list;
	}
}
