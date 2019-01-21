package nosi.base.ActiveRecord;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;

/**
 * Emanuel
 * 15 Jan 2019
 */
public final class RestrictionImpl implements Restriction<RestrictionImpl> {

	private String restriction = "";
	private String alias;
	private List<DatabaseMetadaHelper.Column> parametersMap;
	private ResolveColumnNameQuery recq;
	
	public RestrictionImpl(Class<?> className,String alias) {
		this.alias = alias;
		this.parametersMap = new ArrayList<>();
		this.recq = new ResolveColumnNameQuery(className);
	}
	
	@Override
	public String getRestriction() {
		return this.restriction;
	}

	@Override
	public RestrictionImpl isNotNull(String name) {
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" IS NOT NULL ";
		return this;
	}

	@Override
	public RestrictionImpl isNull(String name) {
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" IS NULL ";
		return this;
	}

	@Override
	public RestrictionImpl equals(String name, Object value) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" =: "+paramName;
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl like(String name, Object value) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" LIKE : "+paramName;
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl notLike(String name, Object value) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" NOT LIKE : "+paramName;
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl gt(String name, Object value) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" >: "+paramName;
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl lt(String name, Object value) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" <: "+paramName;
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl between(String name, Object value1, Object value2) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" BETWEEN :"+paramName+"1 AND :"+paramName+"2";
		this.addParamter(paramName+"1", paramName+"1", value1, Object.class);
		this.addParamter(paramName+"2", paramName+"2", value2, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl notBetween(String name, Object value1, Object value2) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" NOT BETWEEN :"+paramName+"1 AND :"+paramName+"2";
		this.addParamter(paramName+"1", paramName+"1", value1, Object.class);
		this.addParamter(paramName+"2", paramName+"2", value2, Object.class);
		return this;
	}

	protected List<DatabaseMetadaHelper.Column> getParametersMap() {
		return parametersMap;
	}

	@Override
	public RestrictionImpl and() {
		this.restriction+=" AND ";
		return this;
	}

	@Override
	public RestrictionImpl or() {
		this.restriction+=" OR ";
		return this;
	}

	private void addParamter(String name,String paramName, Object value,Class<?> classType) {
		Column c = new Column();
		c.setColumnMap(paramName);
		c.setName(name);
		c.setDefaultValue(value);
		c.setType(classType);
		this.parametersMap.add(c);
	}

	@Override
	public RestrictionImpl in(String name, String query) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" IN (:"+paramName+")";
		this.addParamter(paramName, paramName, query, String.class);
		return this;
	}

	@Override
	public RestrictionImpl notIn(String name, Object[] values) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" NOT IN (:"+paramName+")";
		this.addParamter(paramName, paramName, values, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl notIn(String name, String query) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" NOT IN (:"+paramName+")";
		this.addParamter(paramName, paramName, query, String.class);
		return this;
	}

	@Override
	public RestrictionImpl in(String name, Object[] values) {
		String paramName = this.recq.removeAlias(name);
		this.restriction+=this.recq.resolveColumnName(this.alias,name)+" IN (:"+paramName+")";
		this.addParamter(paramName, paramName, values, Object.class);
		return this;
	}

}
