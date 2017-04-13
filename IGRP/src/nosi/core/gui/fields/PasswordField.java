package nosi.core.gui.fields;

public class PasswordField extends TextField {

	public PasswordField(String name) {
		super(name);
		this.propertie.put("type","password");
	}

}
