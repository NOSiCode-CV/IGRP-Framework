package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Messages
 */
/*
 * <messages>
 * 		<message type="success">Sucess</message>
 * 		...
 * </messages>
 */
import nosi.core.xml.XMLWritter;

import org.apache.commons.lang.StringEscapeUtils;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.LinkField;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;

public class IGRPMessage {
	
	private XMLWritter result;
	
	public IGRPMessage(){
		this.result = new XMLWritter();
		FlashMessage flashMessage = Igrp.getInstance().getFlashMessage();
		this.result.startElement("messages");
		
		// Success
		for(String msg : flashMessage.getMessages(FlashMessage.SUCCESS)){
			this.result.startElement("message");
			this.result.writeAttribute("type", "success");
			this.result.text(msg);
			this.result.endElement();
		}
		
		// Error
		for(String msg : flashMessage.getMessages(FlashMessage.ERROR)){
			this.result.startElement("message");
			this.result.writeAttribute("type", "error");
			this.result.text(msg);
			this.result.endElement();
		}
		
		// Info
		for(String msg : flashMessage.getMessages(FlashMessage.INFO)){
			this.result.startElement("message");
			this.result.writeAttribute("type", "info");
			this.result.text(msg);
			this.result.endElement();
		}
		

		// Info
		for(String msg : flashMessage.getMessages(FlashMessage.INFO_LINK)){
			this.result.startElement("message");
			this.result.writeAttribute("type", "info");
			String []m = msg.split("/#RESERVE#/");
			this.result.text(StringEscapeUtils.escapeXml("<a href=\""+m[1]+"\">"+m[0]+"</a>"));
			this.result.endElement();
		}
		
		// Warning
		for(String msg : flashMessage.getMessages(FlashMessage.WARNING)){
			this.result.startElement("message");
			this.result.writeAttribute("type", "warning");
			this.result.text(msg);
			this.result.endElement();
		}
		
		this.result.endElement();
	}
	
	@Override
	public String toString() {
		return result.toString();
	}
	
}
