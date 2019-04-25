package nosi.core.gui.components;
/**
 * Emanuel
 * 28 Mar 2018
 */


import nosi.core.webapp.QueryString;
import nosi.core.webapp.Report;
import nosi.core.webapp.helpers.Route;

public class IGRPLink {

	private String app;
	private String page;
	private String action;	
	private String link = "";
	private Report report;
	private String link_desc;
	
	private QueryString<String,Object> queryString;

	public IGRPLink() {
		this.queryString = new QueryString<>();
	}
	public IGRPLink(String app,String page,String action) {
		this();
		this.setAction(action);
		this.setApp(app);
		this.setPage(page);
		this.link = Route.getResolveUrl(this.getApp(), this.getPage(), this.getAction());
	}
	public IGRPLink(String link) {
		this();
		this.link = link;
	}
	public IGRPLink(Report report) {
		this();
		this.report = report;
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

	
	public Report getReport() {
		return report;
	}
	
	public void setReport(Report report) {
		this.report = report;
	}
	
	public String getLink_desc() {
		return link_desc;
	}
	
	public void setLink_desc(String link_desc) {
		this.link_desc = link_desc;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getLink() {
		if(this.report!=null) {
			this.link = this.report.getLink();
			this.report.getParams().entrySet().stream().forEach(p->{
				link += ("&name_array="+p.getKey() + "&value_array="+p.getValue());
			});
			return link;
		}
		if(this.queryString.getQueryString()!=null && !this.queryString.getQueryString().isEmpty()) {
			this.queryString.getQueryString().entrySet().stream().forEach(q->{
				q.getValue().stream().forEach(q1->{
					this.link += "&"+q.getKey()+"="+(q1!=null?q1.toString():"");
				});					
			});
		}
		return this.link.replace("&&", "&");
	}
	

	@Override
	public String toString() {
		return "IGRPLink [app=" + app + ", page=" + page + ", action=" + action + ", queryString=" + queryString + "]";
	}
	
	
}
