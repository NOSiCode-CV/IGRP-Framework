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
import nosi.core.config.Connection;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 10 Dec 2017
 */
public class DatabaseMetadaHelper {

	public static List<String> getTables(Config_env config,String schema) {
		List<String> list = new ArrayList<>();
		if(config!=null ) {
			java.sql.Connection con = Connection.getConnection(config.getName());
			ResultSet tables = null;
			try {
				DatabaseMetaData metaData = con.getMetaData();
				tables = metaData.getTables(null, schema, null, new String[]{"TABLE"});//Get All Tables on the schema database
			    while (tables.next()) {
			    	list.add(tables.getString(3));//Get Table Name
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
			//PersistenceUtils.SESSION_FACTORY.remove(config.getName());
		}
		return list;
	}
	
	public static List<String> getPrimaryKeys(Config_env config,String schema,String tableName){
		if(config != null) {
			java.sql.Connection con = Connection.getConnection(config.getName());
			List<String> keys = getPrimaryKeys(con, schema, tableName);
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return keys;
		}
		return null;
	}
	
	//Get primary key of table
	public static List<String> getPrimaryKeys(java.sql.Connection con,String schema,String tableName){
		List<String> keys = new ArrayList<>();
		if(con != null) {
			DatabaseMetaData metaData;
			try {
				metaData = con.getMetaData();
				ResultSet keysR = metaData.getPrimaryKeys(null, schema, tableName);
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
	public static Map<String,String> getForeignKeys(Config_env config,String schema,String tableName){
		if(config != null) {
			java.sql.Connection con = Connection.getConnection(config.getName());
			Map<String,String> keys = getForeignKeys(con, schema, tableName);
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return keys;
		}
		return null;
	}
	
	public static Map<String,String> getForeignKeys(java.sql.Connection con,String schema,String tableName){
		Map<String,String> keys = new HashMap<>();
		if(con != null) {
			DatabaseMetaData metaData;
			try {
				metaData = con.getMetaData();
				ResultSet keysR = metaData.getImportedKeys(null, schema, tableName);
				while(keysR.next()) {
					keys.put(keysR.getString("FKCOLUMN_NAME").toLowerCase(),keysR.getString("PKTABLE_NAME").toLowerCase());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	
	public static List<String> getExportedKeys(java.sql.Connection con,String schema,String tableName){
		List<String> keys = new ArrayList<>();
		if(con != null) {
			DatabaseMetaData metaData;
			try {
				metaData = con.getMetaData();
				ResultSet keysR = metaData.getExportedKeys(null, schema, tableName);
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
	public static List<Column> getCollumns(String connectionName,String sql) {
		List<Column> list = new ArrayList<>();
		if(connectionName!=null && sql!=null) {
			java.sql.Connection con = Connection.getConnection(connectionName);
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
			    st = con.prepareStatement(sql);
			    rs = st.executeQuery();
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
	public static List<Column> getCollumns(Config_env config,String schema,String tableName) {
		List<Column> list = new ArrayList<>();
		if(config!=null) {
			java.sql.Connection con = Connection.getConnection(config.getName());
			PreparedStatement st = null;
			ResultSet rs = null;
			try {
			    List<String> pkeys = getPrimaryKeys(con, schema, tableName);	
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
	public static Map<String,String> getSchemas(Config_env config) {
		Map<String,String> schemasMap = new HashMap<>();
		schemasMap.put(null, "-- Escolha o Schema --");
		if(config!=null) {
			java.sql.Connection con = Connection.getConnection(config.getName());
			ResultSet schemas = null;
			try {
				DatabaseMetaData metaData = con.getMetaData();
				schemas = metaData.getSchemas();
			    while (schemas.next()) {
			    	String s = schemas.getString(1);
			    	if(!s.contains("pg_catalog") && !s.contains("information_schema")) {
			    		schemasMap.put(s,s);
			    	}
			    }
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(schemas!=null)
						schemas.close();
					if(con!=null)
						con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return schemasMap;
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
		
		@Override
		public String toString() {
			return "Column [schemaName=" + schemaName + ", name=" + name + ", type=" + type + ", typeSql=" + typeSql
					+ ", isAutoIncrement=" + isAutoIncrement + ", isPrimaryKey=" + isPrimaryKey + ", isNullable="
					+ isNullable + ", isForeignKey=" + isForeignKey + ", size=" + size + ", defaultValue="
					+ defaultValue + ", tableRelation=" + tableRelation + ", columnMap=" + columnMap + "]";
		}
		
	}


	public static Column getPrimaryKey(Config_env config, String schemaName, String tableName) {
		List<Column> list = getCollumns(config, schemaName, tableName);
		List<String> keys = getPrimaryKeys(config, schemaName, tableName);
		if(list!=null) {
			list = list.stream().filter(col->keys.contains(col.getName())).collect(Collectors.toList());
			return (list!=null && list.size()>0)?list.get(0):null;
		}
		return null;
	}

}
