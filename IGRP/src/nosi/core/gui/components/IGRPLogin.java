/**
 * @author: Emanuel Pereira
 * 
 * Apr 27, 2017
 *
 * Description: class to generate xml of login
 */
package nosi.core.gui.components;

import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Igrp;

public class IGRPLogin extends IGRPForm{

	public IGRPLogin(String tag_name,String title) {
		super(tag_name,title);
		this.properties = null;//No properties
		this.xml = new XMLWritter("rows", "images/IGRP/IGRP2.3/xsl/IGRP-login.xsl", "");
		this.xml.setElement("link_img", Config.getLinkImg());
		this.xml.startElement("content");
		this.xml.text(":_message_reseved");
	}

	public IGRPLogin(String tag_name){
		this(tag_name,"");
	}
	public String toString(){
		this.xml.setElement("link_img", Config.getLinkImg());
		this.xml.setElement("title", "Login");
		this.xml.setElement("version",Config.getVersion());
		this.xml.setElement("action", "webapps?" + Igrp.getInstance().getRequest().getQueryString().replaceAll("&", "&amp;"));
		this.xml.setElement("footer_note", Config.getFooterName());
		this.genForm();
		return this.xml.toString();
	}
	
	private void genForm(){
		//Mensagem de informacao para login de demo
		/*this.xml.startElement("messages");
			this.xml.startElement("message");
				this.xml.writeAttribute("type", "info");
				this.xml.text("Faça login com user: demo e password: demo");
			this.xml.endElement();
		this.xml.endElement();*/
		this.xml.startElement("form");
			this.xml.startElement("label");
			if(this.fields.size() > 0){
				for(Field field:this.fields){
					this.xml.setElement(field.getTagName(), field.getLabel());
				}
			}
			this.xml.endElement();
			this.xml.startElement("value");
			if(this.fields.size() > 0){
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
