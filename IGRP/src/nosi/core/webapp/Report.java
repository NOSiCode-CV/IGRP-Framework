package nosi.core.webapp;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * @author: Emanuel Pereira
 * 9 Oct 2017
 */
public class Report extends Controller{

	private Map<String,Object> params = new HashMap<>();
	
	public Response invokeReport(String code_report,Report rep){
		String params = "&p_code="+code_report;
		if(rep!=null){
			for(Entry<String,Object> entry:rep.getParams().entrySet()){
				if(entry.getValue()!=null && !entry.getValue().toString().equals("?"))
					params += ("&name_array="+entry.getKey() + "&value_array="+entry.getValue());
			}
		}
		try {
			return this.redirect("igrp", "web-report", "get-link-report"+params);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Response getLinkReport(String code_report,Report rep){
		return new Report().invokeReport(code_report, rep);
	}
	
	public Report addParam(String name,Object value){
//		if(value!=null && !value.toString().equals(""))
			this.params.put(name, value);
		return this;
	}

	public Map<String, Object> getParams() {
		return params;
	}
}
