package nosi.core.webapp.helpers;

import java.util.ArrayList;
import java.util.List;


/**
 * joao.augoncalves
 * 06/08/2019
 */
public class RemoteXML {

	private StringBuilder xmlConstruct;
	private List<String> properties;
	private List<String> messages;
	private String lineSeparator="\n";
	private final String rootElement="<content>";
	private final String endRootElement = "</content>";
	
	public RemoteXML()
	{
		this.xmlConstruct = new StringBuilder();
		this.properties = new ArrayList<>();
		this.messages = new ArrayList<>();
		this.startXml();
	}

	public RemoteXML addMessage(String msgType, String msgText) {
		messages.add("<message type=\"" + msgType + "\">"+msgText + "</message>");
		return this;
	}
	
	public RemoteXML addPropertie(String tag, String value) {
		this.properties.add("<"+tag+">"+value+"</"+tag+">");
		return this;
	}
	
	public String build() {
		if(!messages.isEmpty()) {
			this.xmlConstruct.append("<messages>");
			messages.forEach(xmlConstruct::append);
			this.xmlConstruct.append("</messages>");
		}
		
		if(!properties.isEmpty())
			properties.forEach(xmlConstruct::append);
		
		this.closeXml();
		return this.xmlConstruct.toString();
	}

	private void startXml() {
		this.xmlConstruct.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		this.xmlConstruct.append(lineSeparator);
		this.xmlConstruct.append(rootElement);
		this.xmlConstruct.append(lineSeparator);
	}
	
	private void closeXml() {
		this.xmlConstruct.append(lineSeparator);
		this.xmlConstruct.append(endRootElement);
		this.messages=null;
		this.properties=null;
	}
	
}
