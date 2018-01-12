package nosi.core.webapp.databse.helpers;

import nosi.core.config.Config;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryUpdate extends QueryHelper {
	
	public QueryUpdate(String connectionName) {
		super(connectionName);
	}

	public QueryUpdate() {
		this(Config.getBaseConnection());
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
}
