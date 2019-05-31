package nosi.core.webapp.databse.helpers;


import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
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
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.base.ActiveRecord.ResolveColumnNameQuery;
import nosi.core.config.ConfigApp;
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
	protected Config_env config_env;
	protected String[] retuerningKeys;
	protected boolean isAutoCommit = false;
	protected nosi.core.config.Connection connection;
	protected ParametersHelper paramHelper;
	private boolean showError = true;
	private boolean showTracing = true;
	protected ResolveColumnNameQuery recq;
	protected boolean keepConnection = false;
	protected EntityManager em = null;
	
	public QueryHelper(Object connectionName) {
		this();
		if(Core.isNotNull(connectionName) && connectionName instanceof Config_env) {
			this.config_env = (Config_env) connectionName;			
		}
		this.connectionName = this.getMyConnectionName(connectionName);
	}	

	public QueryHelper() {
		this.columnsValue = new ArrayList<>();
		this.connection = new nosi.core.config.Connection();
		this.paramHelper = new ParametersHelper();
		this.recq = new ResolveColumnNameQuery(this.getClass());
	}
	
	private String getMyConnectionName(Object connectionName) {
		if(Core.isNotNull(connectionName))
			return connectionName.toString();
		return ConfigApp.getInstance().getH2IGRPBaseConnection();
	}


	protected SessionFactory getSessionFactory() {
		if(this.config_env!=null) {
			return HibernateUtils.getSessionFactory(config_env);
		}
		return HibernateUtils.getSessionFactory(this.getConnectionName(),null);
	}
	
	public boolean isShowError() {
		return showError;
	}

	public void setShowError(boolean showError) {
		this.showError = showError;
	}

	public boolean isShowTracing() {
		return showTracing;
	}

	public void setShowTracing(boolean showTracing) {
		this.showTracing = showTracing;
	}

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
	
	public QueryInterface where() {
		return this.where("1=1");
	}
	
	public QueryInterface addLong(String columnName,Long value) {
		this.addColumn(columnName, value, Long.class);
		return this;
	}

	public QueryInterface addDouble(String columnName,Double value) {
		this.addColumn(columnName, value, Double.class);
		return this;
	}

	public QueryInterface addFloat(String columnName,Float value) {
		this.addColumn(columnName, value, Float.class);
		return this;
	}

	public QueryInterface addShort(String columnName,Short value) {
		this.addColumn(columnName, value, Short.class);
		return this;
	}

	public QueryInterface addDate(String columnName,String value,String format) {
		this.addColumn(columnName, value, java.sql.Date.class,format);
		return this;
	}
	
	public QueryInterface addDate(String columnName,String value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}
	
	public QueryInterface addDate(String columnName,java.sql.Date value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}

	public QueryInterface addDate(String columnName,java.util.Date value) {
		return addDate(columnName, value, "yyyy-mm-dd");
	}

	public QueryInterface addDate(String columnName,java.util.Date value,String format) {
		this.addColumn(columnName, value, java.util.Date.class,format);
		return this;
	}
	
	public QueryInterface addDate(String columnName,java.sql.Date value,String format) {
		this.addColumn(columnName, value, java.sql.Date.class,format);
		return this;
	}
	
	public QueryInterface add(Column col,Object value) {
		this.addColumn(col.getName(), value,col.getType());
		return this;
	}
	
	public QueryInterface addString(String columnName,String value) {
		this.addColumn(columnName, value, String.class);
		return this;
	}
	
	public QueryInterface addInt(String columnName,Integer value) {
		this.addColumn(columnName, value, Integer.class);
		return this;
	}

	public QueryInterface addBinaryStream(String columnName,FileInputStream value) {
		this.addColumn(columnName, value, FileInputStream.class);
		return this;
	}
	public QueryInterface addBinaryStream(String columnName,InputStream value) {
		this.addColumn(columnName, value, InputStream.class);
		return this;
	}

    public QueryInterface addObject(String columnName,Object value) {
        this.addColumn(columnName, value, Object.class);
        return this;
    }
    
    public QueryInterface addTimestamp(String columnName,Timestamp value) {
        this.addColumn(columnName, value, Timestamp.class);
        return this;
    }

    public QueryInterface addArray(String columnName,ArrayList<?> value) {
        this.addColumn(columnName, value, Array.class);
        return this;
    }

    public QueryInterface addAsciiStream(String columnName,InputStream value) {
        this.addColumn(columnName, value, InputStream.class);
        return this;
    }

    public QueryInterface addClob(String columnName,Clob value) {
        this.addColumn(columnName, value, Clob.class);
        return this;
    } 

    public QueryInterface addBlob(String columnName,Blob value) {
        this.addColumn(columnName, value, Blob.class);
        return this;
    } 

    public QueryInterface addByte(String columnName,byte[] value) {
        this.addColumn(columnName, value, Byte[].class);
        return this;
    }  
    
    public QueryInterface addByte(String columnName,byte value) {
        this.addColumn(columnName, value, Byte.class);
        return this;
    }  
    
    public QueryInterface addBoolean(String columnName,boolean value) {
        this.addColumn(columnName, value, Boolean.class);
        return this;
    }  
    
    public QueryInterface addBigDecimal(String columnName,BigDecimal value) {
        this.addColumn(columnName, value, BigDecimal.class);
        return this;
    }
    
    public QueryInterface addTime(String columnName,Time value) {
        this.addColumn(columnName, value, Time.class);
        return this;
    }
    
	protected void addColumn(String name,Object value,Object type) {
		this.addColumn(name, value, type, null);
	}
	
	protected void addColumn(String name,Object value,Object type,String format) {
		name = this.recq.removeAlias(name);
		Column c = new Column();
		if(this instanceof QueryUpdate) {
			name = this.resolveDuplicateParam(name);
		}
		c.setName(name);
		c.setDefaultValue(value);
		c.setType(type);
		c.setFormat(format);
		c.setAfterWhere(whereIsCall);
		this.columnsValue.add(c);
	}
	

	protected String resolveDuplicateParam(String name) {
		if(this instanceof QueryUpdate && this.columnsValue!=null) {
			String n = name;
			List<Column> cols = this.columnsValue.stream().filter(col->col.getName()!=null && col.getName().equalsIgnoreCase(n)).collect(Collectors.toList());
			if(cols!=null && cols.size()>0) {
				name = name+"_"+cols.size();
			}
		}
		return name;
	}


	protected OperationType operationType;
	
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
		tableName = (schemaName!=null && !schemaName.equals(""))?schemaName+"."+tableName:tableName;//Adiciona schema
		String inserts = "";
		String values = "";
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				inserts += col.getName().toLowerCase()+",";
				values += ":"+col.getName().toLowerCase()+",";
			}
		}	
		inserts = inserts.substring(0, inserts.length()-1);
		values = values.substring(0, values.length()-1);
		return "INSERT INTO "+tableName+" ("+inserts+") VALUES ("+values+")";
	}
	

	public String getSqlUpdate(String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		tableName = (schemaName!=null && !schemaName.equals(""))?schemaName+"."+tableName:tableName;//Adiciona schema
		String updates = "";
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement() && !col.isAfterWhere()) {
				updates += col.getName().toLowerCase()+"=:"+col.getName().toLowerCase()+",";
			}
		}	
		updates = Core.isNotNull(updates)?updates.substring(0, updates.length()-1):"";
		String s = "UPDATE "+tableName +" SET "+updates;
		return s;
	}
	
	public String getSqlDelete(String schemaName, String tableName) {
		tableName = (schemaName!=null && !schemaName.equals(""))?schemaName+"."+tableName:tableName;//Adiciona schema
		return "DELETE FROM "+tableName;
	}


	@Override
	public ResultSet execute() {
		ResultSet r = new ResultSet();
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
					if(this.retuerningKeys!=null) {
						q = new NamedParameterStatement(conn ,this.getSqlExecute(),this.retuerningKeys);
					}else {
						q = new NamedParameterStatement(conn ,this.getSqlExecute(),Statement.RETURN_GENERATED_KEYS);
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
					String sql = this.getSqlExecute();
					q = new NamedParameterStatement(conn, sql);
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
		this.columnsValue = new ArrayList<>();//restart mapped columns
		this.sql = "";
		this.whereIsCall = false;
		return r;
	}
	

	@Override
	public String getSqlWithData() {
		Connection conn = this.connection.getConnection(this.getConnectionName());
		if(conn!=null) {
			NamedParameterStatement q = null;
			if(this instanceof QueryInsert) {
				try {
					
					if(this.retuerningKeys!=null) {
						q = new NamedParameterStatement(conn ,this.getSqlExecute(),this.retuerningKeys);
					}else {
						q = new NamedParameterStatement(conn ,this.getSqlExecute(),Statement.RETURN_GENERATED_KEYS);
					}
					this.setParameters(q);	
					this.sql = q.getSql();
				} catch (SQLException e) {
					this.setError(null, e);
				}
			}else {
				try {
					q = new NamedParameterStatement(conn, this.getSql());
					this.setParameters(q);
					this.sql = q.getSql();
				} catch (SQLException e) {
					this.setError(null, e);
				}
			}
			try {
				if(q!=null)
					q.close();
				if(conn!=null) 
					conn.close();
			} catch (SQLException e) {
				this.setError(null, e);
			}
		}
		return this.sql;
	}
	
	protected void setParameters(NamedParameterStatement q) throws SQLException {
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {	
			 this.paramHelper.setParameter(q,col.getDefaultValue(),col);
		}
	}

	public List<Tuple> getResultList() {
		throw new UnsupportedOperationException();
	}
	
	public Tuple getSigleResult() {
		throw new UnsupportedOperationException();
	}
	
	public Tuple getSingleResult(){
		throw new UnsupportedOperationException();
	}
	
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
	public Record getSigleRecord() {
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

	protected void setError(ResultSet r, Exception e) {
		if(this.isShowError()) {
			if(e!=null) {
				if(r!=null) {
					r.setError(e.getMessage());
				}
				Core.setMessageError(e.getMessage());
				Core.log(e.getMessage());
			}
		}
		if(this.isShowTracing()) {
			if(e!=null)
				e.printStackTrace();
		}
		
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
