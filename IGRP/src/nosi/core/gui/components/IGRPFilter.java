package nosi.core.gui.components;

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
	
	/*public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, properties);
		GenXMLField.toXmlGenerator(this.xml,this.fields);
		this.xml.addXml(this.toolsbar.toXmlTools());
		this.xml.endElement();
		return this.xml.toString();
	}*/
	
	public void addButton(String title,String app, String page, String link, String target, String img){
		this.toolsbar.addItem(title, app, page, link, target, img, "","","");
	}
}
