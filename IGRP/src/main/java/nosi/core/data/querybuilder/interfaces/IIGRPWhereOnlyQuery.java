package nosi.core.data.querybuilder.interfaces;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;
import java.util.function.Predicate;

import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

import java.util.function.BiPredicate;

/**
 * venceslau.gama 09/10/2020
 */
public interface IIGRPWhereOnlyQuery<E> extends IIGRPQuery<E> {

	public IIGRPWhereOnlyQuery<E> between(String column, Date from, Date to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Date from, Date to,
			BiPredicate<Date, Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, LocalDate from, LocalDate to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, LocalDate from, LocalDate to,
			BiPredicate<LocalDate, LocalDate> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, LocalDateTime from, LocalDateTime to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, LocalDateTime from, LocalDateTime to,
			BiPredicate<LocalDateTime, LocalDateTime> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, Double from, Double to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Double from, Double to,
			BiPredicate<Double, Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, Float from, Float to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Float from, Float to,
			BiPredicate<Float, Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, Integer from, Integer to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Integer from, Integer to,
			BiPredicate<Integer, Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, Long from, Long to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Long from, Long to,
			BiPredicate<Long, Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> between(String column, Short from, Short to);

	public IIGRPWhereOnlyQuery<E> betweenIf(String column, Short from, Short to,
			BiPredicate<Short, Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Boolean value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Byte value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, byte[] value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Long value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Short value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Double value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, Float value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, String value);

	public IIGRPWhereOnlyQuery<E> equalTo(String column, UUID value);

	public IIGRPWhereOnlyQuery<E> beginsWith(String column, String value);

	public IIGRPWhereOnlyQuery<E> beginsWithIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> contains(String column, String value);

	public IIGRPWhereOnlyQuery<E> containsIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> endsWith(String column, String value);

	public IIGRPWhereOnlyQuery<E> endsWithIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Boolean value, Predicate<Boolean> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Byte value, Predicate<Byte> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, byte[] value, Predicate<byte[]> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Integer value, Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Long value, Predicate<Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Short value, Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Double value, Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, Float value, Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> equalToIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Date value);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Double value);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Float value);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Long value);

	public IIGRPWhereOnlyQuery<E> greaterThan(String column, Short value);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Date value, Predicate<Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Double value, Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Float value, Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Integer value, Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Long value, Predicate<Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Short value, Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Date value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Double value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Float value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Long value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Short value);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Double value,
			Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Float value,
			Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Integer value,
			Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Short value,
			Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> in(String column, Date... values);

	public IIGRPWhereOnlyQuery<E> in(String column, Double... values);

	public IIGRPWhereOnlyQuery<E> in(String column, Float... values);

	public IIGRPWhereOnlyQuery<E> in(String column, Integer... values);

	public IIGRPWhereOnlyQuery<E> in(String column, Long... values);

	public IIGRPWhereOnlyQuery<E> in(String column, Short... values);

	public IIGRPWhereOnlyQuery<E> in(String column, String... values);

	public IIGRPWhereOnlyQuery<E> isNull(String column);

	public IIGRPWhereOnlyQuery<E> isNotNull(String column);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Date value);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Double value);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Float value);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Long value);

	public IIGRPWhereOnlyQuery<E> lessThan(String column, Short value);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Date value, Predicate<Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Double value, Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Float value, Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Integer value, Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Long value, Predicate<Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanIf(String column, Short value, Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Date value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Double value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Float value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Long value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Short value);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Double value,
			Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Integer value,
			Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression);

	public IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> notBeginsWith(String column, String value);

	public IIGRPWhereOnlyQuery<E> notBeginsWithIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> notContains(String column, String value);

	public IIGRPWhereOnlyQuery<E> notContainsIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEndsWith(String column, String value);

	public IIGRPWhereOnlyQuery<E> notEndsWithIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Boolean value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Byte value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, byte[] value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Date value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Double value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Float value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Integer value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Long value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, Short value);

	public IIGRPWhereOnlyQuery<E> notEqualTo(String column, String value);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Boolean value, Predicate<Boolean> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Byte value, Predicate<Byte> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Double value, Predicate<Double> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Float value, Predicate<Float> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Integer value, Predicate<Integer> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Short value, Predicate<Short> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, String value, Predicate<String> validateExpression);

	public IIGRPWhereOnlyQuery<E> notEqualToIf(String column, byte[] value, Predicate<byte[]> validateExpression);

}
