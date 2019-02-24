package nosi.core.webapp.databse.helpers;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

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
	public QueryInterface insert(String tableName) {
		return this;
	}

	@Override
	public QueryInterface update(String tableName) {
		return this;
	}

	@Override
	public QueryInterface delete(String tableName) {
		return this;
	}

	@Override
	public ResultSet execute() {
		System.out.println("OK");
		return null;
		/*ResultSet r = new ResultSet();
		Connection conn = this.connection.getConnection(this.getConnectionName());
		if(conn!=null) {
			try {
				conn.setAutoCommit(this.isAutoCommit);
			} catch (SQLException e1) {
				this.setError(null, e1);
			}
			NamedParameterStatement q = null;
			if(this instanceof QueryInsert) {
				try {
					if(this.returningKeys!=null) {
						q = new NamedParameterStatement(conn ,this.getSql(),this.returningKeys);
					}else {
						q = new NamedParameterStatement(conn ,this.getSql(),Statement.RETURN_GENERATED_KEYS);
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
					q = new NamedParameterStatement(conn, this.getSql());
					this.setParameters(q);
					r.setSql(q.getSql());
					Core.log("SQL:"+q.getSql());
					r.setKeyValue( q.executeUpdate());
				} catch (SQLException e) {
					this.setError(r,e);
				}
			}
			try {
				if(!this.isAutoCommit)
					conn.commit();
			} catch (SQLException e) {
				this.setError(r,e);
			}finally {
				try {
					if(q!=null)
						q.close();
					if(conn!=null) 
						conn.close();
				} catch (SQLException e) {
					this.setError(r, e);
				}
			}
		}
		return r;*/
	}
}
