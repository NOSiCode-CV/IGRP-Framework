package nosi.core.gui.fields;

import java.util.HashMap;

public class ListField extends AbstractField {
	
	private HashMap<Object,Object> list;
	public Object value = null;
	
	public ListField(String name){
		super();
		this.list = new HashMap<>();
		this.propertie.setType("select");
		this.propertie.setName("p_"+name);
		this.setTagName(name);
	}
	
	@Override
	public void addOption(Object name, Object value) {
		list.put(name, value);
	}	
	
	@Override
	public HashMap<Object,Object> getOptions(){
		return this.list;
	}
}
