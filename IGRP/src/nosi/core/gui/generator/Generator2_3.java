package nosi.core.gui.generator;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to build UI Desgin
 */

import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;

public class Generator2_3 {

	private XMLWritter xml;
	
	public Generator2_3(String xml) {
		this.xml = new XMLWritter("rows",Config.LINK_XSL_GENERATOR, "dash");
		Config.TITLE = "API Generator";
		Config.target = "_blank";
		this.xml.addXml(Config.getHeader());
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
