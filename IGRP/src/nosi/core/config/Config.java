package nosi.core.config;

import java.util.Properties;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.User;

public class Config {
	
	public static String TITLE = "";
	public static String target = "";
	public static String type_header = "normal";
	
	public static String getHeader(){
		XMLWritter xml = new XMLWritter();
		xml.setElement("tamplate", "");
		xml.setElement("title", TITLE);
		xml.setElement("version",getVersion());
		xml.setElement("link",getLink());
		xml.setElement("link_img",getLinkImg());
		if(!target.equals("")){
			xml.setElement("target", target);
		}
		xml.startElement("site");
			xml.setElement("welcome_note",getWelcomeNote());
			xml.setElement("footer_note", getFooterName());
			xml.setElement("user_name", getUserName());
			IGRPToolsBar button = new IGRPToolsBar("button");
			button.addButton(new IGRPButton("Sair", "webapps?r=igrp", "login", "logout", "_self", "exit.png","",""));
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
		xml.startElement("slide-menu");
		xml.writeAttribute("file",getLinkSileMenu());
		xml.endElement();
		if(type_header.equals("home")){
			xml.startElement("applications");
			xml.writeAttribute("file","webapps?r=igrp/env/myApps");
			xml.endElement();
		}
		target = "";
		TITLE = "";
		type_header = "normal";
		return xml.toString();
	}
	
	private static String getUserName() {
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		return (u!=null)?u.getName():"red-igrp";
	}

	public static Properties getConfig(){
		Properties configs = new Properties();
		for(Object c: new nosi.webapps.igrp.dao.Config().getAll()){
			nosi.webapps.igrp.dao.Config obj = (nosi.webapps.igrp.dao.Config) c;
			configs.put(obj.getName(),obj.getValue());
		}
		return configs;
	}
	
	public static String getPathLib(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/lib/");
	}
	
	public static String getPathClass(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/classes/");
	}
	public static String getPathXsl(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
	}
	public static String getLinkImg(){
		return getRootPaht()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString():"images/IGRP/IGRP2.3");
	}
	public static String getLink(){
		return getConfig().get("link")!=null? getConfig().get("link").toString():"webapps?r=igrp/home/index";
	}
	public static String getVersion(){
		return getConfig().get("version")!=null? getConfig().get("version").toString():"1.0";
	}
	public static String getLinkSileMenu(){
		return "webapps?r=igrp/pesquisar-menu/myMenu&amp;dad="+Igrp.getInstance().getCurrentAppName();
	}
	public static String getLinkTopMenu(){
		return getConfig().get("link_top_menu")!=null? getConfig().get("link_top_menu").toString():"";
	}
	public static String getFooterName(){
		return getConfig().get("footer_name")!=null? getConfig().get("footer_name").toString():"2011 - Copyright NOSI";
	}
	public static String getWelcomeNote(){
		return getConfig().get("welcome_note")!=null? getConfig().get("welcome_note").toString():"Ola";
	}
	
	public static String getPageVersion(){
		return "2.3";
	}
	
	public static String getRootPaht(){
		return Igrp.getInstance().getBasePath()+"/";
	}
}
