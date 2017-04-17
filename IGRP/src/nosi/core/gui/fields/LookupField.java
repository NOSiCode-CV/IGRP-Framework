package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure lookup field
 */
public class LookupField extends TextField {

	public LookupField(String name) {
		super(name);
		this.propertie.put("type", "lookup");
	}

}
