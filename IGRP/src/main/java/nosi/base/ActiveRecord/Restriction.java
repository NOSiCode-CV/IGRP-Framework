package nosi.base.ActiveRecord;
/**
 * Emanuel
 * 15 Jan 2019
 */
public interface Restriction<T> extends CommonRestriction<T> {

	T equals(String name, Object value);
	
	T notEquals(String name, Object value);

	T like(String name, Object value);
	
	T notLike(String name, Object value);
	
	T gt(String name, Object value);
	
	T lt(String name, Object value);
	
	T between(String name, Object value1, Object value2);
	
	T notBetween(String name, Object value1, Object value2);
	
	T in(String name, String query);
	
	T notIn(String name, Object[] values);

	T notIn(String name, String query);
	
	T in(String name, Object[] values);
	
	T isNull(String name);
	
	T isNotNull(String name);
	
	String getRestriction();
}
