package nosi.core.gui.components;

import java.util.Iterator;

import org.apache.commons.lang.StringEscapeUtils;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;

/**
 * Iekiny Marcel
 * Jan 11, 2018
 */
public class IGRPLogBar {
	
	private XMLWritter result;
	
	public IGRPLogBar(){
		this.result = new XMLWritter();
		this.result.startElement("messages");
		Iterator<String> i = Igrp.getInstance().getLog().getMsgLog().iterator();
		while(i.hasNext()) {
			this.result.startElement("message");
			this.result.writeAttribute("type", "debug");
			this.result.text(i.next());
			this.result.endElement();
		}
		this.result.endElement();
	}
	
	@Override
	public String toString() {
		return result.toString();
	}
}
