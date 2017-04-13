package nosi.core.gui.fields;

import java.util.HashMap;

public class ListField extends AbstractField {
	
	private HashMap<Object,Object> list;
	public Object value = null;
	
	public ListField(String name){
		super();
		this.list = new HashMap<>();
		this.propertie.put("type","select");
		this.propertie.put("name","p_"+name);
		this.propertie.put("multiple", false);
		this.propertie.put("right", false);
		this.propertie.put("disabled", false);
		this.propertie.put("maxlength", 30);
		this.propertie.put("change", false);
		this.propertie.put("required", false);
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
