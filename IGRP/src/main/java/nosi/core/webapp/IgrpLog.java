package nosi.core.webapp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

	@Override
	public void init() {
		this.msgLog = new ArrayList<String>();
		//this.func1();
	}
	
	public void run() {
		Set<String> paramNames = Igrp.getInstance().getRequest().getParameterMap().keySet();
		Map<String, String[]> params =  Igrp.getInstance().getRequest().getParameterMap();
		Iterator<String> i = paramNames.iterator();
		while(i.hasNext()) {
			String key = i.next();
			String values = "";
			String []aux = params.get(key);
			for(int y = 0; y < aux.length; y++)
				values += aux[y];
			this.msgLog.add(key + " = " + values + " ");
		}
	}

	@Override
	public void destroy() {}
	
}
