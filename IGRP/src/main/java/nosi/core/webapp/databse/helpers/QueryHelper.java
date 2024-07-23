package nosi.core.webapp.databse.helpers;

import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.base.ActiveRecord.ResolveColumnNameQuery;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.webapps.igrp.dao.Config_env;


/**
 * Emanuel
 * 21 Dec 2017
 */
public abstract class QueryHelper implements QueryInterface{

	protected String sql = "";
	protected String schemaName;
	protected String tableName;
	protected List<DatabaseMetadaHelper.Column> columnsValue;
	protected String connectionName;
	protected boolean whereIsCall = false;
	protected Config_env configEnv;
	protected String[] retuerningKeys;
	protected boolean isAutoCommit = false;
	private boolean showError = true;
	private boolean showTracing = true;
	protected ResolveColumnNameQuery recq;
	protected boolean keepConnection = false;
	protected EntityManager em = null;
	protected OperationType operationType;
	
	protected QueryHelper(Object connectionName) {
		this();
		if(Core.isNotNull(connectionName) && connectionName instanceof Config_env ) {
			this.configEnv = (Config_env) connectionName;			
		}
		this.connectionName = nosi.core.webapp.databse.helpers.Connection.getMyConnectionName(connectionName);
	}	

	protected QueryHelper() {
		this.columnsValue = new ArrayList<>();
		this.recq = new ResolveColumnNameQuery(this.getClass());
	}


