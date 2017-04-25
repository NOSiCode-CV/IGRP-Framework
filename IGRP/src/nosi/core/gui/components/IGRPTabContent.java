package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of TabContent
 */
/*
 * <tabcontent_1 type="tabcontent" structure="tabs">
	    <item name="tab_item_1">
	        <title>Tab Item 1</title>
	        <img>fa-dot-circle-o</img>
	    </item>
	    ...
	</tabcontent_1>
 */
import java.util.ArrayList;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;

public class IGRPTabContent extends IGRPBox {

	protected ArrayList<Field> fields;
	
	public IGRPTabContent(String tag_name) {
		super(tag_name);
		this.properties.put("type", "tabcontent");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
		this.fields = new ArrayList<>();
	}

	public void addField(Field field){
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
