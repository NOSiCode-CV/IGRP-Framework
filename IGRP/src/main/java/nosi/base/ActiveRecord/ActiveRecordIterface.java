package nosi.base.ActiveRecord;
import java.sql.Date;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.util.List;
import javax.persistence.criteria.CriteriaQuery;

public interface ActiveRecordIterface<T> extends CommonRestriction<T>{

	public T where(String condition);
	
	public T andWhereNotNull(String name);
	
	public T andWhereIsNull(String name);
	
	public T where();
	
	public T and();
	
	public T or();
	
	public T where(String name,String operator,String value);
	
	public T where(String name,String operator,String[] values);
	
	public T where(String name,String operator,Integer[] values);
	
	public T where(String name,String operator,Double[] values);
	
	public T where(String name,String operator,Float[] values);
	
	public T where(String name,String operator,Short[] values);
	
	public T where(String name,String operator,Integer value);
	
	public T where(String name,String operator,Float value);
	
	public T where(String name,String operator,Double value);

	public T where(String name, String operator, Short value);
	
	public T where(String name,String operator,Date value);
	
	public T andWhere(String name,String operator,String value);
	
	public T andWhere(String name,String operator,Object value);
	
	public T andWhere(String name,String paramName,String operator,Object value);
	
	public T andWhere(String name,String operator,String[] values);
	
	public T andWhere(String name,String operator,Integer[] values);
	
	public T andWhere(String name,String operator,Double[] values);
	
	public T andWhere(String name,String operator,Float[] values);
	
	public T andWhere(String name,String operator,Short[] values);
	
	public T andWhere(String name,String operator,Integer value);
	
	public T andWhere(String name,String operator,Float value);
	
	public T andWhere(String name,String operator,Double value);
	
	public T andWhere(String name,String operator,Date value);
	
	public T andWhere(String name,String operator,Short value);

	public T where(String name,String operator,Object value);
	
	public T where(String name,String paramName,String operator,Object value);
	
    public T where(String name,String paramName,String operator,String value);
	
	public T where(String name,String paramName,String operator,Integer value);
	
	public T where(String name,String paramName,String operator,Float value);
	
	public T where(String name,String paramName,String operator,Double value);
	
	public T where(String name,String paramName,String operator,Date value);
	
	public T where(String name,String paramName,String operator,Short value);
	
	public T andWhere(String name,String paramName,String operator,String value);
	
	public T andWhere(String name,String paramName,String operator,Integer value);
	
	public T andWhere(String name,String paramName,String operator,Float value);
	
	public T andWhere(String name,String paramName,String operator,Double value);
	
	public T andWhere(String name,String paramName,String operator,Date value);
	
	public T andWhere(String name,String paramName,String operator,Short value);
	
	public T andWhere(String name, String operator, Number value);
	
	public T orWhereNotNull(String name);
	
	public T orWhereIsNull(String name);

	public T orWhere(String name,String operator,Object value);
	
	public T orWhere(String name,String paramName,String operator,Object value);
	
	public T orWhere(String name,String operator,String value);
	
	public T orWhere(String name,String operator,String[] values);
	
	public T orWhere(String name,String operator,Integer[] values);
	
	public T orWhere(String name,String operator,Double[] values);
	
	public T orWhere(String name,String operator,Float[] values);
	
	public T orWhere(String name,String operator,Short[] values);
	
	public T orWhere(String name,String operator,Integer value);
	
	public T orWhere(String name,String operator,Float value);
	
	public T orWhere(String name,String operator,Double value);

	public T orWhere(String name,String operator,Date value);
	
	public T orWhere(String name,String operator,Short value);
	
    public T orWhere(String name,String paramName,String operator,String value);
	
	public T orWhere(String name,String paramName,String operator,Integer value);
	
	public T orWhere(String name,String paramName,String operator,Float value);
	
	public T orWhere(String name,String paramName,String operator,Double value);

	public T orWhere(String name,String paramName,String operator,Date value);
	
	public T orWhere(String name,String paramName,String operator,Short value);
	
	public T having(String name,String operator,String value);
	
	public T having(String name,String operator,Integer value);
	
	public T having(String name,String operator,Double value);
	
	public T having(String name,String operator,Float value);

	public T having(String name,String operator,Date value);
	
	public T having(String name,String operator,Short value);
		
	public T orderBy(String...orderByNames);
	
	public T orderBy(String[] ...orderByNames);
	
	public T groupBy(String ...groupByNames);

	public T exists(String subQuery);	
	
	public T notExists(String subQuery);	
	
	public T limit(int limit);
	
	public T offset(int offset);
	
	public T any(String subQuery);
	
	public T all(String subQuery);
	
	public T find();
	
	public T findOne(Object value);
	
	public List<T> findAll();
	
	public T one();
	
	public List<T> all();
	
	public T where(RestrictionImpl restrition);
	
	public T andWhere(RestrictionImpl restrition);
	
	public T orWhere(RestrictionImpl restrition);
	
	public List<T> findAll(CriteriaQuery<T> criteria);

	public T findOne(CriteriaQuery<T> criteria);
	
	public T insert();
	
	public T update();
	
	public boolean delete(Object id);
	
	public boolean delete();
	
	public void setConnectionName(String connectionName);
	
	public String getConnectionName();
	
	public Object getValuePrimaryKey();
	
	public String getNamePrimaryKey();
	
	public Long getCount();

	public T orderByAsc(String...columns);
	
	public T orderByDesc(String...columns);
	
	//public T keepConnection();
	/*
	public T sum(String name);

	public T avg(String name);
	
	public T min(String name);
	
	public T max(String name);
	
	public T count(String name);
	
	*/
}
