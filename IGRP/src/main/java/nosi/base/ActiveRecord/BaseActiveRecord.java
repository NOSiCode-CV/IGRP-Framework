package nosi.base.ActiveRecord;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.persistence.Id;
import javax.persistence.NoResultException;
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
import org.hibernate.jpa.QueryHints;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.annotations.Expose;

import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.Connection;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.ORDERBY;
import nosi.core.webapp.databse.helpers.ParametersHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.helpers.StringHelper;

import static nosi.base.ActiveRecord.HibernateUtils.setSessionAudit;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

@SuppressWarnings("unchecked")
public abstract class BaseActiveRecord<T> implements ActiveRecordIterface<T>, Serializable {

	private static final long serialVersionUID = -2681026559103646326L;
	@Expose(serialize = false)
	@JsonIgnore
	protected String sql="";
	@Expose(serialize = false) @JsonIgnore
	protected String alias;
	@Expose(serialize = false) @JsonIgnore
	protected String connectionName;
	@Expose(serialize = false) @JsonIgnore
	private boolean whereIsCall = false;
	@Expose(serialize = false) @JsonIgnore
	private transient ResolveColumnNameQuery recq;
	@Expose(serialize = false) @JsonIgnore
	private int limit = -1;
	@Expose(serialize = false) @JsonIgnore
	private int offset = -1;	
	@Expose(serialize = false) @JsonIgnore
	private transient List<DatabaseMetadaHelper.Column> parametersMap;
	@Expose(serialize = false) @JsonIgnore
	private String schema = null;
	@Expose(serialize = false) @JsonIgnore @JsonFormat(shape=JsonFormat.Shape.ARRAY)
	private List<String> error;
	@Expose(serialize = false) @JsonIgnore
	private boolean isReadOnly = false;
	@Expose(serialize = false) @JsonIgnore
	private transient CriteriaBuilder builder = null;
	@Expose(serialize = false) @JsonIgnore
	private transient CriteriaQuery<T> criteria = null;
	@Expose(serialize = false) @JsonIgnore
	private transient Root<T> root = null;
	@Expose(serialize = false) @JsonIgnore
	private String tableName;
	@Expose(serialize = false) @JsonIgnore
	private Class<T> className;
	@Expose(serialize = false) @JsonIgnore
	private transient T classNameCriteria;
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
	private String distinctByColumn;
	private boolean isDistinctBy=false;
	private boolean isShowConsoleSql=false;

	private static final String QUOTE = "'";

