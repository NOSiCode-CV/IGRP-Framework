package nosi.core.gui.page;

import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
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
		String path_xsl = "";
		String app = Igrp.getInstance().getCurrentAppName();
		String page = Igrp.getInstance().getCurrentPageName();
		String action = Igrp.getInstance().getCurrentActionName();
		if(!app.equals("") && !page.equals("") && !action.equals("")){
			Action ac = new Action();
			Application env = new Application();
			env.setDad(app);
			ac.setAction(action);
			ac.setPage(resolvePageName(page));
			ac.setEnv(env);
			path_xsl = ac.getXslPath();
		}
		
		XMLWritter xml = new XMLWritter("rows", path_xsl, "utf-8");

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
	
	public static String getPageName(String page){
		page = page.replaceAll("\\s+", "");
		page = page.replaceAll("-", "");
		return page;
	}
	
	public static String getPageFolder(String page){
		page = page.toLowerCase();
		page = page.replaceAll("\\s+", "");
		page = page.replaceAll("-", "");
		return page;
	}
	
	public static String resolvePageName(String page){
		String page_name = "";
		for(String aux : page.split("-")){
			page_name += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		}
		return page_name;
	}
}

