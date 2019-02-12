package nosi.core.webapp.databse.helpers;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryDelete extends CommonFIlter{

	public QueryDelete(String connectionName) {
		super(connectionName);
	}
	public QueryDelete(String connectionName,boolean displayError,boolean tracingError) {
		this(connectionName);
		this.setShowError(displayError);
		this.setShowTracing(tracingError);
	}
	public QueryDelete() {		
		this(Core.defaultConnection());
	}

	public QueryHelper delete(String tableName) {
		this.tableName = tableName;
		return this;
	}
	
	public QueryHelper delete(String schemaName,String tableName) {
		this.schemaName = schemaName;
		this.tableName = tableName;
		return this;
	}

}
