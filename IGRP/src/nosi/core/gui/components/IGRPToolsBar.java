package nosi.core.gui.components;

import java.util.ArrayList;

import nosi.core.xml.XMLWritter;

public class IGRPToolsBar {
	
	protected String tag_name;
	protected ArrayList<IGRPToolsBarItem> items;
	protected Object class_name = this;
	
	public IGRPToolsBar(String tag_name) {
		this.tag_name = tag_name;
		this.items = new ArrayList<>();
	}

	public void addItem(String title,String app, String page, String link, String target, String img){
		IGRPToolsBarItem item = new IGRPToolsBarItem();
		item.setApp(app);
		item.setImg(img);
		item.setLink(link);
		item.setPage(page);
		item.setTarget(target);
		item.setTitle(title);
		this.items.add(item);
	}
	
	public void setClassName(Object class_name){
		this.class_name = class_name;
	}
	
	public String getClassName(){
		return this.class_name.getClass().getSimpleName().toString();
	}
	
	public void toXml(XMLWritter xml){
		if(this.items.size() > 0){
			xml.startElement(this.tag_name);
			for(IGRPToolsBarItem item:items){
				xml.startElement("item");
				if(this.getClassName().compareTo("IGRPForm") == 0){
					xml.writeAttribute("type", "form");
				}else{
					xml.writeAttribute("type", "specific");
				}
				xml.writeAttribute("code", item.getCode());
				xml.writeAttribute("rel", item.getRel());
				xml.writeAttribute("class", item.getClas());
				
				xml.setElement("title", item.getTitle());
				xml.setElement("app", item.getApp());
				xml.setElement("page", item.getPage());
				xml.setElement("link", item.getLink());
				xml.setElement("target", item.getTarget());
				xml.setElement("img", item.getImg());
				xml.endElement();
			}
			xml.endElement();
		}
	}
}
