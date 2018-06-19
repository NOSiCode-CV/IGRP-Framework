package nosi.core.webapp.databse.helpers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QuerySelect extends CommonFIlter{

	private Class<?> className;
	
	public QuerySelect(String connectionName) {
		super(connectionName);
	}

	public QuerySelect() {				
		this(getMyConnectionName());
			
	}		
	
	private static String getMyConnectionName() {		
		final Config_env firstConnectionNameOfTheApp = new Config_env().find().andWhere("application", "=", Core.getCurrentApp().getId()).one();
		if(firstConnectionNameOfTheApp!=null)
			return firstConnectionNameOfTheApp.getName();
		else return Config.getBaseConnection();
	}
	
	//Validate sql query
	public boolean validateQuery(Config_env config,String sql) {
		boolean isValid = false;
		EntityManager em = null;
		try {
			sql = sql.replaceAll(":\\w+", "null");
			Core.log("SQL Query:"+sql);
			em = HibernateUtils.getSessionFactory(config).createEntityManager();
			Query query = em.createNativeQuery(sql,Tuple.class);
			query.getResultList();
			isValid = true;
		}catch(Exception e) {
			isValid = false;
			Core.log(e.getMessage());
		}finally {
			if(em!=null)
				em.close();
		}
		return isValid;
	}
	
	public QueryInterface select(String collumns) {
		if(Core.isNotNull(collumns)) {
			if(!collumns.toUpperCase().contains("SELECT"))
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
	
	@SuppressWarnings("unchecked")
	public List<Tuple> getResultList() {
		EntityManager em = null;
		List<Tuple> list = null;
		try {
			Core.log("SQL Query:"+this.getSql());
			em = HibernateUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
			Query query = em.createNativeQuery(this.getSql(),Tuple.class);	
			for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
				 if(col.getDefaultValue()!=null) {
					 this.setParameter(query,col.getDefaultValue(),col);					
				 }else {
					 query.setParameter(col.getName(), null);
				 }
			}	
			list = query.getResultList();
		}catch(Exception e) {
			Core.log(e.getMessage());
		}finally {
			if(em!=null) {
				em.close();
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> getResultList(Class<T> entity){	
		EntityManager em = null;
		List<T> list = null;
		try {
			Core.log("SQL Query:"+this.getSql());
			em = HibernateUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
			Query query = em.createNativeQuery(this.getSql(),entity);	
			for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
				 if(col.getDefaultValue()!=null) {
					 this.setParameter(query,col.getDefaultValue(),col);					
				 }else {
					 query.setParameter(col.getName(), null);
				 }
			}		
			list = query.getResultList();
		}catch(Exception e) {
			Core.log(e.getMessage());
		}finally {
			if(em!=null)
				em.close();
		}
		return list;
	}
	
	public Object getSigleResult() {
		EntityManager em = null;
		Object list = null;
		try {
			Core.log("SQL Query:"+this.getSql());
			em = HibernateUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
			Query query = em.createNativeQuery(this.getSql());
			for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
				 if(col.getDefaultValue()!=null) {
					 this.setParameter(query,col.getDefaultValue(),col);					
				 }else {
					 query.setParameter(col.getName(), null);
				 }
			}		
			list = query.getSingleResult();
		}catch(Exception e) {
			Core.log(e.getMessage());
		}finally {
			if(em!=null)
				em.close();
		}
		return list;
	}
	
	public TypedQuery<?> getSingleResult(){
		EntityManager em = null;
		TypedQuery<?> query = null;
		try {
			Core.log("SQL Query:"+this.getSql());
			em = HibernateUtils.getSessionFactory(this.getConnectionName()).createEntityManager();
			query = em.createQuery(this.getSql(), this.className);
			for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
				 if(col.getDefaultValue()!=null) {
					 this.setParameter(query,col.getDefaultValue(),col);					
				 }else {
					 query.setParameter(col.getName(), null);
				 }
			}				
		}catch(Exception e) {
			Core.log(e.getMessage());
		}finally {
			if(em!=null)
				em.close();
		}
		return query;
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
	public QueryInterface innerJoin(String table2, String key1, String key2) {
		if(Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" INNER JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}
	
	@Override
	public QueryInterface leftJoin(String table2, String key1, String key2) {
		if(Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" LEFT JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface rightJoin(String table2, String key1, String key2) {
		if(Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" RIGHT JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface outerJoin(String table2, String key1, String key2) {
		if(Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" FULL OUTER JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface selfJoin(String table2, String key1, String key2) {
		if(Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(" AND "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface innerJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(table1+" INNER JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface leftJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(table1+" LEFT JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface rightJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(table1+" RIGHT JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface outerJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(table1+" FULL OUTER JOIN "+table2+" ON "+key1+" = "+key2+" ");
		}
		return this;
	}

	@Override
	public QueryInterface selfJoin(String table1, String table2, String key1, String key2) {
		if(Core.isNotNull(table1) && Core.isNotNull(table2) && Core.isNotNull(key1) && Core.isNotNull(key2)) {
			this.filterWhere(table1+" AND "+table2+" ON "+key1+" = "+key2+" ");
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
	public QueryInterface from(String tables) {
		if(Core.isNotNull(tables)) {
			this.setSql(" FROM "+tables);
		}
		return this;
	}

	public ResultSet executeQuery(Config_env env) {
		Connection conn =nosi.core.config.Connection.getConnection(env);
		return executeQuery(conn);
	}
	
	public ResultSet executeQuery(String connectionName) {
		Connection conn =nosi.core.config.Connection.getConnection(connectionName);	
		return executeQuery(conn);
	}
	
	public ResultSet executeQuery(Connection conn) {
		ResultSet r = new ResultSet();
		if(conn!=null) {
			PreparedStatement ps = null;
			try {
				ps = conn.prepareStatement(this.getSql());
				ps.execute();
				r.setSql(this.getSql());
				Core.log("SQL:"+this.getSql());
			} catch (SQLException e) {
				r.setError(e.getMessage());
				Core.log(e.getMessage());
			}
			try {
				conn.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if(ps!=null)
						ps.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}		
		}
		return r;
	}
}
