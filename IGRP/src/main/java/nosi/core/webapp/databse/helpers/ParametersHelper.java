package nosi.core.webapp.databse.helpers;

import java.sql.SQLException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.helpers.DateHelper;

/**
 * Emanuel
 * 21 Jan 2019
 */
public class ParametersHelper {
	
	public void setParameter(Query query, Object value, Column col) {
		this.setParameter(query, col.getName(), value, col);
	}
	
	public <T> void setParameter(TypedQuery<T> query, Object value, Column col) {
		this.setParameter(query, col.getColumnMap(), value, col);
	}
	
	private void setParameter(Query query,String columnName,Object value,Column col) {
		if(col.getType().equals(java.lang.Integer.class)) {
			query.setParameter(columnName,value!=null?Core.toInt(value.toString()):null);
		}else if(col.getType().equals(java.lang.Double.class)){
			query.setParameter(columnName, value!=null?Core.toDouble(value.toString()):null);
		}else if(col.getType().equals(java.lang.Float.class)){
			query.setParameter(columnName, value!=null?Core.toFloat(value.toString()):null);
		}else if(col.getType().equals(java.lang.Long.class)){
			query.setParameter(columnName, value!=null?Core.toLong(value.toString()):null);
		}else if(col.getType().equals(java.lang.Short.class)){
			query.setParameter(columnName, value!=null?Core.toShort(value.toString()):null);
		}else if(col.getType().equals(java.lang.Boolean.class)){
			query.setParameter(columnName, (Boolean)value);
		}else if(col.getType().equals(java.lang.Byte.class)){
			query.setParameter(columnName, (Byte)value);
		}else if(col.getType().equals(java.sql.Date.class)){
			if((value instanceof String) && Core.isNotNull(value))
				query.setParameter(columnName,value!=null?Core.ToDate(value.toString(), col.getFormat()):null);
			else
				query.setParameter(columnName,value);
		}else if(col.getType().equals(java.lang.String.class) || col.getType().equals(java.lang.Character.class) && Core.isNotNull(value)){
			query.setParameter(columnName,value!=null?value.toString():null);
		}else {
			query.setParameter(columnName,value);
		}
	}
	
	public void setParameter(NamedParameterStatement query, Object value, Column col) throws SQLException {
		if(value!=null) {
			if(col.getType().equals(java.lang.Integer.class)) {
				query.setInt(col.getName(),Core.toInt(value.toString()));
			}else if(col.getType().equals(java.lang.Double.class)){
				query.setDouble(col.getName(), Core.toDouble(value.toString()));
			}else if(col.getType().equals(java.lang.Float.class)){
				query.setFloat(col.getName(),Core.toFloat(value.toString()));
			}else if(col.getType().equals(java.lang.Long.class)){
				query.setLong(col.getName(), Core.toLong(value.toString()));
			}else if(col.getType().equals(java.lang.Short.class)){
				query.setShort(col.getName(), Core.toShort(value.toString()));
			}else if(col.getType().equals(java.lang.Boolean.class)){
				query.setBoolean(col.getName(), (Boolean)value);
			}else if(col.getType().equals(java.lang.Byte.class)){
				query.setByte(col.getName(), (Byte)value);
			}else if(col.getType().equals(java.sql.Date.class) && Core.isNotNull(value)){
				query.setDate(col.getName(),DateHelper.formatDate(value.toString(), col.getFormat()));
			}else if(col.getType().equals(java.lang.String.class) || col.getType().equals(java.lang.Character.class) && Core.isNotNull(value)){
				query.setString(col.getName(),value.toString());
			}else {
				query.setObject(col.getName(), value);
			}
		}else {
			query.setObject(col.getName(), null);
		}
	}
}
