package nosi.core.config;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.xml.XMLWritter;

public class Config {

	public  static final String ROOT_PATH = "C:/Users/Yma/git/IGRP-Framework/IGRP/src/";
	public Config() {
		// TODO Auto-generated constructor stub
	}

	public static String getHeader(){
		XMLWritter xml = new XMLWritter();
		xml.setElement("tamplate", "");
		xml.setElement("title", "API - Gerador");
		xml.setElement("version", "201532");
		xml.setElement("link", "images/IGRP/IGRP2.3/xml/IGRP-home.xml");
		xml.setElement("link_img", "/IGRP/images/IGRP/IGRP2.3");
		xml.setElement("target", "_blank");
		xml.startElement("site");
			xml.setElement("welcome_note", "Ola");
			xml.setElement("footer_note", "2011 - Copyright NOSI");
			xml.setElement("user_name", "red-igrp");
			IGRPToolsBar button = new IGRPToolsBar("button");
			button.addButton(new IGRPButton("Sair", "igrp", "", "#", "_self", "exit.png","",""));
			xml.addXml(button.toXmlButton());
		xml.endElement();
		xml.setElement("app", "igrp");
		xml.setElement("page", "form");
		xml.startElement("plsql");
			xml.setElement("action", "1");
			xml.setElement("package_db", "FORM_DESIGNER_DB");
			xml.setElement("package_html", "FORM_DESIGNER_HTML");
			xml.setElement("package_instance", "");
			xml.setElement("with_replace", "false");
			xml.setElement("with_label", "false");
			xml.setElement("with_biztalk", "false");
			xml.setElement("dynamic_menu", "false");
			xml.setElement("copy_menu", "false");
			xml.setElement("package_copy_db", "");
			xml.setElement("package_copy_html", "");
		xml.endElement();
		xml.startElement("navigation");
		xml.writeAttribute("url", "webapps?");
		xml.writeAttribute("prm_app", "prm_app");
		xml.writeAttribute("prm_page", "prm_page");
		xml.writeAttribute("prm_action", "r");
		xml.endElement();
		
		xml.startElement("top_menu");
		xml.writeAttribute("file", "images/IGRP/IGRP2.3/xml/IGRP-top_menu.xml");
		xml.endElement();
		
		xml.startElement("slide-menu");
		xml.writeAttribute("file", "slide-menu.xml");
		xml.endElement();
		return xml.toString();
	}
}
