package nosi.core.webapp;

import java.util.HashMap;
import java.util.Map;
import nosi.core.gui.page.Page;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class View {
	
	private Controller context;
	private Page page; // representa o main layout de uma view
	
	private String pageTitle;
	
	private Map<String, Object> currentModels;
	
	public View(){
		this.currentModels = new HashMap<String, Object>();
		this.pageTitle = "IGRP"; // Default page title
		this.page = new Page();
	}
	
	public Controller getContext(){
		return this.context;
	}
	
	public void setContext(Controller context){
		this.context = context;
	}
	
	public Page getPage(){
		return this.page;
	}
	
	public abstract void render(); // Permite override obrigatorio nas subclasses
	
	protected void addToPage(Object obj){
		this.page.addContent(obj);
	}
	
	protected Object getModel(String name){
		return this.currentModels.get(name);
	}
	
	public View addModel(String name, Object model){
			this.currentModels.put(name, model);
		return this;
	}
	
	public void setPageTitle(String pageTitle){
		this.pageTitle = pageTitle;
	}
	
	public String getPageTitle(){
		return this.pageTitle;
	}

}
