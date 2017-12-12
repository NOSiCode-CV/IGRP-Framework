package nosi.core.webapp.databse.helpers;

import java.sql.Types;

/**
 * Emanuel
 * 10 Dec 2017
 */
public class SqlJavaType {

	public static Class<?> sqlToJava(int type) {
        Class<?> result = Object.class;
        System.out.println("Type:"+type);
        switch (type) {
            case Types.CHAR:
            case Types.VARCHAR:
            case Types.LONGVARCHAR:
            case Types.SQLXML:
                result = String.class;
                break;
            case Types.NUMERIC:
            case Types.DECIMAL:
                result = java.math.BigDecimal.class;
                break;
            case Types.BIT:
                result = Boolean.class;
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
            case Types.BLOB:
            	result = java.sql.Blob.class;
            	break;
            case Types.CLOB:
            	result = java.sql.Clob.class;
            	break;
            case Types.STRUCT:
            	result = java.sql.Struct.class;
            case Types.REF:
            	result = java.sql.Ref.class;
            	break;
        }

        return result;
    }
}
