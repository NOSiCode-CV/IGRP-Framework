package nosi.core.gui.components;

/**
 * @author: Emanuel Pereira
 * 
 * May 19, 2017
 *
 * Description: class to generate xml for home page
 */

import nosi.core.config.Config;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.SeparatorField;
import nosi.core.xml.XMLWritter;

public class IGRPHome{
	private XMLWritter xml;
	public String type_home="";
	
	public IGRPHome(String type_home){
		this.type_home = type_home;
	}
	
	public String toString(){
		String path = Config.LINK_XSL_HOME;
		if(this.type_home.equals("home-app")){
			path = Config.LINK_XSL_HOME_APP;
		}
		else if(this.type_home.equals("home-app-studio")){
			path = Config.LINK_XSL_HOME_STUDIO;
		}
		 this.xml = new XMLWritter("rows", path, "dash");
		 Config.type_header = "home";
		 this.xml.addXml(Config.getHeader());
		 this.xml.startElement("content");
		 this.xml.text(":_message_reseved");		
		 this.xml.setElement("title", Config.TITLE);
		 if(this.type_home.equals("home-app")){
			 IGRPForm form_1 = new IGRPForm("form_1");
			 Field separator = new SeparatorField(null,"separator_1");
			 separator.setValue(Config.TITLE);
			 separator.setLabel(Config.TITLE);
			 form_1.addField(separator);
			 this.xml.addXml(form_1.toString());
		 }
		 this.xml.endElement();
		return this.xml.toString();
	}
}
