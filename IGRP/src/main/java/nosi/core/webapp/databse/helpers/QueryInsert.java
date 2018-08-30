package nosi.core.webapp.databse.helpers;

import nosi.core.config.ConfigApp;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryInsert extends QueryHelper {


	public QueryInsert(String connectionName) {
		super(connectionName);
	}

	public QueryInsert() {
		this(new ConfigApp().getBaseConnection());
	}
	
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
