package nosi.core.webapp;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Emanuel
 * 21 Mar 2018
 */
public class QueryString<K,V> {

	private final Map<K,List<V>> queryString;

	public QueryString() {
		this.queryString = new LinkedHashMap<>();
	}
	
	public List<V> getValues(K key){
        return queryString.get(key);
    }

    public QueryString<K,V> addQueryString(K key, V value){
        List<V> target = queryString.get(key);
        if(target == null){
            target = new ArrayList<V>();
            queryString.put(key,target);
        }
        target.add(value);
        return this;
    }
    
    public QueryString<K,V> removeQueryString(K key){
        queryString.remove(key);
        return this;
    } 
	public Map<K,List<V>> getQueryString() {
		return queryString;
	}

}
