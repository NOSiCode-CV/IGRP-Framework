package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure radio field
 */
public class RadioField extends TextField {

	public RadioField(String name) {
		super(name);
		this.propertie.put("type","radio");
		this.propertie.put("check", true);
	}

}
