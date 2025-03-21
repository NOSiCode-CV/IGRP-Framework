package nosi.core.webapp.databse.helpers;

import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import static nosi.base.ActiveRecord.HibernateUtils.setSessionAudit;

public class NamedParameterStatement implements AutoCloseable {
	
	private final PreparedStatement statement;

	private Map<String, int[]> indexMap;
	
	private String[] returningKeys;
	
	public NamedParameterStatement(Connection connection, String query) throws SQLException {
		statement = connection.prepareStatement(parse(connection,query));
	}

	public NamedParameterStatement(Connection connection, String query,int generatedkeys) throws SQLException {
		statement = connection.prepareStatement(parse(connection,query), generatedkeys);
	}

	public NamedParameterStatement(Connection connection, String query, String[] returningKeys) throws SQLException {
		this.returningKeys = returningKeys;
		statement = connection.prepareStatement(parse(connection,query), returningKeys);
	}

	final String parse(Connection connection, String query) {
		int length = query.length();
		StringBuilder parsedQuery = new StringBuilder(length);
		setSessionAudit(connection, parsedQuery);
		boolean inSingleQuote = false;
		boolean inDoubleQuote = false;
		int index = 1;
		HashMap<String, List<Integer>> indexes = new HashMap<>(10);

		for (int i = 0; i < length; i++) {
			char c = query.charAt(i);
			if (inSingleQuote) {
				if (c == '\'') {
					inSingleQuote = false;
				}
			} else if (inDoubleQuote) {
				if (c == '"') {
					inDoubleQuote = false;
				}
			} else {
				if (c == '\'') {
					inSingleQuote = true;
				} else if (c == '"') {
					inDoubleQuote = true;
				} else if (c == ':' && i + 1 < length && Character.isJavaIdentifierStart(query.charAt(i + 1))) {
					int j = i + 2;
					while (j < length && Character.isJavaIdentifierPart(query.charAt(j))) {
						j++;
					}
					String name = query.substring(i + 1, j);
					c = '?'; // replace the parameter with a question mark
					i += name.length(); // skip past the end if the parameter

					List<Integer> indexList = indexes.get(name);
					if (indexList == null) {
						indexList = new LinkedList<>();
						indexes.put(name, indexList);
					}
					indexList.add(index);

					index++;
				}
			}
			parsedQuery.append(c);
		}

		indexMap = new HashMap<>(indexes.size());
		// replace the lists of Integer objects with arrays of ints
		for (Map.Entry<String, List<Integer>> entry : indexes.entrySet()) {
			List<Integer> list = entry.getValue();
			int[] intIndexes = new int[list.size()];
			int i = 0;
			for (Integer x : list) {
				intIndexes[i++] = x;
			}
			indexMap.put(entry.getKey(), intIndexes);
		}

		return parsedQuery.toString();
	}




	private int[] getIndexes(String name) {
		int[] indexes = indexMap.get(name);
		if (indexes == null) {
			throw new IllegalArgumentException("Parameter not found: " + name);
		}
		return indexes;
	}


