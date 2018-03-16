package nosi.core.webapp.databse.helpers;

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
public class QuerySelect extends QueryHelper {

	private Class<?> className;
	
	public QuerySelect(String connectionName) {
		super(connectionName);
	}

	public QuerySelect() {
		this(Config.getBaseConnection());
	}
	
	public QueryHelper select(String sql) {
		this.sql = sql;
		return this;
	}
	

	public QueryHelper select(String sql,Class<?> className) {
		this.sql = sql;
		this.className = className;
		return this;
	}
	
	public List<Tuple> getResultList() {
		this.sql += Core.isNotNull(this.condition)?(" WHERE "+this.condition):"";		
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Core.log("SQL Query:"+this.sql);
		Query query = em.createNativeQuery(this.sql,Tuple.class);	
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
		this.sql += Core.isNotNull(this.condition)?(" WHERE "+this.condition):"";		
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Core.log("SQL Query:"+this.sql);
		Query query = em.createNativeQuery(this.sql,entity);	
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		@SuppressWarnings("unchecked")
		List<T> list = query.getResultList();
		t.commit();
		em.close();
		return list;
	}
	
	public Object getSigleResult() {
		this.sql += Core.isNotNull(this.condition)?(" WHERE "+this.condition):"";
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Core.log("SQL Query:"+this.sql);
		Query query = em.createNativeQuery(this.sql);
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		Object list = query.getSingleResult();
		t.commit();
		em.close();
		return list;
	}
	
	public TypedQuery<?> getSingleResult(){
		this.sql += Core.isNotNull(this.condition)?(" WHERE "+this.condition):"";
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		TypedQuery<?> query = em.createQuery(this.sql, this.className);
		Core.log("SQL Query:"+this.sql);
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		t.commit();
		em.close();
		return query;
	}
}
