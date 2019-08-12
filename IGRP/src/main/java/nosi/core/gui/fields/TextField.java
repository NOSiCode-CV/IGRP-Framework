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
		this.setName(name);
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("right", new Boolean(false));
		this.propertie.put("placeholder", "");
		this.propertie.put("disabled", new Boolean(false));
		this.propertie.put("readonly", new Boolean(false));
		this.propertie.put("change", new Boolean(false));
		this.propertie.put("required", new Boolean(false));
		this.propertie.put("maxlength", new Integer(30));
		this.setValue(model);
	}

}
