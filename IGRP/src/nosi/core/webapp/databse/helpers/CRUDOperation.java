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
		String sql = this.getSqlInsert(schemaName, colmns, tableName);
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery(sql);
        int i = 1;
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				 Object value = model.getFieldValueAsObject(model,col.getName());			 
				 if(value!=null) {
					 this.setParameter(query,value,col,i);					
				 }else {
					 query.setParameter(i, null);
				 }
				 i++;
			}
		}
		int r = query.executeUpdate();
		t.commit();
		em.close();
		return r > 0;
	}


	private void setParameter(Query query, Object value, Column col, int i) {
		if(col.getType().equals(java.lang.Integer.class)) {
			query.setParameter(i,Integer.parseInt(value.toString()));
		}else if(col.getType().equals(java.lang.Double.class)){
			query.setParameter(i, Double.parseDouble(value.toString()));
		}else if(col.getType().equals(java.lang.Float.class)){
			query.setParameter(i, Float.parseFloat(value.toString()));
		}else if(col.getType().equals(java.lang.Character.class)){
			query.setParameter(i, (Character)value);
		}else {
			query.setParameter(i,value);
		}
	}


	private String getSqlInsert(String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		String inserts = "";
		String values = "";
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				inserts += col.getName()+",";
				values += "?,";
			}
		}	
		inserts = inserts.substring(0, inserts.length()-1);
		values = values.substring(0, values.length()-1);
		return "INSERT INTO "+tableName+" ("+inserts+") VALUES ("+values+")";
	}

	private String getSqlUpdate(Config_env config,String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		Column pkey = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		String updates = "";
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				updates += col.getName()+"=?,";
			}
		}	
		updates = updates.substring(0, updates.length()-1);
		return "UPDATE "+tableName +" SET "+updates+" WHERE "+pkey.getName()+"=?";
	}
	
	public boolean update(Config_env config,String schemaName,  String tableName,Model model, Object id) {
		List<DatabaseMetadaHelper.Column> colmns = DatabaseMetadaHelper.getCollumns(config,schemaName, tableName);
		String sql = this.getSqlUpdate(config,schemaName, colmns, tableName);
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery(sql);
        int i = 1;
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				if(!col.isAutoIncrement()) {
					 if(!col.isAutoIncrement()) {
						 Object value = model.getFieldValueAsObject(model,col.getName());
						 if(value!=null) {
							 this.setParameter(query,value,col,i);					
						 }else {
							 query.setParameter(i, null);
						 }
						 i++;
					}
				}
			}
		}
		query.setParameter(i, Integer.parseInt(id.toString()));
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
		this.setParameter(query, value, col, 1);
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
