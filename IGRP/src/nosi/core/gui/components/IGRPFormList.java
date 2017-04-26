package nosi.core.gui.components;

import nosi.core.gui.fields.GenXMLField;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of FormList
 */
/*
 * /*Generate XML Table
 *<formlist_1 type="formlist" structure="fields">
    <fields>
        <number_1 name="p_number_1" type="number" align="left" lookup_parser="false">
            <label>Number</label>
        </number_1>
        ...
    </fields>
    <table>
        <value>
            <row>
                <number_1>527</number_1>
                <number_1_desc>527</number_1_desc>
                <text_1>Magna dolor labore ipsum totam</text_1>
                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
            </row>
            ...
        </value>
    </table>
</formlist_1>
 */
public class IGRPFormList extends IGRPTable {

	public IGRPFormList(String tag_name) {
		super(tag_name);
		this.properties.put("type", "formlist");
	}

	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, properties);
		GenXMLField.toXml(this.xml,this.fields);
		this.xml.startElement("table");
			this.xml.startElement("value");
				this.genRows();
			this.xml.endElement();
		this.xml.endElement();
		this.xml.endElement();
		return this.xml.toString();
	}
}
