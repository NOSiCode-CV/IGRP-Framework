package nosi.core.gui.fields;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 13, 2017
 *
 * Description: class to configure link field
 */
public class LinkField extends AbstractField {
	private final Map<String,Object> params;
	public LinkField(Object model,String name) {
		super();
		this.setName(name);
		this.setTagName(name);
		this.propertie().put("type","link");
		this.propertie().put("name","p_"+name);
		this.propertie().put("target", "_self");
		this.propertie().put("class", "link");
		this.propertie().put("iconColor", "#333");
		this.propertie().put("iconClass", "");
		this.propertie().put("img","fa-link");
		this.propertie().put("placeholder", "");
		this.propertie().put("right", Boolean.FALSE);
		this.propertie().put("maxlength", 30);
		this.configValue(model);
		this.params = new LinkedHashMap <>();
	}
	@Override
	public void addParam(String key,String value){
		this.params.put(key, value);
	}
	
	public Map<String,Object> getParams(){
		return this.params;
	}
	
	String link;

	@Override
	public Object getValue() {
		link = super.getValue()+"";
		if (this.params != null) {
			this.params.forEach((key, value) -> link += "&" + key + "=" + value);
		}
		return link.replace("&&", "&");
	}
}
