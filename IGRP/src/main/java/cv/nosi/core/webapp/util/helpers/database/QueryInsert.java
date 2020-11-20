package cv.nosi.core.webapp.util.helpers.database;

import cv.nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryInsert extends QueryHelper {


	public QueryInsert(String connectionName) {
		super(connectionName);
	}
	
	public QueryInsert(String connectionName,boolean displayError,boolean tracingError) {
		this(connectionName);
		this.setShowError(displayError);
		this.setShowTracing(tracingError);
	}

	public QueryInsert() {
		this(Core.defaultConnection());
	}

	@Override
	public QueryHelper insert(String tableName) {
		this.tableName = tableName;
		return this;
	}
	
	public QueryHelper insert(String schemaName,String tableName) {
		this.schemaName = schemaName;
		this.tableName = tableName;
		return this;
	}

}