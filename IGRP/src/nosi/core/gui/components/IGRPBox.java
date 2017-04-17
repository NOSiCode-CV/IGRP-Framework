package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Box
 */
/*
 * <box_1 type="box" structure="fields">
        <fields/>
    </box_1>
 */
import java.util.Properties;

import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

public class IGRPBox {
	protected Properties properties;
	protected XMLWritter xml;
	protected String tag_name;
	
	public IGRPBox(String tag_name) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new Properties();
		this.properties.put("type", "box");
		this.properties.put("structure", "fields");
	}

	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml,this.properties);
		this.xml.emptyTag("fields");
		this.xml.endElement();
		return this.xml.toString();
	}
}
