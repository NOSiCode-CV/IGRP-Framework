package nosi.core.webapp;

import java.util.Map;
import java.util.HashMap;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import nosi.core.webapp.Igrp;
/**
 * @author Marcel Iekiny
 * Apr 19, 2017
 */
public class FlashMessage implements Serializable{
	
	private Message msgs;
	
	public FlashMessage(){	// "flash" is the reserved name for messages in session
		this.msgs = new Message();
		if(Igrp.getInstance().getRequest().getSession(true).getAttribute("flash") == null){
			Igrp.getInstance().getRequest().getSession(true).setAttribute("flash", this.msgs);
		}
		else
			this.msgs = (Message) Igrp.getInstance().getRequest().getSession(true).getAttribute("flash");
	}
	
	public void addMessage(String name, String msg){
		this.msgs.addMessage(name, msg);
		// actualizar session
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
	}
	
	public void setMessage(String name, String msg){
		this.msgs.setMessage(name, msg);
		// actualizar session
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
	}
	
	public boolean hasMessage(String name){
		return this.msgs.hasMessage(name);
	}
	
	public String getMessages(String name){
		return this.msgs.getMessage(name);
	}
	
	// Please comment this method below ...
	public Message getMessage(){
		return this.msgs;
	}
	
	private class Message implements Serializable{ // inner/internal class for all message
		
		private Map<String, ArrayList<String>> msg;
		
		public Message(){
			this.msg = new HashMap<String, ArrayList<String>>();
			this.msg.put("error", new ArrayList<String>());
			this.msg.put("success", new ArrayList<String>());
			this.msg.put("info", new ArrayList<String>());
			this.msg.put("warning", new ArrayList<String>());
		}
		
		public void addMessage(String name, String msg){
			if(this.msg.containsKey(name))
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
			return this.msg.containsKey(name);
		}
		
		public String getMessage(String name){
			String result = "";
			if(this.msg.containsKey(name)){
				Iterator<String> i = this.msg.get(name).iterator();
				while(i.hasNext())
					result += i.next() + " ";
			}
			return result;
		}
		
	}

}
