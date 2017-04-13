package nosi.core.gui.fields;

public class VirtaulKeyboardField extends TextField {

	public VirtaulKeyboardField(String name) {
		super(name);
		this.propertie.put("type", "virtualkeyboard");
		this.propertie.put("keyType", "vkb_aznum");
	}

}
