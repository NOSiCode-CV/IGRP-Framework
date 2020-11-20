package cv.nosi.core.webapp.util.helpers.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cv.nosi.core.webapp.util.Core;
import cv.nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel 10 Dec 2017
 */
public class DatabaseMetadaHelper {
	
	private static String TABLE_TYPE_TABLE = "TABLE";
	private static String TABLE_TYPE_VIEW = "VIEW";
	private static String TABLE_TYPE_SYSTEM_TABLE = "SYSTEM TABLE";
	private static String TABLE_TYPE_GLOBAL_TEMPORARY = "GLOBAL TEMPORARY";
	private static String TABLE_TYPE_LOCAL_TEMPORARY = "LOCAL TEMPORARY";
	private static String TABLE_TYPE_ALIAS = "ALIAS";
	private static String TABLE_TYPE_SYNONYM = "SYNONYM";
	
	public static List<String> getTables(Config_env config, String schema, String type_table) {
		List<String> list = new ArrayList<>();
		try (java.sql.Connection con = Connection.getConnection(config);
				ResultSet tables = con.getMetaData().getTables(null, schema, null, new String[] { "TABLE","VIEW", "SYSTEM TABLE", "GLOBAL TEMPORARY","LOCAL TEMPORARY", "ALIAS", "SYNONYM" });) {
			// Get All Tables on the schema database
			while (tables.next()) {
				if(TABLE_TYPE_TABLE.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_TABLE)) {
					list.add(tables.getString("TABLE_NAME"));// Get Table Name
					}else if(TABLE_TYPE_VIEW.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_VIEW)) {
						list.add(tables.getString("TABLE_NAME"));// Get view Name
						}else if(TABLE_TYPE_SYSTEM_TABLE.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_SYSTEM_TABLE)) {
							list.add(tables.getString("TABLE_NAME"));// Get SYSTEM TABLE Name
							}else if(TABLE_TYPE_GLOBAL_TEMPORARY.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_GLOBAL_TEMPORARY)) {
								list.add(tables.getString("TABLE_NAME"));// Get GLOBAL TEMPORARY Name
								}else if(TABLE_TYPE_LOCAL_TEMPORARY.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_LOCAL_TEMPORARY)) {
									list.add(tables.getString("TABLE_NAME"));// Get LOCAL TEMPORARY Name
									}else if(TABLE_TYPE_ALIAS.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_ALIAS))
										list.add(tables.getString("TABLE_NAME"));// Get ALIAS Name
										else if(TABLE_TYPE_SYNONYM.equalsIgnoreCase(type_table) && tables.getString("TABLE_TYPE").equalsIgnoreCase(TABLE_TYPE_SYNONYM)) {
											list.add(tables.getString("TABLE_NAME"));// Get SYNONYM Name
										}
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<String> getPrimaryKeys(Config_env config, String schema, String tableName) {
		try (java.sql.Connection con = Connection.getConnection(config.getName())) {
			List<String> keys = getPrimaryKeys(con, schema, tableName);
			return keys;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Get primary key of table
	public static List<String> getPrimaryKeys(java.sql.Connection con, String schema, String tableName) {
		List<String> keys = new ArrayList<>();
		if (con != null) {
			try (ResultSet keysR = con.getMetaData().getPrimaryKeys(null, schema, tableName)) {
				while (keysR.next()) {
					keys.add(keysR.getString("COLUMN_NAME"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}

	// Get foreign key of table
	public Map<String, String> getForeignKeys(Config_env config, String schema, String tableName,String dad) {
		try (java.sql.Connection con = Connection.getConnection(config.getName(), dad)) {
			return getForeignKeysTableName(con, schema, tableName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// Get foreign key of constrain name
	public Map<String, String> getForeignKeysConstrainName(Config_env config, String schema, String tableName,String dad) {
		try (java.sql.Connection con = Connection.getConnection(config.getName(), dad)) {
			return getForeignKeysConstrainName(con, schema, tableName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public static Map<String, String> getForeignKeysTableName(java.sql.Connection con, String schema, String tableName) {
		Map<String, String> keys = new HashMap<>();
		if (con != null) {
			try (ResultSet keysR = con.getMetaData().getImportedKeys(null, schema, tableName)) {
				while (keysR.next()) {
					keys.put(keysR.getString("FKCOLUMN_NAME"),
							keysR.getString("PKTABLE_NAME"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	
	public static Map<String, String> getForeignKeysConstrainName(java.sql.Connection con, String schema, String tableName) {
		Map<String, String> keys = new HashMap<>();
		if (con != null) {
			try (ResultSet keysR = con.getMetaData().getImportedKeys(null, schema, tableName)) {
				while (keysR.next()) {
					keys.put(keysR.getString("FKCOLUMN_NAME"),
							keysR.getString("FK_NAME"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}
	

	public static List<String> getExportedKeys(java.sql.Connection con, String schema, String tableName) {
		List<String> keys = new ArrayList<>();
		if (con != null) {
			try (ResultSet keysR = con.getMetaData().getExportedKeys(null, schema, tableName)) {
				while (keysR.next()) {
					keys.add(keysR.getString("PKCOLUMN_NAME"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return keys;
	}

	// Get collumns name of query
	public static List<Column> getCollumns(String connectionName, String sql) {
		List<Column> list = new ArrayList<>();
		if (Core.isNotNull(sql)) {
			try (java.sql.Connection con = Connection.getConnection(connectionName);
					PreparedStatement st = con.prepareStatement(sql);
					ResultSet rs = st.executeQuery()) {
				ResultSetMetaData metaData = rs.getMetaData();
				int columnsCount = metaData.getColumnCount();
				for (int i = 1; i <= columnsCount; i++) {
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

	private static void setParameters(NamedParameterStatement q, List<Column> parametersMap) throws SQLException {
		for (DatabaseMetadaHelper.Column col : parametersMap) {
			ParametersHelper.setParameter(q, col.getDefaultValue(), col);
		}
	}

	public static List<Column> getCollumns(String connectionName, List<Column> parametersMap, String sql) {
		List<Column> list = new ArrayList<>();
		if (Core.isNotNull(sql)) {
			try (java.sql.Connection con = Connection.getConnection(connectionName);
					PreparedStatement st = con.prepareStatement(sql)) {
				NamedParameterStatement q = new NamedParameterStatement(con, sql);
				setParameters(q, parametersMap);
				try (ResultSet rs = q.executeQuery()) {
					ResultSetMetaData metaData = rs.getMetaData();
					int columnsCount = metaData.getColumnCount();
					for (int i = 1; i <= columnsCount; i++) {
						Column col = new Column();
						col.setName(metaData.getColumnName(i));
						list.add(col);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// Get collumns name of table
	public static List<Column> getCollumns(Config_env config, String schema, String tableName) {
		List<Column> list = new ArrayList<>();
		String justTablename = tableName;
		try (java.sql.Connection con = Connection.getConnection(config)) {
			List<String> pkeys = getPrimaryKeys(con, schema, tableName);
			Map<String, String> fkeys = getForeignKeysTableName(con, schema, tableName);
			justTablename = (schema != null && !schema.equals("")) ? schema + "." + tableName : tableName;
			String sql = "SELECT * FROM " + justTablename;
			try (PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
				ResultSetMetaData metaData = rs.getMetaData();
				int columnsCount = metaData.getColumnCount();
				for (int i = 1; i <= columnsCount; i++) {
					Column col = new Column();
					col.setConnectionName(config.getName());
					col.setSchemaName(schema);
					col.setTypeSql(metaData.getColumnType(i));
					col.setSize(metaData.getColumnDisplaySize(i));
					col.setNullable(metaData.isNullable(i) > 0);
					col.setAutoIncrement(metaData.isAutoIncrement(i));
					col.setColumnTypeName​(metaData.getColumnTypeName(i));
					col.setName(metaData.getColumnName(i));
					col.setPrimaryKey(pkeys != null && pkeys.contains(col.getName()));
					if (fkeys != null && fkeys.containsKey(col.getName())) {
						col.setForeignKey(true);
						col.setTableRelation(fkeys.get(col.getName()));
						List<String> colRelaction = getExportedKeys(con, schema, col.getTableRelation());
						if (colRelaction != null && colRelaction.size() > 0) {
							col.setColumnMap(colRelaction.get(0));
						}
					}
					col.setType(SqlJavaType.sqlToJava(metaData.getColumnType(i)));
					list.add(col);
				}
			}
		} catch (SQLException e) {
			Core.setMessageError(justTablename + " error- " + e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	// Get Schemas of connection datasource
	public static Map<String, String> getSchemas(Config_env config) {
		Map<String, String> schemasMap = new HashMap<>();
		schemasMap.put(null, "-- Escolha o Schema --");
		try (java.sql.Connection con = Connection.getConnection(config);
				ResultSet schemas = con.getMetaData().getSchemas()) {
			while (schemas.next()) {
				String s = schemas.getString(1);
				if (!s.contains("pg_catalog") && !s.contains("information_schema")) {
					schemasMap.put(s, s);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return schemasMap;
	}

	// Not in use
	public static Map<String, String> getTablesMap(Config_env config, String schema) {
		Map<String, String> list = new HashMap<>();
		try (java.sql.Connection con = Connection.getConnection(config.getName());
				ResultSet tables = con.getMetaData().getTables(null, schema, null, new String[] { "TABLE" })) {
			while (tables.next()) {
				list.put(tables.getString(3), tables.getString(3));// Get Table Name
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static class Column {
		private String schemaName;
		private String name;
		private Object type;
		private int typeSql;
		private boolean isAutoIncrement;
		private boolean isPrimaryKey;
		private boolean isNullable;
		private boolean isForeignKey;
		private Integer size;
		private Object defaultValue;
		private String tableRelation;
		private String columnMap;
		private String connectionName;
		private String format = "yyyy-mm-dd";
		private String ColumnTypeName​;
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
			this.name = name;
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

		public Integer getSize() {
			return size;
		}

		public void setSize(Integer size) {
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

		public String getColumnTypeName​() {
			return ColumnTypeName​;
		}

		public void setColumnTypeName​(String columnTypeName​) {
			ColumnTypeName​ = columnTypeName​;
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

	public static Column getPrimaryKey(Config_env config, String schemaName, String tableName) {
		List<Column> list = getCollumns(config, schemaName, tableName);
		List<String> keys = getPrimaryKeys(config, schemaName, tableName);
		if (list != null) {
			list = list.stream().filter(col -> keys.contains(col.getName())).collect(Collectors.toList());
			return (list != null && list.size() > 0) ? list.get(0) : null;
		}
		return null;
	}

	public static List<Column> getCollumns(Config_env config_env, String sql) throws SQLException {
		List<Column> list = new ArrayList<>();
		if (Core.isNotNull(sql)) {
			try (java.sql.Connection con = Connection.getConnection(config_env);
					PreparedStatement st = con.prepareStatement(sql);
					ResultSet rs = st.executeQuery()) {
				ResultSetMetaData metaData = rs.getMetaData();
				int columnsCount = metaData.getColumnCount();
				for (int i = 1; i <= columnsCount; i++) {
					Column col = new Column();
					col.setName(metaData.getColumnName(i));
					list.add(col);
				}
			}
		}
		return list;
	}

}