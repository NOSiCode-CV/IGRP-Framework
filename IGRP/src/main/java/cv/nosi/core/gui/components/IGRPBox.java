package cv.nosi.core.gui.components;
import cv.nosi.core.gui.fields.GenXMLField;

public class IGRPBox extends IGRPComponent{
	
	public IGRPBox(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "box");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
	}
	public IGRPBox(String tag_name){
		this(tag_name, "");
	}
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml,this.properties);
		this.xml.emptyTag("fields");
		this.xml.endElement();
		return this.xml.toString();
	}
}