	protected BaseActiveRecord() {
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
		if(values!=null) {
			String[] valuesT = this.normalizeStringValues(values);
			String value = this.applyToInCondition(valuesT);	
			this.where("");
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
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
	 * @param name column name
	 * @param operator - can be "isnull" or "notnull"
	 * @return this instance
	 */
	public T andWhere(String name, String operator) {
		if(Core.isNull(operator))
		    return (T) this;
	    if(operator.equalsIgnoreCase("isnull")){
			return this.andWhereIsNull(name);
		}else if( operator.equalsIgnoreCase("notnull")) {
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
			String value="('')";
			if(values.length>0){
				String[] valuesT = this.normalizeStringValues(values);
				value = this.applyToInCondition(valuesT);
			}			
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

	@Override
	public T where(RestrictionImpl restriction) {
		this.parametersMap.addAll(restriction.getParametersMap());
		this.sql+=" WHERE ("+restriction.getRestriction()+")";
		return (T) this;
	}

	@Override
	public T andWhere(RestrictionImpl restriction) {
		this.parametersMap.addAll(restriction.getParametersMap());
		this.sql+=" AND ("+restriction.getRestriction()+")";
		return (T) this;
	}

	@Override
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
		return " SELECT "+(Core.isNull(this.columnsSelect)?(" "+this.getAlias()):this.columnsSelect)+" FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	@Transient	 
	protected String generateSqlCount() {		
		return " SELECT count("+this.getAlias()+") FROM "+this.getTableName()+" "+this.getAlias()+" ";
	}
	
	@Transient	 
	protected String generateSqlCountDistinctBy() {		
		return " SELECT count("+this.distinctByColumn+") FROM "+this.getTableName()+" "+this.getAlias()+" "+this.sql;
	}
	
	@Transient
	protected String generateSqlAggregate(String columnName, String aggregate) {
		return " SELECT "+ aggregate +"("+recq.resolveColumnName(this.getAlias(),columnName)+") FROM " + this.getTableName() + " " + this.getAlias() + " ";
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
	
	private void addParameter(String name, String paramName, Object value, Class<?> classType) {
		Column c = new Column();
		c.setColumnMap(paramName);
		c.setName(name);
		c.setDefaultValue(value);
		c.setType(classType);
		this.parametersMap.add(c);
	}

	private String[] normalizeStringValues(String[] values) {
		for (int i = 0; i < values.length; i++) {
			values[i] = QUOTE + values[i] +QUOTE;
		}
		return values;
	}

	private String applyToInCondition(Object[] values) {
		return String.join(",", Arrays.toString(values)).replace("[", "(").replace("]", ")");			
	}

	private T whereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			this.where("");
			String value = this.applyToInCondition(values);
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}


	private T whereObject(String name, String paramName, String operator, Object value, Class<?> classType) {
		if (Core.isNotNull(value)) {
			this.where("");
			String paramName_ = recq.removeAlias(paramName);
			if (operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equalsIgnoreCase("notlike")) {
				this.filterWhere("UPPER(" + recq.resolveColumnName(this.getAlias(), name) + ") " + operator + " :" + paramName_ + " ");
				this.addParameter(name, paramName_, value.toString().toUpperCase(), classType);
			} else {
				this.filterWhere(recq.resolveColumnName(this.getAlias(), name) + " " + operator + ":" + paramName_ + " ");
				this.addParameter(name, paramName_, value, classType);
			}
		}
		return (T) this;
	}

	private T andWhereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			String value = this.applyToInCondition(values);
			this.and();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	
	private T andWhereObject(String name,String paramName,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			String paramName_ = recq.removeAlias(paramName);
			this.and();
			if(operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equalsIgnoreCase("notlike")) {
				this.filterWhere("UPPER("+recq.resolveColumnName(this.getAlias(),name)+") "+operator+" :"+paramName_+" ");
				this.addParameter(name,paramName_,value.toString().toUpperCase(),classType);
			}else {
				this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" :"+paramName_+" ");
				this.addParameter(name,paramName_,value,classType);
			}
		}
		return (T) this;
	}
	
	private T orWhereObject(String name,String paramName,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			String paramName_ = recq.removeAlias(paramName);
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+paramName_+" ");
			this.addParameter(name,paramName_,value,classType);
		}
		return (T) this;
	}
	
	private T orWhereObject(String name, String operator, Object[] values) {
		if(values!=null) {
			String value = this.applyToInCondition(values);
			this.or();
			this.filterWhere(recq.resolveColumnName(this.getAlias(),name)+" "+operator+" "+value+" ");
		}
		return (T) this;
	}
	
