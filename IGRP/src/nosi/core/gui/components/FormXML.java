package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.Properties;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FieldXML;
import nosi.core.xml.XMLWritter;

public class FormXML {

	protected XMLWritter xml;
	private ArrayList<Field> fields;
	public Properties properties;
	private String tag_name;
	
	public FormXML(String tag_name) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.fields = new ArrayList<>();
		this.properties = new Properties();
		this.properties.put("type", "form");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("xml-group", "");
	}	

	public void addField(Field field){
		this.fields.add(field);
	}
		
	public String toString(){
		this.xml.startElement(this.tag_name);
		FieldXML.writteAttributes(this.xml, properties);
		FieldXML.toString(this.xml,this.fields);
		this.xml.endElement();
		return this.xml.toString();
	}

}
