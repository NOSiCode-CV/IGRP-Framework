package nosi.core.gui.components;

import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;

public class IGRPHome {
	private XMLWritter xml;
	public IGRPHome(String title){
		 this.xml = new XMLWritter("rows", "images/IGRP/IGRP2.3/xsl/IGRP-home.xsl", null);
		 Config.TITLE = title;
		 this.xml.addXml(Config.getHeaderHome());
	}
	
	public String toString(){
		return this.xml.toString();
	}
}
