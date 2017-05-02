package nosi.core.webapp;

import java.util.Map;
import java.util.Map.Entry;
import java.util.HashMap;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
/**
 * @author Marcel Iekiny
 * Apr 19, 2017
 */
public class FlashMessage implements Serializable{
	
	private Message msgs;
	
	public FlashMessage(){	// "flash" is the reserved name for messages in session
		if(Igrp.getInstance().getRequest().getSession().getAttribute("flash") == null){
			this.msgs = new Message();
			Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
		}
		else
			this.msgs = (Message) Igrp.getInstance().getRequest().getSession().getAttribute("flash");
	}
	
	public FlashMessage addMessage(String name, String msg){
		this.msgs.addMessage(name, msg);
		// actualizar session
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
		return this;
	}
	
	public void setMessage(String name, String msg){
		this.msgs.setMessage(name, msg);
		// actualizar session /* Sorry we dont need it */
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
	}
	
	public boolean hasMessage(String name){
		return this.msgs.hasMessage(name);
	}
	
	public String getMessagesAsString(String name){
		return this.msgs.getMessagesAsString(name);
	}
	
	public ArrayList<String> getMessages(String name){
		return this.msgs.getMessages(name);
	}

	// Please dont uncomment this method below ... (because it is only for test purpose)
	/*public Message getMessage(){
		return this.msgs;
	}*/
	
	public class Message implements Serializable{ // inner/internal class for all message
		
		private Map<String, ArrayList<String>> msg;
		
		public Message(){
			this.msg = new HashMap<String, ArrayList<String>>();
			this.msg.put("error", new ArrayList<String>());
			this.msg.put("success", new ArrayList<String>());
			this.msg.put("info", new ArrayList<String>());
			this.msg.put("warning", new ArrayList<String>());
		}
		
		public void addMessage(String name, String msg){
			if(this.msg!=null && this.msg.containsKey(name))
				this.msg.get(name).add(msg);
			else
				this.setMessage(name, msg);
		}
		
		public void setMessage(String name, String msg){
			ArrayList<String> aux = new ArrayList<String>();
			aux.add(msg);
			this.msg.put(name, aux);
		}
		
		public boolean hasMessage(String name){
			return this.msg.containsKey(name) && this.msg.get(name).size() > 0;
		}
		
		public String getMessagesAsString(String name){ // return all specific message as a String
			String result = "";
			if(this.msg.containsKey(name)){
				Iterator<String> i = this.msg.get(name).iterator();
				while(i.hasNext())
					result += i.next() + " ";
			}
			this.msg.get(name).clear();
			return result;
		}
		
		public ArrayList<String> getMessages(String name){
			ArrayList<String> result = new ArrayList<String>(); // empty ArrayList for NullPointerException when return it ...
			if(this.msg.containsKey(name)){
				result = new ArrayList<String>(this.msg.get(name)); // to make clone of collection
				this.msg.get(name).clear();
			}
			return result;
		}
		
	}

}
