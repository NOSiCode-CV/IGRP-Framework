package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure radio field
 */
public class RadioField extends TextField {

	public RadioField(Object model,String name) {
		super(model,name);
		this.propertie.put("type","radio");
		this.propertie.put("check", true);
	}

}
