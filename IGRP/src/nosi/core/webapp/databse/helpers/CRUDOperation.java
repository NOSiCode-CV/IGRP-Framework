package nosi.core.webapp.databse.helpers;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.webapp.Model;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 8 Dec 2017
 */
public class CRUDOperation {

	public boolean insert(String schemaName, Config_env config, String tableName,Model model) {
		List<DatabaseMetadaHelper.Column> colmns = DatabaseMetadaHelper.getCollumns(config,schemaName,  tableName);
		String sql = new QueryInsert().getSqlInsert(schemaName, colmns, tableName);
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery(sql);
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				 Object value = model.getFieldValueAsObject(model,col.getName());			 
				 if(value!=null) {
					 new QueryInsert().setParameter(query,value,col);					
				 }else {
					 query.setParameter(col.getName(), null);
				 }
			}
		}
		int r = query.executeUpdate();
		t.commit();
		em.close();
		return r > 0;
	}

	public boolean update(Config_env config,String schemaName,  String tableName,Model model, Object id) {
		List<DatabaseMetadaHelper.Column> colmns = DatabaseMetadaHelper.getCollumns(config,schemaName, tableName);
		String sql = new QueryUpdate().getSqlUpdate(config,schemaName, colmns, tableName);
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery(sql);
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				if(!col.isAutoIncrement()) {
					 if(!col.isAutoIncrement()) {
						 Object value = model.getFieldValueAsObject(model,col.getName());
						 if(value!=null) {
							 new QueryUpdate().setParameter(query,value,col);					
						 }else {
							 query.setParameter(col.getName(), null);
						 }
					}
				}
			}
		}
		Column pkey = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		query.setParameter(pkey.getName().toLowerCase(), Integer.parseInt(id.toString()));
		int r = query.executeUpdate();
		t.commit();
		em.close();
		return r > 0;
	}

	public boolean delete(String schemaName, Config_env config, String tableName, Object value) {
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Column col = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		Query query = em.createNativeQuery("DELETE FROM "+tableName+" WHERE "+col.getName()+"=?");
		new QueryDelete().setParameter(query, value, col);
	    int r = query.executeUpdate();
	    t.commit();
	    em.close();
	    return r > 0;
	}


	public Map<String,Object> selectOne(String schemaName, Config_env config, String tableName, Object value) {
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Column pkey = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		Map<String,Object> query  = nosi.core.webapp.databse.helpers.Query.queryOne(config.getName(), "SELECT * FROM "+tableName+" WHERE "+pkey.getName()+"="+value.toString());
		return query;
	}
}
