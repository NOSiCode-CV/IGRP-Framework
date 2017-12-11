package nosi.core.webapp.databse.helpers;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import nosi.core.config.Connection;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 10 Dec 2017
 */
public class DatabaseMetadaHelper {

	public static List<String> getTables(String schema,Config_env config) {
		List<String> list = new ArrayList<>();
		if(config!=null ) {
			try {
				DatabaseMetaData metaData = Connection.getConnection(config.getName()).getMetaData();
				ResultSet schemas = metaData.getTables(null, schema, null, new String[]{"TABLE"});//Get All Tables on the schema database
			    while (schemas.next()) {
			    	list.add(schemas.getString(3));//Get Table Name
			    }
			    schemas.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//PersistenceUtils.SESSION_FACTORY.remove(config.getName());
		}
		return list;
	}
	
	public static List<Column> getCollumns(Config_env config,String schema,String tableName) {
		List<Column> list = new ArrayList<>();
		try {
			DatabaseMetaData metaData = Connection.getConnection(config.getName()).getMetaData();
			ResultSet columns = metaData.getColumns(null, schema, tableName, null);				
		    while (columns.next()) {
		    	Column col = new Column();
		    	Properties p = new Properties();
		    	Class<?> javaType = SqlJavaType.sqlToJava(columns.getInt( "DATA_TYPE"));
		    	p.setProperty("size",columns.getString("COLUMN_SIZE"));
	    		p.setProperty("name", columns.getString("COLUMN_NAME"));
		    	p.setProperty("isNullable", columns.getString("IS_NULLABLE"));
		    	p.setProperty("is_autoIncrment", columns.getString("IS_AUTOINCREMENT"));
		    	col.setName(columns.getString("COLUMN_NAME"));
		    	col.setType(javaType);
		    	col.setProperties(p);
		    	list.add(col);
		    }
		    columns.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//PersistenceUtils.SESSION_FACTORY.remove(config.getName());			
		return list;
	}

	public static Map<String,String> getSchemas(Config_env config) {
		Map<String,String> schemasMap = new HashMap<>();
		if(config!=null) {
			try {
				DatabaseMetaData metaData = Connection.getConnection(config.getName()).getMetaData();
				ResultSet schemas = metaData.getSchemas();
			    while (schemas.next()) {
			    	String s = schemas.getString(1);
			    	if(!s.contains("pg_catalog") && !s.contains("information_schema")) {
			    		schemasMap.put(s,s);
			    	}
			    }
			    schemas.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return schemasMap;
	}
	

	public static class Column{
		private String name;
		private Class<?> type;
		private boolean isAutoIncrement;
		private boolean isPrimaryKey;
		private boolean isNullable;
		private Properties properties;		
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Class<?> getType() {
			return type;
		}
		public void setType(Class<?> type) {
			this.type = type;
		}
		public Properties getProperties() {
			return properties;
		}
		public void setProperties(Properties properties) {
			this.properties = properties;
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
		
	}

}
