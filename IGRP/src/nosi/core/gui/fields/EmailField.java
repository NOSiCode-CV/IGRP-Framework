package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure email field
 */
public class EmailField extends TextField {

	public EmailField(String name) {
		super(name);
		this.propertie.put("type","email");
	}

}
