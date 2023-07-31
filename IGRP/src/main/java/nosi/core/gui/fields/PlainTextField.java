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
		this.setName(name);
		this.propertie.put("type","plaintext");
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("clear",  Boolean.valueOf(false));
		this.propertie.put("maxlength",  Integer.valueOf(30));
		this.propertie.put("right",  Boolean.valueOf(false));
		this.configValue(model);
	}

}
