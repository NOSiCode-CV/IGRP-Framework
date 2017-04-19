package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure lookup field
 */
public class LookupField extends TextField {

	public LookupField(Object model,String name) {
		super(model,name);
		this.propertie.put("type", "lookup");
	}

}
