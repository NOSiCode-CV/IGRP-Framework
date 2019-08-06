package nosi.core.webapp.databse.helpers;

import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 10 Dec 2017
 * 
 * @revision 17/07/2019
 * @author joao.augoncalves
 */
public class DatabaseMetadaHelper {

	private Connection connection;
	private ParametersHelper paramHelper;
	
	public DatabaseMetadaHelper() {
		this.connection = new Connection();
		this.paramHelper = new ParametersHelper();
	}
	
	
	public List<String> getTables(Config_env config,String schema) {
		List<String> list = new ArrayList<>();
		try (java.sql.Connection con = this.connection.getConnection(config);
				ResultSet tables = con.getMetaData().getTables(null, schema, null, new String[] { "TABLE" });) {
			while (tables.next()) {
				list.add(tables.getString(3));// Get Table Name
			   }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<String> getPrimaryKeys(Config_env config,String schema,String tableName){
		try(java.sql.Connection con = this.connection.getConnection(config.getName())) {
			return this.getPrimaryKeys(con, schema, tableName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//Get primary key of table
	public List<String> getPrimaryKeys(java.sql.Connection con,String schema,String tableName){
		List<String> keys = new ArrayList<>();
		if(con != null) {
			try (ResultSet keysR = con.getMetaData().getPrimaryKeys(null, schema, tableName)){
				while(keysR.next()) {
					keys.add(keysR.getString("COLUMN_NAME").toLowerCase());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	
	//Get foreign key of table
	public Map<String,String> getForeignKeys(Config_env config,String schema,String tableName){
		try(java.sql.Connection con = this.connection.getConnection(config.getName())) {
			return this.getForeignKeys(con, schema, tableName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Map<String,String> getForeignKeys(java.sql.Connection con,String schema,String tableName){
		Map<String,String> keys = new HashMap<>();
		if(con != null) {
			try (ResultSet keysR = con.getMetaData().getImportedKeys(null, schema, tableName)){
				while(keysR.next()) {
					keys.put(keysR.getString("FKCOLUMN_NAME").toLowerCase(),keysR.getString("PKTABLE_NAME").toLowerCase());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	
	public List<String> getExportedKeys(java.sql.Connection con,String schema,String tableName){
		List<String> keys = new ArrayList<>();
		if(con != null) {
			try (ResultSet keysR = con.getMetaData().getExportedKeys(null, schema, tableName)){
				while(keysR.next()) {
					keys.add(keysR.getString("PKCOLUMN_NAME").toLowerCase());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	
	//Get collumns name of query
	public List<Column> getCollumns(String connectionName,String sql) {
		List<Column> list = new ArrayList<>();
		if(Core.isNotNull(sql)) {
			try(	java.sql.Connection con = this.connection.getConnection(connectionName);
					PreparedStatement st = con.prepareStatement(sql);
					ResultSet rs = st.executeQuery()) {
				ResultSetMetaData metaData = rs.getMetaData();
			    int columnsCount = metaData.getColumnCount();
			    for(int i=1;i<=columnsCount;i++) {
			    	Column col = new Column();
			    	col.setName(metaData.getColumnName(i));
			    	list.add(col);
			    }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	

	private void setParameters(NamedParameterStatement q,List<Column> parametersMap) throws SQLException {
		for(DatabaseMetadaHelper.Column col:parametersMap) {	
			 this.paramHelper.setParameter(q,col.getDefaultValue(),col);
		}
	}

	public List<Column> getCollumns(String connectionName, List<Column> parametersMap, String sql) {
			java.sql.Connection con = this.connection.getConnection(connectionName);
			List<Column> list = new ArrayList<>();
			if(con!=null && Core.isNotNull(sql)) {
				PreparedStatement st = null;
				ResultSet rs = null;
				try {
					NamedParameterStatement q = new NamedParameterStatement(con ,sql);
					this.setParameters(q,parametersMap);
				    st = con.prepareStatement(sql);
				    rs = q.executeQuery();
				    ResultSetMetaData metaData = rs.getMetaData();
				    int columnsCount = metaData.getColumnCount();
				    for(int i=1;i<=columnsCount;i++) {
				    	Column col = new Column();
				    	col.setName(metaData.getColumnName(i));
				    	list.add(col);
				    }
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					try {
						if(st!=null)
				    		st.close();
				    	if(rs!=null)
				    		rs.close();
						if(con!=null)
							con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}		
			return list;
	}
	
	//Get collumns name of table
	public List<Column> getCollumns(Config_env config,String schema,String tableName) {
		List<Column> list = new ArrayList<>();
		String justTablename = tableName;
		java.sql.Connection con = this.connection.getConnection(config);
		if(con!=null) {
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
			    List<String> pkeys = this.getPrimaryKeys(con, schema, tableName);	
			    Map<String,String> fkeys = getForeignKeys(con, schema, tableName);	
			    tableName = (schema!=null && !schema.equals(""))?schema+"."+tableName:tableName;
			    String sql = "SELECT * FROM "+tableName;
			    st = con.prepareStatement(sql);
			    rs = st.executeQuery();
			    ResultSetMetaData metaData = rs.getMetaData();
			    int columnsCount = metaData.getColumnCount();
			    for(int i=1;i<=columnsCount;i++) {
			    	Column col = new Column();
			    	col.setConnectionName(config.getName());
			    	col.setSchemaName(schema);
			    	col.setTypeSql(metaData.getColumnType(i));
			    	col.setSize(metaData.getColumnDisplaySize(i));
			    	col.setNullable(metaData.isNullable(i) > 0);
			    	col.setAutoIncrement(metaData.isAutoIncrement(i));
			    	col.setName(metaData.getColumnName(i));
			    	col.setPrimaryKey(pkeys!=null && pkeys.contains(col.getName()));
			    	if(fkeys!=null && fkeys.containsKey(col.getName())) {
				    	col.setForeignKey(true);
				    	col.setTableRelation(fkeys.get(col.getName()));
				    	List<String> colRelaction = getExportedKeys(con, schema, col.getTableRelation());
				    	if(colRelaction!=null && colRelaction.size()>0) {
				    		col.setColumnMap(colRelaction.get(0));
				    	}
			    	}
			    	col.setType(SqlJavaType.sqlToJava(metaData.getColumnType(i)));
			    	list.add(col);
			    }
			} catch (SQLException e) {		
				Core.setMessageError(justTablename+" error- "+e.getMessage());
				e.printStackTrace();
			}finally {
				try {
					if(st!=null)
			    		st.close();
			    	if(rs!=null)
			    		rs.close();
					if(con!=null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();				
				}
			}
		}		
		return list;
	}

	//Get Schemas of connection datasource
	public Map<String,String> getSchemas(Config_env config) {
		Map<String,String> schemasMap = new HashMap<>();
		schemasMap.put(null, Core.gt("-- Escolha o Schema --"));
		try(java.sql.Connection con = this.connection.getConnection(config);
			ResultSet schemas = con.getMetaData().getSchemas()) {
			while (schemas.next()) {
		    	String s = schemas.getString(1);
		    	if(!s.contains("pg_catalog") && !s.contains("information_schema")) {
		    		schemasMap.put(s,s);
		    	}
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return schemasMap;
	}
	//Not in use
		public Map<String,String> getTablesMap(Config_env config,String schema) {
			Map<String,String> list = new HashMap<>();
			java.sql.Connection con = this.connection.getConnection(config.getName());
			if(con!=null ) {
				ResultSet tables = null;
				try {
					DatabaseMetaData metaData = con.getMetaData();
					tables = metaData.getTables(null, schema, null, new String[]{"TABLE"});//Get All Tables on the schema database
				    while (tables.next()) {
				    	list.put(tables.getString(3),tables.getString(3));//Get Table Name
				    }
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					try {
						if(tables!=null)
							tables.close();
						if(con!=null)
							con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return list;
		}

	public static class Column{
		private String schemaName;
		private String name;
		private Object type;
		private int typeSql;
		private boolean isAutoIncrement;
		private boolean isPrimaryKey;
		private boolean isNullable;	
		private boolean isForeignKey;
		private int size;
		private Object defaultValue;
		private String tableRelation;
		private String columnMap;
		private String connectionName;
		private String format ="yyyy-mm-dd";
		private boolean afterWhere = false;
		
		public String getSchemaName() {
			return schemaName;
		}
		public void setSchemaName(String schemaName) {
			this.schemaName = schemaName;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name.toLowerCase();
		}
		public Object getType() {
			return type;
		}
		public void setType(Object type) {
			this.type = type;
		}
		public int getTypeSql() {
			return typeSql;
		}
		public void setTypeSql(int typeSql) {
			this.typeSql = typeSql;
		}
		public boolean isAutoIncrement() {
			return isAutoIncrement;
		}
		public void setAutoIncrement(boolean isAutoIncrement) {
			this.isAutoIncrement = isAutoIncrement;
		}
		public boolean isPrimaryKey() {
			return isPrimaryKey;
		}
		public void setPrimaryKey(boolean isPrimaryKey) {
			this.isPrimaryKey = isPrimaryKey;
		}
		public boolean isNullable() {
			return isNullable;
		}
		public void setNullable(boolean isNullable) {
			this.isNullable = isNullable;
		}
		public int getSize() {
			return size;
		}
		public void setSize(int size) {
			this.size = size;
		}
		public Object getDefaultValue() {
			return defaultValue;
		}
		public void setDefaultValue(Object defaultValue) {
			this.defaultValue = defaultValue;
		}	
		public boolean isForeignKey() {
			return isForeignKey;
		}
		public void setForeignKey(boolean isForeignKey) {
			this.isForeignKey = isForeignKey;
		}
		public String getTableRelation() {
			return tableRelation;
		}
		public void setTableRelation(String tableRelation) {
			this.tableRelation = tableRelation;
		}		
		
		public String getColumnMap() {
			return columnMap;
		}
		public void setColumnMap(String columnMap) {
			this.columnMap = columnMap;
		}		
		
		public String getConnectionName() {
			return connectionName;
		}
		public void setConnectionName(String connectionName) {
			this.connectionName = connectionName;
		}		
		
		public String getFormat() {
			return format;
		}
		public void setFormat(String format) {
			this.format = format;
		}
		
		public boolean isAfterWhere() {
			return afterWhere;
		}
		public void setAfterWhere(boolean afterWhere) {
			this.afterWhere = afterWhere;
		}
		@Override
		public String toString() {
			return "Column [schemaName=" + schemaName + ", name=" + name + ", type=" + type + ", typeSql=" + typeSql
					+ ", isAutoIncrement=" + isAutoIncrement + ", isPrimaryKey=" + isPrimaryKey + ", isNullable="
					+ isNullable + ", isForeignKey=" + isForeignKey + ", size=" + size + ", defaultValue="
					+ defaultValue + ", tableRelation=" + tableRelation + ", columnMap=" + columnMap + "]";
		}
		
	}


	public Column getPrimaryKey(Config_env config, String schemaName, String tableName) {
		List<Column> list = getCollumns(config, schemaName, tableName);
		List<String> keys = getPrimaryKeys(config, schemaName, tableName);
		if(list!=null) {
			list = list.stream().filter(col->keys.contains(col.getName())).collect(Collectors.toList());
			return (list!=null && list.size()>0)?list.get(0):null;
		}
		return null;
	}

	public List<Column> getCollumns(Config_env config_env, String sql) throws SQLException {
		List<Column> list = new ArrayList<>();
		if(config_env!=null && sql!=null) {
			try(java.sql.Connection con = this.connection.getConnection(config_env);
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery()) {
				
				ResultSetMetaData metaData = rs.getMetaData();
				int columnsCount = metaData.getColumnCount();
				for(int i=1;i<=columnsCount;i++) {
					Column col = new Column();
					col.setName(metaData.getColumnName(i));
					list.add(col);
				}
			} catch (SQLException e) {
					e.printStackTrace();
			}
		}
		return list;
	}
}
