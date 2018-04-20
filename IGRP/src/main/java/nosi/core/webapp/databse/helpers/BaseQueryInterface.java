package nosi.core.webapp.databse.helpers;

import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;

/**
 * Emanuel
 * 21 Dec 2017
 */
public interface BaseQueryInterface {
	
	public ResultSet execute();
	
	public List<Tuple> getResultList();
	
	public Object getSigleResult();
	
	public TypedQuery<?> getSingleResult();
	
	public <T> List<T> getResultList(Class<T> type);
	
	public String getConnectionName();
	
	public String getSql();
	
	public QueryInterface from(String tables);
	
	public QueryInterface select(String collumns);
	
	public QueryInterface where(String condition);
	
	public QueryInterface where();
	
	public QueryInterface addLong(String columnName,Long value);

	public QueryInterface addDouble(String columnName,Double value);

	public QueryInterface addFloat(String columnName,Float value);

	public QueryInterface addShort(String columnName,Short value);

	public QueryInterface addDate(String columnName,String value,String format);
	
	public QueryInterface addDate(String columnName,String value);
	
	public QueryInterface addDate(String columnName,java.sql.Date value);
	
	public QueryInterface addDate(String columnName,java.sql.Date value,String format);
	
	public QueryInterface add(Column col,Object value);
	
	public QueryInterface addString(String columnName,String value);
	
	public QueryInterface addInt(String columnName,Integer value);

	public QueryInterface addBinaryStream(String columnName,FileInputStream value);
	
	public QueryInterface addBinaryStream(String columnName,InputStream value);

    public QueryInterface addObject(String columnName,Object value);
    
    public QueryInterface addTimestamp(String columnName,Timestamp value);

    public QueryInterface addArray(String columnName,Array value);

    public QueryInterface addAsciiStream(String columnName,InputStream value);

    public QueryInterface addClob(String columnName,Clob value);
    
    public QueryInterface addBlob(String columnName,Blob value);

    public QueryInterface addByte(String columnName,byte[] value);
    
    public QueryInterface addByte(String columnName,byte value);
    
    public QueryInterface addBoolean(String columnName,boolean value);
    
    public QueryInterface addBigDecimal(String columnName,BigDecimal value);
    
    public QueryInterface addTime(String columnName,Time value);
}