	private T havingObject(String name,String operator,Object value,Class<?> classType) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" HAVING "+recq.resolveColumnName(this.getAlias(),name)+" "+operator+":"+recq.removeAlias(name)+" ");
			this.addParameter(name,recq.removeAlias(name), value,classType);
		}
		return (T) this;
	}

	@Override
	public T setConnectionName(String connectionName) {
		this.connectionName = connectionName;
		return (T) this;
	}

	@Transient	
	@XmlTransient
	@Override
	public String getConnectionName() {	
		if(Core.isNotNullOrZero(getApplicationName()) && Core.isNull(this.connectionName)) {
			this.connectionName=this.defaultConnection(getApplicationName());
			return this.connectionName;
		}			
		return Core.isNotNull(this.connectionName) ? this.connectionName:this.defaultConnection();
	}
	
	@Transient	
	@XmlTransient
	public String getApplicationName() {					
		return this.applicationName;
	}

	protected void setParameters(TypedQuery<T> query) {
		if(this.parametersMap!=null && !this.parametersMap.isEmpty()) {
            this.parametersMap.forEach(col->ParametersHelper.setParameter(query, col.getDefaultValue(), col));
		}
	}

	@Override
	public T find() {
		this.whereIsCall = false;
		this.sql = "";
		this.parametersMap = new ArrayList<>();
		this.error = new ArrayList<>();
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
			StringBuilder c = new StringBuilder(this.sql.contains("ORDER BY")?",":" ORDER BY ");
    		int i=1;
    		for(String[] names:orderByNames) {
    			String order = names[names.length-1];
    			String[] newNames;
				final int newLength = names.length - 1 >= 1 ? names.length - 1 : names.length;
				if(order.equalsIgnoreCase(ORDERBY.ASC_NULLS_FIRST)){
					order = ORDERBY.ASC_NULLS_FIRST;
					newNames = Arrays.copyOf(names, newLength);
				}
				else if(order.equalsIgnoreCase(ORDERBY.ASC_NULLS_LAST)){
					order = ORDERBY.ASC_NULLS_LAST;
					newNames = Arrays.copyOf(names, newLength);
				}
				else if(order.equalsIgnoreCase(ORDERBY.DESC_NULLS_LAST)){
					order = ORDERBY.DESC_NULLS_LAST;
					newNames = Arrays.copyOf(names, newLength);
				}
				else if(order.equalsIgnoreCase(ORDERBY.DESC_NULLS_FIRST)){
					order = ORDERBY.DESC_NULLS_FIRST;
					newNames = Arrays.copyOf(names, newLength);
				}
				else if (!order.equalsIgnoreCase(ORDERBY.ASC) && !order.equalsIgnoreCase(ORDERBY.DESC)) {
    				order = Core.isNotNull(defaultOrder)?defaultOrder:ORDERBY.ASC;
    				newNames = Arrays.copyOf(names, names.length);
				}
				else{
					newNames = Arrays.copyOf(names, newLength);
    			}
    			for(int j=0;j<newNames.length;j++)
    				newNames[j] = recq.resolveColumnName(this.getAlias(),newNames[j]);
    			c.append(Arrays.toString(newNames).replace("[", "").replace("]", "")).append(" ").append(order).append(i == orderByNames.length ? " " : ", ");
    			i++;
    		}
    		this.filterWhere(c.toString());
    	}
		return (T) this;
	}
	//Can be used with allColumns and oneColumns
	@Override
	public T groupBy(String... groupByNames) {
		if(groupByNames!=null) {
			this.sql+=" GROUP BY "+ String.join(",", groupByNames);		
		}
		return (T) this;
	}
	
	public void setDistinct(String column) {
		if(column!=null) {
			distinctByColumn = " DISTINCT "+column;	
			isDistinctBy = true;			
		}
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
		Session s = this.getSession();
		try {
			if(!s.getTransaction().isActive()) {
				s.beginTransaction();
			}
			TypedQuery<T> query = s.createQuery(criteria);
			if(!this.keepConnection)
				query.setHint(QueryHints.HINT_READONLY, true);
			this.setParameters(query);
			list = query.getResultList();
		}catch (Exception e) {
			this.keepConnection = false;
			this.setError(e);
		} finally {			
			this.closeSession(s);
		}
		return list;
	}


	@Override
	public T findOne(CriteriaQuery<T> criteria) {
		T t = null;
		Session s = this.getSession();
		try {
			if(!s.getTransaction().isActive()) {
				s.beginTransaction();
			}
			TypedQuery<T> query = s.createQuery(criteria);
			query.setMaxResults(1);
			if(!this.keepConnection)
				query.setHint(QueryHints.HINT_READONLY, true);
			this.setParameters(query);
			t = query.getSingleResult();
		}catch (Exception e) {			
			if(!(e instanceof NoResultException)) {
				this.keepConnection = false;
				this.setError(e);
			}
			
		} finally {			
			this.closeSession(s);
		}
		
		return t;
	}

	@Override
	public T findOne(Object value) {
		if(value!=null) {
			this.find();
			final String primaryKey = this.getPrimaryKey();
			this.whereObject(primaryKey, primaryKey, "=",value,Object.class);
			return this.one();
		}
		return null;
	}
	
	@Override
	public T one() {
		this.limit = 1;
		List<T> list = this.all();
		return (list!=null && !list.isEmpty())?list.get(0):null;
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
		Session s = this.getSession();
		try {
			if(!s.getTransaction().isActive()) {
				s.beginTransaction();
			}
			if(this.isShowConsoleSql) {
				Core.log(this.getSql());
				System.out.println(this.getSql());
			}
			TypedQuery<T> query = s.createQuery(this.getSql(), this.className);
			if(this.offset > -1) {
				query.setFirstResult(offset);
			}
			if(this.limit > -1) {
				query.setMaxResults(limit);
			}
			if(!this.keepConnection)
				query.setHint(QueryHints.HINT_READONLY, true);
			this.setParameters(query);
			list = query.getResultList();
		}catch (Exception e) {
			this.keepConnection = false;
			this.setError(e);
		} finally {
			this.closeSession(s);
		}
		return list;
	}
	
	public List<Map<String, Object>> allColumns(String... columns) {
		List<Map<String, Object>> lista = new ArrayList<>();
		if (columns != null && columns.length > 0) {
			for (String columnName : columns) {
                this.columnsSelect += ", " + recq.resolveColumnName(this.getAlias(), columnName.trim()) + " ";
            }
			this.columnsSelect = this.columnsSelect.substring(1);
			this.sql = this.generateSql() + this.sql;
			Session s = this.getSession();
			try {
				if (!s.getTransaction().isActive()) {
					s.beginTransaction();
				}
				if (this.isShowConsoleSql) {
					Core.log(this.getSql());
					System.out.println(this.getSql());
				}
				TypedQuery<T> query = s.createQuery(this.getSql());
			
				if (this.offset > -1) {
					query.setFirstResult(offset);
				}
				if (this.limit > -1) {
					query.setMaxResults(limit);
				}
				if(!this.keepConnection)
					query.setHint(QueryHints.HINT_READONLY, true);
				if (this.parametersMap != null && !this.parametersMap.isEmpty()) {
                   for (Column col : parametersMap) {
                      ParametersHelper.setParameter(query, col.getColumnMap(), col.getDefaultValue(), col);

                   }
				}

				List<T> list = query.getResultList();
				for (Iterator<Object> iter = (Iterator<Object>) list.iterator(); iter.hasNext();) {
					Map<String, Object> mapObject = new LinkedHashMap<>();					
					final Object obj = iter.next();
					if(obj instanceof Object[]) {
						Object[] teste = (Object[]) obj;
						for(int i = 0; teste.length > i; i++)
							mapObject.put(columns[i], teste[i]);
					}else {
						mapObject.put(columns[0], obj);						
					}
					
					lista.add(mapObject);
				}
			} catch (Exception e) {
				this.keepConnection = false;
				this.setError(e);
			} finally {
				this.closeSession(s);
			}
		}
		return lista;
	}

	public Map<String, Object> oneColumns(String... columns) {
		this.limit = 1;
		List<Map<String, Object>> list = this.allColumns(columns);
		return (list != null && !list.isEmpty()) ? list.get(0) : null;
	}

