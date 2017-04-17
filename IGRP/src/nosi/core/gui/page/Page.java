package nosi.core.gui.page;

import java.util.Queue;
import java.util.PriorityQueue;

public class Page {
	
	private String template;
	private String content;
	
	Queue<Object> gui;
	
	
	public Page(){
		this.gui = new PriorityQueue<Object>();
	}
	
	private String convertToXml(){
		String xml = "";
		while(!this.gui.isEmpty())
			xml += this.gui.poll();
	 return xml;
	}
	
	public void addContent(Object c){
		this.gui.offer(c);
	}
	
	private void createTemplate(){
		
	}
	
	public void renderContent(boolean layout){
		if(layout){
			
		}else{
			
		}
	}
	
}

