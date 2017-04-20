package nosi.core.gui.components;

import nosi.core.gui.fields.Field;

public class IGRPIframe extends IGRPForm {

	public IGRPIframe(String tag_name) {
		super(tag_name);
		this.properties.put("type", "iframe");
		this.properties.put("xml-type", "iframe");
	}
	
	@Override
	public void addField(Field field){
		field.setValue("<![CDATA["+field.getValue()+"]]");
		this.fields.add(field);
	}
}
