package nosi.core.gui.components;

import nosi.core.config.Config;
import nosi.core.config.IHeaderConfig;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.SeparatorField;
import nosi.core.xml.XMLWritter;

public class IGRPHome implements IHeaderConfig{
	public String type_home="";
	protected final Config config = new Config();
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
		XMLWritter xml = new XMLWritter("rows", path);
		 xml.addXml(new Config().getHeader(this));
		 xml.startElement("content");
		 xml.text(":_message_reseved");
		 xml.setElement("title","Home");
		 if(this.type_home.equals("home-app")){
			 IGRPForm form_1 = new IGRPForm("form_1");
			 Field separator = new SeparatorField(null,"separator_1");
			 separator.setValue("Home");
			 separator.setLabel("Home");
			 form_1.addField(separator);
			 xml.addXml(form_1.toString());
		 }
		 xml.endElement();
		return xml.toString();
	}
	
	public String getTypeHeader() {
		return "home";
	}
}