	protected SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = null;
		if(this.configEnv!=null) {
			sessionFactory= HibernateUtils.getSessionFactory(configEnv.getName(),  configEnv.getApplication().getDad());
		}else
			sessionFactory= HibernateUtils.getSessionFactory(this.getConnectionName());
		if(sessionFactory!=null) {
			return sessionFactory;
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}
	
	
	protected Session getSession() {
		SessionFactory sessionFactory = this.getSessionFactory();
		if (sessionFactory != null) {
			Session s = null;
			if (sessionFactory.isOpen() && sessionFactory.getCurrentSession() != null
					&& sessionFactory.getCurrentSession().isOpen()) {
				s = sessionFactory.getCurrentSession();
				return s;
			}
			sessionFactory.close();
			HibernateUtils.removeSessionFactory(this.configEnv != null?this.configEnv.getName():this.getConnectionName());
			sessionFactory = this.getSessionFactory();
			if (sessionFactory != null) {
				s = sessionFactory.getCurrentSession();
				return s;
			}
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}
	
	
	public boolean isShowError() {
		return showError;
	}

	@Override
	public void setShowError(boolean showError) {
		this.showError = showError;
	}

	public boolean isShowTracing() {
		return showTracing;
	}

	@Override
	public void setShowTracing(boolean showTracing) {
		this.showTracing = showTracing;
	}

	@Override
	public QueryInterface where(String condition) {
		if(!this.whereIsCall) {
			this.sql += " WHERE "+condition;
			this.whereIsCall = true;
		}
		return this;
	}
	
	protected QueryInterface filterWhere(String condition) {
		this.sql += condition;
		return this;
	}
	
	@Override
	public QueryInterface where() {
		return this.where("1=1");
	}
	
	@Override
	public QueryInterface addLong(String columnName,Long value) {
		this.addColumn(columnName, value, Long.class);
		return this;
	}

	@Override
	public QueryInterface addDouble(String columnName,Double value) {
		this.addColumn(columnName, value, Double.class);
		return this;
	}

	@Override
	public QueryInterface addFloat(String columnName,Float value) {
		this.addColumn(columnName, value, Float.class);
		return this;
	}

	@Override
	public QueryInterface addShort(String columnName,Short value) {
		this.addColumn(columnName, value, Short.class);
		return this;
	}

	@Override
	public QueryInterface addDate(String columnName,String value,String format) {
		this.addColumn(columnName, value, java.sql.Date.class,format);
		return this;
	}
	
	@Override
	public QueryInterface addDate(String columnName,String value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}
	
	@Override
	public QueryInterface addDate(String columnName,java.sql.Date value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}

	@Override
	public QueryInterface addDate(String columnName,java.util.Date value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}

	@Override
	public QueryInterface addDate(String columnName,java.util.Date value,String format) {
		this.addColumn(columnName, value, java.util.Date.class,format);
		return this;
	}
	
	@Override
	public QueryInterface addDate(String columnName,java.sql.Date value,String format) {
		this.addColumn(columnName, value, java.sql.Date.class,format);
		return this;
	}
	
	@Override
	public QueryInterface add(Column col,Object value) {
		this.addColumn(col.getName(), value,col.getType());
		return this;
	}
	
	@Override
	public QueryInterface addString(String columnName,String value) {
		this.addColumn(columnName, value, String.class);
		return this;
	}
	
	@Override
	public QueryInterface addInt(String columnName,Integer value) {
		this.addColumn(columnName, value, Integer.class);
		return this;
	}

	@Override
	public QueryInterface addBinaryStream(String columnName,FileInputStream value) {
		this.addColumn(columnName, value, FileInputStream.class);
		return this;
	}
	
	@Override
	public QueryInterface addBinaryStream(String columnName,InputStream value) {
		this.addColumn(columnName, value, InputStream.class);
		return this;
	}

	@Override
    public QueryInterface addObject(String columnName,Object value) {
        this.addColumn(columnName, value, Object.class);
        return this;
    }
    
	@Override
    public QueryInterface addTimestamp(String columnName,Timestamp value) {
        this.addColumn(columnName, value, Timestamp.class);
        return this;
    }

	@Override
    public QueryInterface addArray(String columnName,ArrayList<?> value) {
        this.addColumn(columnName, value, Array.class);
        return this;
    }

	@Override
    public QueryInterface addAsciiStream(String columnName,InputStream value) {
        this.addColumn(columnName, value, InputStream.class);
        return this;
    }

	@Override
    public QueryInterface addClob(String columnName,Clob value) {
        this.addColumn(columnName, value, Clob.class);
        return this;
    } 

	@Override
    public QueryInterface addBlob(String columnName,Blob value) {
        this.addColumn(columnName, value, Blob.class);
        return this;
    } 

	@Override
    public QueryInterface addByte(String columnName,byte[] value) {
        this.addColumn(columnName, value, Byte[].class);
        return this;
    }  
    
	@Override
    public QueryInterface addByte(String columnName,byte value) {
        this.addColumn(columnName, Byte.valueOf(value), Byte.class);
        return this;
    }  
    
    @Override
    public QueryInterface addBoolean(String columnName,boolean value) {
        this.addColumn(columnName, value, Boolean.class);
        return this;
    }  
    
    @Override
    public QueryInterface addBigDecimal(String columnName,BigDecimal value) {
        this.addColumn(columnName, value, BigDecimal.class);
        return this;
	}
	
	    
    @Override
    public QueryInterface addBigInteger(String columnName,BigInteger value) {
        this.addColumn(columnName, value, BigInteger.class);
        return this;
    }
    
    @Override
    public QueryInterface addTime(String columnName,Time value) {
        this.addColumn(columnName, value, Time.class);
        return this;
    }
    
	protected void addColumn(String name,Object value,Object type) {
		this.addColumn(name, value, type, null);
	}
	
	protected void addColumn(String name,Object value,Object type,String format) {
		String name_ = this.recq.removeAlias(name);
		Column c = new Column();
		c.setName(name_);
		c.setDefaultValue(value);
		c.setType(type);
		c.setFormat(format);
		c.setAfterWhere(whereIsCall);
		this.columnsValue.add(c);
	}
	

	protected String resolveDuplicateParam(String name) {
		/**
		 * Remove duplicate params name for sql update
		 * UPDATE TABLE1 SET estado=:estado,date_update=:date_update WHERE id=:id AND  UPPER(estado) = :estado 
		 */
		String name_ = name;
		if((this instanceof QueryUpdate|| (this.operationType!=null && this.operationType.compareTo(OperationType.UPDATE)==0)) && this.columnsValue!=null) {
			String n = name;
			List<Column> cols = this.columnsValue.stream().filter(col->col.getName()!=null && col.getName().equalsIgnoreCase(n)).toList();
			if(cols!=null && !cols.isEmpty()) {
				name_ = name+"_"+cols.size();
			}
		}
		return name_;
	}


	@Override
	public String getSql() {
		return this.sql;
	}
	
	public String getSqlExecute() {
		if(this instanceof QueryInsert || (this.operationType!=null && this.operationType.compareTo(OperationType.INSERT)==0)) {
			this.sql = this.getSqlInsert(this.getSchemaName(),this.getColumnsValue(), this.getTableName()) + this.sql;
		}
		else if(this instanceof QueryUpdate || (this.operationType!=null && this.operationType.compareTo(OperationType.UPDATE)==0)) {
			this.sql = this.getSqlUpdate(this.getSchemaName(),this.getColumnsValue(), this.getTableName()) + this.sql;
		}
		else if(this instanceof QueryDelete || (this.operationType!=null && this.operationType.compareTo(OperationType.DELETE)==0)) {
			this.sql = this.getSqlDelete(this.getSchemaName(), this.getTableName()) + this.sql;
		}
		return sql;
	}

	public void setSql(String sql) {
		this.sql += sql;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Override
	public String getConnectionName() {
		return connectionName;
	}

	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}

	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}

