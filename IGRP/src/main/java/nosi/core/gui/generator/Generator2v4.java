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

public class Generator2v4 implements IHeaderConfig{

	private final XMLWritter xml;
	
	@Override
	public String getTitle() {
		return "API Generator";
	}
	@Override
	public String getTarget() {
		return "_blank";
	}
	public Generator2v4(String xmlContent) {
		this.xml = new XMLWritter("rows",new Config().getLinkXSLGenerator("2.4"), "dash");
		Application appG= new Application();
		appG.setDad("igrp");
		Action acGen24= new Action("Generator", "Generator", "", "", "Generator","Generator", "2.4", 1, appG);
		this.xml.addXml(new Config().getHeader(this,acGen24)
				.replace("<template>igrp_studio</template>", "<template>default</template>")
				);
		this.xml.startElement("content");
		this.xml.writeAttribute("type", "dash");
		this.xml.setElement("title", "Form Design");
		this.xml.addXml(xmlContent);
		this.xml.endElement();//end tag content
		this.xml.endElement();//end tag rows
	}

	public String toString(){
		return this.xml.toString();
	}
}
