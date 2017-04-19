package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure texteditor field
 */
public class TextEditorField extends TextField {

	public TextEditorField(Object model,String name) {
		super(model,name);
		this.propertie.put("type","texteditor");
	}

}
