package nosi.core.webapp.databse.helpers;

import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.config.Config;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QuerySelect extends QueryHelper implements QueryInterface{

	private Class<?> className;
	
	public QuerySelect(String connectionName) {
		super(connectionName);
	}

	public QuerySelect() {
		this(Config.getBaseConnection());
	}
	
	public QueryInterface select(String collumns) {
		if(Core.isNotNull(collumns)) {
			if(!collumns.toUpperCase().startsWith("SELECT"))
				this.setSql("SELECT "+collumns+" ");
			else
				this.setSql(collumns);
		}
		return this;
	}
	

	public QueryInterface select(String sql,Class<?> className) {
		this.setSql(sql);
		this.className = className;
		return this;
	}
	
	public List<Tuple> getResultList() {		
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Core.log("SQL Query:"+this.getSql());
		Query query = em.createNativeQuery(this.getSql(),Tuple.class);	
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}	
		@SuppressWarnings("unchecked")
		List<Tuple> list = query.getResultList();
		t.commit();
		em.close();
		return list;
	}

	public <T> List<T> getResultList(Class<T> entity){	
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		Core.log("SQL Query:"+this.getSql());
		Query query = em.createNativeQuery(this.getSql(),entity);	
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		@SuppressWarnings("unchecked")
		List<T> list = query.getResultList();
		em.close();
		return list;
	}
	
	public Object getSigleResult() {
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		Core.log("SQL Query:"+this.getSql());
		Query query = em.createNativeQuery(this.getSql());
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		Object list = query.getSingleResult();
		em.close();
		return list;
	}
	
	public TypedQuery<?> getSingleResult(){
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		TypedQuery<?> query = em.createQuery(this.getSql(), this.className);
		Core.log("SQL Query:"+this.getSql());
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		em.close();
		return query;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addString(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String[] values) {
		if(values!=null) {
			values = this.normalizeStringVlaues(values);
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	private String[] normalizeStringVlaues(String[] values) {
		for(int i=0;i<values.length;i++) {
        	values[i] = "\'"+values[i]+"\'";
        }
		return values;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addDouble(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addString(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String[] values) {
		if(values!=null) {
			values = this.normalizeStringVlaues(values);
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addDouble(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, String value) {		 
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+name+" "+operator+":"+name+" ").addString(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Integer value) {		 
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+name+" "+operator+":"+name+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Double value) {		 
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+name+" "+operator+":"+name+" ").addDouble(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Float value) {		 
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+name+" "+operator+":"+name+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orderBy(String[]... orderByNames) {
		if(orderByNames!=null) {
			String c = " ORDER BY ";
    		int i=1;
    		for(String[] names:orderByNames) {
    			String order = names[names.length-1];
    			if(!order.equalsIgnoreCase(ORDERBY.ASC) && !order.equalsIgnoreCase(ORDERBY.DESC))
    				order = ORDERBY.ASC;
    			String[] newNames = Arrays.copyOf(names, names.length-1>=1?names.length-1:names.length);
    			c+= (Arrays.toString(newNames).replaceAll("\\[", "").replaceAll("\\]", "")+" "+order+(i==orderByNames.length?" ":", "));
    			i++;
    		}
    		this.filterWhere(c);
    	}
		return this;
	}

	@Override
	public QueryInterface groupBy(String... groupByNames) {
		if(groupByNames!=null) {
			this.filterWhere(" GROUP BY "+Arrays.toString(groupByNames).replaceAll("\\[", "").replaceAll("\\]", "")+" ");
		}
		return this;
	}

	@Override
	public QueryInterface between(String name, Object value1, Object value2) {
		if(Core.isNotNull(value1) && Core.isNotNull(value2)) {
			this.where(" "+name+" BETWEEN value1=:value1 AND value2=:value2 ").addObject("value1",value1).addObject("value2", value2);
		}
		return this;
	}

	@Override
	public QueryInterface notBetween(String name, Object value1, Object value2) {
		if(Core.isNotNull(value1) && Core.isNotNull(value2)) {
			this.filterWhere(" "+name+" NOT BETWEEN value1=:value1 AND value2=:value2 ").addObject("value1",value1).addObject("value2", value2);
		}
		return this;
	}

	@Override
	public QueryInterface exists(String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" EXISTS ("+value+") ");
		}
		return this;
	}

	@Override
	public QueryInterface innerJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" INNER JOIN "+table1+" ON "+table1+"."+key1+" = "+table2+"."+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface leftJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" LEFT JOIN "+table1+" ON "+table1+"."+key1+" = "+table2+"."+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface rightJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" RIGHT JOIN "+table1+" ON "+table1+"."+key1+" = "+table2+"."+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface outerJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" FULL OUTER JOIN "+table1+" ON "+table1+"."+key1+" = "+table2+"."+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface selfJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" AND "+table1+"."+key1+" = "+table2+"."+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface union() {
		this.filterWhere(" UNION ");
		return this;
	}

	@Override
	public QueryInterface unionAll() {
		this.filterWhere(" UNION ALL ");
		return this;
	}

	@Override
	public QueryInterface andWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" AND "+name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface andWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" AND "+name+" IS NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" OR "+name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" OR "+name+" IS NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	private void applyToInCondition(String name,String operator,Object[] values) {
		String value = String.join(",", Arrays.toString(values)).replaceAll("\\[", "(").replaceAll("\\]", ")");			
		this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addString(name, value);
	}

	@Override
	public QueryInterface from(String tables) {
		if(Core.isNotNull(tables)) {
			this.setSql(" FROM "+tables);
		}
		return this;
	}
}
