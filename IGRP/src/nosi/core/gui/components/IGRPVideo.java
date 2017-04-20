package nosi.core.gui.components;

import nosi.core.gui.fields.Field;

public class IGRPVideo extends IGRPForm {

	public IGRPVideo(String tag_name) {
		super(tag_name);
		this.properties.put("type", "video");
		this.properties.put("xml-type", "video");
	}
	
	@Override
	public void addField(Field field){
		field.setValue("<![CDATA["+field.getValue()+"]]");
		this.fields.add(field);
	}
}
