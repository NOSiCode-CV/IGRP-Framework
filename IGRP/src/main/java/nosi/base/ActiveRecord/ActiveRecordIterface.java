package nosi.base.ActiveRecord;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.criteria.CriteriaQuery;

public interface ActiveRecordIterface<T> extends CommonRestriction<T>{

	T where(String condition);
	
	T andWhereNotNull(String name);
	
	T andWhereIsNull(String name);
	
	T where();
	
	T and();
	
	T or();
	
	T where(String name, String operator, String value);
	
	T where(String name, String operator, String[] values);
	
	T where(String name, String operator, Integer[] values);
	
	T where(String name, String operator, Double[] values);
	
	T where(String name, String operator, Float[] values);
	
	T where(String name, String operator, Short[] values);
	
	T where(String name, String operator, Integer value);
	
	T where(String name, String operator, Float value);
	
	T where(String name, String operator, Double value);

	T where(String name, String operator, Short value);
	
	T where(String name, String operator, Date value);
	
	T andWhere(String name, String operator, String value);
	
	T andWhere(String name, String operator, Object value);
	
	T andWhere(String name, String paramName, String operator, Object value);
	
	T andWhere(String name, String operator, String[] values);
	
	T andWhere(String name, String operator, Integer[] values);
	
	T andWhere(String name, String operator, Double[] values);
	
	T andWhere(String name, String operator, Float[] values);
	
	T andWhere(String name, String operator, Short[] values);
	
	T andWhere(String name, String operator, Integer value);
	
	T andWhere(String name, String operator, Float value);
	
	T andWhere(String name, String operator, Double value);
	
	T andWhere(String name, String operator, Date value);
	
	T andWhere(String name, String operator, Short value);

	T where(String name, String operator, Object value);
	
	T where(String name, String paramName, String operator, Object value);
	
    T where(String name, String paramName, String operator, String value);
	
	T where(String name, String paramName, String operator, Integer value);
	
	T where(String name, String paramName, String operator, Float value);
	
	T where(String name, String paramName, String operator, Double value);
	
	T where(String name, String paramName, String operator, Date value);
	
	T where(String name, String paramName, String operator, Short value);
	
	T whereIn(String columnName, Number... numbers);
	
	T whereIn(String columnName, String... strings);
	
	T whereIn(String columnName, UUID... uuIds);
	
	T whereNotIn(String columnName, UUID... uuIds);
	
	T whereNotIn(String columnName, String... strings);
	
	T whereNotIn(String columnName, Number... numbers);

	T whereBetween(String columnName, Object o1, Object o2);
	
	T orWhereBetween(String columnName, Object o1, Object o2);
	
	T andWhereBetween(String columnName, Object o1, Object o2);
	
	T andWhere(String name, String paramName, String operator, String value);
	
	T andWhere(String name, String paramName, String operator, Integer value);
	
	T andWhere(String name, String paramName, String operator, Float value);
	
	T andWhere(String name, String paramName, String operator, Double value);
	
	T andWhere(String name, String paramName, String operator, Date value);
	
	T andWhere(String name, String paramName, String operator, Short value);
	
	T andWhere(String name, String operator, Number value);
	
	T orWhereNotNull(String name);
	
	T orWhereIsNull(String name);

	T orWhere(String name, String operator, Object value);
	
	T orWhere(String name, String paramName, String operator, Object value);
	
	T orWhere(String name, String operator, String value);
	
	T orWhere(String name, String operator, String[] values);
	
	T orWhere(String name, String operator, Integer[] values);
	
	T orWhere(String name, String operator, Double[] values);
	
	T orWhere(String name, String operator, Float[] values);
	
	T orWhere(String name, String operator, Short[] values);
	
	T orWhere(String name, String operator, Integer value);
	
	T orWhere(String name, String operator, Float value);
	
	T orWhere(String name, String operator, Double value);

	T orWhere(String name, String operator, Date value);
	
	T orWhere(String name, String operator, Short value);
	
    T orWhere(String name, String paramName, String operator, String value);
	
	T orWhere(String name, String paramName, String operator, Integer value);
	
	T orWhere(String name, String paramName, String operator, Float value);
	
	T orWhere(String name, String paramName, String operator, Double value);

	T orWhere(String name, String paramName, String operator, Date value);
	
	T orWhere(String name, String paramName, String operator, Short value);
	
	T having(String name, String operator, String value);
	
	T having(String name, String operator, Integer value);
	
	T having(String name, String operator, Double value);
	
	T having(String name, String operator, Float value);

	T having(String name, String operator, Date value);
	
	T having(String name, String operator, Short value);
		
	T orderBy(String... orderByNames);
	
	T orderBy(String[]... orderByNames);
	
	T groupBy(String... groupByNames);

	T exists(String subQuery);
	
	T notExists(String subQuery);
	
	T limit(int limit);
	
	T offset(int offset);
	
	T any(String subQuery);
	
	T all(String subQuery);
	
	T find();
	
	T findOne(Object value);
	
	List<T> findAll();
	
	T one();
	
	List<T> all();
	
	T where(RestrictionImpl restrition);
	
	T andWhere(RestrictionImpl restrition);
	
	T orWhere(RestrictionImpl restrition);
	
	List<T> findAll(CriteriaQuery<T> criteria);

	T findOne(CriteriaQuery<T> criteria);
	
	T insert();
	
	T update();
	
	boolean delete(Object id);
	
	boolean delete();
	
	T setConnectionName(String connectionName);
	
	String getConnectionName();
	
	Object getValuePrimaryKey();
	
	String getNamePrimaryKey();
	
	Long getCount();
	
	Object getMax(String columnName);

	Object getMin(String columnName);

	Double getAvg(String columnName);
	
	Object getSum(String columnName);

	T orderByAsc(String... columns);
	
	T orderByDesc(String... columns);
	
	T keepConnection();//keep connection open

}
