package nosi.core.gui.components;
/**
 * Emanuel
 * 28 Mar 2018
 */

import nosi.core.config.Config;
import nosi.core.webapp.QueryString;

public class IGRPLink {

	private String app;
	private String page;
	private String action;	
	private String link = "";
	private QueryString queryString;
	
	public IGRPLink() {
		this.queryString = new QueryString();
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
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}	
	
	public IGRPLink addParam(String name,Object value) {
		this.queryString.addQueryString(name, value);
		return this;
	}

	@Override
	public String toString() {
		return "IGRPLink [app=" + app + ", page=" + page + ", action=" + action + ", queryString=" + queryString + "]";
	}
	
	public String getLink() {
		 link = new Config().getResolveUrl(app, page, action);
		if(this.queryString.getQueryString()!=null && !this.queryString.getQueryString().isEmpty()) {
			this.queryString.getQueryString().entrySet().stream().forEach(qs->{
				link += "&"+qs.getKey()+"="+qs.getValue();
			});
		}
		return link;
	}
}
