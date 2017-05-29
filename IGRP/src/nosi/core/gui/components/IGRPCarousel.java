package nosi.core.gui.components;

import nosi.core.gui.fields.FieldProperties;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

public class IGRPCarousel {
	private String tag_name;
	private XMLWritter xml;
	private FieldProperties properties;
	
	public IGRPCarousel(String tag_name){
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.put("type", "carousel");
		this.properties.put("xml-type", "carousel");
		this.properties.put("gen-type", "menu");
		this.properties.put("gen-group", "");
	}
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(xml, properties);
		this.xml.endElement();
		return this.xml.toString();
	}
}