	public List<DatabaseMetadaHelper.Column> getColumnsValue() {
		return columnsValue;
	}

	public void setColumnsValue(List<DatabaseMetadaHelper.Column> columnsValue) {
		this.columnsValue = columnsValue;
	}

	public String getSqlInsert(String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		String tableName_ = (schemaName!=null && !schemaName.isEmpty())? schemaName + "." + tableName:tableName;//Adiciona schema
		StringBuilder inserts = new StringBuilder();
		StringBuilder values = new StringBuilder();
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				inserts.append(col.getName().toLowerCase()).append(",");
				values.append(":").append(col.getName().toLowerCase()).append(",");
			}
		}	
		inserts = new StringBuilder(inserts.substring(0, inserts.length() - 1));
		values = new StringBuilder(values.substring(0, values.length() - 1));
		return "INSERT INTO "+tableName_+" ("+inserts+") VALUES ("+values+")";
	}
	

	public String getSqlUpdate(String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		String tableName_ = (schemaName!=null && !schemaName.isEmpty())? schemaName + "." + tableName:tableName;//Adiciona schema
		StringBuilder updates = new StringBuilder();
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement() && !col.isAfterWhere()) {
				updates.append(col.getName().toLowerCase()).append("=:").append(col.getName().toLowerCase()).append(",");
			}
		}	
		updates = new StringBuilder(Core.isNotNull(updates.toString()) ? updates.substring(0, updates.length() - 1) : "");
       return "UPDATE " + tableName_ + " SET " + updates;
	}
	
	public String getSqlDelete(String schemaName, String tableName) {
		String tableName_ = (schemaName!=null && !schemaName.isEmpty())? schemaName + "." + tableName:tableName;//Adiciona schema
		return "DELETE FROM "+tableName_;
	}

	@Override
	public ResultSet executeTransaction() throws SQLException {
		throw new UnsupportedOperationException();
	}

	@Override
	public ResultSet execute() {
		ResultSet r = new ResultSet();
		try (Connection conn = nosi.core.webapp.databse.helpers.Connection.getConnection(this.getConnectionName())) {
			if (conn != null) {
				conn.setAutoCommit(this.isAutoCommit);
				if (this instanceof QueryInsert) {
					executeInsertQuery(conn, r);
				} else {
					executeUpdateQuery(conn, r);
				}
				if (!this.isAutoCommit) {
					conn.commit();
				}
			}
		} catch (SQLException e) {
			this.setError(r, e);
		}
		this.resetQuery();
		this.whereIsCall = false;
		return r;
	}

	private void executeInsertQuery(Connection conn, ResultSet r) throws SQLException {
		try (NamedParameterStatement q = createStatementForInsert(conn)) {
			this.setParameters(q);
			Core.log("SQL:" + q.getSql());
			r.setSql(q.getSql());
			r.setKeyValue(q.executeInsert(this.tableName));
		} catch (SQLException e) {
			this.setError(r, e);
		}
	}

	private NamedParameterStatement createStatementForInsert(Connection conn) throws SQLException {
		if (this.retuerningKeys != null) {
			return new NamedParameterStatement(conn, this.getSqlExecute(), this.retuerningKeys);
		} else {
			return new NamedParameterStatement(conn, this.getSqlExecute(), Statement.RETURN_GENERATED_KEYS);
		}
	}

	private void executeUpdateQuery(Connection conn, ResultSet r) throws SQLException {
		try (NamedParameterStatement q = new NamedParameterStatement(conn, this.getSqlExecute())) {
			this.setParameters(q);
			Core.log("SQL:" + q.getSql());
			r.setSql(q.getSql());
			r.setKeyValue(q.executeUpdate());
		} catch (SQLException e) {
			this.setError(r, e);
		}
	}



	protected void resetQuery() {
		this.columnsValue = new ArrayList<>();//restart mapped columns
		this.sql = "";
	}

	@Override
	public String getSqlWithData() {
		Connection conn = nosi.core.webapp.databse.helpers.Connection.getConnection(this.getConnectionName());
		if (conn != null) {
			NamedParameterStatement q = null;
			if (this instanceof QueryInsert) {
				try {

					if (this.retuerningKeys != null) {
						q = new NamedParameterStatement(conn, this.getSqlExecute(), this.retuerningKeys);
					} else {
						q = new NamedParameterStatement(conn, this.getSqlExecute(), Statement.RETURN_GENERATED_KEYS);
					}
					this.setParameters(q);
					this.sql = q.getSql();
				} catch (SQLException e) {
					this.setError(null, e);
				}
			} else {
				try {
					q = new NamedParameterStatement(conn, this.getSql());
					this.setParameters(q);
					this.sql = q.getSql();
				} catch (SQLException e) {
					this.setError(null, e);
				}
			}
			try {
				if (q != null)
					q.close();
			} catch (SQLException e) {
				this.setError(null, e);
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return this.sql;
	}
	
	protected void setParameters(NamedParameterStatement q) throws SQLException {
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {	
			ParametersHelper.setParameter(q,col.getDefaultValue(),col);
		}
	}

	@Override
	public List<Tuple> getResultList() {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public Tuple getSingleResult(){
		throw new UnsupportedOperationException();
	}
	
	@Override
	public <T> List<T> getResultList(Class<T> type){
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, String value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orderBy(String[]... orderByNames) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface groupBy(String... groupByNames) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface between(String name, Object value1, Object value2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface notBetween(String name, Object value, Object value2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface exists(String value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface notExists(String value) {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public QueryInterface innerJoin(String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface leftJoin(String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface rightJoin( String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface outerJoin( String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface selfJoin( String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface union() {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface unionAll() {
		throw new UnsupportedOperationException();
	}
	@Override
	public QueryInterface andWhereNotNull(String name) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhereIsNull(String name) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhereNotNull(String name) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhereIsNull(String name) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float[] values) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, Integer value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, Double value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, Float value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface from(String tables) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface select(String collumns) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface innerJoin(String table1, String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface leftJoin(String table1, String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface rightJoin(String table1, String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface outerJoin(String table1, String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface selfJoin(String table1, String table2, String key1, String key2) {
		throw new UnsupportedOperationException();
	}

	@Override
	public Record getRecordList() {
		throw new UnsupportedOperationException();
	}

	@Override
	public Record getSingleRecord() {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public TypedQuery<?> getTypedQuery(){
		throw new UnsupportedOperationException();
	}
	
	@Override
	public QueryInterface whereNotNull(String name) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface whereIsNull(String name) {
		throw new UnsupportedOperationException();
	}


	
	@Override
	public QueryInterface returning(String... retuerningKeys) {
		this.retuerningKeys = retuerningKeys;
		return this;
	}

	@Override
	public QueryInterface setAutoCommit(boolean isAutoCommit) {
		this.isAutoCommit = isAutoCommit;
		return this;
	}

	@Override
	public QueryInterface and() {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface or() {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface limit(int limit) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface offset(int offset) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface any(String subQuery) {
		throw new UnsupportedOperationException();
	}

	protected void setError(ResultSet resultSet, Exception e) {
		if (this.isShowError() && e != null) {

			Core.setMessageError(e.getMessage());
			Core.log(e.getMessage());

			if (resultSet != null)
				resultSet.setError(e.getMessage());

		}
		if (this.isShowTracing() && e != null)
			e.printStackTrace();
	}

	@Override
	public QueryInterface orderByAsc(String... columns) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orderByDesc(String... columns) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface where(String name, String operator, String value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface where(String name, String operator, Integer value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface where(String name, String operator, Float value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface where(String name, String operator, Double value) {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public QueryInterface where(String name, String operator, Date value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface where(String name, String operator, String value, String format) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Date value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String value, String format) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Date value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String value, String format) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, Date value) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface having(String name, String operator, String value, String format) {
		throw new UnsupportedOperationException();
	}

	@Override
	public List<Column> getParametersMap() {
		return this.columnsValue;
	}

	@Override
	public <T> T getSingleResult(Class<T> entity) {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public QueryInterface keepConnection() {
		this.keepConnection = true;
		return this;
	}
	
	
	protected void close() {
		if(!this.keepConnection && this.em!=null) {
			em.close();
			this.getSessionFactory().getCurrentSession().close();
		}
	}
	
	@Override
	public void closeConnection() throws SQLException {
		this.keepConnection = false;
		this.close();
	}

	@Override
	public void begin() throws SQLException{
		throw new UnsupportedOperationException();
	}

	@Override
	public void commit() throws SQLException{
		throw new UnsupportedOperationException();
	}

	@Override
	public void roolback() throws SQLException{
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface insert(String tableName) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface update(String tableName) {
		throw new UnsupportedOperationException();
	}

	@Override
	public QueryInterface delete(String tableName) {
		throw new UnsupportedOperationException();
	}
}
