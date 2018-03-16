package nosi.core.webapp.databse.helpers;

import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class NamedParameterStatement {
	private final PreparedStatement statement;

	private Map<String, int[]> indexMap;

	public NamedParameterStatement(Connection connection, String query) throws SQLException {
		statement = connection.prepareStatement(parse(query));
	}

	public NamedParameterStatement(Connection connection, String query,int generatedkeys) throws SQLException {
		statement = connection.prepareStatement(parse(query), generatedkeys);
	}

	final String parse(String query) {
		int length = query.length();
		StringBuffer parsedQuery = new StringBuffer(length);
		boolean inSingleQuote = false;
		boolean inDoubleQuote = false;
		int index = 1;
		HashMap<String, List<Integer>> indexes = new HashMap<String, List<Integer>>(10);

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
						indexList = new LinkedList<Integer>();
						indexes.put(name, indexList);
					}
					indexList.add(Integer.valueOf(index));

					index++;
				}
			}
			parsedQuery.append(c);
		}

		indexMap = new HashMap<String, int[]>(indexes.size());
		// replace the lists of Integer objects with arrays of ints
		for (Map.Entry<String, List<Integer>> entry : indexes.entrySet()) {
			List<Integer> list = entry.getValue();
			int[] intIndexes = new int[list.size()];
			int i = 0;
			for (Integer x : list) {
				intIndexes[i++] = x.intValue();
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
		for (int i = 0; i < indexes.length; i++) {
			statement.setObject(indexes[i], value);
		}
	}

	public void setString(String name, String value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setString(indexes[i], value);
		}
	}

	public void setInt(String name, int value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setInt(indexes[i], value);
		}
	}


	public void setLong(String name, long value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setLong(indexes[i], value);
		}
	}


	public void setTimestamp(String name, Timestamp value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setTimestamp(indexes[i], value);
		}
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

	public String executeInsert() throws SQLException {
		String lastInsertedId = "0";
		if(statement.executeUpdate() > 0) {			
			try (java.sql.ResultSet rs = statement.getGeneratedKeys()) {
		        if (rs.next()) {
		        	lastInsertedId = rs.getString(1);
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

	public void setDouble(String name, double value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setDouble(indexes[i], value);
		}
	}

	public void setFloat(String name, float value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setFloat(indexes[i], value);
		}
	}

	public void setShort(String name, Short value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setShort(indexes[i], value);
		}
	}

	public void setDate(String name, Date value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setDate(indexes[i], value);
		}
	}

	public void setBigDecimal(String name, BigDecimal value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setBigDecimal(indexes[i], value);
		}
	}
	
	public void setArray(String name, Array value) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setArray(indexes[i], value);
		}
	}
	
	public void setAsciiStream(String name, InputStream value,int length) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setAsciiStream(indexes[i], value,length);
		}
	}
	
	public void setAsciiStream(String name, InputStream value,long length) throws SQLException {
		int[] indexes = getIndexes(name);
		for (int i = 0; i < indexes.length; i++) {
			statement.setAsciiStream(indexes[i], value,length);
		}
	}
}
