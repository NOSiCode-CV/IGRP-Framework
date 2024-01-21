package nosi.core.gui.page;

import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.gui.components.IGRPLogBar;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.View;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;

/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class Page{
	
	private String template;
	private View view;
	List<Object> gui;
	private String linkXsl; 
	
	private boolean showFooter; 
	private String copyright; 
	private String developed; 
	
	public View getView() {
		return view;
	}

	public void setView(View view) {
		this.view = view;
	}

	public Page(){
		this.gui = new ArrayList<>();
		this.copyright = "&copy; Copyright 2023, Núcleo Operacional da Sociedade de informação - E.P.E. Todos os direitos reservados."; 
		this.developed = "Design &amp; Concepção"; 
	}
	
	private String convertContentToXml(){
		StringBuilder xml = new StringBuilder();
		for(Object obj : this.gui)
			xml.append(obj.toString());
		this.gui = null;
		return xml.toString();
	}
	
	public String getLinkXsl() {
		return linkXsl;
	}

	public void setLinkXsl(String linkXsl) {
		this.linkXsl = linkXsl;
	}

	public void addContent(Object c){
		this.gui.add(c);
	}
	
	public void removeContent(Object c) {
		if(this.gui != null) 
			this.gui.remove(c);
	}
	
	private void createTemplate(){
		Igrp igrpApp = Igrp.getInstance();
		String path_xsl = "teste";
		String app = igrpApp.getCurrentAppName();
		String page = igrpApp.getCurrentPageName();
		String action = igrpApp.getCurrentActionName();
		Action ac=null;
		if (!app.isEmpty() && !page.isEmpty() && !action.isEmpty()) {
			ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
			
		}
		if (this.getLinkXsl() != null && !this.getLinkXsl().isEmpty())
			path_xsl = this.getLinkXsl();
		else if(ac!=null)
			path_xsl = new Config().getLinkPageXsl(ac);
			
		XMLWritter xml = new XMLWritter("rows", path_xsl, "utf-8");
		xml.addXml(new Config().getHeader(this.getView(),ac));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", this.getView().getPageTitle());
		xml.text(":_content");
		xml.addXml(new IGRPMessage().toString());
		if(this.showFooter) { 
			xml.startElement("igrpfooter"); 
			xml.setElement("copyright", this.copyright); 
			xml.setElement("developed", this.developed); 
			xml.startElement("by"); 
			xml.writeAttribute("link", "https://www.nosi.cv"); 
			xml.text("NOSi"); 
			xml.endElement(); 
			xml.endElement(); 
		}
		xml.endElement();		
		this.template = String.valueOf(xml);
	}
	
	public String renderContent(boolean layout){
		if(layout){
			if(new Config().getEnvironment().equalsIgnoreCase(ConfigCommonMainConstants.IGRP_ENV_DEV.value()) || new Config().getEnvironment().equalsIgnoreCase(ConfigCommonMainConstants.IGRP_ENV_STA.value()))
				new IGRPLogBar().displayLogs();
			// Create a standard template of IGRP 
			this.createTemplate();
			return this.template.replace(":_content", this.convertContentToXml());
		}
		return this.convertContentToXml().replace(":_message_reseved", new IGRPMessage().toString());
	}
	
	public static String getPageName(String page){
		return StringHelper.camelCase(StringHelper.removeSpace(page));
	}
	
	public static boolean validatePage(String page){
		return StringHelper.validateClassName(page);
	}
	
	public static String getPageFolder(String page){
		return page.toLowerCase().replaceAll("\\s+", "").replace("-", "");
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	
	public void setDeveloped(String developed) {
		this.developed = developed;
	}

	public void displayFooter(boolean showFooter) {
		this.showFooter = showFooter;
	}

	public static String resolvePageName(String page){
		String page_name = "";
		for(String aux : page.split("-"))
			page_name += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		return page_name;
	}
}