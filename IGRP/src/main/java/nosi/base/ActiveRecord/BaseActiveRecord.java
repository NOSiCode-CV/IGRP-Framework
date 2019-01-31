package nosi.base.ActiveRecord;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.Id;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.ORDERBY;
import nosi.core.webapp.databse.helpers.ParametersHelper;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

@SuppressWarnings("unchecked")
public abstract class BaseActiveRecord<T> implements ActiveRecordIterface<T> {

	protected String sql="";
	protected String alias;
	protected String connectionName;
	private boolean whereIsCall = false;
	private ResolveColumnNameQuery recq;
	private int limit = -1;
	private int offset = -1;	
	private List<DatabaseMetadaHelper.Column> parametersMap;
	private String schema = null;
	private List<String> error;
	private boolean isReadOnly = false;
	private CriteriaBuilder builder = null;
	private CriteriaQuery<T> criteria = null;
	private Root<T> root = null;
	private ParametersHelper paramHelper;
	private String tableName;
	private Class<T> className;
	private T classNameCriteria;
	private boolean showError = true;
	private boolean showTracing = true;
	private String columnsSelect = "";
	
	public BaseActiveRecord() {
		this.classNameCriteria = (T) this;
		this.className = this.getClassType();
		this.setTableName(className.getSimpleName());
		this.setAlias("obj_"+className.getSimpleName().toLowerCase());
		this.recq = new ResolveColumnNameQuery(this.getClass());
		this.error = new ArrayList<>();
	}

	@Override
	public T where(String condition) {
		if(!this.whereIsCall) {
			this.sql += " WHERE "+condition;
			this.whereIsCall = true;
		}
		return (T) this;
	}
	
	protected T filterWhere(String condition) {
		this.sql += condition;
		return (T) this;
	}
	
	@Override
	public T where() {
		return this.where("1=1");
	}
	
	@Override
	public T and() {
		if(!this.whereIsCall)
			this.where();
		this.sql += " AND ";
		return (T) this;
	}
	
	@Override
	public T or() {
		if(!this.whereIsCall)
			this.where();
		this.sql += " OR ";
		return (T) this;
	}
	
	@Override
	public T where(String name, String operator, String value) {
		return this.whereObject(name,name, operator, value,String.class);
	}

	@Override
	public T where(String name, String operator, String[] values) {
		return this.whereObject(name, operator, values);
	}

	@Override
	public T where(String name, String operator, Integer[] values) {
		return this.whereObject(name, operator, values);
	}

	@Override
	public T where(String name, String operator, Double[] values) {
		return this.whereObject(name, operator, values);
	}

	@Override
	public T where(String name, String operator, Float[] values) {
		return this.whereObject(name, operator, values);
	}

	@Override
	public T where(String name, String operator, Short[] values) {
		return this.whereObject(name, operator, values);
	}
	
	@Override
	public T where(String name, String operator, Short value) {
		return this.whereObject(name,name, operator, value,Short.class);
	}
	
	@Override
	public T where(String name, String operator, Integer value) {
		return this.whereObject(name,name, operator, value,Integer.class);
	}

	@Override
	public T where(String name, String operator, Float value) {
		return this.whereObject(name,name, operator, value,Float.class);
	}

	@Override
	public T where(String name, String operator, Double value) {
		return this.whereObject(name,name, operator, value,Double.class);
	}
	
	@Override
	public T where(String name, String paramName, String operator, Short value) {
		return this.whereObject(name,paramName, operator, value,Short.class);
	}
	
	@Override
	public T where(String name, String operator, Date value) {
		return this.whereObject(name,name, operator, value,Date.class);
	}