//	private boolean beginTransaction(Transaction transaction) {
//		if (transaction != null && !transaction.isActive()) {
//			transaction.begin();
//			return true;
//		}
//		return transaction != null && transaction.isActive();
//	}

	public List<T> query(String querySql,Class<T> className) {
		return this.query(querySql, className,-1,-1);
	}
	
	public List<T> query(String querySql,Class<T> className,int limit,int offset) {
		Transaction transaction = null;
		List<T> list = null;
		Session s = this.getSession();
		try {
			 transaction=s.getTransaction();
			if(!transaction.isActive()) {
				transaction=s.beginTransaction();
			}
			TypedQuery<T> query = s.createQuery(querySql, className);
			if(offset > -1)
				query.setFirstResult(offset);
			if(limit > -1)
				query.setMaxResults(limit);
			if(!this.keepConnection)
				query.setHint(QueryHints.HINT_READONLY, true);
			this.setParameters(query);
			list = query.getResultList();
			if(!this.keepConnection)
				transaction.commit();

		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession(s);
		}
		return list;
	}
	
	@Override
	public T insert() {
		Transaction transaction = null;
		Session s = this.getSession();
		try {
			transaction=s.getTransaction();
			if(!transaction.isActive()) {
				transaction=s.beginTransaction();
			}
			setSessionAudit(s);
			s.persist(this);
			if(!this.keepConnection)
				transaction.commit();

		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession(s);
		}
		return (T) this;
	}

	@Override
	public T update() {		
		Transaction transaction = null;
		Session s = this.getSession();
		try {
			transaction=s.getTransaction();
			if(!transaction.isActive()) {
				transaction=s.beginTransaction();
			}
				setSessionAudit(s);
				s.merge(this);
				if(!this.keepConnection)
					transaction.commit();

		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession(s);
		}
		return (T) this;
	}
	
	@Override
	public boolean delete(Object id) {
		boolean deleted = false;
		if(this.isReadOnly())
			return false;
		Transaction transaction = null;
		Session s = this.getSession();
		try {
			transaction=s.getTransaction();
			if(!transaction.isActive()) {
				transaction=s.beginTransaction();
			}
				setSessionAudit(s);
				s.remove(s.find(this.className, id));
				if(!this.keepConnection)
					transaction.commit();
				deleted=true;

		}catch (Exception e) {
			this.keepConnection = false;
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e);
		} finally {
			this.closeSession(s);
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
        this.getSessionFactory();
        return this.getSessionFactory().getPersistenceUnitUtil().getIdentifier(this);
	}

	@Override
	@Transient	 
	@XmlTransient
	public String getNamePrimaryKey() {
		for(Field field: this.className.getDeclaredFields()){
			if(field.isAnnotationPresent(Id.class))
				return field.getName();
		}
		return "id";//Defualt ID
	}

	@Override
	@Transient
	@XmlTransient
	public Long getCount() {
		this.sql = isDistinctBy ? this.generateSqlCountDistinctBy() : this.generateSqlCount() + this.sql;
		return (Long)this.getSingleResult();
	}
	
	@Override
	@Transient
	//@XmlTransient
	public Object getMax(String columnName) {
		if(Core.isNull(columnName))
			return null;
		this.sql = this.generateSqlAggregate(columnName, "max")+this.sql;
		return this.getSingleResult();
	}
	
	@Override
	@Transient
	//@XmlTransient
	public Object getMin(String columnName) {
		if(Core.isNull(columnName))
			return null;
		this.sql = this.generateSqlAggregate(columnName, "min")+this.sql;
		return this.getSingleResult();
	}
	
	@Override
	@Transient
	//@XmlTransient
	public Double getAvg(String columnName) {
		if(Core.isNull(columnName))
			return null;
		this.sql = this.generateSqlAggregate(columnName, "avg")+this.sql;
		return (Double)this.getSingleResult();
	}
	
	@Override
	@Transient
	//@XmlTransient
	public Object getSum(String columnName) {
		if(Core.isNull(columnName))
			return null;
		this.sql = this.generateSqlAggregate(columnName, "sum")+this.sql;
		return this.getSingleResult();
	}
	
	@Transient
	@XmlTransient
	private Object getSingleResult() {
		Object result = null;
		Transaction transaction = null;
		Session s = this.getSession();
		try {
			transaction=s.getTransaction();
			if(!transaction.isActive()) {
				transaction=s.beginTransaction();
			}
				if(this.isShowConsoleSql) {
					Core.log(this.getSql());
					System.out.println(this.getSql());
				}
				TypedQuery<T> query = s.createQuery(this.getSql());
				if(!this.keepConnection)
					query.setHint(QueryHints.HINT_READONLY, true);
				this.setParameters(query);

				if (this.limit > -1) {
					query.setMaxResults(limit);
				}
				result = query.getSingleResult();
				if(!this.keepConnection)
					transaction.commit();

		}catch (Exception e) {
			if(!(e instanceof NoResultException)) {
				this.keepConnection = false;
				if (transaction != null) {
					transaction.rollback();
				}
				this.setError(e);
			}
		} finally {
			this.closeSession(s);
		}
		
		return result;
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
    private Session getSession() {
		SessionFactory sessionFactory = getSessionFactory();
		try {
			// Use Hibernate-managed session (auto-closed with transaction)
			return sessionFactory.getCurrentSession();
		} catch (HibernateException ex) {
			// Fallback to unmanaged session (MUST close manually)
			return sessionFactory.openSession();
		}
    }

	@Transient
    private SessionFactory getSessionFactory() {
		SessionFactory sessionFactory;
		if(Core.isNull(getApplicationName())) 
			this.applicationName=Core.getCurrentDadParam();
		sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),getApplicationName());
		
		if(sessionFactory!=null) {
			return sessionFactory;
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}
	
	private void closeSession() {
		Session session = this.getSession();
		if (session != null && session.isOpen()) {
			if (!this.keepConnection) {
				session.close(); // Force close if keepConnection is false
			} else {
				// Explicitly reset keepConnection to avoid leaks
				this.keepConnection = false;
		}
	}
	}
	private void closeSession(Session session) {
		if (session != null && session.isOpen()) {
			if (!this.keepConnection) {
				session.close(); // Force close if keepConnection is false
			} else {
				// Explicitly reset keepConnection to avoid leaks
				this.keepConnection = false;
			}
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
			Core.setMessageError("DAO "+this.getTableName()+": "+error);
		}
		Core.log("DAO "+this.getTableName()+": "+error);
	}
	
	public void showMessage() {
		if(this.hasError()) {
            this.error.forEach(Core::setMessageError);
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
				return this.andWhereObject(name, paramName, operator, v,pk.getType());
			} catch (IllegalAccessException | IllegalArgumentException e) {
				e.printStackTrace();
			}
		}
		return this.andWhereObject(name, paramName, operator, value,Object.class);
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
            } catch (IllegalAccessException | IllegalArgumentException e) {
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
            } catch (IllegalAccessException | IllegalArgumentException e) {
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
	
	public T setApplicationName(String applicationName) {
		this.applicationName = applicationName;
		return (T) this;
	}
	
	

	@Override
	public T keepConnection() {
		this.keepConnection = true;
		return (T) this;
	}

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
		return applyInClause(columnName, " NOT IN (", numbers);
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
			StringBuilder lista = new StringBuilder();
			for(String n : strings) {
				lista.append(",'").append(n).append(QUOTE);
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " NOT IN (" + lista.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereNotIn("status",{"closed","canceled"}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' NOT IN (UUID[]) }</p>
	 * @param columnName - Column's name
	 * @param uuIds - Array of uuIds
	 * 
	 */
	@Override
	public T whereNotIn(String columnName, UUID... uuIds) {
		if(Core.isNotNull(columnName)&&uuIds!=null&&uuIds.length>0) {
			this.where("");
			StringBuilder list = new StringBuilder();
			for(UUID u : uuIds) {
				list.append(",'").append(u).append(QUOTE);
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " NOT IN (" + list.substring(1) + ") ");
		}
		return (T)this;
	}
	
	/**
	 * 
	 * <p>Extension of where clause</p>
	 * <p>Example: find().whereIn("id",{1,2,3,4}).all()</p>
	 * <p>HQL Code{@code: WHERE 'columnName' IN (UUID[]) }</p>
	 * @param columnName - Column's name
	 * @param uuIds - Array of uuIds
	 * 
	 */
	@Override
	public T whereIn(String columnName, UUID... uuIds) {
		if(Core.isNotNull(columnName)&&uuIds!=null&&uuIds.length>0) {
			this.where("");
			StringBuilder list = new StringBuilder();
			for(UUID u : uuIds) {
				list.append(",'").append(u).append(QUOTE);
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " IN (" + list.substring(1) + ") ");
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
		return applyInClause(columnName, " IN (", numbers);
	}

	private T applyInClause(String columnName, String inClause, Number[] numbers) {
		if (Core.isNotNull(columnName) && numbers != null && numbers.length > 0) {
			this.where("");
			StringBuilder lista = new StringBuilder();
			for (Number n : numbers) {
				lista.append(",").append(n);
			}
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + inClause + lista.substring(1) + ") ");
		}
		return (T) this;
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
			StringBuilder lista = new StringBuilder();
			for(String n : strings) {
				lista.append(",'").append(n).append(QUOTE);
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
			String between;
			if(o1 instanceof Number && o2 instanceof Number) {
				between = o1 + " AND " + o2;
			}else {
				between = QUOTE + o1 + "' AND '" + o2 + QUOTE;
			}
			this.where("");
			this.filterWhere(recq.resolveColumnName(this.getAlias(), columnName) + " between "+between);
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
		this.connectionName=this.defaultConnection(Core.getCurrentDadParam());
		return this.connectionName;
	}
	
	public String defaultConnection(String dad) {
		return new Connection().defaultConnection(dad);
	}
}
