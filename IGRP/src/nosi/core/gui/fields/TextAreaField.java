package nosi.core.gui.fields;

public class TextAreaField extends TextField {

	public TextAreaField(String name) {
		super(name);
		this.propertie.put("type", "textarea");
	}

}
