package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of filter
 */

import nosi.core.gui.fields.FieldProperties;

public class IGRPFilter extends IGRPForm{
	
	public IGRPFilter(String tag_name) {
		super(tag_name);
		this.properties.put("type", "filter");
	}
	
	public IGRPFilter(String tag_name,float version){
		this(tag_name);
		this.version = version;
		this.properties = new FieldProperties();
		this.properties.put("tab", "");
		this.properties.put("type", "filter");
	}
}
