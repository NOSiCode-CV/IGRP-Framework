package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure separator field
 */
public class SeparatorField extends AbstractField {

	public SeparatorField(Object model,String name) {
		super();
		this.setName(name);
		this.propertie.put("type","separator");
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("right", false);
		this.propertie.put("placeholder", "");
		this.propertie.put("maxlength", 30);
		this.configValue(model);
	}

}
