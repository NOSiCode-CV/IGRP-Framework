package nosi.base.ActiveRecord;
/**
 * Emanuel
 * 15 Jan 2019
 */
public interface Restriction<T> extends CommonRestriction<T> {

	public T equals(String name,Object value);
	
	public T like(String name,Object value);
	
	public T notLike(String name,Object value);
	
	public T gt(String name,Object value);
	
	public T lt(String name,Object value);
	
	public T between(String name,Object value1,Object value2);
	
	public T notBetween(String name,Object value1,Object value2);
	
	public T in(String name,String query);
	
	public T notIn(String name,Object[] values);

	public T notIn(String name,String query);
	
	public T in(String name,Object[] values);
	
	public T isNull(String name);
	
	public T isNotNull(String name);
	
	public String getRestriction();
}
