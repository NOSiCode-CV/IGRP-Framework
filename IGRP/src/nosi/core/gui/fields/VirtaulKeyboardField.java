package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure virtualkeyboard field
 */
public class VirtaulKeyboardField extends TextField {

	public VirtaulKeyboardField(String name) {
		super(name);
		this.propertie.put("type", "virtualkeyboard");
		this.propertie.put("keyType", "vkb_aznum");
	}

}
