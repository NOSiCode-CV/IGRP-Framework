package nosi.core.webapp.databse.helpers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Parameter;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.config.Config;
import nosi.core.config.Connection;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 14 Dec 2017
 */
public class Query {

	private boolean isError;
	private String error;
	private ResultSetMetaData metadata;
	private ResultSet resultSet;
	private Statement ps;
	
	public ResultSetMetaData getMetadata() {
		return metadata;
	}
	public void setResultSet(ResultSet resultSet, Statement ps2) {
		this.resultSet = resultSet;
		this.ps = ps2;
	}
	public void setMetadata(ResultSetMetaData metadata) {
		this.metadata = metadata;
	}
	public ResultSet getResultSet() {
		return resultSet;
	}
	public boolean isError() {
		return isError;
	}
	public void setError(boolean isError) {
		this.isError = isError;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
	
	public static List<?> queryToList(String connectionName,String sql){
		EntityManager em = PersistenceUtils.getSessionFactory(connectionName).createEntityManager();
		javax.persistence.Query q = em.createQuery(sql);
		List<?> list =  q.getResultList();
		em.close();
		return list;
	}
	
	public static List<Map<String,Object>> query(String connectionName,String sql){
		List<Map<String,Object>> list = new ArrayList<>();
		java.sql.Connection con = Connection.getConnection(connectionName);
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    ResultSetMetaData metaData = rs.getMetaData();
		    int columnsCount = metaData.getColumnCount();
		    while(rs.next()) {
		    	Map<String,Object> data = new HashMap<>();
			    for(int i=1;i<=columnsCount;i++) {
			    	data.put(metaData.getColumnName(i).toLowerCase(), rs.getObject(i));
			    }
			    list.add(data);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		    try {
		    	if(st!=null)
		    		st.close();
		    	if(rs!=null)
		    		rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	
	public static Map<Object,Object> queryToComboBox(String connectionName,String sql){
		Map<Object,Object> comboBox = new HashMap<>();
		java.sql.Connection con = Connection.getConnection(connectionName);
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    while(rs.next()) {
		    	comboBox.put(rs.getObject(1), rs.getObject(2));
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		    try {
		    	if(st!=null)
		    		st.close();
		    	if(rs!=null)
		    		rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comboBox;
	}

	public static Map<String, Object> queryOne(String connectionName, String sql) {
		List<Map<String, Object>> list = query(connectionName, sql);
		if(list!=null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	
	//Validate sql query
	public static boolean validateQuery(Config_env config,String query) {
		EntityManager em = PersistenceUtils.getSessionFactory(config.getName()).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		boolean x = false;
		try{
			javax.persistence.Query q = em.createNativeQuery(query);
			for(Parameter<?> param:q.getParameters()){
				q.setParameter(param.getName(), null);
			}
			q.getResultList();
			x = true;
			t.commit();
		}catch(Exception e){
			x = false;
		}finally{
			em.close();
		}
		return x;
	}
	
	
	public void close(){
		try {
			if(this.getResultSet()!=null){
				this.ps.close();
				this.getResultSet().close();
			}
		} catch (SQLException e) {
		}
	}
	

	public Query queryChart(String connectionName,String sql){
		Query q = new Query();
		java.sql.Connection conn = Connection.getConnection(connectionName);
		try {
			Statement ps = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = ps.executeQuery(sql);
			q.setResultSet(rs,ps);
			q.setMetadata(rs.getMetaData());
		} catch (SQLException e) {
			q.setError(e.getMessage());
			q.setError(true);
			q.close();
		}
		return q; 
	}
	
	public Query queryChart(String sql){
		return this.queryChart(Config.getBaseConnection(), sql);
	}
	
	public List<String> getColumns(){
		List<String> column = new ArrayList<>();
		if(this.getMetadata()!=null){
			try {
				for(int j=1;j<=this.getMetadata().getColumnCount();j++){
					column.add(this.getMetadata().getColumnName(j));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return column;
	}
}
