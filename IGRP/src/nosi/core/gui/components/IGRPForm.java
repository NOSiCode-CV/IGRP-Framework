package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of Form
/*
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
import java.util.ArrayList;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FieldProperties;
import nosi.core.gui.fields.GenXMLField;

public class IGRPForm extends IGRPComponent{
	protected ArrayList<Field> fields;
	protected ArrayList<IGRPButton> buttons;
	protected IGRPToolsBar toolsbar;
	protected float version = (float) 2.3;
	private IGRPTable table;
	
	public IGRPForm(String tag_name,String title) {
		super(tag_name,title);
		this.fields = new ArrayList<>();
		this.buttons = new ArrayList<>();
		this.properties.put("type", "form");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("xml-group", "");
		this.toolsbar = new IGRPToolsBar("tools-bar");
		this.toolsbar.setClassName(this);
	}	

	public IGRPForm(String tag_name) {
		this(tag_name,"");
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

	public void addButton(IGRPButton button){
		button.propertie.put("type",button.getType());
		this.buttons.add(button);
	}
	
	
	public IGRPTable getTable() {
		return table;
	}

	public void setTable(IGRPTable table) {
		this.table = table;
	}

	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, properties);
		if(this.version > (float) 2.1)
			GenXMLField.toXml(this.xml,this.fields);
		else if(this.version == (float) 2.1){
			GenXMLField.toXmlV21(this.xml,this.fields);
		}
		if(this.table!=null){
			this.xml.addXml(this.table.getDoc_list());
			this.table = null;
		}
		this.toolsbar.setButtons(this.buttons);
		if(this.toolsbar!=null){
			this.xml.addXml(this.toolsbar.toXmlTools());
		}
		this.xml.endElement();
		return this.xml.toString();
	}
	
}
