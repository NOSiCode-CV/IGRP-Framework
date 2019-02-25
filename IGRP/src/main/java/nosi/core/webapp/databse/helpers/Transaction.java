package nosi.core.webapp.databse.helpers;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 22 Feb 2019
 */
public class Transaction extends QueryHelper{
	private Connection conn;
	
	public Transaction(String connectionName) {
		super(connectionName);
	}
	
	@Override
	public void begin() throws SQLException {
		this.conn = this.connection.getConnection(this.getConnectionName());
		if(this.conn!=null) {
			this.conn.setAutoCommit(false);
		}
	}
	
	@Override
	public void commit() throws SQLException{
		if(this.conn!=null) {
			this.conn.commit();
		}
	}

	@Override
	public void roolback() throws SQLException{
		if(this.conn!=null) {
			this.conn.rollback();
		}
	}
	
	@Override
	public void closeConnection() throws SQLException {
		if(this.conn!=null) {
			this.conn.close();
		}
	}
	
	@Override
	public QueryInterface insert(String tableName) {
		this.operationType = OperationType.INSERT;
		this.tableName = tableName;
		return this;
	}

	@Override
	public QueryInterface update(String tableName) {
		this.operationType = OperationType.UPDATE;
		this.tableName = tableName;
		return this;
	}

	@Override
	public QueryInterface delete(String tableName) {
		this.operationType = OperationType.DELETE;
		this.tableName = tableName;
		return this;
	}

	@Override
	public ResultSet execute() {
		ResultSet r = new ResultSet();
		if(this.conn!=null) {
			NamedParameterStatement q = null;
			if(this.operationType!=null && this.operationType.compareTo(OperationType.INSERT)==0) {
				try {
					if(this.retuerningKeys!=null) {
						q = new NamedParameterStatement(this.conn ,this.getSql(),this.retuerningKeys);
					}else {
						q = new NamedParameterStatement(this.conn ,this.getSql(),Statement.RETURN_GENERATED_KEYS);
					}
					this.setParameters(q);	
					Core.log("SQL:"+q.getSql());
					r.setSql(q.getSql());
					r.setKeyValue(q.executeInsert(this.tableName));
				} catch (SQLException e) {
					this.setError(r,e);
				}
			}else {
				try {
					q = new NamedParameterStatement(this.conn, this.getSql());
					this.setParameters(q);
					r.setSql(q.getSql());
					Core.log("SQL:"+q.getSql());
					r.setKeyValue( q.executeUpdate());
				} catch (SQLException e) {
					this.setError(r,e);
				}
			}
		}
		this.columnsValue = new ArrayList<>();//restart mapped columns
		this.sql = "";
		return r;
	}
}
