package nosi.core.gui.components;

import java.util.Properties;

import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

public class IGRPChart {
	
	private String tag_name;
	private XMLWritter xml;
	private Properties properties;
	
	public IGRPChart(String tag_name,String title) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new Properties();
		this.properties.put("type", "chart");
		this.properties.put("structure", "graphic");
		this.properties.put("title",title);
	}
	
	//Continuar depois
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, this.properties);
		this.xml.endElement();
		return this.xml.toString();
	}

}
