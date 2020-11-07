package cv.nosi.core.gui.fields;
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
		this.propertie.put("clear", new Boolean(false));
		this.propertie.put("maxlength", new Integer(30));
		this.propertie.put("right", new Boolean(false));
		this.configValue(model);
	}

}
