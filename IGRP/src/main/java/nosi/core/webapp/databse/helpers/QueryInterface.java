package nosi.core.webapp.databse.helpers;
/**
 * Emanuel
 * 19 Apr 2018
 */
public interface QueryInterface extends BaseQueryInterface{

	QueryInterface where(String name, String operator, java.sql.Date value);

	QueryInterface where(String name, String operator, String value, String format);
	
	QueryInterface andWhereNotNull(String name);
	
	QueryInterface andWhereIsNull(String name);
	
	QueryInterface andWhere(String name, String operator, String value);
	
	QueryInterface andWhere(String name, String operator, String[] values);
	
	QueryInterface andWhere(String name, String operator, Integer[] values);
	
	QueryInterface andWhere(String name, String operator, Double[] values);
	
	QueryInterface andWhere(String name, String operator, Float[] values);
	
	QueryInterface andWhere(String name, String operator, Integer value);
	
	QueryInterface andWhere(String name, String operator, Float value);
	
	QueryInterface andWhere(String name, String operator, Double value);

	QueryInterface andWhere(String name, String operator, java.sql.Date value);

	QueryInterface andWhere(String name, String operator, String value, String format);
	
	QueryInterface orWhereNotNull(String name);
	
	QueryInterface orWhereIsNull(String name);
	
	QueryInterface orWhere(String name, String operator, String value);
	
	QueryInterface orWhere(String name, String operator, String[] values);
	
	QueryInterface orWhere(String name, String operator, Integer[] values);
	
	QueryInterface orWhere(String name, String operator, Double[] values);
	
	QueryInterface orWhere(String name, String operator, Float[] values);
	
	QueryInterface orWhere(String name, String operator, Integer value);
	
	QueryInterface orWhere(String name, String operator, Float value);
	
	QueryInterface orWhere(String name, String operator, Double value);

	QueryInterface orWhere(String name, String operator, java.sql.Date value);

	QueryInterface orWhere(String name, String operator, String value, String format);

	QueryInterface having(String name, String operator, String value);
	
	QueryInterface having(String name, String operator, Integer value);
	
	QueryInterface having(String name, String operator, Double value);
	
	QueryInterface having(String name, String operator, Float value);

	QueryInterface having(String name, String operator, java.sql.Date value);

	QueryInterface having(String name, String operator, String value, String format);
	
	QueryInterface orderBy(String[]... orderByNames);
	
	QueryInterface orderByAsc(String... columns);
	
	QueryInterface orderByDesc(String... columns);
	
	QueryInterface groupBy(String... groupByNames);
	
	QueryInterface between(String name, Object value1, Object value2);
	
	QueryInterface notBetween(String name, Object value1, Object value2);
	
	QueryInterface exists(String value);
	
	QueryInterface notExists(String value);

	QueryInterface innerJoin(String table2, String key1, String key2);
	
	QueryInterface leftJoin(String table2, String key1, String key2);
	
	QueryInterface rightJoin(String table2, String key1, String key2);
	
	QueryInterface outerJoin(String table2, String key1, String key2);
	
	QueryInterface selfJoin(String table2, String key1, String key2);

	QueryInterface innerJoin(String table1, String table2, String key1, String key2);
	
	QueryInterface leftJoin(String table1, String table2, String key1, String key2);
	
	QueryInterface rightJoin(String table1, String table2, String key1, String key2);
	
	QueryInterface outerJoin(String table1, String table2, String key1, String key2);
	
	QueryInterface selfJoin(String table1, String table2, String key1, String key2);
	
	QueryInterface union();
	
	QueryInterface unionAll();
//	@Deprecated
QueryInterface returning(String... retuerningKeys);
	
	QueryInterface and();
	
	QueryInterface or();
	
	QueryInterface limit(int limit);
	
	QueryInterface offset(int offset);
	
	QueryInterface any(String subQuery);
	
	void setShowError(boolean showError);

	void setShowTracing(boolean showTracing);
}
