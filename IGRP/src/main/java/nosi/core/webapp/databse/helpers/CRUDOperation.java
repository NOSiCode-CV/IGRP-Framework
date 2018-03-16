package nosi.core.webapp.databse.helpers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
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
		QueryHelper query = new QueryInsert(config.getName()).insert(schemaName, tableName);
		colmns = colmns.stream().filter(col->!col.isAutoIncrement()).peek(col->{
			Object value = model.getFieldValueAsObject(model,col.getName());			 
			 if(value!=null) {
				 col.setDefaultValue(value);					
			 }	
		}).collect(Collectors.toList());
		query.setColumnsValue(colmns);
		int r = (int)query.execute();
		return r > 0;
	}

	public boolean update(Config_env config,String schemaName,  String tableName,Model model, Object idValue) {		
		List<DatabaseMetadaHelper.Column> colmns = DatabaseMetadaHelper.getCollumns(config,schemaName,  tableName);
		colmns = colmns.stream().filter(col->!col.isAutoIncrement()).peek(col->{
			Object value = model.getFieldValueAsObject(model,col.getName());			 
			 if(value!=null) {
				 col.setDefaultValue(value);					
			 }	
		}).collect(Collectors.toList());		
		Column pkey = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		pkey.setDefaultValue(idValue);
		colmns.add(pkey);
		QueryHelper query = new QueryUpdate(config.getName()).update(schemaName, tableName).where(pkey.getName().toLowerCase()+"=:"+pkey.getName().toLowerCase());
		query.setColumnsValue(colmns);
		int r = (int) query.execute();
		return r > 0;
	}

	public boolean delete(String schemaName, Config_env config, String tableName, Object value) {
		Column pkey = DatabaseMetadaHelper.getPrimaryKey(config, schemaName, tableName);
		pkey.setDefaultValue(value);
		List<DatabaseMetadaHelper.Column> colmns = new ArrayList<>();
		colmns.add(pkey);
		QueryHelper query = new QueryDelete(config.getName()).delete(schemaName, tableName).where(pkey.getName().toLowerCase()+"=:"+pkey.getName().toLowerCase());
		query.setColumnsValue(colmns);
		int r = (int) query.execute();
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
