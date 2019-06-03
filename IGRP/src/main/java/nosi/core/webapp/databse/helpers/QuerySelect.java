package nosi.core.webapp.databse.helpers;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import org.hibernate.SessionFactory;
import nosi.base.ActiveRecord.HibernateHintOption;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 21 Dec 2017
 */
public class QuerySelect extends CommonFIlter{

	private Class<?> className;
	
	public QuerySelect(Object connectionName) {
		super(connectionName);
	}
	public QuerySelect(Object connectionName,boolean displayError,boolean tracingError) {
		this(connectionName);
		this.setShowError(displayError);
		this.setShowTracing(tracingError);
	}
	
	public QuerySelect() {				
				
	}

	//Validate sql query
	public boolean validateQuery(Config_env config,String sql) {
		boolean isValid = false;
		SessionFactory session =  HibernateUtils.getSessionFactory(config);
		if(session!=null) {
			EntityManager em = null;
			try {
				sql = sql.replaceAll(":\\w+", "null");
				Core.log("SQL Query:"+sql);
				em = session.createEntityManager();
				Query query = em.createNativeQuery(sql,Tuple.class);
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				query.getResultList();
				isValid = true;
			}catch(Exception e) {
				isValid = false;
				this.setError(null, e);
			}finally {
				if(em!=null)
					em.close();
			}
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
		List<Tuple> list = null;
		SessionFactory session =  this.getSessionFactory();
		if(session!=null) {
			try {
				Core.log("SQL Query:"+this.getSql());
				this.em = session .createEntityManager();
				Query query = this.em.createNativeQuery(this.getSql(),Tuple.class);	
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
					 if(col.getDefaultValue()!=null) {
						 this.paramHelper.setParameter(query,col.getDefaultValue(),col);					
					 }else {
						 query.setParameter(col.getName(), null);
					 }
				}	
				list = query.getResultList();
			}catch(Exception e) {
				this.setError(null, e);
			}finally {
				this.close();
			}
		}
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T getSingleResult(Class<T> entity) {
		T find = null;
		SessionFactory session =  this.getSessionFactory();
		if(session!=null) {
			try {
				Core.log("SQL Query:"+this.getSql());
				this.em = session.createEntityManager();
				Query query = this.em.createQuery(this.getSql(),entity);
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
					 if(col.getDefaultValue()!=null) {
						 this.paramHelper.setParameter(query,col.getDefaultValue(),col);					
					 }else {
						 query.setParameter(col.getName(), null);
					 }
				}		
				find = (T) query.getSingleResult();
			}catch(Exception e) {
				this.setError(null, e);
			}finally {
				this.close();
			}
		}
		return find;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> getResultList(Class<T> entity){	
		List<T> list = null;
		SessionFactory session =  this.getSessionFactory();
		if(session!=null) {
			try {
				Core.log("SQL Query:"+this.getSql());
				this.em = session.createEntityManager();
				Query query = this.em.createQuery(this.getSql(),entity);	
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
					 if(col.getDefaultValue()!=null) {
						 this.paramHelper.setParameter(query,col.getDefaultValue(),col);					
					 }else {
						 query.setParameter(col.getName(), null);
					 }
				}		
				list = query.getResultList();
			}catch(Exception e) {
				this.setError(null, e);
			}finally {
				this.close();
			}
		}
		return list;
	}
	
	@Deprecated
	@Override
	public Tuple getSigleResult() {
		List<Tuple> list = this.getResultList();		
		if(list!=null && list.size()> 0)
			return list.get(0);
		return null;
	}
	
	@Override
	public Tuple getSingleResult() {
		List<Tuple> list = this.getResultList();		
		if(list!=null && list.size()> 0)
			return list.get(0);
		return null;
	}
	
	
	@Override
	public Record getRecordList() {
		Record r = new Record();
		List<Tuple> list = this.getResultList();
		r.setSql(this.getSql());
		if(list!=null) { 
			r.RowList = new ArrayList<>();
			list.stream().forEach(l->{
				Record rec = new Record();
				rec.Row = l;
				r.RowList.add(rec);
			});
		}
		return r;
	}

	@Override
	@Deprecated
	public Record getSigleRecord() {
		Record r = new Record();
		r.Row = this.getSigleResult();
		r.setSql(this.getSql());
		return r;
	}
	

	@Override
	public Record getSingleRecord() {
		Record r = new Record();
		r.Row = this.getSingleResult();
		r.setSql(this.getSql());
		return r;
	}
	
