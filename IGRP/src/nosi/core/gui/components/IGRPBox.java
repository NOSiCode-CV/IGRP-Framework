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
import nosi.core.gui.fields.GenXMLField;

public class IGRPBox extends IGRPComponent{
	
	public IGRPBox(String tag_name) {
		super(tag_name);
		this.properties.put("type", "box");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
	}

	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml,this.properties);
		this.xml.emptyTag("fields");
		this.xml.endElement();
		return this.xml.toString();
	}
}