	public void setObject(String name, Object value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setObject(index, value);
       }
	}

	public void setString(String name, String value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setString(index, value);
       }
	}

	public void setInt(String name, Integer value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setInt(index, value);
       }
	}


	public void setLong(String name, Long value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setLong(index, value);
       }
	}

	public String getSql() {
		return statement.toString();
	}
	
	public PreparedStatement getStatement() {
		return statement;
	}

	public boolean execute() throws SQLException {
		return statement.execute();
	}

	public ResultSet executeQuery() throws SQLException {
		return statement.executeQuery();
	}


	public int executeUpdate() throws SQLException {
		return statement.executeUpdate();
	}
	
	public Map<String,Object> executeInsert(String tableName) throws SQLException {
		Map<String,Object> lastInsertedId = new LinkedHashMap<>();
		if(statement.executeUpdate() > 0) {				
			try (java.sql.ResultSet rs = statement.getGeneratedKeys()) {
			        if (rs.next()) {
			        	if(this.returningKeys != null) {
			        		for(int i = 0; i < returningKeys.length; i++) {
			        			try {
									lastInsertedId.put(returningKeys[i],rs.getString(i + 1));
								} catch (SQLException e) {
									lastInsertedId.put(returningKeys[i],"");
								}
			        		}
			        	}else {
			        		for(int i=1;i<=rs.getMetaData().getColumnCount();i++){
			        			String key = rs.getMetaData().getColumnName(i);			        			
				        		try {
									lastInsertedId.put(key,rs.getString(key));
								} catch (SQLException e) {
									lastInsertedId.put(key,"");
								}
				        	}
			        	}
			        }
			}
			statement.close();
		}
		return lastInsertedId;
	}

	public void close() throws SQLException {
		statement.close();
	}


	public void addBatch() throws SQLException {
		statement.addBatch();
	}


	public int[] executeBatch() throws SQLException {
		return statement.executeBatch();
	}

	public void setDouble(String name, Double value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setDouble(index, value);
       }
	}

	public void setFloat(String name, Float value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setFloat(index, value);
       }
	}

	public void setShort(String name, Short value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setShort(index, value);
       }
	}


	public void setTime(String name, Time value,Calendar cal) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setTime(index, value, cal);
       }
	}

	public void setTimestamp(String name, Timestamp value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setTimestamp(index, value);
       }
	}

	public void setTimestamp(String name, Timestamp value,Calendar cal) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setTimestamp(index, value, cal);
       }
	}
	
	public void setTime(String name, Time value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setTime(index, value);
       }
	}
	public void setDate(String name, Date value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setDate(index, value);
       }
	}

	public void setDate(String name, Date value,Calendar cal) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setDate(index, value, cal);
       }
	}
	public void setBigDecimal(String name, BigDecimal value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBigDecimal(index, value);
       }
	}
	
	public void setArray(String name, Array value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setArray(index, value);
       }
	}
	
	public void setAsciiStream(String name, InputStream value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setAsciiStream(index, value);
       }
	}
	
	public void setAsciiStream(String name, InputStream value,int length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setAsciiStream(index, value, length);
       }
	}
	
	public void setAsciiStream(String name, InputStream value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setAsciiStream(index, value, length);
       }
	}	

	public void setBinaryStream(String name, InputStream value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBinaryStream(index, value, length);
       }
	}
	
	public void setBinaryStream(String name, InputStream value,int length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBinaryStream(index, value, length);
       }
	}
	
	public void setBinaryStream(String name, InputStream value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBinaryStream(index, value);
       }
	}
	

	public void setBlob(String name, Blob value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBlob(index, value);
       }
	}
	public void setBlob(String name, InputStream value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBlob(index, value);
       }
	}
	public void setBlob(String name, InputStream value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBlob(index, value, length);
       }
	}
	public void setBoolean(String name, Boolean value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBoolean(index, value);
       }
	}
	public void setByte(String name, Byte value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setByte(index, value);
       }
	}
	public void setBytes(String name, byte[] value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setBytes(index, value);
       }
	}
	public void setCharacterStream(String name, Reader value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setCharacterStream(index, value);
       }
	}
	public void setCharacterStream(String name, Reader value,int length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setCharacterStream(index, value, length);
       }
	}
	public void setCharacterStream(String name, Reader value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setCharacterStream(index, value, length);
       }
	}

	public void setClob(String name, Clob value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setClob(index, value);
       }
	}
	
	public void setClob(String name, Reader value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setClob(index, value);
       }
	}
	
	public void setClob(String name, Reader value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setClob(index, value, length);
       }
	}

	public void setURL(String name,URL value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setURL(index, value);
       }
	}
	

	public void setNCharacterStream(String name,Reader value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNCharacterStream(index, value);
       }
	}

	public void setNCharacterStream(String name,Reader value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNCharacterStream(index, value, length);
       }
	}

	public void setNClob(String name,NClob value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNClob(index, value);
       }
	}
	public void setNClob(String name,Reader value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNClob(index, value);
       }
	}
	public void setNClob(String name,Reader value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNClob(index, value, length);
       }
	}

	public void setNClob(String name,String value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setNString(index, value);
       }
	}

	public void setNClob(String name,Object value) throws SQLException {
		int[] indexes = getIndexes(name);
       for (int index : indexes) {
          statement.setObject(index, value);
       }
	}
	public void setFetchSize(int rows) throws SQLException {
		statement.setFetchSize(rows);
	}

	public void setMaxRows(int max) throws SQLException {
		statement.setMaxRows(max);
	}
	
	public void setCursorName(String name) throws SQLException {
		statement.setCursorName(name);
	}
	
}
