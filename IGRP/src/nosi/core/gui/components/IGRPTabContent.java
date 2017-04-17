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

import nosi.core.gui.fields.GenXMLField;

public class IGRPTabContent extends IGRPBox {

	protected ArrayList<IGRPToolsBarItem> items;
	
	public IGRPTabContent(String tag_name) {
		super(tag_name);
		this.properties.put("type", "tabcontent");
		this.properties.put("structure", "tabs");
		this.items = new ArrayList<>();
	}

	public void addItem(String name,String title,String img){
		IGRPToolsBarItem item = new IGRPToolsBarItem();
		item.setTitle(title);
		item.setImg(img);
		item.propertie.put("name", name);
		this.items.add(item );
	}
	
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, this.properties);
		for(IGRPToolsBarItem item:items){
			this.xml.startElement("item");
			GenXMLField.writteAttributes(this.xml, item.getProperties());
			this.xml.setElement("title", item.getTitle());
			this.xml.setElement("img", item.getImg());
			this.xml.endElement();
		}
		this.xml.endElement();
		return this.xml.toString();
	}
}
