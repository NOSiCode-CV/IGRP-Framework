package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure checkboxlist field
 */
public class CheckBoxListField extends ListField {

	public CheckBoxListField(Object model,String name) {
		super(model,name);
		this.propertie.put("type","checkboxlist");
		this.propertie.remove("multiple");
	}
}
