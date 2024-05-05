package nosi.core.webapp.databse.helpers;

import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;

import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.databse.helpers.ResultSet.Record;

/**
 * Emanuel
 * 21 Dec 2017
 */
public interface BaseQueryInterface {
	
	ResultSet execute();
	
	ResultSet executeTransaction() throws SQLException;
	
	List<Tuple> getResultList();
	
	Record getRecordList();
	
	Record getSingleRecord();
	
	Tuple getSingleResult();
	
	TypedQuery<?> getTypedQuery();
	
	<T> List<T> getResultList(Class<T> entity);
	
	<T> T getSingleResult(Class<T> entity);
	
	String getConnectionName();
	
	String getSql();
	
	String getSqlWithData();
	
	QueryInterface setAutoCommit(boolean isAutoCommit);
	
	QueryInterface from(String tables);
	
	QueryInterface select(String collumns);
	
	QueryInterface where(String condition);
	
	QueryInterface where();
	
	QueryInterface whereNotNull(String name);
	
	QueryInterface whereIsNull(String name);
	
	QueryInterface where(String name, String operator, String value);
	
	QueryInterface where(String name, String operator, Integer value);
	
	QueryInterface where(String name, String operator, Float value);
	
	QueryInterface where(String name, String operator, Double value);
	
	QueryInterface addLong(String columnName, Long value);

	QueryInterface addDouble(String columnName, Double value);

	QueryInterface addFloat(String columnName, Float value);

	QueryInterface addShort(String columnName, Short value);

	QueryInterface addDate(String columnName, String value, String format);
	
	QueryInterface addDate(String columnName, String value);
	
	QueryInterface addDate(String columnName, java.util.Date value);
	
	QueryInterface addDate(String columnName, java.util.Date value, String format);
	
	QueryInterface addDate(String columnName, java.sql.Date value);
	
	QueryInterface addDate(String columnName, java.sql.Date value, String format);
	
	QueryInterface add(Column col, Object value);
	
	QueryInterface addString(String columnName, String value);
	
	QueryInterface addInt(String columnName, Integer value);

	QueryInterface addBinaryStream(String columnName, FileInputStream value);
	
	QueryInterface addBinaryStream(String columnName, InputStream value);

    QueryInterface addObject(String columnName, Object value);
    
    QueryInterface addTimestamp(String columnName, Timestamp value);

    QueryInterface addArray(String columnName, ArrayList<?> value);

    QueryInterface addAsciiStream(String columnName, InputStream value);

    QueryInterface addClob(String columnName, Clob value);
    
    QueryInterface addBlob(String columnName, Blob value);

    QueryInterface addByte(String columnName, byte[] value);
    
    QueryInterface addByte(String columnName, byte value);
    
    QueryInterface addBoolean(String columnName, boolean value);
    
	QueryInterface addBigDecimal(String columnName, BigDecimal value);
	
	QueryInterface addBigInteger(String columnName, BigInteger value);

    QueryInterface addTime(String columnName, Time value);
    
    List<Column> getParametersMap();
    
    QueryInterface keepConnection();
    
    void begin() throws SQLException;
    
    void commit() throws SQLException;
    
    void roolback() throws SQLException;
    
    QueryInterface insert(String tableName);
    
    QueryInterface update(String tableName);

    QueryInterface delete(String tableName);
    
    void closeConnection() throws SQLException;
}
