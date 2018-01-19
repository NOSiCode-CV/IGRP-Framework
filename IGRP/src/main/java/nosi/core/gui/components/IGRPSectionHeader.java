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

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;

public class IGRPSectionHeader extends IGRPComponent{
	
	protected ArrayList<Field> fields;
	
	public IGRPSectionHeader(String tag_name,String title) {
		super(tag_name,title);
		this.fields = new ArrayList<>();
		this.properties.put("type", "sectionheader");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
	}
	
	public IGRPSectionHeader(String tag_name){
		this(tag_name,"");
	}
	
	public void addField(Field field){
		field.setValue(field.getValue());
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
