package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.Properties;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Table
 */
/*
 * /*Generate XML Table
 *<table_1 type="table" structure="fields">
    <fields>
        <number_1 name="p_number_1" type="number" align="left" lookup_parser="false">
            <label>Number</label>
        </number_1>
        ...
    </fields>
    <table>
        <value>
            <row>
                <context-menu>
                    <param>p1=linha1</param>
                    <param>p2=linha1</param>
                </context-menu>
                <number_1>527</number_1>
                <number_1_desc>527</number_1_desc>
                <text_1>Magna dolor labore ipsum totam</text_1>
                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
            </row>
            ...
        </value>
        <context-menu>
            <item type="specific" code="" rel="button_1" class="default">
                <title>Button</title>
                <app/>
                <page/>
                <link/>
                <target>_blank</target>
                <img>fa-dot-circle-o</img>
            </item>
            ...
        </context-menu>
    </table>
</table_1>
 */
 
public class IGRPTable {

	protected XMLWritter xml;
	protected ArrayList<Field> fields;
	public Properties properties;
	protected String tag_name;
	private IGRPContextMenu contextmenu;
	protected float version = (float) 2.3;
	
	public IGRPTable(String tag_name) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.fields = new ArrayList<>();
		this.properties = new Properties();
		this.properties.put("type", "table");
		this.properties.put("structure", "fields");
		this.contextmenu = new IGRPContextMenu();
		this.contextmenu.setClassName(this);
	}	
	
	public IGRPTable(String tag_name,float version){
		this(tag_name);
		this.version = version;
		this.properties = new Properties();
		this.properties.put("operation", "");
	}
	public void addField(Field field){
		this.fields.add(field);
	}
		
	public String toString(){
		this.xml.startElement(this.tag_name);
			GenXMLField.writteAttributes(this.xml, properties);
			if(this.version > (float) 2.1){
				GenXMLField.toXml(this.xml,this.fields);
				this.xml.startElement("table");
					this.xml.startElement("value");
						//adicionar rows depois
					this.xml.endElement();
				this.xml.addXml(this.contextmenu.toXmlTools());
				this.xml.endElement();//end tag table
			}else if(this.version == (float) 2.1){
				GenXMLField.toXmlV21(this.xml,this.fields);
				this.xml.startElement("value");
					//adicionar rows depois
				this.xml.endElement();//end tag value
				this.xml.addXml(this.contextmenu.toXmlTools());
			}
		this.xml.endElement();
		return this.xml.toString();
	}
	
	public void addButton(String title,String app, String page, String link, String target, String img, String code, String rel, String _class){
		this.contextmenu.addItem(title, app, page, link, target, img, code, rel, _class);
	}
	public void addButton(String title,String app, String page, String link, String target, String img, String code, String rel, String _class, String params){
		this.contextmenu.addItem(title, app, page, link, target, img, code, rel, _class, params);
	}
}
