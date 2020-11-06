package nosi.core.webapp.util.helpers.database;

import nosi.core.webapp.util.Core;

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

	@Override
	public QueryHelper update(String tableName) {
		this.tableName = tableName;
		return this;
	}
	
	public QueryHelper update(String schemaName,String tableName) {
		this.schemaName = schemaName;
		this.tableName = tableName;
		return this;
	}

	@Override
	public QueryInterface where(String condition) {
		this.sql += " WHERE "+condition;
		this.whereIsCall = true;
		return this;
	}

	@Override
	protected QueryInterface filterWhere(String condition) {
		this.sql += condition;
		this.whereIsCall = true;
		return this;
	}
}
