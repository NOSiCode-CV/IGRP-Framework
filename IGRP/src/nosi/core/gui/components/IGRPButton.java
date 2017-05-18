package nosi.core.gui.components;

import nosi.core.gui.fields.FieldProperties;

public class IGRPButton {
	
	private String title = "";
    private String app = "";
    private String page = "";
    private String link = "";
    private String target = "";
    private String img = "";
    private String params = "";
    private String parameter = "";
    public FieldProperties propertie;
    
    public IGRPButton(String title,String app,String page,String link,String target,String img,String parameter,String params){
    	this.propertie = new FieldProperties();
    	this.title = title;
    	this.app = app;
    	this.page = page;
    	this.link = link;
    	this.target = target;
    	this.img = img;
    	this.params = params;
    	this.parameter = parameter;
    }

    public IGRPButton(){
    	this.propertie = new FieldProperties();
    }
    
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getApp() {
		return app;
	}
	public void setApp(String app) {
		this.app = app;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getLink() {
		return app+"/"+page+"/"+link;
	}
	public void setLink(String link) {
		this.link = link.replace("&", "&amp;");
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	
	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public FieldProperties getProperties() {
		return this.propertie;
	}
}
