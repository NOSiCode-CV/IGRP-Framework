package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure plaintext field
 */
public class PlainTextField extends AbstractField {

	public PlainTextField(Object model,String name) {
		super();
		this.propertie.put("type","plaintext");
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("clear", false);
		this.propertie.put("maxlength", 30);
		this.propertie.put("right", false);
		this.configValue(model);
	}

}
