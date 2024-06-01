package nosi.core.gui.generator;


import nosi.core.config.Config;
import nosi.core.config.IHeaderConfig;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 18, 2017
 *
 * Description: class to build UI Desgin
 */

public class Generator2v3 implements IHeaderConfig{

	private final XMLWritter xml;
	
	@Override
	public String getTitle() {
		return "API Generator";
	}
	@Override
	public String getTarget() {
		return "_blank";
	}
	public Generator2v3(String xml) {
		this.xml = new XMLWritter("rows",new Config().getLinkXSLGenerator("2.3"));
		Action acGen23= new Action("Generator", "Generator", "", "", "Generator","Generator", "2.3", 1, new Application().findOne(1));
		this.xml.addXml(new Config().getHeader(this,acGen23));
		this.xml.startElement("content");
		this.xml.writeAttribute("type", "dash");
			this.xml.setElement("title", "Form Design");
			this.xml.addXml(xml);
		this.xml.endElement();//end tag content
		this.xml.endElement();//end tag rows
	}

	public String toString(){
		return this.xml.toString();
	}
}
