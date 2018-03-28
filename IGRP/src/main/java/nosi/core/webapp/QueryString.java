package nosi.core.webapp;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Emanuel
 * 21 Mar 2018
 */
public class QueryString {

	private Map<String,Object> queryString;
	
	public QueryString() {
		this.queryString = new LinkedHashMap<>();
	}
	
	public Map<String, Object> getQueryString() {
		return queryString;
	}

	public void setQueryString(Map<String, Object> queryString) {
		this.queryString = queryString;
	}
	
	public QueryString addQueryString(String name,Object value) {
		this.queryString.put(name, value);
		return this;
	}
}
