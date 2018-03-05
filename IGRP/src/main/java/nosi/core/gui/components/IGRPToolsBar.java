package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of tools-bar 
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import nosi.core.gui.fields.FieldProperties;
import nosi.core.xml.XMLWritter;

public class IGRPToolsBar {
	
	protected String tag_name;
	protected List<IGRPButton> buttons;
	protected Object class_name = this;
	protected XMLWritter xml;
	protected String type = "toolsbar";
	protected FieldProperties properties;
	
	public IGRPToolsBar(String tag_name) {
		this.tag_name = tag_name;
		this.buttons = new ArrayList<>();
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.add("type", this.type);
		this.properties.add("xml-type", this.type);
	}
	
	public void setClassName(Object class_name){
		this.class_name = class_name;
	}
	
	public String getClassName(){
		return this.class_name.getClass().getSimpleName().toString();
	}
	
	public FieldProperties getProperties() {
		return properties;
	}

	public void setProperties(FieldProperties properties) {
		this.properties = properties;
	}

	public String toString(){
		return this.toXmlTools();
	}
	
	/*Generate xml item
	 *  <item type="specific" code="" rel="button_1" class="default">
            <title>Button</title>
            <app/>
            <page/>
            <link/>
            <target>_blank</target>
            <img>fa-dot-circle-o</img>
            <params>default|fa-dot-circle-o|www</params>
        </item>
	 */
	public String toXmlTools(){
		if(this.buttons!=null && this.buttons.size() > 0){
			xml.startElement(this.tag_name);
			if(this.getClassName().compareTo("IGRPToolsBar") == 0){
				for(Entry<Object, Object> prop : properties.entrySet()) {
					if(prop.getKey()!=null && prop.getValue()!=null)
						xml.writeAttribute(prop.getKey().toString(), prop.getValue().toString());
				}
			}
			for(IGRPButton item:buttons){
				xml.addXml(item.toString());
			}
			xml.endElement();
		}
		this.buttons = null;
		return xml.toString();
	}
	
	/*Generate xml button
	 * <button		type="specific">
            <title>Sair</title>
            <app>YGRP</app>
            <page />
            <link>#</link>
            <target>_self</target>
            <img>exit.png</img>
        </button>
	 */
	public String toXmlButton(){
		if(this.buttons.size() > 0){
			for(IGRPButton item:buttons){
				item.setTag("button");
				this.xml.addXml(item.toString());
			}
		}
		this.buttons = null;
		return xml.toString();
	}
	
	public void addButton(IGRPButton button){
		if(this.buttons!=null){
			button.propertie.put("type", "specific");
			this.buttons.add(button);
		}
	}
	
	public void setButtons(List<IGRPButton> buttons){
		if(this.buttons!=null)
			this.buttons = buttons;
	}
}
