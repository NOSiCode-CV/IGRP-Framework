package nosi.core.gui.page;

import java.util.Queue;
import java.util.PriorityQueue;
import nosi.core.xml.XMLWritter;
import nosi.core.config.Config;
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
		XMLWritter xml = new XMLWritter("rows", "images/IGRP/IGRP2.3/app/TST/teste.xsl", "utf-8");
		xml.addXml(Config.getHeader());
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

