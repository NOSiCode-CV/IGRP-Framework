package nosi.core.gui.generator;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to build UI Desgin
 */

import nosi.core.config.Config;
import nosi.core.config.IHeaderConfig;
import nosi.core.xml.XMLWritter;

public class Generator2_3 implements IHeaderConfig{

	private XMLWritter xml;
	
	@Override
	public String getTitle() {
		return "API Generator";
	}
	@Override
	public String getTarget() {
		return "_blank";
	}
	public Generator2_3(String xml) {
		this.xml = new XMLWritter("rows",new Config().getLinkXSLGenerator(), "dash");
		this.xml.addXml(new Config().getHeader(this));
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
