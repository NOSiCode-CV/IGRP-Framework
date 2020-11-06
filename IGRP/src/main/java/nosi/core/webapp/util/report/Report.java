package nosi.core.webapp.util.report;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import nosi.core.webapp.Response;
import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.QueryString;
import nosi.core.webapp.util.helpers.GUIDGenerator;
import nosi.core.webapp.util.helpers.ReflectionHelper;
import nosi.core.webapp.util.helpers.Route;

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
		if(rep!=null) 
			for(Entry<String, Object> p : rep.getParams().entrySet()) 
				if(!(p.getValue() instanceof List)) {
					if(p.getValue() != null && !p.getValue().toString().equals("?")) { 
						if (p.getKey().equals("isPublic") && p.getValue().equals("1")) 
							qs += "&" + p.getKey() + "=" + p.getValue(); // isPublic=1 :-) 
						else 
							qs += ("&name_array="+p.getKey() + "&value_array="+p.getValue()); 
					}
				}else {
					List<Object> parms = (List<Object>) p.getValue(); 
					for(Object v : parms) 
						qs += ("&name_array="+p.getKey() + "&value_array="+v.toString());
				}
		
		try {
			return this.redirect("igrp_studio", "web-report", "get-link-report"+qs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Report getLinkReport(String code_report){
		return getLinkReport(code_report, false); 
	}
	
	public Report getLinkReport(String code_report, boolean isPublic){
		Report rep = new Report(); 
		if(isPublic) 
			Core.setAttribute("isPublic", "1"); 
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

	public static String getContraProva(String packageFind) {
		List<Class<?>> allClasses = ReflectionHelper.findClassesByInterface(IReportKey.class,packageFind);
		if(allClasses != null) {
			for(Class<?> c:allClasses) {
				try {
					IReportKey key = (IReportKey) c.newInstance();
					return key.getKeyGenerate();
				} catch (Exception e) {
					return  GUIDGenerator.getGUIDUpperCase();
				}	
			}
		}
		return GUIDGenerator.getGUIDUpperCase();
	}
	
}
