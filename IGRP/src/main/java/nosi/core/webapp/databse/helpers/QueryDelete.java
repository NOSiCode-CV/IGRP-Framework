package nosi.core.webapp.databse.helpers;

import nosi.core.config.Config;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QueryDelete extends CommonFIlter{

	public QueryDelete(String connectionName) {
		super(connectionName);
	}

	public QueryDelete() {
		this(new Config().getBaseConnection());
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
