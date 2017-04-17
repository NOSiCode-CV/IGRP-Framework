package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure password field
 */
public class PasswordField extends TextField {

	public PasswordField(String name) {
		super(name);
		this.propertie.put("type","password");
	}

}
