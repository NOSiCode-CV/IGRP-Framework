package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure textarea field
 */
public class TextAreaField extends TextField {

	public TextAreaField(Object model,String name) {
		super(model,name);
		this.propertie.put("type", "textarea");
	}

}
