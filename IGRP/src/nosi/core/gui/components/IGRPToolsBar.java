package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of tools-bar 
 */
import java.util.ArrayList;

import nosi.core.gui.fields.GenXMLField;
import nosi.core.xml.XMLWritter;

public class IGRPToolsBar {
	
	protected String tag_name;
	protected ArrayList<IGRPToolsBarItem> items;
	protected Object class_name = this;
	protected XMLWritter xml;
	
	public IGRPToolsBar(String tag_name) {
		this.tag_name = tag_name;
		this.items = new ArrayList<>();
		this.xml = new XMLWritter();
	}
	
	public void setClassName(Object class_name){
		this.class_name = class_name;
	}
	
	public String getClassName(){
		return this.class_name.getClass().getSimpleName().toString();
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
		if(this.items.size() > 0){
			xml.startElement(this.tag_name);
			if(this.getClassName().compareTo("IGRPToolsBar") == 0){
				xml.writeAttribute("type", "toolsbar");
				xml.writeAttribute("structure", "items");
			}
			for(IGRPToolsBarItem item:items){
				this.genXmlItem(item, "item");
			}
			xml.endElement();
		}
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
		if(this.items.size() > 0){
			for(IGRPToolsBarItem item:items){
				this.genXmlItem(item, "button");
			}
		}
		return xml.toString();
	}

	private void genXmlItem(IGRPToolsBarItem item, String tag) {
		xml.startElement(tag);
		GenXMLField.writteAttributes(xml, item.getProperties());
		xml.setElement("title", item.getTitle());
		xml.setElement("app", item.getApp());
		xml.setElement("page", item.getPage());
		xml.setElement("link", item.getLink());
		xml.setElement("target", item.getTarget());
		xml.setElement("img", item.getImg());
		if(item.getParams().compareTo("") != 0){
			xml.setElement("params", item.getParams());
		}
		xml.endElement();
	}

	/*Generate xml item without params tag
	 * <item type="specific" code="" rel="button_1" class="default">
            <title>Button</title>
            <app/>
            <page/>
            <link/>
            <target>_blank</target>
            <img>fa-dot-circle-o</img>
            <params>default|fa-dot-circle-o|www</params>
        </item>
	 */
	public void addItem(String title, String app, String page, String link, String target, String img, String code,
			String rel, String _class) {
		IGRPToolsBarItem item = new IGRPToolsBarItem();
		item.setApp(app);
		item.setImg(img);
		item.setLink(link);
		item.setPage(page);
		item.setTarget(target);
		item.setTitle(title);
		item.propertie.put("type", this.getTypeItem());
		item.propertie.put("code", code);
		item.propertie.put("rel", rel);
		item.propertie.put("class", _class);
		this.items.add(item);
	}

	/*Generate xml item with params tag
	 * <item type="specific" code="" rel="button_1" class="default">
            <title>Button</title>
            <app/>
            <page/>
            <link/>
            <target>_blank</target>
            <img>fa-dot-circle-o</img>
            <params>default|fa-dot-circle-o|www</params>
        </item>
	 */
	public void addItem(String title, String app, String page, String link, String target, String img, String code,
			String rel, String _class, String params) {
		IGRPToolsBarItem item = new IGRPToolsBarItem();
		item.setApp(app);
		item.setImg(img);
		item.setLink(link);
		item.setPage(page);
		item.setTarget(target);
		item.setTitle(title);
		item.propertie.put("type", this.getTypeItem());
		item.propertie.put("code", code);
		item.propertie.put("rel", rel);
		item.propertie.put("class", _class);
		item.setParams(params);
		this.items.add(item);
	}
	
	private String getTypeItem(){
		return this.getClassName().compareTo("IGRPForm") == 0? "form" : "specific";
	}
}
