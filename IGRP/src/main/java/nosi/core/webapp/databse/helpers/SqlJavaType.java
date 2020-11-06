package nosi.core.webapp.databse.helpers;

import java.sql.Types;
import nosi.core.xml.TypesXML;

/**
 * Emanuel
 * 10 Dec 2017
 */
public class SqlJavaType {

	//Receive Sql Type and Return Java Type
	public static Object sqlToJava(int type) {
        Object result = Object.class;
        switch (type) {
            case Types.VARCHAR:
            case Types.NVARCHAR:
            case Types.LONGNVARCHAR:
            case Types.LONGVARCHAR:
                result = String.class;
                break;
            case Types.CHAR:
            case Types.NCHAR:
            	result = java.lang.Character.class;
            	break;
            case Types.BIT:
                result = Boolean.class;
                break;
            case Types.NUMERIC:
            case Types.DECIMAL:
                result = java.math.BigDecimal.class;
                break;
            case Types.TINYINT:
                result = Byte.class;
                break;
            case Types.SMALLINT:
                result = Short.class;
                break;
            case Types.INTEGER:
                result = Integer.class;
                break;
            case Types.BIGINT:
                result = Long.class;
                break;
            case Types.REAL:
            case Types.FLOAT:
                result = Float.class;
                break;
            case Types.DOUBLE:
                result = Double.class;
                break;
            case Types.BINARY:
            case Types.VARBINARY:
            case Types.LONGVARBINARY:
                result = Byte[].class;
                break;
            case Types.DATE:
                result = java.sql.Date.class;
                break;
            case Types.TIME:
                result = java.sql.Time.class;
                break;
            case Types.TIMESTAMP:
                result = java.sql.Timestamp.class;
                break;
            case Types.ARRAY:
            	result = java.sql.Array.class;
            	break;
            case Types.CLOB:
            	result = java.sql.Clob.class;
            	break;
            case Types.BLOB:
            	result = java.sql.Blob.class;
            	break;
            case Types.NCLOB:
            	result = java.sql.NClob.class;
            	break;
            case Types.STRUCT:
            	result = java.sql.Struct.class;
            	break;
            case Types.REF:
            	result = java.sql.Ref.class;
            	break;
        }
        return result;
    }
	
	//Recive column Databse and Return XML Type
	public static String sqlToXML(DatabaseMetadaHelper.Column column) {
			if(column.isForeignKey()) {
				return TypesXML.COMBOBOX;
			}
			if(column.isAutoIncrement()) {
				return TypesXML.HIDDEN;
			}
	      	String result = TypesXML.TEXT;
	        switch (column.getTypeSql()) {
		        case Types.VARCHAR:
	            case Types.NVARCHAR:
	            case Types.CHAR:
	            case Types.NCHAR:
	            case Types.STRUCT:
	            	result = TypesXML.TEXT;
	            	break;
	            case Types.LONGNVARCHAR:
	            case Types.LONGVARCHAR:
	                result = TypesXML.TEXT_AREA;
	                break;
	            case Types.BIT:
	            case Types.TINYINT:
	                result = TypesXML.CHECK;
	                break;
	            case Types.NUMERIC:
	            case Types.DECIMAL:
	            case Types.SMALLINT:
	            case Types.INTEGER:
	            case Types.BIGINT:
	            case Types.REAL:
	            case Types.FLOAT:
	            case Types.DOUBLE:
	            case Types.TIMESTAMP:
	                result = TypesXML.NUMBER;
	                break;
	            case Types.DATE:
	                result = TypesXML.DATE;
	                break;
	            case Types.TIME:
	                result = TypesXML.TIME;
	                break;
	            case Types.CLOB:
	            case Types.BLOB:
	            case Types.NCLOB:
	            case Types.BINARY:
	            case Types.VARBINARY:
	            case Types.LONGVARBINARY:
	            case Types.ARRAY:
	            	result = TypesXML.FILE;
	            	break;
	            case Types.REF:
	            	result = TypesXML.COMBOBOX;
	            	break;
	        }
	        return result;
	}
}
