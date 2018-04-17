package nosi.core.webapp.databse.helpers;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 17 Apr 2018
 */
public class ResultSet {

	private String sql;
	private String error;
	private Object keyValue;
	
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public Object getKeyValue() {
		return keyValue;
	}
	public void setKeyValue(Object keyValue) {
		this.keyValue = keyValue;
	}
	public boolean hasError() {
		return Core.isNotNull(this.getError());
	}	
	
}