	@Override
	public TypedQuery<?> getTypedQuery(){
		TypedQuery<?> query = null;
		SessionFactory session =  this.getSessionFactory();
		if(session!=null) {
			try {
				Core.log("SQL Query:"+this.getSql());
				this.em = session.createEntityManager();
				query = this.em.createQuery(this.getSql(), this.className);
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				for(DatabaseMetadaHelper.Column col:this.getColumnsValue()) {		 
					 if(col.getDefaultValue()!=null) {
						 this.paramHelper.setParameter(query,col.getDefaultValue(),col);					
					 }else {
						 query.setParameter(col.getName(), null);
					 }
				}				
			}catch(Exception e) {
				this.setError(null, e);
			}finally {
				this.close();
			}
		}
		return query;
	}
	

	@Override
	public QueryInterface having(String name, String operator, String value) {		 
		if(Core.isNotNull(value)) {
			String name_ = this.resolveDuplicateParam(this.recq.removeAlias(name));
			this.filterWhere(" HAVING "+name+" "+operator+":"+name_+" ").addString(name_, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Integer value) {		 
		if(Core.isNotNull(value)) {
			String name_ = this.resolveDuplicateParam(this.recq.removeAlias(name));
			this.filterWhere(" HAVING "+name+" "+operator+":"+name_+" ").addInt(name_, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Double value) {		 
		if(Core.isNotNull(value)) {
			String name_ = this.resolveDuplicateParam(this.recq.removeAlias(name));
			this.filterWhere(" HAVING "+name+" "+operator+":"+name_+" ").addDouble(name_, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Float value) {		 
		if(Core.isNotNull(value)) {
			String name_ = this.resolveDuplicateParam(this.recq.removeAlias(name));
			this.filterWhere(" HAVING "+name+" "+operator+":"+name_+" ").addFloat(name_, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, Date value) {
		if(Core.isNotNull(value)) {
			String name_ = this.resolveDuplicateParam(this.recq.removeAlias(name));
			this.filterWhere(" HAVING "+name+" "+operator+":"+name_+" ").addDate(name_, value);
		}
		return this;
	}

	@Override
	public QueryInterface having(String name, String operator, String value, String format) {
		return this.having(name, operator, Core.ToDate(value, format));
	}

	
	@Override
	public QueryInterface orderBy(String[]... orderByNames) {
		return this.orderBy(orderByNames,ORDERBY.ASC);
	}
	
	private QueryInterface orderBy(String[][] orderByNames, String defaultOrder) {
		if(orderByNames!=null) {
			String c = " ORDER BY ";
    		int i=1;
    		for(String[] names:orderByNames) {
    			String order = names[names.length-1];
    			String[] newNames = null;
    			if(!order.equalsIgnoreCase(ORDERBY.ASC) && !order.equalsIgnoreCase(ORDERBY.DESC)) {
    				order = Core.isNotNull(defaultOrder)?defaultOrder:ORDERBY.ASC;
    				newNames = Arrays.copyOf(names, names.length);
    			}else{
    				newNames = Arrays.copyOf(names, names.length-1>=1?names.length-1:names.length);
    			}
    			c+= (Arrays.toString(newNames).replaceAll("\\[", "").replaceAll("\\]", "")+" "+order+(i==orderByNames.length?" ":", "));
    			i++;
    		}
    		this.filterWhere(c);
    	}
		return this;
	}
	@Override
	public QueryInterface orderByAsc(String... columns) {
		return this.orderBy(new String[][] {columns},ORDERBY.ASC);
	}

	@Override
	public QueryInterface orderByDesc(String... columns) {
		return this.orderBy(new String[][] {columns},ORDERBY.DESC);
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
		Connection conn =  this.connection.getConnection(env);
		return executeQuery(conn);
	}
	
	public ResultSet executeQuery(String connectionName) {
		Connection conn = this.connection.getConnection(connectionName);	
		return executeQuery(conn);
	}
	
	public ResultSet executeQuery(Connection conn) {
		ResultSet r = new ResultSet();
		if(conn!=null) {
			PreparedStatement ps = null;
			try {
				conn.setAutoCommit(false);
				ps = conn.prepareStatement(this.getSql());
				ps.execute();
				r.setSql(this.getSql());
				Core.log("SQL:"+this.getSql());
			} catch (SQLException e) {
				this.setError(r, e);
			}
			try {
				conn.commit();
			} catch (SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					this.setError(r, e1);
				}
				this.setError(r, e);
			}finally {
				try {
					if(ps!=null)
						ps.close();
				} catch (SQLException e1) {
					this.setError(r, e1);
				}
				if(conn!=null) {
					try {
						conn.close();
					} catch (SQLException e) {
						this.setError(r, e);
					}
				}
			}		
		}
		return r;
	}
}
