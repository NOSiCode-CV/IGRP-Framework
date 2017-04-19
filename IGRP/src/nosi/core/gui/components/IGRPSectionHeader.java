package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of SectionHeader
 */
/*
 * <sectionheader_1 type="sectionheader" structure="text">
	    <fields>
	        <text>
	            <value>
	                <![CDATA[Sectionheader]]>
	            </value>
	        </text>
	    </fields>
	</sectionheader_1>
 */
import java.util.ArrayList;
import java.util.Properties;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.TextField;
import nosi.core.xml.XMLWritter;

public class IGRPSectionHeader {
	
	private XMLWritter xml;
	private String tag_name;
	protected Properties properties;
	protected ArrayList<Field> fields;
	
	public IGRPSectionHeader(String tag,String text) {
		this.tag_name = tag;
		this.xml = new XMLWritter();
		this.fields = new ArrayList<>();
		this.properties = new Properties();
		this.properties.put("type", "sectionheader");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
		Field _text = new TextField(null,tag);
		_text.propertie().put("persist","true");
		_text.setValue("<![CDATA["+text+"]]");
		this.addField(_text);
	}
	
	protected void addField(Field field){
		this.fields.add(field);
	}
	
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, this.properties);
		GenXMLField.toXml(this.xml,this.fields);
		this.xml.endElement();
		return this.xml.toString();
	}

}
