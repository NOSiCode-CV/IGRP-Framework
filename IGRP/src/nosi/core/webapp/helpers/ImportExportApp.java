package nosi.core.webapp.helpers;

import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;

/**
 * Isaias.Nunes
 * Oct 11, 2017
 */
public class ImportExportApp {
	
	public static String generateXMLPage(Action pagina) {
		XMLWritter xml = new XMLWritter();
		xml.setElement("id", pagina.getId()+"");
		xml.setElement("action", pagina.getAction());
		xml.setElement("action_desc", pagina.getAction_descr());
		xml.setElement("package_name", pagina.getPackage_name());
		xml.setElement("page", pagina.getPage());
		xml.setElement("page_desc", pagina.getPage_descr());
		xml.setElement("status", pagina.getStatus()+"");
		xml.setElement("version", pagina.getVersion());
		xml.setElement("xsl_src", pagina.getXsl_src());
		xml.setElement("env_fk", pagina.getApplication().getId()+"");
		
		return xml.toString();
	}
	
	
}