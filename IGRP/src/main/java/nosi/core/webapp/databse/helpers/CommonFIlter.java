package nosi.core.webapp.databse.helpers;

import java.sql.Date;
import java.util.Arrays;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.StringHelper;

/**
 * Emanuel
 * 9 May 2018
 */
public class CommonFIlter extends QueryHelper implements QueryInterface{	
	
	public CommonFIlter(Object connectionName) {
		super(connectionName);
	}

	public CommonFIlter() {
		
	}
	
	@Override
	public QueryInterface whereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.where();
			this.sql += name+" IS NOT NULL ";
		}
		return this;
	}

	@Override
	public QueryInterface whereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.where();
			this.sql += name+" IS NULL ";
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, String value) {
		if(value!=null) {
			if(operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equals("notlike")) {
				this.where("");
				this.sql += " UPPER("+name+") "+operator+":"+this.recq.removeAlias(name);
			}else {
				this.where("");
				this.sql += " UPPER("+name+") "+operator+":"+this.recq.removeAlias(name);
			}
			this.addString(name, value.toUpperCase());
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, Integer value) {
		if(value!=null) {
			this.where("");
			this.sql += name+" "+operator+":"+this.recq.removeAlias(name);
			this.addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, Float value) {
		if(value!=null) {
			this.where("");
			this.sql += name+" "+operator+":"+this.recq.removeAlias(name);
			this.addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, Double value) {
		if(value!=null) {
			this.where("");
			this.sql += name+" "+operator+":"+this.recq.removeAlias(name);
			this.addDouble(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, Date value) {
		if(value!=null) {
			this.where("");
			this.sql += name+" "+operator+":"+this.recq.removeAlias(name);
			this.addDate(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface where(String name, String operator, String value, String format) {
		return this.where(name, operator, Core.ToDate(value, format));
	}

	
	@Override
	public QueryInterface andWhere(String name, String operator, String value) {
		if(value!=null) {
			this.and();
			if(operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equalsIgnoreCase("notlike")) {
				this.filterWhere(" UPPER("+name+") "+operator+" :"+this.recq.removeAlias(name)+" ").addString(name, value.toUpperCase());
			}else {
				this.filterWhere(" UPPER("+name+") "+operator+" :"+this.recq.removeAlias(name)+" ").addString(name,value.toUpperCase());
			}
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
		if(value!=null) {
			this.and();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Float value) {
		if(value!=null) {
			this.and();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, Double value) {
		if(value!=null) {
			this.and();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addDouble(name, value);
		}
		return this;
	}
	
	@Override
	public QueryInterface andWhere(String name, String operator, Date value) {
		if(value!=null) {
			this.and();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addDate(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface andWhere(String name, String operator, String value, String format) {
		return this.andWhere(name, operator, Core.ToDate(value, format));
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Date value) {
		if(value!=null) {
			this.or();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addDate(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, String value, String format) {
		return this.orWhere(name, operator, Core.ToDate(value, format));
	}
	
	@Override
	public QueryInterface orWhere(String name, String operator, String value) {
		if(value!=null) {
			this.or();
			if(operator.equalsIgnoreCase("like") || StringHelper.removeSpace(operator).equalsIgnoreCase("notlike")) {
				this.filterWhere(" UPPER("+name+") "+operator+" :"+name+" ").addString(name, value.toUpperCase());
			}else {
				this.filterWhere(" UPPER("+name+") "+operator+" :"+this.recq.removeAlias(name)+" ").addString(name, value.toUpperCase());
			}
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
		if(value!=null) {
			this.or();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addInt(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Float value) {
		if(value!=null) {
			this.or();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addFloat(name, value);
		}
		return this;
	}

	@Override
	public QueryInterface orWhere(String name, String operator, Double value) {
		if(value!=null) {
			this.or();
			this.filterWhere(name+" "+operator+" :"+this.recq.removeAlias(name)+" ").addDouble(name, value);
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
	public QueryInterface exists(String subQuery) {
		if(Core.isNotNull(subQuery)) {
			this.filterWhere(" EXISTS ("+subQuery+") ");
		}
		return this;
	}

	@Override
	public QueryInterface notExists(String subQuery) {
		if(Core.isNotNull(subQuery)) {
			this.filterWhere(" NOT EXISTS ("+subQuery+") ");
		}
		return this;
	}
	
	@Override
	public QueryInterface andWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.and();
			this.filterWhere(name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface andWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.and();
			this.filterWhere(name+" IS NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereNotNull(String name) {
		if(Core.isNotNull(name)) {
			this.or();
			this.filterWhere(name+" IS NOT NULL ");
		}
		return this;
	}

	@Override
	public QueryInterface orWhereIsNull(String name) {
		if(Core.isNotNull(name)) {
			this.or();
			this.filterWhere(name+" IS NULL ");
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
		this.and();			
		this.filterWhere(name+" "+operator+" "+value+" ");
	}

	@Override
	public QueryInterface and() {
		if(!this.whereIsCall)
			this.where();
		this.sql += " AND ";
		return this;
	}

	@Override
	public QueryInterface or() {
		if(!this.whereIsCall)
			this.where();
		this.sql += " OR ";
		return this;
	}

	@Override
	public QueryInterface limit(int limit) {
		if(limit > 0)
			this.sql+=" LIMIT "+limit;
		return this;
	}

	@Override
	public QueryInterface offset(int offset) {
		if(offset > 0)
			this.sql+=" OFFSET "+offset;
		return this;
	}

	@Override
	public QueryInterface any(String subQuery) {
		if(Core.isNotNull(subQuery))
			this.sql+=" ANY ("+subQuery+")";
		return this;
	}
}
