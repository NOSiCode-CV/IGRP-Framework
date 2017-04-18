package nosi.core.gui.components;

import java.util.Properties;

public class IGRPFilter extends IGRPForm{
	
	public IGRPFilter(String tag_name) {
		super(tag_name);
	}
	
	public IGRPFilter(String tag_name,float version){
		this(tag_name);
		this.version = version;
		this.properties = new Properties();
		this.properties.put("tab", "");
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
