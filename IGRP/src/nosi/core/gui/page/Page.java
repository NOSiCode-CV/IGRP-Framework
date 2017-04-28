package nosi.core.gui.page;

import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;

public class Page {
	
	private String template;
	List<Object> gui;
	
	
	public Page(){
		this.gui = new ArrayList<Object>();
	}
	
	private String convertContentToXml(){
		String xml = "";
		for(Object obj:this.gui){
			xml += obj.toString();
		}
		this.gui = null;
	 return xml;
	}
	
	public void addContent(Object c){
		this.gui.add(c);
	}
	
	private void createTemplate(){
		
		XMLWritter xml = new XMLWritter("rows", "images/IGRP/IGRP2.3/app/novodominio/NovoDominio.xsl", "utf-8");

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

