package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure list field
 */


public class ListField extends AbstractField {
	public Object value = null;
	
	public ListField(Object model, String name){
		super();
		this.propertie.put("type","select");
		this.propertie.put("name","p_"+name);
		this.propertie.put("multiple", false);
		this.propertie.put("right", false);
		this.propertie.put("disabled", false);
		this.propertie.put("maxlength", 30);
		this.propertie.put("change", false);
		this.propertie.put("required", false);
		this.setTagName(name);
		this.configValue(model);
		this.propertie.put("value", this.getValue());
		this.value = null;
	}
}
