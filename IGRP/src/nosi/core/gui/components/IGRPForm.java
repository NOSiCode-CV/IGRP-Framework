package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of Form
 */
import java.util.ArrayList;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.FieldProperties;
import nosi.core.xml.XMLWritter;

/*Generate XML Form
 * Form can contain one or more fields
 * <form_1 type="form" xml-type="form" gen-type="container" gen-group="">
        <fields>
        	<number_1 name="p_number_1" type="number" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Number</label>
                <value>606</value>
            </number_1>
            ...
        </fields>
   </form_1>
 */
public class IGRPForm {

	protected XMLWritter xml;
	protected ArrayList<Field> fields;
	public FieldProperties properties;
	protected String tag_name;
	protected IGRPToolsBar toolsbar;
	protected float version = (float) 2.3;
	
	public IGRPForm(String tag_name) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.fields = new ArrayList<>();
		this.properties = new FieldProperties();
		this.properties.put("type", "form");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("xml-group", "");
		this.toolsbar = new IGRPToolsBar("tools-bar");
		this.toolsbar.setClassName(this);
	}	

	public IGRPForm(String tag_name,float version){
		this(tag_name);
		this.version = version;
		this.properties = new FieldProperties();
		this.properties.put("tab", "");
	}
	
	public void addField(Field field){
		this.fields.add(field);
	}
		
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, properties);
		if(this.version > (float) 2.1)
			GenXMLField.toXml(this.xml,this.fields);
		else if(this.version == (float) 2.1){
			GenXMLField.toXmlV21(this.xml,this.fields);
		}
		this.xml.addXml(this.toolsbar.toXmlTools());
		this.xml.endElement();
		return this.xml.toString();
	}
	
	public void addButton(String title,String app, String page, String link, String target, String img, String code, String rel, String _class){
		this.toolsbar.addItem(title, app, page, link, target, img, code, rel, _class);
	}
	public void addButton(String title,String app, String page, String link, String target, String img, String code, String rel, String _class, String params){
		this.toolsbar.addItem(title, app, page, link, target, img, code, rel, _class, params);
	}
}
