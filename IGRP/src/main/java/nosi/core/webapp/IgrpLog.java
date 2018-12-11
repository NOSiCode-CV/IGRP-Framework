package nosi.core.webapp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;

/**
 * Iekiny Marcel
 * Jan 11, 2018
 */
public final class IgrpLog implements Component { // Not inherited 
	
	private List<String> msgLog; 
	
	public IgrpLog() {}
	
	public IgrpLog addMessage(String msg) {
		this.msgLog.add(msg);
		return this;
	}
	
	public List<String> getMsgLog(){
		return this.msgLog;
	}

	public void run() {
		Set<String> paramNames = Igrp.getInstance().getRequest().getParameterMap().keySet();
		Iterator<String> i = paramNames.iterator();
		
		String qs = Igrp.getInstance().getRequest().getQueryString();
		
		while(i.hasNext()) {
			String key = i.next();
			String values = "";
			
			if(qs.contains(key+"=")) {
				values = Igrp.getInstance().getRequest().getParameter(key);
			}else {
				String []result = Igrp.getInstance().getRequest().getParameterValues(key); 
				if(result != null && result.length > 1) {
					values += "[";
					for(int j = 0; j < result.length; j++) {
						values += result[j];
						if(j < result.length - 1)
							values += ", ";
					}		
					values += "]";
				}else 
					values = Igrp.getInstance().getRequest().getParameter(key);
			}	
				this.msgLog.add(key + " = " + values + " ");
		}
	}

	@Override
	public void destroy() {}

	@Override
	public void init(HttpServletRequest request) {
		this.msgLog = new ArrayList<String>();
	}
	
}
