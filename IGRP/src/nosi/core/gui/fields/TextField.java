package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure text field
 */
public class TextField extends AbstractField {

	public TextField(Object model,String name){
		super();
		this.propertie.put("type","text");
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("right", false);
		this.propertie.put("placeholder", "");
		this.propertie.put("disabled", false);
		this.propertie.put("readonly", false);
		this.propertie.put("change", false);
		this.propertie.put("required", false);
		this.propertie.put("maxlength", 30);
		this.configValue(model);
	}

}
