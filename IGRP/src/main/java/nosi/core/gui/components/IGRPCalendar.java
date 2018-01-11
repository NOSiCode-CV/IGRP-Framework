package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * May 10, 2017
 *
 * Description: class to generate xml of calendar
 */
/*
 * <calendar_1 type="calendar" xml-type="calendar" gen-type="container" gen-group="">
        <lang>pt</lang>
        <dataUrl>/images/IGRP/IGRP2.3/core/calendar/3.0.1/data/calendar.json</dataUrl>
    </calendar_1>
 */

import java.util.ArrayList;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;

public class IGRPCalendar extends IGRPComponent{
	protected ArrayList<Field> fields;
	
	public IGRPCalendar(String tag_name,String title){
		super(tag_name,title);
		this.properties.put("type", "calendar");
		this.properties.put("xml-type", "calendar");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
		this.fields = new ArrayList<>();
	}
	public IGRPCalendar(String tag_name){
		this(tag_name,"");
	}

	public IGRPCalendar(){
		this(null);
	}
	public void addField(Field field){
		this.fields.add(field);
	}
	
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(xml, properties);
		GenXMLField.toXml(this.xml,this.fields);
		this.xml.endElement();
		return this.xml.toString();
	}
	
}
