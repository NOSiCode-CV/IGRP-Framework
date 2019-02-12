package nosi.core.webapp.databse.helpers;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryUpdate extends CommonFIlter {
	
	public QueryUpdate(String connectionName) {
		super(connectionName);
	}
	public QueryUpdate(String connectionName,boolean displayError,boolean tracingError) {
		this(connectionName);
		this.setShowError(displayError);
		this.setShowTracing(tracingError);
	}
	
	public QueryUpdate() {
		this(Core.defaultConnection());
	}

	public QueryHelper update(String tableName) {
		this.tableName = tableName;
		return this;
	}
	
	public QueryHelper update(String schemaName,String tableName) {
		this.schemaName = schemaName;
		this.tableName = tableName;
		return this;
	}
	
	public QueryInterface where(String condition) {
		this.sql += " WHERE "+condition;
		this.whereIsCall = true;
		return this;
	}
	
	protected QueryInterface filterWhere(String condition) {
		this.sql += condition;
		this.whereIsCall = true;
		return this;
	}
}
