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

	private final StringBuilder restriction = new StringBuilder();
	private final String alias;
	private final List<DatabaseMetadaHelper.Column> parametersMap;
	private final ResolveColumnNameQuery recq;
	private Integer paramPrefixSeq=0;
	public RestrictionImpl(Class<?> className,String alias) {
		this.alias = alias;
		this.parametersMap = new ArrayList<>();
		this.recq = new ResolveColumnNameQuery(className);
	}
	
	@Override
	public String getRestriction() {
		return this.restriction.toString();
	}

	@Override
	public RestrictionImpl isNotNull(String name) {
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" IS NOT NULL ");
		return this;
	}

	@Override
	public RestrictionImpl isNull(String name) {
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" IS NULL ");
		return this;
	}

	@Override
	public RestrictionImpl equals(String name, Object value) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" = :").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}
	@Override
	public RestrictionImpl notEquals(String name, Object value) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" != :").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl like(String name, Object value) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" LIKE :").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl notLike(String name, Object value) {
		String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" NOT LIKE: ").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl gt(String name, Object value) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" > :").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl lt(String name, Object value) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" < :").append(paramName);
		this.addParamter(paramName, paramName, value, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl between(String name, Object value1, Object value2) {
		return applyBetweenClause(name, " BETWEEN", value1, value2);
	}

	@Override
	public RestrictionImpl notBetween(String name, Object value1, Object value2) {
		return applyBetweenClause(name, " NOT BETWEEN", value1, value2);
	}

	private RestrictionImpl applyBetweenClause(String name, String betweenClause, Object value1, Object value2) {
		final String paramName = this.recq.removeAlias(name) + getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(betweenClause).append(" :").append(paramName).append("1 AND :").append(paramName).append("2");
		this.addParamter(paramName + "1", paramName + "1", value1, Object.class);
		this.addParamter(paramName + "2", paramName + "2", value2, Object.class);
		return this;
	}

	protected List<DatabaseMetadaHelper.Column> getParametersMap() {
		return parametersMap;
	}

	@Override
	public RestrictionImpl and() {
		this.restriction.append(" AND ");
		return this;
	}

	@Override
	public RestrictionImpl or() {
		this.restriction.append(" OR ");
		return this;
	}
	
	public RestrictionImpl openGroup() {
		this.restriction.append(" ( ");
		return this;
	}
	
	public RestrictionImpl closeGroup() {
		this.restriction.append(" ) ");
		return this;
	}

	private void addParamter(String name,String paramName, Object value,Class<?> classType) {
		final Column c = new Column();
		c.setColumnMap(paramName);
		c.setName(name);
		c.setDefaultValue(value);
		c.setType(classType);
		this.parametersMap.add(c);
	}

	@Override
	public RestrictionImpl in(String name, String query) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" IN (:").append(paramName).append(")");
		this.addParamter(paramName, paramName, query, String.class);
		return this;
	}

	@Override
	public RestrictionImpl notIn(String name, Object[] values) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" NOT IN (:").append(paramName).append(")");
		this.addParamter(paramName, paramName, values, Object.class);
		return this;
	}

	@Override
	public RestrictionImpl notIn(String name, String query) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" NOT IN (:").append(paramName).append(")");
		this.addParamter(paramName, paramName, query, String.class);
		return this;
	}

	@Override
	public RestrictionImpl in(String name, Object[] values) {
		final String paramName = this.recq.removeAlias(name)+getParamPrefixSeq();
		this.restriction.append(this.recq.resolveColumnName(this.alias, name)).append(" IN (:").append(paramName).append(")");
		this.addParamter(paramName, paramName, values, Object.class);
		return this;
	}

	private Integer getParamPrefixSeq() {
		return paramPrefixSeq++;
	}

}
