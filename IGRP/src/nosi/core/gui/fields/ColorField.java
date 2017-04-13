package nosi.core.gui.fields;

public class ColorField extends TextField {

	public ColorField(String name) {
		super(name);
		this.propertie.put("type", "color");
		this.propertie.put("format", "hex");
	}

}
