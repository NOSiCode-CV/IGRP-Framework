package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure link field
 */
public class LinkField extends AbstractField {

	public LinkField(Object model,String name) {
		super();
		this.setTagName(name);
		this.propertie.put("type","link");
		this.propertie.put("name","p_"+name);
		this.propertie.put("target", "_self");
		this.propertie.put("class", "link");
		this.propertie.put("iconColor", "#333");
		this.propertie.put("iconClass", "");
		this.propertie.put("img","fa-link");
		this.propertie.put("placeholder", "");
		this.propertie.put("right", false);
		this.propertie.put("maxlength", 30);
		this.configValue(model);
	}

}
