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
import java.util.List;

import org.json.JSONArray;

import com.google.gson.annotations.SerializedName;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;

public class IGRPCalendar extends IGRPComponent{
	protected ArrayList<Field> fields;
	private List<Calendar> calendar;
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
		this.calendar = new ArrayList<>();
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
	public void add(Calendar c){
		this.calendar.add(c);
	}
	public String getCalendar(){
		JSONArray json = new JSONArray(calendar);
		return json.toString().replaceAll("params", "context-param");
	}
	
	public static class Calendar{
		private String title;
		private String start;
		private String end;
		private boolean allDay;
		private String color;
		private int id;
		@SerializedName("context-param")
		private List<String> params = new ArrayList<>();		
		
		public String getEnd() {
			return end;
		}
		public void setEnd(String end) {
			this.end = end;
		}
		public boolean isAllDay() {
			return allDay;
		}
		public void setAllDay(boolean allDay) {
			this.allDay = allDay;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public List<String> getParams() {
			return params;
		}
		public void setParams(String param) {
			this.params.add(param);
		}
	}
	
}
