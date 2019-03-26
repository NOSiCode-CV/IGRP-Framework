package nosi.base.ActiveRecord;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.annotations.Expose;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.ORDERBY;
import nosi.core.webapp.databse.helpers.ParametersHelper;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.StringHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

@SuppressWarnings("unchecked")
public abstract class BaseActiveRecord<T> implements ActiveRecordIterface<T>, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Expose(serialize = false) @JsonIgnore
	protected String sql="";
	@Expose(serialize = false) @JsonIgnore
	protected String alias;
	@Expose(serialize = false) @JsonIgnore
	protected String connectionName;
	@Expose(serialize = false) @JsonIgnore
	private boolean whereIsCall = false;
	@Expose(serialize = false) @JsonIgnore
	private ResolveColumnNameQuery recq;
	@Expose(serialize = false) @JsonIgnore
	private int limit = -1;
	@Expose(serialize = false) @JsonIgnore
	private int offset = -1;	
	@Expose(serialize = false) @JsonIgnore
	private List<DatabaseMetadaHelper.Column> parametersMap;
	@Expose(serialize = false) @JsonIgnore
	private String schema = null;
	@Expose(serialize = false) @JsonIgnore @JsonFormat(shape=JsonFormat.Shape.ARRAY)
	private List<String> error;
	@Expose(serialize = false) @JsonIgnore
	private boolean isReadOnly = false;
	@Expose(serialize = false) @JsonIgnore
	private CriteriaBuilder builder = null;
	@Expose(serialize = false) @JsonIgnore
	private CriteriaQuery<T> criteria = null;
	@Expose(serialize = false) @JsonIgnore
	private Root<T> root = null;
	@Expose(serialize = false) @JsonIgnore
	private ParametersHelper paramHelper;
	@Expose(serialize = false) @JsonIgnore
	private String tableName;
	@Expose(serialize = false) @JsonIgnore
	private Class<T> className;
	@Expose(serialize = false) @JsonIgnore
	private T classNameCriteria;
	@Expose(serialize = false) @JsonIgnore
	private boolean showError = true;
	@Expose(serialize = false) @JsonIgnore
	private boolean showTracing = true;
	@Expose(serialize = false) @JsonIgnore
	private String columnsSelect = "";
	@Expose(serialize = false) @JsonIgnore
	private boolean keepConnection = false;
	@Expose(serialize = false) @JsonIgnore
	private String applicationName;
	private boolean isShowConsoleSql=false;
	
	public BaseActiveRecord() {
		this.classNameCriteria = (T) this;
		this.className = this.getClassType();
		if(this.className!=null) {
			this.setTableName(this.className.getSimpleName());
			this.setAlias("obj_"+this.className.getSimpleName().toLowerCase());
		}
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
	/**
	 * Compares if is not null the name string, then it adds IS NOT NULL to query
	 * if(Core.isNotNull(name))
	 *  return ...name)+" IS NOT NULL "
	 */
	@Override
	public T andWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NOT NULL ");
		}
		return (T) this;
	}
	/**
	 * Depending in the operator, it call andWhereIsNull or andWhereNotNull
	 * 
	 * @param name
	 * @param operator - can be "isnull" or "notnull"
	 * @return
	 */
	public T andWhere(String name, String operator) {
		if(operator.toString().equalsIgnoreCase("isnull")){
			return this.andWhereIsNull(name);
		}else if( operator.toString().equalsIgnoreCase("notnull")) {
			return this.andWhereNotNull(name);
		}
		return (T) this;
	}
	
	/**
	 * Compares if is not null the name string, then it adds IS NULL to query
	 * if(Core.isNotNull(name))
	 *  return ...name)+" IS NULL "
	 */
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
	
	/**
	 * Compares if is not null the name string, then it adds IS NOT NULL to query
	 * if(Core.isNotNull(name))
	 *  return ...name)+" IS NOT NULL "
	 */
	@Override
	public T orWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" IS NOT NULL ");
		}
		return (T) this;
	}

	/**
	 * Compares if is not null the name string, then it adds IS NULL to query
	 * if(Core.isNotNull(name))
	 *  return ...name)+" IS NULL "
	 */
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
	
	@Transient	 
	@XmlTransient
	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	@Transient	
	protected String getAlias() {
		return alias;
	}

	protected void setAlias(String alias) {
		this.alias = alias;
	}
	
	@Transient	 
	protected String generateSql() {
		return " SELECT "+this.columnsSelect+" "+this.getAlias()+" FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	@Transient	 
	protected String generateSqlCount() {
		return " SELECT count("+this.getAlias()+") FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	@Transient	 
	protected Class<T> getClassType(){
		ParameterizedType genericType = (ParameterizedType) this.getClass().getGenericSuperclass();
		return (Class<T>) genericType.getActualTypeArguments()[0];
	}
	
	@Transient	 
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

	@Transient	
	@XmlTransient
	public String getConnectionName() {	
		if(Core.isNotNullOrZero(this.applicationName) && Core.isNull(this.connectionName))
			return this.defaultConnection(this.applicationName);
		return Core.isNotNull(this.connectionName) ? this.connectionName:this.defaultConnection();
	}

	protected void setParameters(TypedQuery<T> query) {
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
	
	@Transient	 
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
	
	
	/**This andWhere has paramName to change if not equal to the column name
	 *  @param paramName - use it when you have a method like "lower(" . The variable cannot have "("
	 * {@code 	dao.find().andWhere("lower(dominio)","dominio", "=", domainsName.toLowerCase())
	 * .andWhere("lower(valor)","valor", "=", key.toLowerCase()).one();
	}
	 */
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
		return this.orderBy(orderByNames,null);
	}

	private T orderBy(String[][] orderByNames, String defaultOrder) {
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
		List<T> list = null;
		try {
			Session s = this.getSession();
			if(!s.getTransaction().isActive()) {
				s.beginTransaction();
			}
			TypedQuery<T> query = s.createQuery(criteria);
			query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
			this.setParameters(query);
			list = query.getResultList();
		}catch (Exception e) {
			this.keepConnection = false;
			this.setError(e);
		} finally {
			this.closeSession();
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
		if(value!=null) {
			this.find();
			this.whereObject(this.getPrimaryKey(),this.getPrimaryKey(), "=",value,Object.class);
			return this.one();
		}
		return null;
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
		List<T> list = null;
		try {
			Session s = this.getSession();
			if(!s.getTransaction().isActive()) {
				s.beginTransaction();
			}
			if(this.isShowConsoleSql) {
				System.out.println(this.getSql());
			}
			TypedQuery<T> query = s.createQuery(this.getSql(), this.className);
			if(this.offset > -1) {
				query.setFirstResult(offset);
			}
			if(this.limit > -1) {
				query.setMaxResults(limit);
			}
			query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
			this.setParameters(query);
			list = query.getResultList();
		}catch (Exception e) {
			this.keepConnection = false;
			this.setError(e);
		} finally {
			this.closeSession();
		}
		return list;
	}
		
	private boolean beginTransaction(Transaction transaction) {		
		if(transaction!=null && !transaction.isActive()) {
			transaction.begin();
			return true;
		}else if(transaction!=null && transaction.isActive()){
			return true;
		}
		return false;
	}

	public List<T> query(String querySql,Class<T> className) {
		return this.query(querySql, className,-1,-1);
	}
	
	public List<T> query(String querySql,Class<T> className,int limit,int offset) {
		Transaction transaction = null;
		List<T> list = null;
		try {
			transaction = (Transaction) this.getSession().getTransaction();
			if(this.beginTransaction(transaction)) {
				TypedQuery<T> query = this.getSession().createQuery(querySql, className);
				if(offset > -1)
					query.setFirstResult(offset);
				if(limit > -1)
					query.setMaxResults(limit);
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				this.setParameters(query);
				list = query.getResultList();
				transaction.commit();
			}
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession();
		}
		return list;
	}
	
	@Override
	public T insert() {
		Transaction transaction = null;
		try {
			transaction = (Transaction) this.getSession().getTransaction();
			if(this.beginTransaction(transaction)) {
				this.getSession().persist(this);
				transaction.commit();
			}
		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession();
		}
		return (T) this;
	}

	@Override
	public T update() {
		Transaction transaction = null;
		try {
			transaction = (Transaction) this.getSession().getTransaction();
			if(this.beginTransaction(transaction)) {
				this.getSession().merge(this);
				transaction.commit();
			}
		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession();
		}
		return (T) this;
	}
	
	@Override
	public boolean delete(Object id) {
		boolean deleted = false;
		if(this.isReadOnly())
			return false;
		Transaction transaction = null;
		try {
			transaction = (Transaction) this.getSession().getTransaction();
			if(this.beginTransaction(transaction)) {
				this.getSession().remove(this.getSession().find(this.className, id));
				transaction.commit();
				deleted=true;
			}
		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession();
		}
		return deleted;
	}

	@Override
	@Transient
	 
	public boolean delete() {
		Object id = this.getValuePrimaryKey();
		if(id!=null)
			return this.delete(id);
		return false;
	}

	@Override
	@Transient
	@XmlTransient
	public Object getValuePrimaryKey() {
		Object id = this.getSessionFactory()!=null?this.getSessionFactory().getPersistenceUnitUtil().getIdentifier(this):null;
		return id;
	}

	@Override
	@Transient	 
	@XmlTransient
	public String getNamePrimaryKey() {
		for(Field field:this.className.getClass().getDeclaredFields()){
			if(field.isAnnotationPresent(Id.class))
				return field.getName();
		}
		return "id";//Defualt ID
	}

	@Override
	@Transient
	@XmlTransient
	public Long getCount() {
		this.sql = this.generateSqlCount()+this.sql;
		Long count = (long) 0;
		Transaction transaction = null;
		try {
			transaction = (Transaction) this.getSession().getTransaction();
			if(this.beginTransaction(transaction)) {
				TypedQuery<T> query = (TypedQuery<T>) this.getSession().createQuery(this.getSql(),Long.class);
				query.setHint(HibernateHintOption.HINTNAME, HibernateHintOption.HINTVALUE);
				this.setParameters(query);
				count = (Long)query.getSingleResult();
				transaction.commit();
			}
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession();
		}
		
		return count;
	}
	
	@Transient	 
	@XmlTransient
	public boolean isReadOnly() {
		return isReadOnly;
	}

	public void setReadOnly(boolean isReadOnly) {
		this.isReadOnly = isReadOnly;
	}
	
	@Transient	 
	protected Session getSession() {	
		SessionFactory sessionFactory = null;
		if(Core.isNotNull(this.applicationName)) {
			sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),this.applicationName,this.schema);
		}else {
			sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema);
		}
		if(sessionFactory!=null) {
			return sessionFactory.getCurrentSession();
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}

	@Transient	 
	protected SessionFactory getSessionFactory() {		
		SessionFactory sessionFactory = null;
		if(Core.isNotNull(this.applicationName)) {
			sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),this.applicationName,this.schema);
		}else {
			sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema);
		}
		if(sessionFactory!=null) {
			return sessionFactory;
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}
	
	protected void closeSession() {
		if(!this.keepConnection && this.getSession()!=null && this.getSession().isOpen()) {
			this.getSession().close();
		}
	}

	public void closeConnection() {
		this.keepConnection = false;
		this.closeSession();
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
	
	@Transient
	@XmlTransient
	public List<String> getError() {
		return error;
	}
	
	@Transient
	public boolean hasError() {
		return this.error!=null && !this.error.isEmpty();
	}
	
	public void showMessage(String error) {
		if(this.isShowError()) {
			Core.setMessageError(error);
		}
		Core.log(error);
	}
	
	public void showMessage() {
		if(this.hasError()) {
			this.error.stream().forEach(e->{
				Core.setMessageError(e);
			});
		}
	}

	@Transient
	@XmlTransient
	public boolean isShowError() {
		return showError;
	}

	public void setShowError(boolean showError) {
		this.showError = showError;
	}
	
	@Transient
	@XmlTransient
	public boolean isShowTracing() {
		return showTracing;
	}

	public void setShowTracing(boolean showTracing) {
		this.showTracing = showTracing;
	}

	@Transient	 
	private void startCriteria() {
		if(this.builder==null && this.getSessionFactory()!=null) {
			this.builder = this.getSessionFactory().getCriteriaBuilder();
		}
		if(this.criteria==null && this.builder!=null) {
			this.criteria = (CriteriaQuery<T>) this.builder.createQuery(this.classNameCriteria.getClass());
		}
		if(this.root==null && this.builder!=null) {
			this.root = (Root<T>) this.criteria.from(this.classNameCriteria.getClass());
		}
		if(this.criteria!=null && this.root!=null){
			this.criteria.select(this.root);
		}
	}
	
	@Transient	 
	public CriteriaQuery<T> getCriteria() {
		this.startCriteria();
		return this.criteria;
	}
	
	/**
	 * @return the builder
	 */
	@Transient	 
	public CriteriaBuilder getBuilder() {
		this.startCriteria();
		return this.builder;
	}

	/**
	 * @return the root
	 */
	@Transient	 
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
			try {
				Object v = pk.get(value);
				pk.setAccessible(false);
				return this.andWhereObject(name, name, operator, v,pk.getType());
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
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
			try {
				Object v = pk.get(value);
				pk.setAccessible(false);
				return this.whereObject(name, name, operator, v,pk.getType());
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
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
			try {
				Object v = pk.get(value);
				pk.setAccessible(false);
				return this.orWhereObject(name, name, operator, v,pk.getType());
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return this.orWhereObject(name, name, operator, value,Object.class);
	}

	@Override
	public T orderByAsc(String... columns) {
		return this.orderBy(new String[][] {columns},ORDERBY.ASC);
	}

	@Override
	public T orderByDesc(String... columns) {
		return this.orderBy(new String[][] {columns},ORDERBY.DESC);
	}
	
	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}
	
	

	@Override
	public T keepConnection() {
		this.keepConnection = true;
		return (T) this;
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
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereNotIn("id",{1,2,3,4}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' NOT IN (Number[]) } </p>
	 * @param columnName - Column's name
	 * @param numbers - Array of numbers(Integer,Float,Double,...)
	 * 
	 */
	@Override
	public T whereNotIn(String columnName, Number... numbers) {
		if(Core.isNotNull(columnName)&&numbers!=null&&numbers.length>0) {
			this.where("");
			String lista = "";
			for(Number n : numbers) {
				lista = lista + "," + n ;
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " NOT IN (" + lista.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereNotIn("status",{"closed","canceled"}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' NOT IN (String[]) }</p>
	 * @param columnName - Column's name
	 * @param strings - Array of strings
	 * 
	 */
	@Override
	public T whereNotIn(String columnName, String... strings) {
		if(Core.isNotNull(columnName)&&strings!=null&&strings.length>0) {
			this.where("");
			String lista = "";
			for(String n : strings) {
				lista = lista + ",'" + n + "'";
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " NOT IN (" + lista.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereIn("id",{1,2,3,4}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' IN (Number[]) }</p>
	 * @param columnName - Column's name
	 * @param numbers - Array of numbers(Integer,Float,Double,...)
	 * 
	 */
	@Override
	public T whereIn(String columnName, Number... numbers) {
		if(Core.isNotNull(columnName)&&numbers!=null&&numbers.length>0) {
			this.where("");
			String lista = "";
			for(Number n : numbers) {
				lista = lista + "," + n ;
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " IN (" + lista.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereIn("status",{"new","accepted"}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' IN (String[]) }</p>
	 * @param columnName - Column's name
	 * @param strings - Array of strings 
	 * 
	 * 
	 */
	@Override
	public T whereIn(String columnName, String... strings) {
		if(Core.isNotNull(columnName)&&strings!=null&&strings.length>0) {
			this.where("");
			String lista = "";
			for(String n : strings) {
				lista = lista + ",'" + n + "'";
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " IN (" + lista.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Between filter</p>
	 * <p>Example: find().whereBetween("age",18,35).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' BETWEEN o1 AND o2}</p>
	 * @param columnName - Column's name
	 * @param o1 - min Object(Number, String, Date,...) 
	 * @param o2 - max Object(Number, String, Date,...)
	 * 
	 */
	@Override
	public T whereBetween(String columnName, Object o1, Object o2) {

		if (Core.isNotNullMultiple(columnName, o1, o2) && o1.getClass().equals(o2.getClass())) {
			if (o1 instanceof java.util.Date) {
				o1 = DateHelper.utilDateToSqlDate((java.util.Date) o1);
				o2 = DateHelper.utilDateToSqlDate((java.util.Date) o2);
			}
			this.where("");
			this.filterWhere(
					recq.resolveColumnName(this.getAlias(), columnName) + " between '" + o1 + "' AND '" + o2 + "'");
		}
		return (T) this;
	}

	/**
	 * 
	 * <p>Between filter</p>
	 * <p>Example: find().andWhere(1).orWhereBetween("name","Ana","Maria").all()</p>
	 * <p>HQL Code{@code: OR 'columnName' BETWEEN o1 AND o2}</p>
	 * @param columnName - Column's name
 	 * @param o1 - min Object(Number, String, Date,...) 
	 * @param o2 - max Object(Number, String, Date,...)
	 * 
	 */
	@Override
	public T orWhereBetween(String columnName, Object o1, Object o2) {
		if (Core.isNotNullMultiple(columnName, o1, o2) && o1.getClass().equals(o2.getClass())) {
			this.or();
			return this.whereBetween(columnName, o1, o2);
		}
		return (T) this;
	}

	/**
	 * 
	 * <p>Between filter</p>
	 * <p>Example: find().andWhere(1).andWhereBetween("birthDate",date1,date2).all()</p>
	 * <p>HQL Code{@code: AND 'columnName' BETWEEN o1 AND o2}</p>
	 * @param columnName - Column's name
 	 * @param o1 - min Object(Number, String, Date,...) 
	 * @param o2 - max Object(Number, String, Date,...)
	 * 
	 */
	@Override
	public T andWhereBetween(String columnName, Object o1, Object o2) {
		if (Core.isNotNullMultiple(columnName, o1, o2) && o1.getClass().equals(o2.getClass())) {
			this.and();
			return this.whereBetween(columnName, o1, o2);
		}
		return (T) this;
	}
	
	
	public T setShowConsoleSql(boolean isShowConsoleSql) {
		this.isShowConsoleSql = isShowConsoleSql;
		return (T) this;
	}


	public T setKeepConnection(boolean keepConnection) {
		this.keepConnection = keepConnection;
		return (T) this;
	}
	
	public String defaultConnection() {
		return this.defaultConnection(Core.getCurrentDadParam());
	}
	
	public String defaultConnection(String dad) {
		String result = "";
		Application app = new Application().setKeepConnection(this.keepConnection).find().andWhere("dad", "=", dad).one();
		if (app != null) {
			Config_env config_env = new Config_env().setKeepConnection(this.keepConnection).find().andWhere("isdefault", "=", (short) 1)
					.andWhere("application", "=", app.getId()).one();
			if (config_env != null)
				result = config_env.getName();
		}
		return result;
	}
}
