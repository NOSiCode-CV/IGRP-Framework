package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure radiolist field
 */
public class RadioListField extends ListField {

	public RadioListField(String name) {
		super(name);
		this.propertie.put("type","radiolist");
	}

}
