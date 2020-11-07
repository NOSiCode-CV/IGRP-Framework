package cv.nosi.core.webapp.util.helpers.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import cv.nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 22 Feb 2019
 */
public class Transaction extends QuerySelect{
	private Connection conn;
	
	public Transaction(String connectionName) {
		super(connectionName);
	}
	
	@Override
	public void begin() throws SQLException {
		this.conn = cv.nosi.core.webapp.util.helpers.database.Connection.getConnection(this.getConnectionName());
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
	public QueryInterface select(String collumns) {
		this.resetQuery();
		if(Core.isNotNull(collumns)) {
			if(!collumns.toUpperCase().contains("SELECT"))
				this.setSql("SELECT "+collumns+" ");
			else
				this.setSql(collumns);
		}
		return this;
	}
	
	@Override
	public QueryInterface insert(String tableName) {
		this.resetQuery();
		this.operationType = OperationType.INSERT;
		this.tableName = tableName;
		return this;
	}

	@Override
	public QueryInterface update(String tableName) {
		this.resetQuery();
		this.operationType = OperationType.UPDATE;
		this.tableName = tableName;
		return this;
	}

	@Override
	public QueryInterface delete(String tableName) {
		this.resetQuery();
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
						q = new NamedParameterStatement(this.conn ,this.getSqlExecute(),this.retuerningKeys);
					}else {
						q = new NamedParameterStatement(this.conn ,this.getSqlExecute(),Statement.RETURN_GENERATED_KEYS);
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
					q = new NamedParameterStatement(this.conn, this.getSqlExecute());
					this.setParameters(q);
					r.setSql(q.getSql());
					Core.log("SQL:"+q.getSql());
					r.setKeyValue(new Integer(q.executeUpdate()));
				} catch (SQLException e) {
					this.setError(r,e);
				}
			}
		}
		this.resetQuery();
		this.whereIsCall = false;
		return r;
	}
	
	@Override
	public ResultSet executeTransaction() throws SQLException {
		ResultSet r = new ResultSet();
		if(this.conn!=null) {
			NamedParameterStatement q = null;
			if(this.operationType!=null && this.operationType.compareTo(OperationType.INSERT)==0) {
					String s = this.getSqlExecute();
					if(this.retuerningKeys!=null) {
						q = new NamedParameterStatement(this.conn ,s,this.retuerningKeys);
					}else {
						q = new NamedParameterStatement(this.conn ,s,Statement.RETURN_GENERATED_KEYS);
					}
					this.setParameters(q);	
					Core.log("SQL:"+q.getSql());
					r.setSql(q.getSql());
					r.setKeyValue(q.executeInsert(this.tableName));
			}else {
					q = new NamedParameterStatement(this.conn, this.getSqlExecute());
					this.setParameters(q);
					r.setSql(q.getSql());
					Core.log("SQL:"+q.getSql());
					r.setKeyValue(new Integer(q.executeUpdate()));
			}
		}
		this.resetQuery();
		this.whereIsCall = false;
		return r;
	}
}
