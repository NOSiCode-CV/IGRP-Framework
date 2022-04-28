package nosi.core.data.querybuilder.whereclause;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.function.BiPredicate;
import java.util.function.Predicate;
import javax.persistence.criteria.CriteriaBuilder.In;
import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.groupbyclause.IGRPGroupByQuery;
import nosi.core.data.querybuilder.interfaces.IIGRPWhereOnlyQuery;
import nosi.core.data.querybuilder.interfaces.IIGRPWhereQuery;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPWhereQuery<E> extends IGRPSelectQuery<E> implements IIGRPWhereQuery<E> {

	public IGRPQueryBase<E> parent;
	private List<javax.persistence.criteria.Predicate> predicates;
	
	
	public IGRPWhereQuery(IGRPQueryBase<E> parent) {
		super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
		this.parent = parent;
		this.predicates = new ArrayList<>();
	}
	
	
	public void addPredicate(javax.persistence.criteria.Predicate predicate) {
    	this.predicates.add(predicate);
    }
	
	
	private void applyWhereClause() {
		javax.persistence.criteria.Predicate[] ps =
				this.predicates.stream().toArray(javax.persistence.criteria.Predicate[]::new);
		this.getCriteriaQuery().select(this.getRoot());
		this.getCriteriaQuery().where(ps);
	}
	
	
	public IGRPOrWhereQuery<E> beginOr() {
		return new IGRPOrWhereQuery<E>(this);
	}
	
	public IGRPAndWhereQuery<E> beginAnd() {
		return new IGRPAndWhereQuery<E>(this);
	}
	
	public IGRPGroupByQuery<E> groupBy(String column) {
		this.applyWhereClause();
		return new IGRPGroupByQuery<E>(this, column); 
	}
	
	
	public IGRPGroupByQuery<E> groupBy(String... columns) {
		this.applyWhereClause();
		return new IGRPGroupByQuery<E>(this, columns); 
	}


	public IGRPOrderByQuery<E> orderBy( IGRPOrderByQuery.Order order, String column) {
		this.applyWhereClause();
		return new IGRPOrderByQuery<E>(this, order, column);
	}
	
	public IGRPOrderByQuery<E> orderBy( IGRPOrderByQuery.Order order, String... columns) {
		this.applyWhereClause();
		return new IGRPOrderByQuery<E>(this, order, columns);
	}
	

	@Override
	public List<E> all() {
		this.applyWhereClause();
		return super.all();
	}

	@Override
	public E one() {
		this.applyWhereClause();
		return super.one();
	}
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#IN
	 */
	
	private <T> IGRPWhereQuery<E> internalIn( String column, @SuppressWarnings("unchecked") T... values) {
		In<T> inClause = this.getCriteriaBuilder().in(this.getRoot().get(column));
		Arrays.asList(values).forEach( v-> inClause.value(v));
		this.addPredicate(inClause);
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Date... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Double... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Float... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Integer... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Long... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, Short... values) {
		return this.internalIn(column, values);
	}
	
	@Override
	public IGRPWhereQuery<E> in( String column, String... values) {
		return this.internalIn(column, values);
	}

	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#between
	 */

	@Override
	public IGRPWhereQuery<E> between(String column, Date from, Date to) {
			this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
	        return this;
	}

	@Override
	public IGRPWhereQuery<E> between(String column, Double from, Double to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> between(String column, Float from, Float to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> between(String column, Integer from, Integer to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> between(String column, Long from, Long to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> between(String column, Short from, Short to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> between(String column, LocalDate from, LocalDate to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> between(String column, LocalDateTime from, LocalDateTime to) {
		this.addPredicate( this.getCriteriaBuilder().between(this.getRoot().get(column),  from, to));
		return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Date from, Date to, BiPredicate<Date,Date> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
        return this;
	}
	
	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Double from, Double to,BiPredicate<Double, Double> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}


	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Float from, Float to,BiPredicate<Float, Float> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}


	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Integer from, Integer to,BiPredicate<Integer, Integer> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}


	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Long from, Long to,BiPredicate<Long, Long> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}


	@Override
	public IGRPWhereQuery<E> betweenIf(String column, Short from, Short to,BiPredicate<Short, Short> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> betweenIf(String column, LocalDate from, LocalDate to,
			BiPredicate<LocalDate, LocalDate> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}

	@Override
	public IGRPWhereQuery<E> betweenIf(String column, LocalDateTime from, LocalDateTime to,
			BiPredicate<LocalDateTime, LocalDateTime> validateExpression) {
		if(validateExpression.test(from,to))
			return this.between(column, from, to);
		return this;
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#contains
	 */
	
	@Override
	public IGRPWhereQuery<E> contains(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().like(this.getRoot().get(column), "%" + value + "%"));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> containsIf(String column, String value, Predicate<String> validateExpression) {
		if(validateExpression.test(value))
			return this.contains(column, value);
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> notContains(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().notLike(this.getRoot().get(column), "%" + value + "%"));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> notContainsIf(String column, String value, Predicate<String> validateExpression) {
		if(validateExpression.test(value))
			return this.notContains(column, value);
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> beginsWith(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().like(this.getRoot().get(column), "%" + value));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> beginsWithIf(String column, String value, Predicate<String> validateExpression) {
		if( validateExpression.test(value))
			return this.beginsWith(column, value);
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> notBeginsWith(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().notLike(this.getRoot().get(column), "%" + value));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> notBeginsWithIf(String column, String value, Predicate<String> validateExpression) {
		if( validateExpression.test(value))
			return this.notBeginsWith(column, value);
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> endsWith(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().like(this.getRoot().get(column), value + "%"));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> endsWithIf(String column, String value, Predicate<String> validateExpression) {
		if( validateExpression.test(value))
			return this.endsWith(column, value);
		return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> notEndsWith(String column, String value) {
        this.addPredicate( this.getCriteriaBuilder().notLike(this.getRoot().get(column), value + "%"));
        return  this;
    }
	
	@Override
	public IGRPWhereQuery<E> notEndsWithIf(String column, String value, Predicate<String> validateExpression) {
		if( validateExpression.test(value))
			return this.notEndsWith(column, value);
		return this;
	}

	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IIgrpQuery#equalTo
	 */
	
	private <V> IGRPWhereQuery<E> internalEqualTo(String column, V value) {
		this.addPredicate( this.getCriteriaBuilder().equal(this.getRoot().get(column),  value));
        return this;
    }
	
	public <V> IGRPWhereQuery<E> internalEqualTo(String column, String column2, V value) {
		this.addPredicate( this.getCriteriaBuilder().equal(this.getRoot().get(column).get(column2),  value));
        return this;
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Boolean value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Byte value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, byte[] value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Integer value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Long value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Double value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Float value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, Short value) {
		return this.internalEqualTo(column, value);
	}
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, String value) {
		return this.internalEqualTo(column, value);
    }
	
	@Override
	public IGRPWhereQuery<E> equalTo(String column, UUID value) {
		return this.internalEqualTo(column, value);
    }
	
	/**
	 * 
	 * @param column
	 * @param value
	 * @param validateExpression
	 * @return
	 */
	private <V> IGRPWhereQuery<E> internalEqualToIf(String column, V value, Predicate<V> validateExpression) {
		if (validateExpression.test(value))
			this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(column), value));
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Byte value, Predicate<Byte> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
    }

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Integer value, Predicate<Integer> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Long value, Predicate<Long> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Short value, Predicate<Short> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Double value, Predicate<Double> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Float value, Predicate<Float> validateExpression) {
		return this.internalEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> equalToIf(String column, String value, Predicate<String> validateExpression) {
		return  this.internalEqualToIf(column, value, validateExpression);
	}
	
	@Override
	public IGRPWhereQuery<E> equalToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
		return this.internalEqualToIf(column, value,validateExpression);
	}
	
	
	
	/**
	 * 
	 * @param column
	 * @param value
	 * @return
	 */
	private <V> IGRPWhereQuery<E> internalNotEqualTo(String column, V value) {
		this.addPredicate( this.getCriteriaBuilder().notEqual(this.getRoot().get(column),  value));
        return this;
    }

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Boolean value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Byte value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, byte[] value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Date value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Double value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Float value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Integer value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Long value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, Short value) {
		return this.internalNotEqualTo(column, value);
	}

	@Override
	public IGRPWhereQuery<E> notEqualTo(String column, String value) {
		return this.internalNotEqualTo(column, value);
	}
	
	
	/**
	 * 
	 * @param column
	 * @param value
	 * @param validateExpression
	 * @return
	 */
	private <V> IGRPWhereQuery<E> internalNotEqualToIf(String column, V value, Predicate<V> validateExpression) {
		if(validateExpression.test(value))
			this.addPredicate( this.getCriteriaBuilder().notEqual(this.getRoot().get(column),  value));
        return this;
    }

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Byte value, Predicate<Byte> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, String value, Predicate<String> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}
	
	@Override
	public IGRPWhereQuery<E> notEqualToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
		return this.internalNotEqualToIf(column, value, validateExpression);
	}

	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#lessThan
	 */

	@Override
	public IGRPWhereQuery<E> lessThan(String column, Date value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThan(String column, Double value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThan(String column, Float value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThan(String column, Integer value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> lessThan(String column, Short value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThan(String column, Long value) {
		this.addPredicate( this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
		return this;
	}
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#lessThanOrEqualTo
	 */
	
	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Date value) {
		this.addPredicate( this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Double value) {
		this.addPredicate( this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Float value) {
		this.addPredicate( this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Integer value) {
		this.addPredicate( this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}

	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Long value) {
		this.addPredicate( this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}
	
	@Override
	public IGRPWhereQuery<E> lessThanOrEqualTo(String column, Short value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
        return this;
	}


	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#greaterThan
	 */

	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Date value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Double value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Float value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Integer value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Long value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> greaterThan(String column, Short value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
		return this;
	}
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#greaterThanOrEqualTo
	 */
	
	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Date value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Double value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Float value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Integer value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Long value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualTo(String column, Short value) {
		this.addPredicate( this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
		return this;
	}


	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#greaterThanIf
	 */
	
	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Date value, Predicate<Date> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Double value, Predicate<Double> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Float value, Predicate<Float> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Long value, Predicate<Long> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> greaterThanIf(String column, Short value, Predicate<Short> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThan( column, value);
        return this;
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#greaterThanOrEqualToIf
	 */

	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> greaterThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
		if(validateExpression.test(value))
			return this.greaterThanOrEqualTo( column, value);
        return this;
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#isNull
	 */
	
	@Override
	public IGRPWhereQuery<E> isNull(String column) {
		this.addPredicate( this.getCriteriaBuilder().isNull(this.getRoot().get(column)));
		return this;
	}


	@Override
	public IGRPWhereQuery<E> isNotNull(String column) {
		this.addPredicate( this.getCriteriaBuilder().isNotNull(this.getRoot().get(column)));
		return this;
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#lessThanIf
	 */
	
	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Date value, Predicate<Date> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Double value, Predicate<Double> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Float value, Predicate<Float> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}
	
	
	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Short value, Predicate<Short> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanIf(String column, Long value, Predicate<Long> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThan( column, value);
        return this;
	}
	
	
	
	/*
	 * (non-Javadoc)
	 * @see nosi.webapps.teste_pessoa.core.data.querybuilder.IgrpQuery#lessThanOrEqualToIf
	 */
	
	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}


	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}
	
	@Override
	public IGRPWhereQuery<E> lessThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
		if(validateExpression.test(value))
			return this.lessThanOrEqualTo( column, value);
        return this;
	}


	
}
