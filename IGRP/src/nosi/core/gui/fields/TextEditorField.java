package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure texteditor field
 */
public class TextEditorField extends TextField {

	public TextEditorField(String name) {
		super(name);
		this.propertie.put("type","texteditor");
	}

}
