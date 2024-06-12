/**
 * @author: Emanuel Pereira
 * 
 * Apr 27, 2017
 *
 * Description: class to generate xml of login
 */
package nosi.core.gui.components;

import java.util.Properties;

import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;

public class IGRPLogin extends IGRPForm{
	protected final Config config = new Config();

	public IGRPLogin(String tag_name,String title) {
		super(tag_name,title);
		this.properties = null;//No properties
		this.xml = new XMLWritter("rows",this.config.getLinkXSLLogin());
		this.xml.setElement("template", ConfigApp.getInstance().getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_LOGIN_TEMPLATE.value()));
		this.xml.setElement("link_img", this.config.getLinkImg(Config.DEFAULT_V_PAGE));
		this.xml.startElement("content");
		this.xml.text(":_message_reseved");
	}

	public IGRPLogin(String tag_name){
		this(tag_name,"");
	}
	@Override
	public String toString(){
		
		this.xml.setElement("link_img", this.config.getLinkImg(Config.DEFAULT_V_PAGE));
		this.xml.setElement("title", "Login");
		this.xml.setElement("version",Config.VERSION);
		
		this.xml.setElement("action", "webapps" + "?" + Igrp.getInstance().getRequest().getQueryString()); 
		
		this.xml.setElement("footer_note", this.config.getFooterName()); 
		this.genForm();
		return this.xml.toString();
	}
	
	private void genForm(){
		
		Properties settings = ConfigApp.getInstance().getMainSettings();

		final String authType = ConfigCommonMainConstants.isEnvironmentVariableScanActive() ?
				ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.getEnvironmentVariable() : settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
		
		//Mensagem de informacao para login de demo
		/*this.xml.startElement("messages");
			this.xml.startElement("message");
				this.xml.writeAttribute("type", "info");
				this.xml.text("Faça login com user: demo e password: demo");
			this.xml.endElement();
		this.xml.endElement();*/
		this.xml.startElement("form");
			
			this.xml.setElement("login-type", authType);

			
			this.xml.startElement("label");

			if(!this.fields.isEmpty()){
				for(Field field:this.fields){
					this.xml.setElement(field.getTagName(), field.getLabel());
				}
			}
			this.xml.endElement();
			this.xml.startElement("value");
			if(!this.fields.isEmpty()){
				for(Field field:this.fields){	
					if(field instanceof HiddenField){
						field.propertie().remove("maxlength");
						this.xml.startElement("hidden");
					}else{
						this.xml.startElement(field.getTagName());
					}
					GenXMLField.writteAttributes(this.xml, field.propertie());
					this.xml.text(field.getValue().toString());
					this.xml.endElement();
				}
			}
			this.xml.endElement();

		this.xml.endElement();
	}
}