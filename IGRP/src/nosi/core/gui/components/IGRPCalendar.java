package nosi.core.gui.components;

import nosi.core.gui.fields.FieldProperties;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

public class IGRPCalendar{

	private String tag_name;
	private XMLWritter xml;
	private FieldProperties properties;
	private String lang;
	private String dataUrl;
	
	public IGRPCalendar(String tag_name){
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.put("type", "calendar");
		this.properties.put("xml-type", "calendar");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
	}

	public void setLang(String lang) {
		this.lang = lang;
	}
	public void setDataUrl(String dataUrl) {
		this.dataUrl = dataUrl;
	}
	
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(xml, properties);
		this.xml.setElement("lang", this.lang);
		this.xml.setElement("dataUrl", this.dataUrl);
		this.xml.endElement();
		return this.xml.toString();
	}
	
}
