package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import nosi.core.xml.XMLWritter;

public class IGRPMessage {

	private static ArrayList<HashMap<String,String>> messages = new ArrayList<>();
	
	public static void addMessage(String type,String message){
		HashMap<String,String> m = new HashMap<>();
		m.put(type, message);
		messages.add(m);
	}

	public static ArrayList<HashMap<String, String>> getMessages(){
		return messages;
	}
	
	public static void reset() {
		messages = new ArrayList<>();
	}
	
	public static String getXml(){
		XMLWritter xml = new XMLWritter();
		xml.startElement("messages");
		for(int i=0;i<IGRPMessage.getMessages().size();i++){
			for(Entry<String,String> msg : getMessages().get(i).entrySet()){
				xml.startElement("message");
				xml.writeAttribute("type", msg.getKey());
				xml.text(msg.getValue());
				xml.endElement();
			}
		}
		xml.endElement();
		reset();
		return xml.toString();
	}
}
