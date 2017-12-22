package nosi.core.webapp.databse.helpers;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
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
	
	public List<?> getResultList() {
		this.sql += Core.isNotNull(this.condition)?("WHERE "+this.condition):"";
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = null;
		if(this.className!=null) {
			TypedQuery<?> q = em.createQuery(this.sql,this.className);
			query = q;
		}else {
			query = em.createNativeQuery(this.sql);
		}
		for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
			 if(col.getDefaultValue()!=null) {
				 this.setParameter(query,col.getDefaultValue(),col);					
			 }else {
				 query.setParameter(col.getName(), null);
			 }
		}		
		List<?> list = query.getResultList();
		t.commit();
		em.close();
		return list;
	}

	
	public Object getSigleResult() {
		this.sql += Core.isNotNull(this.condition)?("WHERE "+this.condition):"";
		EntityManager em = PersistenceUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
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
}
