package nosi.core.gui.fields;

public class EmailField extends TextField {

	public EmailField(String name) {
		super(name);
		this.propertie.put("type","email");
	}

}
