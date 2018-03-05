package nosi.core.gui.components;

/**
 * @author: Emanuel Pereira
 * 
 * May 19, 2017
 *
 * Description: class to generate xml for home page
 */

import nosi.core.config.Config;
import nosi.core.config.IHeaderConfig;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.SeparatorField;
import nosi.core.xml.XMLWritter;

public class IGRPHome implements IHeaderConfig{
	private XMLWritter xml;
	public String type_home="";
	protected Config config = new Config();
	public IGRPHome(String type_home){
		this.type_home = type_home;
	}
	
	public String toString(){
		String path = this.config.getLinkXSLHome();
		if(this.type_home.equals("home-app")){
			path = this.config.getLinkXSLHomeApp();
		}
		else if(this.type_home.equals("home-app-studio")){
			path = this.config.getLinkXSLHomeStudio();
		}
		 this.xml = new XMLWritter("rows", path, "dash");
		 this.xml.addXml(new Config().getHeader(this));
		 this.xml.startElement("content");
		 this.xml.text(":_message_reseved");		
		 this.xml.setElement("title","Home");
		 if(this.type_home.equals("home-app")){
			 IGRPForm form_1 = new IGRPForm("form_1");
			 Field separator = new SeparatorField(null,"separator_1");
			 separator.setValue("Home");
			 separator.setLabel("Home");
			 form_1.addField(separator);
			 this.xml.addXml(form_1.toString());
		 }
		 this.xml.endElement();
		return this.xml.toString();
	}
	
	public String getTypeHeader() {
		return "home";
	}
}
