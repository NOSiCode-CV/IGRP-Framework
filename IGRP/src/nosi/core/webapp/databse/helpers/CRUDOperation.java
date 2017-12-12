package nosi.core.webapp.databse.helpers;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.webapp.Model;
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
				 Object value = model.getFieldValueAsObject(col.getName());
				 if(value!=null) {
					query.setParameter(i,col.getType().cast(value.toString()));
				 }
				 i++;
			}
		}
		int r = query.executeUpdate();
		t.commit();
		em.close();
		return r > 0;
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

	private String getSqlUpdate(String schemaName, List<DatabaseMetadaHelper.Column> colmns, String tableName) {
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		String updates = "";
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				updates += col.getName()+"=?,";
			}
		}	
		updates = updates.substring(0, updates.length()-1);
		return "UPDATE "+tableName +" SET "+updates+" WHERE id=?";
	}
	
	public boolean update(String schemaName, Config_env config, String tableName,Model model, Object id) {
		List<DatabaseMetadaHelper.Column> colmns = DatabaseMetadaHelper.getCollumns(config,schemaName, tableName);
		String sql = this.getSqlUpdate(schemaName, colmns, tableName);
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery(sql);
        int i = 1;
		for(DatabaseMetadaHelper.Column col:colmns) {
			if(!col.isAutoIncrement()) {
				if(!col.isAutoIncrement()) {
					 query.setParameter(i,col.getType().cast(model.getFieldValueAsObject(col.getName()).toString()));
					 i++;
				}
			}
		}
		query.setParameter(i+1, Integer.parseInt(id.toString()));
		int r = query.executeUpdate();
		t.commit();
		em.close();
		return r > 0;
	}

	public boolean delete(String schemaName, Config_env config, String tableName, Object id) {
		tableName = !schemaName.equals("")?schemaName+"."+tableName:tableName;//Adiciona schema
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query query = em.createNativeQuery("Delete from "+tableName+" where ID=?");
		query.setParameter(1, id);
	    int r = query.executeUpdate();
	    t.commit();
	    em.close();
	    return r > 0;
	}
}
