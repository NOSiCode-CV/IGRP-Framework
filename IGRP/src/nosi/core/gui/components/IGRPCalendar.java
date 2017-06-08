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

import nosi.core.gui.fields.GenXMLField;

public class IGRPCalendar extends IGRPComponent{
	private String lang;
	private String dataUrl;
	
	public IGRPCalendar(String tag_name){
		super(tag_name);
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