	@Override
	public T andWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NOT NULL ");
		}
		return (T) this;
	}
	public T andWhere(String name, String operator) {
		if(operator.toString().equalsIgnoreCase("isnull")){
			return this.andWhereIsNull(name);
		}else if( operator.toString().equalsIgnoreCase("notnull")) {
			return this.andWhereNotNull(name);
		}
		return (T) this;
	}
	
	@Override
	public T andWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NULL ");
		}
		return (T) this;
	}

	@Override
	public T andWhere(String name, String operator, String value) {
		return this.andWhereObject(name,name, operator, value, String.class);
	}


	@Override
	public T andWhere(String name, String operator, Number value) {
		return this.andWhereObject(name,name, operator, value, Number.class);
	}
	
	@Override
	public T andWhere(String name, String operator, String[] values) {
		if(values!=null) {
			values = this.normalizeStringVlaues(values);
			String value = this.applyToInCondition(operator, values);
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	
	@Override
	public T orWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NOT NULL ");
		}
		return (T) this;
	}

	@Override
	public T orWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NULL ");
		}
		return (T) this;
	}
	
	@Override
	public T andWhere(String name, String operator, Integer[] values) {
		return this.andWhereObject(name, operator, values);
	}

	@Override
	public T andWhere(String name, String operator, Double[] values) {
		return this.andWhereObject(name, operator, values);
	}

	@Override
	public T andWhere(String name, String operator, Float[] values) {
		return this.andWhereObject(name, operator, values);
	}

	@Override
	public T andWhere(String name, String operator, Short[] values) {
		return this.andWhereObject(name, operator, values);
	}
	
	@Override
	public T andWhere(String name, String operator, Short value) {
		return this.andWhereObject(name,name, operator, value, Short.class);
	}
	
	@Override
	public T andWhere(String name, String paramName, String operator, Short value) {
		return this.andWhereObject(name,paramName, operator, value, Short.class);
	}
	
	@Override
	public T andWhere(String name, String operator, Integer value) {
		return this.andWhereObject(name,name, operator, value, Integer.class);
	}

	@Override
	public T andWhere(String name, String operator, Float value) {
		return this.andWhereObject(name,name, operator, value, Float.class);
	}

	@Override
	public T andWhere(String name, String operator, Double value) {
		return this.andWhereObject(name,name, operator, value, Double.class);
	}

	@Override
	public T andWhere(String name, String operator, Date value) {
		return this.andWhereObject(name,name, operator, value, Date.class);
	}

	@Override
	public T orWhere(String name, String operator, String value) {
		return this.orWhereObject(name,name, operator, value, String.class);
	}

	@Override
	public T orWhere(String name, String operator, Short value) {
		return this.orWhereObject(name,name, operator, value, Short.class);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, Short value) {
		return this.orWhereObject(name,paramName, operator, value, Short.class);
	}
	
	@Override
	public T orWhere(String name, String operator, String[] values) {
		return this.orWhereObject(name, operator, values);
	}

	@Override
	public T orWhere(String name, String operator, Integer[] values) {
		return this.orWhereObject(name, operator, values);
	}

	@Override
	public T orWhere(String name, String operator, Double[] values) {
		return this.orWhereObject(name, operator, values);
	}

	@Override
	public T orWhere(String name, String operator, Float[] values) {
		return this.orWhereObject(name, operator, values);
	}

	@Override
	public T orWhere(String name, String operator, Short[] values) {
		return this.orWhereObject(name, operator, values);
	}
	
	@Override
	public T orWhere(String name, String paramName,String operator, Integer value) {
		return this.orWhereObject(name,paramName, operator, value, Integer.class);
	}
	
	@Override
	public T orWhere(String name, String operator, Integer value) {
		return this.orWhereObject(name,name, operator, value, Integer.class);
	}

	@Override
	public T orWhere(String name, String operator, Float value) {
		return this.orWhereObject(name,name, operator, value, Float.class);
	}

	@Override
	public T orWhere(String name, String operator, Double value) {
		return this.orWhereObject(name,name, operator, value, Double.class);
	}

	@Override
	public T orWhere(String name, String operator, Date value) {
		return this.orWhereObject(name,name, operator, value, Date.class);
	}

	@Override
	public T having(String name, String operator, String value) {
		return this.havingObject(name, operator, value, String.class);
	}

	@Override
	public T having(String name, String operator, Integer value) {
		return this.havingObject(name, operator, value, Integer.class);
	}

	@Override
	public T having(String name, String operator, Double value) {
		return this.havingObject(name, operator, value, Double.class);
	}

	@Override
	public T having(String name, String operator, Float value) {
		return this.havingObject(name, operator, value, Float.class);
	}

	@Override
	public T having(String name, String operator, Short value) {
		return this.havingObject(name, operator, value, Short.class);
	}
	
	@Override
	public T having(String name, String operator, Date value) {
		return this.havingObject(name, operator, value, Date.class);
	}
	
	public T where(RestrictionImpl restriction) {
		this.parametersMap.addAll(restriction.getParametersMap());
		this.sql+=" WHERE ("+restriction.getRestriction()+")";
		return (T) this;
	}
	
	public T andWhere(RestrictionImpl restriction) {
		this.parametersMap.addAll(restriction.getParametersMap());
		this.sql+=" AND ("+restriction.getRestriction()+")";
		return (T) this;
	}
	
	public T orWhere(RestrictionImpl restriction) {
		this.parametersMap.addAll(restriction.getParametersMap());
		this.sql+=" OR ("+restriction.getRestriction()+")";
		return (T) this;
	}
	
	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	protected String getAlias() {
		return alias;
	}

	protected void setAlias(String alias) {
		this.alias = alias;
	}
	
	private String generateSql() {
		return " SELECT "+this.columnsSelect+" "+this.getAlias()+" FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	private String generateSqlCount() {
		return " SELECT count("+this.getAlias()+") FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	protected Class<T> getClassType(){
		ParameterizedType genericType = (ParameterizedType) this.getClass().getGenericSuperclass();
		return (Class<T>) genericType.getActualTypeArguments()[0];
	}
	
	protected String getTableName() {
		return this.tableName;
	}
	
	protected void setTableName(String tableName) {
		this.tableName = tableName;
	}
	private void addParamter(String name,String paramName, Object value,Class<?> classType) {
		Column c = new Column();
		c.setColumnMap(paramName);
		c.setName(name);
		c.setDefaultValue(value);
		c.setType(classType);
		this.parametersMap.add(c);
	}
	
	private String[] normalizeStringVlaues(String[] values) {
		for(int i=0;i<values.length;i++) {
        	values[i] = "\'"+values[i]+"\'";
        }
		return values;
	}
	
	private String applyToInCondition(String operator,Object[] values) {
		return String.join(",", Arrays.toString(values)).replaceAll("\\[", "(").replaceAll("\\]", ")");			
	}

	private T whereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			String value = this.applyToInCondition(operator, values);
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	

	private T whereObject(String name,String paramName,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			this.where("");
			paramName = recq.removeAlias(paramName);
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+paramName+" ");
			this.addParamter(name,paramName,value,classType);
		}
		return (T) this;
	}
	
	private T andWhereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			String value = this.applyToInCondition(operator, values);
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	
	private T andWhereObject(String name,String paramName,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			paramName = recq.removeAlias(paramName);
			this.and();
			if(operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equalsIgnoreCase("notlike")) {
				this.filterWhere("UPPER("+recq.resolveColumnName(this.getAlias(),name)+") "+operator+":"+paramName+" ");
				this.addParamter(name,paramName,value.toString().toUpperCase(),classType);				
			}else {
				this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+paramName+" ");
				this.addParamter(name,paramName,value,classType);
			}
		}
		return (T) this;
	}
	
	private T orWhereObject(String name,String paramName,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			paramName = recq.removeAlias(paramName);
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+paramName+" ");
			this.addParamter(name,paramName,value,classType);
		}
		return (T) this;
	}
	
	private T orWhereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			String value = this.applyToInCondition(operator, values);
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	
	private T havingObject(String name,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+recq.removeAlias(name)+" ");
			this.addParamter(name,recq.removeAlias(name), value,classType);
		}
		return (T) this;
	}
	
	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}

	public String getConnectionName() {		
		return Core.isNotNull(this.connectionName) ? this.connectionName:Core.defaultConnection();
	}

	private void setParameters(TypedQuery<T> query) {
		if(this.parametersMap!=null && !this.parametersMap.isEmpty()) {
			this.parametersMap.stream().forEach(col->{
				this.paramHelper.setParameter(query, col.getDefaultValue(), col);
			});
		}
	}
	
	public T find() {
		this.whereIsCall = false;
		this.sql = "";
		this.parametersMap = new ArrayList<>();
		this.error = new ArrayList<>();
		this.paramHelper = new ParametersHelper();
		return (T) this;
	}
	
	protected String getPrimaryKey() {
		Field[] fields = this.className.getDeclaredFields();
		for(Field field:fields) {
			if(field.isAnnotationPresent(Id.class)) {
				return field.getName();
			}
		}
		return null;
	}

	@Override
	public T where(String name, String paramName, String operator, String value) {
		return this.whereObject(name, paramName, operator, value,String.class);
	}

	@Override
	public T where(String name, String paramName, String operator, Integer value) {
		return this.whereObject(name, paramName, operator, value,Integer.class);
	}

	@Override
	public T where(String name, String paramName, String operator, Float value) {
		return this.whereObject(name, paramName, operator, value,Float.class);
	}

	@Override
	public T where(String name, String paramName, String operator, Double value) {
		return this.whereObject(name, paramName, operator, value,Double.class);
	}

	@Override
	public T where(String name, String paramName, String operator, Date value) {
		return this.whereObject(name, paramName, operator, value,Date.class);
	}
	
	@Override
	public T andWhere(String name, String paramName, String operator, String value) {
		return this.andWhereObject(name, paramName, operator, value,String.class);
	}

	@Override
	public T andWhere(String name, String paramName, String operator, Integer value) {
		return this.andWhereObject(name, paramName, operator, value,Integer.class);
	}

	@Override
	public T andWhere(String name, String paramName, String operator, Float value) {
		return this.andWhereObject(name, paramName, operator, value,Float.class);
	}

	@Override
	public T andWhere(String name, String paramName, String operator, Double value) {
		return this.andWhereObject(name, paramName, operator, value,Double.class);
	}

	@Override
	public T andWhere(String name, String paramName, String operator, Date value) {
		return this.andWhereObject(name, paramName, operator, value,Date.class);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, String value) {
		return this.orWhereObject(name, paramName, operator, value,String.class);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, Float value) {
		return this.orWhereObject(name, paramName, operator, value,Float.class);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, Double value) {
		return this.orWhereObject(name, paramName, operator, value,Double.class);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, Date value) {
		return this.orWhereObject(name, paramName, operator, value,Date.class);
	}

	public RestrictionImpl restriction() {
		return new RestrictionImpl(this.getClass(),this.getAlias());
	}

	@Override
	public T orderBy(String... orderByNames) {
		return this.orderBy(new String[][] {orderByNames});
	}
	
	@Override
	public T orderBy(String[]... orderByNames) {
		if(orderByNames!=null) {
			String c = " ORDER BY ";
    		int i=1;
    		for(String[] names:orderByNames) {
    			String order = names[names.length-1];
    			String[] newNames = null;
    			if(!order.equalsIgnoreCase(ORDERBY.ASC) && !order.equalsIgnoreCase(ORDERBY.DESC)) {
    				order = ORDERBY.ASC;
    				newNames = Arrays.copyOf(names, names.length);
    			}else{
    				newNames = Arrays.copyOf(names, names.length-1>=1?names.length-1:names.length);
    			}
    			for(int j=0;j<newNames.length;j++)
    				newNames[j] = recq.resolveColumnName(this.getAlias(),newNames[j]);
    			c+= (Arrays.toString(newNames).replaceAll("\\[", "").replaceAll("\\]", "")+" "+order+(i==orderByNames.length?" ":", "));
    			i++;
    		}
    		this.filterWhere(c);
    	}
		return (T) this;
	}

	@Override
	public T groupBy(String... groupByNames) {
		if(groupByNames!=null) {
			this.sql+=" GROUP BY "+String.join(",", groupByNames);
		}
		return (T) this;
	}

	@Override
	public T exists(String subQuery) {
		if(Core.isNotNull(subQuery))
			this.sql+=" EXISTS ("+subQuery+")";
		return (T) this;
	}
	
	@Override
	public T notExists(String subQuery) {
		if(Core.isNotNull(subQuery))
			this.sql+=" NOT EXISTS ("+subQuery+")";
		return (T) this;
	}
	
	@Override
	public T limit(int limit) {
		this.limit = limit;
		return (T) this;
	}

	@Override
	public T offset(int offset) {
		this.offset = offset;
		return (T) this;
	}

	@Override
	public T any(String subQuery) {
		if(Core.isNotNull(subQuery))
			this.sql+=" ANY ("+subQuery+")";
		return (T) this;
	}

	@Override
	public T all(String subQuery) {
		if(Core.isNotNull(subQuery))
			this.sql+=" ALL ("+subQuery+")";
		return (T) this;
	}

	@Override
	public List<T> findAll(CriteriaQuery<T> criteria) {
//		EntityManager em = null;
		Transaction transaction = null;
		List<T> list = null;
		try {
//			em = this.getSession().getTransaction();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			TypedQuery<T> query = this.getSession().createQuery(criteria);
			this.setParameters(query);
			list = query.getResultList();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.getSession().close();
		}
		return list;
	}


	@Override
	public T findOne(CriteriaQuery<T> criteria) {
		List<T> list = this.findAll(criteria);
		return list!=null && !list.isEmpty()?list.get(0):null;
	}

	@Override
	public T findOne(Object value) {
		this.find();
		this.whereObject(this.getPrimaryKey(),this.getPrimaryKey(), "=",value,Object.class);
		return this.one();
	}
	
	@Override
	public T one() {
		this.limit = 1;
		List<T> list = this.all();
		return (list!=null && !list.isEmpty() && list.size()>0)?list.get(0):null;
	}

	@Override
	public List<T> findAll() {
		this.find();
		return this.all();
	}
	
	@Override
	public List<T> all() {
		this.sql =  this.generateSql()+this.sql;
//		EntityManager em = null;
		Transaction transaction = null;
		List<T> list = null;
		try {
//			em = this.getSessionFactory().createEntityManager();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			TypedQuery<T> query = this.getSession().createQuery(this.getSql(), this.className);
			if(this.offset > -1)
				query.setFirstResult(offset);
			if(this.limit > -1)
				query.setMaxResults(limit);
			this.setParameters(query);
			list = query.getResultList();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
//			if (em != null) {
//				em.close();
//			}
//			this.closeSession();
			this.getSession().close();
		}
		return list;
	}
		
	@Override
	public T insert() {
//		EntityManager em = null;
		Transaction transaction = null;
		try {
//			em = this.getSessionFactory().createEntityManager();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			this.getSession().persist(this);
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
//			if (em != null) {
//				em.close();
//			}
//			this.closeSession();
			this.getSession().close();
		}
		return (T) this;
	}

	@Override
	public T update() {
//		EntityManager em = null;
		Transaction transaction = null;
		try {
//			em = this.getSessionFactory().createEntityManager();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			this.getSession().merge(this);
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
//			if (em != null) {
//				em.close();
//			}
//			this.closeSession();
			this.getSession().close();
		}
		return (T) this;
	}
	
	@Override
	public boolean delete(Object id) {
		boolean deleted = false;
		if(this.isReadOnly())
			return false;
//		EntityManager em = null;
		Transaction transaction = null;
		try {
//			em = this.getSessionFactory().createEntityManager();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			this.getSession().remove(this.getSession().find(this.className, id));
			transaction.commit();
			deleted=true;
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
//			if (em != null) {
//				em.close();
//			}
//			this.closeSession();
			this.getSession().close();
		}
		return deleted;
	}

	@Override
	public boolean delete() {
		Object id =this.getValuePrimaryKey();
		return this.delete(id);
	}

	@Override
	public Object getValuePrimaryKey() {
		Object id = this.getSessionFactory().getPersistenceUnitUtil().getIdentifier(this);
		return id;
	}

	@Override
	public String getNamePrimaryKey() {
		for(Field field:this.className.getClass().getDeclaredFields()){
			if(field.isAnnotationPresent(Id.class))
				return field.getName();
		}
		return "id";//Defualt ID
	}

	@Override
	public Long getCount() {
		this.sql = this.generateSqlCount()+this.sql;
		Long count = (long) 0;
//		EntityManager em = null;
		Transaction transaction = null;
		try {
//			em = this.getSessionFactory().createEntityManager();
			transaction = (Transaction) this.getSession().getTransaction();
			transaction.begin();
			TypedQuery<T> query = (TypedQuery<T>) this.getSession().createQuery(this.getSql(),Long.class);
			this.setParameters(query);
			count = (Long)query.getSingleResult();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
//			if (em != null) {
//				em.close();
//			}
//			this.closeSession();
			this.getSession().close();
		}
		
		return count;
	}
	
	public boolean isReadOnly() {
		return isReadOnly;
	}

	public void setReadOnly(boolean isReadOnly) {
		this.isReadOnly = isReadOnly;
	}

	protected Session getSession() {		
		return HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema).getCurrentSession();
	}

	protected SessionFactory getSessionFactory() {		
		return HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema);
	}
	
	protected void closeSession() {
		if(this.getSessionFactory()!=null && this.getSessionFactory().isOpen()) {
			this.getSession().close();
		}
	}

	
	protected void setError(Exception e) {
		if(this.isShowTracing()) {
			e.printStackTrace();
		}
		if(e.getCause()!=null) {
			if(e.getCause().getCause()!=null) {
				this.error.add(e.getCause().getCause().getMessage());
				this.showMessage(e.getCause().getCause().getMessage());
			}else {
				this.error.add(e.getCause().getMessage());
				this.showMessage(e.getCause().getMessage());
			}
		}else {
			this.error.add(e.getMessage());
			this.showMessage(e.getMessage());
		}
	}
	
	public List<String> getError() {
		return error;
	}
	
	public boolean hasError() {
		return this.error!=null && !this.error.isEmpty();
	}
	
	public void showMessage(String error) {
		if(this.isShowError()) {
			Core.setMessageError(error);
		}
	}
	
	public void showMessage() {
		if(this.hasError()) {
			this.error.stream().forEach(e->{
				Core.setMessageError(e);
			});
		}
	}

	
	public boolean isShowError() {
		return showError;
	}

	public void setShowError(boolean showError) {
		this.showError = showError;
	}
	
	public boolean isShowTracing() {
		return showTracing;
	}

	public void setShowTracing(boolean showTracing) {
		this.showTracing = showTracing;
	}

	private void startCriteria() {
		if(this.builder==null) {
			this.builder = this.getSessionFactory().getCriteriaBuilder();
		}
		if(this.criteria==null) {
			this.criteria = (CriteriaQuery<T>) this.builder.createQuery(this.classNameCriteria.getClass());
		}
		if(this.root==null) {
			this.root = (Root<T>) this.criteria.from(this.classNameCriteria.getClass());
		}
		if(this.criteria!=null && this.root!=null){
			this.criteria.select(this.root);
		}
	}
	
	public CriteriaQuery<T> getCriteria() {
		this.startCriteria();
		return this.criteria;
	}
	
	/**
	 * @return the builder
	 */
	public CriteriaBuilder getBuilder() {
		this.startCriteria();
		return this.builder;
	}

	/**
	 * @return the root
	 */
	public Root<T> getRoot() {
		this.startCriteria();
		return this.root;
	}

	private Field getKeyFieldOfEntity(Object value) {
		if(value instanceof BaseActiveRecord) {
			Field[] fields = value.getClass().getDeclaredFields();
			for(Field field:fields) {
				if(field.isAnnotationPresent(Id.class)) {
					return field;
				}
			}
		}
		return null;
	}
	
	@Override
	public T andWhere(String name,String operator,Object value) {
		return this.andWhere(name,name,operator,value);
	}
	
	@Override
	public T andWhere(String name, String paramName, String operator, Object value) {
		Field pk = this.getKeyFieldOfEntity(value);
		if(pk!=null) {
			pk.setAccessible(true);
			Object v = null;
			try {
				v = pk.get(value);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			pk.setAccessible(false);
			return this.andWhereObject(name, name, operator, v,pk.getType());
		}
		return this.andWhereObject(name, name, operator, value,Object.class);
	}

	@Override
	public T where(String name, String operator, Object value) {
		return this.where(name,name,operator,value);
	}

	@Override
	public T where(String name, String paramName, String operator, Object value) {
		Field pk = this.getKeyFieldOfEntity(value);
		if(pk!=null) {
			pk.setAccessible(true);
			Object v = null;
			try {
				v = pk.get(value);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			pk.setAccessible(false);
			return this.whereObject(name, name, operator, v,pk.getType());
		}
		return this.whereObject(name, name, operator, value,Object.class);
	}

	@Override
	public T orWhere(String name, String operator, Object value) {
		return this.orWhere(name,name,operator,value);
	}

	@Override
	public T orWhere(String name, String paramName, String operator, Object value) {
		Field pk = this.getKeyFieldOfEntity(value);
		if(pk!=null) {
			pk.setAccessible(true);
			Object v = null;
			try {
				v = pk.get(value);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			pk.setAccessible(false);
			return this.orWhereObject(name, name, operator, v,pk.getType());
		}
		return this.orWhereObject(name, name, operator, value,Object.class);
	}

	/*
	@Override
	public T sum(String name) {
		this.columnsSelect+=" SUM("+recq.resolveColumnName(this.getAlias(),name)+"), ";
		return (T) this;
	}

	@Override
	public T avg(String name) {
		this.columnsSelect+=" AVG("+recq.resolveColumnName(this.getAlias(),name)+"), ";
		return (T) this;
	}

	@Override
	public T min(String name) {
		this.columnsSelect+=" MIN("+recq.resolveColumnName(this.getAlias(),name)+"), ";
		return (T) this;
	}

	@Override
	public T max(String name) {
		this.columnsSelect+=" MAX("+recq.resolveColumnName(this.getAlias(),name)+"), ";
		return (T) this;
	}

	@Override
	public T count(String name) {
		this.columnsSelect+=" COUNT("+recq.resolveColumnName(this.getAlias(),name)+"), ";
		return (T) this;
	}

	*/
}
