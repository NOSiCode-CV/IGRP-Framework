package nosi.core.webapp.databse.helpers;

import java.util.Arrays;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 9 May 2018
 */
public class CommonFIlter extends QueryHelper implements QueryInterface{	
	
	public CommonFIlter(String connectionName) {
		super(connectionName);
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addString(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String[] values) {
		if(values!=null) {
			values = this.normalizeStringVlaues(values);
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	private String[] normalizeStringVlaues(String[] values) {
		for(int i=0;i<values.length;i++) {
        	values[i] = "\'"+values[i]+"\'";
        }
		return values;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" AND "+name+" "+operator+":"+name+" ").addDouble(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addString(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String[] values) {
		if(values!=null) {
			values = this.normalizeStringVlaues(values);
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" OR "+name+" "+operator+":"+name+" ").addDouble(name, value);
		}
		return this;
	}
	
	@Override
	public QueryInterface between(String name, Object value1, Object value2) {
		if(Core.isNotNull(value1) && Core.isNotNull(value2)) {
			this.where(" "+name+" BETWEEN value1=:value1 AND value2=:value2 ").addObject("value1",value1).addObject("value2", value2);
		}
		return this;
	}

	@Override
	public QueryInterface notBetween(String name, Object value1, Object value2) {
		if(Core.isNotNull(value1) && Core.isNotNull(value2)) {
			this.filterWhere(" "+name+" NOT BETWEEN value1=:value1 AND value2=:value2 ").addObject("value1",value1).addObject("value2", value2);
		}
		return this;
	}

	@Override
	public QueryInterface exists(String value) {
		if(Core.isNotNull(value)) {
			this.filterWhere(" EXISTS ("+value+") ");
		}
		return this;
	}
	
	@Override
	public QueryInterface andWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" AND "+name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface andWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" AND "+name+" IS NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" OR "+name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.filterWhere(" OR "+name+" IS NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Integer[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Integer[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float[] values) {
		if(values!=null) {
			this.applyToInCondition(name, operator, values);
		}
		return this;
	}
	private void applyToInCondition(String name,String operator,Object[] values) {
		String value = String.join(",", Arrays.toString(values)).replaceAll("\\[", "(").replaceAll("\\]", ")");			
		this.filterWhere(" AND "+name+" "+operator+" "+value+" ");
	}

}
