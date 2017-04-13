package nosi.core.gui.fields;

public class RadioField extends TextField {

	public RadioField(String name) {
		super(name);
		this.propertie.put("type","radio");
		this.propertie.put("check", true);
	}

}
