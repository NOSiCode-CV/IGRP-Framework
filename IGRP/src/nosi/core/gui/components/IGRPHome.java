package nosi.core.gui.components;

import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;

public class IGRPHome {
	private XMLWritter xml;
	public String type_home="";
	
	public IGRPHome(String type_home){
		this.type_home = type_home;
	}
	
	public String toString(){
		String path = "images/IGRP/IGRP2.3/xsl/IGRP-home.xsl";
		if(this.type_home.equals("home-app")){
			path = "images/IGRP/IGRP2.3/xsl/IGRP-home-app.xsl";
		}
		 this.xml = new XMLWritter("rows", path, null);
		 Config.type_header = "home";
		 this.xml.addXml(Config.getHeader());
		 this.xml.startElement("content");
		 this.xml.setElement("title", "Home");
		 this.xml.endElement();
		return this.xml.toString();
	}
}
