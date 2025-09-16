package nosi.core.webapp.databse.helpers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel 10 Dec 2017
 */
public class DatabaseMetadaHelper {
	
	private static final String TABLE_TYPE = "TABLE_TYPE";
	private static final String TABLE_NAME = "TABLE_NAME";
	private static final String TABLE = "TABLE"; 
	private static final String VIEW = "VIEW";
	private static final String SYSTEM_TABLE = "SYSTEM TABLE";
	private static final String GLOBAL_TEMPORARY = "GLOBAL TEMPORARY";
	private static final String LOCAL_TEMPORARY = "LOCAL TEMPORARY";
	private static final String ALIAS = "ALIAS";
	private static final String SYNONYM = "SYNONYM";
	
	public static List<String> getTables(Config_env config, String schema, String tableType) {
		List<String> tableNames = new ArrayList<>();
		try (java.sql.Connection con = Connection.getConnection(config);
				ResultSet tables = con.getMetaData().getTables(null, schema, null, getTypesAsArray())) {
			// Get All Tables on the schema database
			while (tables.next()) {
				if (TABLE.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(TABLE)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get Table Name
				} else if (VIEW.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(VIEW)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get view Name
				} else if (SYSTEM_TABLE.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(SYSTEM_TABLE)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get SYSTEM TABLE Name
				} else if (GLOBAL_TEMPORARY.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(GLOBAL_TEMPORARY)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get GLOBAL TEMPORARY Name
				} else if (LOCAL_TEMPORARY.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(LOCAL_TEMPORARY)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get LOCAL TEMPORARY Name
				} else if (ALIAS.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(ALIAS))
					tableNames.add(tables.getString(TABLE_NAME));// Get ALIAS Name
				else if (SYNONYM.equalsIgnoreCase(tableType) && tables.getString(TABLE_TYPE).equalsIgnoreCase(SYNONYM)) {
					tableNames.add(tables.getString(TABLE_NAME));// Get SYNONYM Name
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tableNames;
	}	
	
	public static boolean tableOrViewExists(Config_env config, String schema, String tableViewName) {
		if (Core.isNotNull(tableViewName)) {
			try (java.sql.Connection connection = Connection.getConnection(config);
					ResultSet tables = connection.getMetaData().getTables(null, schema, null, new String[] { TABLE, VIEW })) {
				while (tables.next()) {
					final String table = tables.getString(TABLE_NAME);
					if (tableViewName.equalsIgnoreCase(table))
						return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	private static String[] getTypesAsArray() {
		return new String[] { TABLE, VIEW, SYSTEM_TABLE, GLOBAL_TEMPORARY,
				LOCAL_TEMPORARY, ALIAS, SYNONYM };
	}
	
	public static Map<String, String> getTableTypeOptions() {
		Map<String, String> tableTypeOptions = new LinkedHashMap<>();
		tableTypeOptions.put(TABLE.toLowerCase(), TABLE);
		tableTypeOptions.put(VIEW.toLowerCase(), VIEW);
		tableTypeOptions.put(SYSTEM_TABLE.toLowerCase(), SYSTEM_TABLE);
		tableTypeOptions.put(GLOBAL_TEMPORARY.toLowerCase(), GLOBAL_TEMPORARY);
		tableTypeOptions.put(LOCAL_TEMPORARY.toLowerCase(), LOCAL_TEMPORARY);
		tableTypeOptions.put(ALIAS.toLowerCase(), ALIAS);
		tableTypeOptions.put(SYNONYM.toLowerCase(), SYNONYM);
		return tableTypeOptions;
	}

	public static List<String> getPrimaryKeys(Config_env config, String schema, String tableName) {
		try (java.sql.Connection con = Connection.getConnection(config.getName())) {			
			return getPrimaryKeys(con, schema, tableName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}

	// Get primary key of table
	public static List<String> getPrimaryKeys(java.sql.Connection connection, String schema, String tableName) {
		List<String> keys = new ArrayList<>();
		if (connection != null) {
			try (ResultSet keysR = connection.getMetaData().getPrimaryKeys(connection.getCatalog(), schema, tableName)) {
				while (keysR.next()) {
					keys.add(keysR.getString("COLUMN_NAME"));
				}
			} catch (Exception e) {
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
			try (ResultSet keysR = con.getMetaData().getImportedKeys(con.getCatalog(), schema, tableName)) {
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
			try (ResultSet keysR = con.getMetaData().getImportedKeys(con.getCatalog(), schema, tableName)) {
				while (keysR.next()) {
					keys.put(keysR.getString("FKCOLUMN_NAME"),keysR.getString("FK_NAME"));
					keys.put(keysR.getString("FK_NAME"), keysR.getString("PKCOLUMN_NAME"));	
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
			try (ResultSet keysR = con.getMetaData().getExportedKeys(con.getCatalog(), schema, tableName)) {
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
    @Deprecated
	public static List<Column> getCollumns(String connectionName, List<Column> parametersMap, String sql) {
		List<Column> list = new ArrayList<>();
		if (Core.isNotNull(sql)) {
			try (java.sql.Connection con = Connection.getConnection(connectionName);
					PreparedStatement ignored = con.prepareStatement(sql)) {
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
			justTablename = (schema != null && !schema.isEmpty()) ? schema + "." + tableName : tableName;
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
					col.setPrimaryKey(pkeys.contains(col.getName()));
					if (fkeys.containsKey(col.getName())) {
						col.setForeignKey(true);
						col.setTableRelation(fkeys.get(col.getName()));
						List<String> colRelaction = getExportedKeys(con, schema, col.getTableRelation());
						if (!colRelaction.isEmpty()) {
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
		} catch (Exception e) {
			schemasMap.put(null, "Conexão à base de dados sem sucesso!");
			e.printStackTrace();
			//Core.setMessageError("Conexão à base de dados sem sucesso! ");
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
		private Integer size;
		private Object defaultValue;
		private String tableRelation;
		private String columnMap;
		private String connectionName;
		private String format = Core.YYYY_MM_DD;
		private String columnTypeName​;
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
			return columnTypeName​;
		}

		public void setColumnTypeName​(String columnTypeName​) {
			this.columnTypeName​ = columnTypeName​;
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
		List<Column> listCols = getCollumns(config, schemaName, tableName);
		if (!listCols.isEmpty()) {
            List<String> keys = getPrimaryKeys(config, schemaName, tableName);
            listCols = listCols.stream().filter(col -> keys.contains(col.getName())).collect(Collectors.toList());
			return (!listCols.isEmpty()) ? listCols.get(0) : null;
		}
		return null;
	}

	public static List<Column> getCollumns(Config_env configEnv, String sql) throws SQLException {
		List<Column> list = new ArrayList<>();
		if (Core.isNotNull(sql)) {
			try (java.sql.Connection con = Connection.getConnection(configEnv);
					PreparedStatement st = con.prepareStatement(sql);
					ResultSet rs = st.executeQuery()) {
				ResultSetMetaData metaData = rs.getMetaData();
				int columnsCount = metaData.getColumnCount();
				for (int i = 1; i <= columnsCount; i++) {
					Column col = new Column();
					col.setName(metaData.getColumnName(i));
					list.add(col);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
