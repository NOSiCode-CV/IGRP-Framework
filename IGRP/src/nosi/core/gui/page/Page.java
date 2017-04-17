package nosi.core.gui.page;

import java.util.Queue;
import java.util.PriorityQueue;
import nosi.core.xml.XMLWritter;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.webapp.Igrp;

public class Page {
	
	private String template;
	private String content;
	
	Queue<Object> gui;
	
	
	public Page(){
		this.gui = new PriorityQueue<Object>();
	}
	
	private String convertContentToXml(){
		String xml = "";
		while(!this.gui.isEmpty())
			xml += this.gui.poll();
	 return xml;
	}
	
	public void addContent(Object c){
		this.gui.offer(c);
	}
	
	private void createTemplate(){
		XMLWritter xml = new XMLWritter("rows", "", "utf-8");
		xml.setElement("title", "xpto"/*Igrp.getInstance().getCurrentController().getView().getPageTitle()*/);
		xml.setElement("version", "");
		xml.setElement("link", "");
		
		xml.startElement("site");
		xml.setElement("welcome", "");
		xml.setElement("footer_note", "");
		xml.setElement("user_name", "");
		
		
		IGRPToolsBar button = new IGRPToolsBar("button");
		button.addItem("Button name", "App name", "Page name", "Action name", "Target", "Image name");
		
		xml.addXml(button.toXmlButton());
		/*xml.startElement("button");
		xml.writeAttribute("type", "");
		xml.setElement("title", "");
		xml.setElement("app", "");
		xml.setElement("page", "");
		xml.setElement("link", "");
		xml.setElement("target", "_self");
		xml.setElement("img", "");
		xml.endElement();*/
		
		xml.endElement();
		
		
		xml.setElement("app", "");
		
		xml.startElement("navigation");
		xml.writeAttribute("file", "");
		xml.writeAttribute("prm_app", "");
		xml.writeAttribute("prm_page", "");
		xml.writeAttribute("prm_action", "");
		xml.endElement();
		
		xml.startElement("top_menu");
		xml.writeAttribute("file", "");
		xml.endElement();
		
		xml.startElement("slide_top");
		xml.writeAttribute("file", "");
		xml.endElement();
		
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", "");
		xml.text(":_content");
		xml.endElement();
		
		this.template = xml + "";
	}
	
	public String renderContent(boolean layout){
		if(layout){
			// Create a standard template of IGRP
			this.createTemplate();
			return this.template.replace(":_content", this.convertContentToXml());
		}
		return this.convertContentToXml();
	}
	
}

