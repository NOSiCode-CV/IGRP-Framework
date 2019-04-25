package nosi.core.webapp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.helpers.Route;

/**
 * 
 * Use the functions getLinkReport and other to manage and invoke reports.
 * 
 * @author: Emanuel Pereira
 * 9 Oct 2017
 */
public class Report extends Controller{

	private Map<String,Object> params = new HashMap<>();
	private String qs = "";
	private String link;
	
	@SuppressWarnings("unchecked")
	public Response invokeReport(String code_report,Report rep){
		qs+="&p_rep_code="+code_report;
		if(rep!=null){
			rep.getParams().entrySet().stream().filter(p->!(p.getValue() instanceof List)).forEach(p->{
				if(p.getValue()!=null && !p.getValue().toString().equals("?"))
					qs += ("&name_array="+p.getKey() + "&value_array="+p.getValue());
			});
			rep.getParams().entrySet().stream().filter(p->p.getValue() instanceof List).forEach(p->{
				((List<Object>) p.getValue()).stream().forEach(v->{
					qs += ("&name_array="+p.getKey() + "&value_array="+v.toString());
				});
			});
		}
		try {
			return this.redirect("igrp_studio", "web-report", "get-link-report"+qs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Report getLinkReport(String code_report){
		Report rep = new Report();
		rep.setLink(Route.getResolveUrl("igrp_studio", "web-report", "get-link-report")+"&p_rep_code="+code_report);
		return rep;
	}
	
	public static Response getLinkReport(String code_report,Report rep){
		return new Report().invokeReport(code_report, rep);
	}
	
	public Report addParam(String name,Object value){
		this.params.put(name, value);
		return this;
	}

	public Map<String, Object> getParams() {
		return params;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	public Report getLinkReport(String code_report, QueryString<String, Object> queryString) {
		Report rep = new Report();
		rep.setLink(Route.getResolveUrl("igrp_studio", "web-report", "get-link-report")+"&p_rep_code="+code_report);
		if(queryString!=null) {
			queryString.getQueryString().entrySet().stream().forEach(q->{
				rep.addParam(q.getKey(), q.getValue().get(0));
			});
		}
		return rep;
	}
	
	
}
