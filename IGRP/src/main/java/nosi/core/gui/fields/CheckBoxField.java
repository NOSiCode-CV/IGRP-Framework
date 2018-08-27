package nosi.core.gui.fields;


/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure checkbox field
 */
public class CheckBoxField extends TextField {

	public CheckBoxField(Object model,String name) {
		super(model,name);
		this.propertie.put("type", "checkbox");
		this.propertie.put("check", true);
	}
	
}
