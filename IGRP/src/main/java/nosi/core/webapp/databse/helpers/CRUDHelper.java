package nosi.core.webapp.databse.helpers;

import java.lang.reflect.Field;
import java.util.Map;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.webapp.helpers.IgrpHelper;

/**
 * @author: Emanuel Pereira
 * 26 Mar 2018
 */
public class CRUDHelper {

	
	public static <T> Object insert(String connectionName,String schema,String tableName,T obj) {
		QueryHelper query = Core.insert(connectionName,schema, tableName);
		mapQuery(obj,query);
		return query.execute();
	}

	public static <T> Object update(String connectionName,String schema,String tableName,T obj,Map<String,Object> conditions) {
		QueryHelper query = Core.update(connectionName,schema, tableName);
		mapQuery(obj,query);
		if(conditions!=null && !conditions.isEmpty()) {
			conditions.entrySet().stream().forEach(k->{
				query.where(k.getKey()+"=:"+k.getKey());
			});
			conditions.entrySet().stream().forEach(k->{
				if(k.getValue() instanceof Number)
					query.addInt(k.getKey(), Core.toInt(k.getValue().toString()));
				else
					query.addString(k.getKey(), k.getValue().toString());
			});
		}
		return query.execute();
	}
	

	public static <T> Object delete(String connectionName,String schema,String tableName,Map<String,Object> conditions) {
		QueryHelper query = Core.delete(connectionName,schema, tableName);
		if(conditions!=null && !conditions.isEmpty()) {
			conditions.entrySet().stream().forEach(k->{
				query.where(k.getKey()+"=:"+k.getKey());
			});
			conditions.entrySet().stream().forEach(k->{
				if(k.getValue() instanceof Number)
					query.addInt(k.getKey(), Core.toInt(k.getValue().toString()));
				else
					query.addString(k.getKey(), k.getValue().toString());
			});
		}
		return query.execute();
	}
	
	private static <T> void mapQuery(T obj, QueryHelper query) {
		for(Field f:obj.getClass().getDeclaredFields()) {
			Object value = IgrpHelper.getValue(obj, f.getName());
			switch(f.getType().getName().toLowerCase()) {
				case "int":
				case "java.lang.integer":
					query.addInt(f.getName(),Core.toInt(value.toString()));
					break;
				case "short":
				case "java.lang.short":
						query.addShort(f.getName(),Core.toShort(value.toString()));
						break;
				case "long":
				case "java.lang.long":
					query.addLong(f.getName(),Core.toLong(value.toString()));
					break;
				case "float":
				case "java.lang.float":
					query.addFloat(f.getName(),Core.toFloat(value.toString()));
					break;
				case "double":
				case "java.lang.double":
					query.addDouble(f.getName(),Core.toDouble(value.toString()));
					break;
				case "date":
				case "java.util.date":
				case "java.sql.date":
					query.addDate(f.getName(),Core.ToDate(value.toString(), "yyyy-MM-dd"));
					break;
				case "java.lang.string":
				case "string":
					query.addString(f.getName(), value.toString());
					break;
				case "java.lang.object":
				case "object":
					query.addObject(f.getName(), value);
					break;					
			}
		}
	}
}
