package nosi.core.gui.components;

import nosi.core.gui.fields.FieldProperties;

public class IGRPToolsBarItem {
	
	private String title = "";
    private String app = "";
    private String page = "";
    private String link = "";
    private String target = "";
    private String img = "";
    private String params = "";
    public FieldProperties propertie;
    
    public IGRPToolsBarItem(){
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
		return link;
	}
	public void setLink(String link) {
		this.link = link;
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
	public FieldProperties getProperties() {
		return this.propertie;
	}
}
