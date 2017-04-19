package nosi.core.gui.generator;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to build API Generator
 */

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPFilter;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.TextField;
import nosi.core.xml.XMLWritter;

public class Generator2_3 {

	private XMLWritter xml;
	
	public Generator2_3(String xml) {
		this.xml = new XMLWritter("rows","images/IGRP/IGRP2.3/app/RED/RED_FORM_1_dash.xsl", "dash");
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
