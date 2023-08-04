package nosi.core.data.querybuilder.interfaces;

import javax.persistence.metamodel.SingularAttribute;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;
import java.util.function.BiPredicate;
import java.util.function.Predicate;

/**
 * venceslau.gama 09/10/2020
 */
public interface IIGRPWhereOnlyQuery<E> extends IIGRPQuery<E> {

	IIGRPWhereOnlyQuery<E> beginsWith(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> beginsWith(String column, String value);

	IIGRPWhereOnlyQuery<E> beginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> beginsWithIf(String column, String value, Predicate<String> validateExpression);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> between(SingularAttribute<E, V> attribute, V from, V to);

	IIGRPWhereOnlyQuery<E> between(String column, Date from, Date to);

	IIGRPWhereOnlyQuery<E> between(String column, Double from, Double to);

	IIGRPWhereOnlyQuery<E> between(String column, Float from, Float to);

	IIGRPWhereOnlyQuery<E> between(String column, Integer from, Integer to);

	IIGRPWhereOnlyQuery<E> between(String column, LocalDate from, LocalDate to);

	IIGRPWhereOnlyQuery<E> between(String column, LocalDateTime from, LocalDateTime to);

	IIGRPWhereOnlyQuery<E> between(String column, Long from, Long to);

	IIGRPWhereOnlyQuery<E> between(String column, Short from, Short to);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> betweenIf(SingularAttribute<E, V> attribute, V from,
																			  V to, BiPredicate<V, V> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Date from, Date to,
											BiPredicate<Date, Date> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Double from, Double to,
											BiPredicate<Double, Double> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Float from, Float to,
											BiPredicate<Float, Float> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Integer from, Integer to,
											BiPredicate<Integer, Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, LocalDate from, LocalDate to,
											BiPredicate<LocalDate, LocalDate> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, LocalDateTime from, LocalDateTime to,
											BiPredicate<LocalDateTime, LocalDateTime> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Long from, Long to,
											BiPredicate<Long, Long> validateExpression);

	IIGRPWhereOnlyQuery<E> betweenIf(String column, Short from, Short to,
											BiPredicate<Short, Short> validateExpression);

	IIGRPWhereOnlyQuery<E> contains(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> contains(String column, String value);

	IIGRPWhereOnlyQuery<E> containsIf(SingularAttribute<E, String> attribute, String value,
											 Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> containsIf(String column, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> endsWith(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> endsWith(String column, String value);

	IIGRPWhereOnlyQuery<E> endsWithIf(SingularAttribute<E, String> attribute, String value,
											 Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> endsWithIf(String column, String value, Predicate<String> validateExpression);

	<V> IIGRPWhereOnlyQuery<E> equalTo(SingularAttribute<E, V> attribute, V value);

	/**
	 * Add condition for equality of Boolean value.
	 *
	 * @param column table column
	 * @param value  value
	 * @return inequality predicate
	 */
	IIGRPWhereOnlyQuery<E> equalTo(String column, Boolean value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Byte value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, byte[] value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Double value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Float value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Integer value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Long value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, Short value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, String value);

	IIGRPWhereOnlyQuery<E> equalTo(String column, UUID value);

	<V> IIGRPWhereOnlyQuery<E> equalToIf(SingularAttribute<E, V> attribute, V value,
												Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Boolean value, Predicate<Boolean> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Byte value, Predicate<Byte> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, byte[] value, Predicate<byte[]> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Double value, Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Float value, Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Integer value, Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Long value, Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, Short value, Predicate<Short> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIf(String column, UUID value, Predicate<UUID> validateExpression);

	<V> IIGRPWhereOnlyQuery<E> equalToIfOrDefault(SingularAttribute<E, V> attribute, V value, V defaultValue,
														 Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Boolean value, Boolean defaultValue,
													 Predicate<Boolean> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Byte value, Byte defaultValue,
													 Predicate<Byte> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, byte[] value, byte[] defaultValue,
													 Predicate<byte[]> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Double value, Double defaultValue,
													 Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Float value, Float defaultValue,
													 Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Integer value, Integer defaultValue,
													 Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Long value, Long defaultValue,
													 Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, Short value, Short defaultValue,
													 Predicate<Short> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, String value, String defaultValue,
													 Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> equalToIfOrDefault(String column, UUID value, UUID defaultValue,
													 Predicate<UUID> validateExpression);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> greaterThan(SingularAttribute<E, V> attribute,
																				V value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Date value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Double value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Float value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Integer value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Long value);

	IIGRPWhereOnlyQuery<E> greaterThan(String column, Short value);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> greaterThanIf(SingularAttribute<E, V> attribute,
																				  V value, Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Date value, Predicate<Date> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Double value, Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Float value, Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Integer value, Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Long value, Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanIf(String column, Short value, Predicate<Short> validateExpression);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(
			SingularAttribute<E, V> attribute, V value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Date value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Double value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Float value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Integer value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Long value);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualTo(String column, Short value);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(
			SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Double value,
														 Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Float value,
														 Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Integer value,
														 Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> greaterThanOrEqualToIf(String column, Short value,
														 Predicate<Short> validateExpression);

	<V> IIGRPWhereOnlyQuery<E> inIf(SingularAttribute<E, V> attribute,Predicate<V[]> validateExpression, V... values);
	<V> IIGRPWhereOnlyQuery<E> notInIf(SingularAttribute<E, V> attribute,Predicate<V[]> validateExpression, V... values);
	<V> IIGRPWhereOnlyQuery<E> in(SingularAttribute<E, V> attribute, V... values);
	<V> IIGRPWhereOnlyQuery<E> notIn(SingularAttribute<E, V> attribute, V... values);

	IIGRPWhereOnlyQuery<E> in(String column, Date... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Date... values);

	IIGRPWhereOnlyQuery<E> in(String column, Double... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Double... values);

	IIGRPWhereOnlyQuery<E> in(String column, Float... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Float... values);

	IIGRPWhereOnlyQuery<E> in(String column, Integer... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Integer... values);

	IIGRPWhereOnlyQuery<E> in(String column, Long... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Long... values);

	IIGRPWhereOnlyQuery<E> in(String column, Short... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, Short... values);

	IIGRPWhereOnlyQuery<E> in(String column, String... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, String... values);

	IIGRPWhereOnlyQuery<E> in(String column, UUID... values);
	IIGRPWhereOnlyQuery<E> notIn(String column, UUID... values);

	<V> IIGRPWhereOnlyQuery<E> isNotNullIf(SingularAttribute<E, V> attribute, boolean condition);
	<V> IIGRPWhereOnlyQuery<E> isNotNull(SingularAttribute<E, V> attribute);

	IIGRPWhereOnlyQuery<E> isNotNullIf(String column, boolean condition);
	IIGRPWhereOnlyQuery<E> isNotNull(String column);

	<V> IIGRPWhereOnlyQuery<E> isNull(SingularAttribute<E, V> attribute);
	<V> IIGRPWhereOnlyQuery<E> isNullIf(SingularAttribute<E, V> attribute, boolean condition);

	IIGRPWhereOnlyQuery<E> isNull(String column);
	IIGRPWhereOnlyQuery<E> isNullIf(String column, boolean condition);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> lessThan(SingularAttribute<E, V> attribute,
																			 V value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Date value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Double value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Float value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Integer value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Long value);

	IIGRPWhereOnlyQuery<E> lessThan(String column, Short value);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> lessThanIf(SingularAttribute<E, V> attribute,
																			   V value, Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Date value, Predicate<Date> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Double value, Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Float value, Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Integer value, Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Long value, Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanIf(String column, Short value, Predicate<Short> validateExpression);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(SingularAttribute<E, V> attribute,
																					  V value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Date value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Double value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Float value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Integer value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Long value);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualTo(String column, Short value);

	<V extends Comparable<? super V>> IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(
			SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Double value,
													  Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Integer value,
													  Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression);

	IIGRPWhereOnlyQuery<E> lessThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression);

	IIGRPWhereOnlyQuery<E> notBeginsWith(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> notBeginsWith(String column, String value);

	IIGRPWhereOnlyQuery<E> notBeginsWithIf(SingularAttribute<E, String> attribute, String value,
												  Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notBeginsWithIf(String column, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notContains(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> notContains(String column, String value);

	IIGRPWhereOnlyQuery<E> notContainsIf(SingularAttribute<E, String> attribute, String value,
												Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notContainsIf(String column, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notEndsWith(SingularAttribute<E, String> attribute, String value);

	IIGRPWhereOnlyQuery<E> notEndsWith(String column, String value);

	IIGRPWhereOnlyQuery<E> notEndsWithIf(SingularAttribute<E, String> attribute, String value,
												Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notEndsWithIf(String column, String value, Predicate<String> validateExpression);

	<V> IIGRPWhereOnlyQuery<E> notEqualTo(SingularAttribute<E, V> attribute, V value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Boolean value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Byte value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, byte[] value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Date value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Double value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Float value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Integer value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Long value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, Short value);

	IIGRPWhereOnlyQuery<E> notEqualTo(String column, String value);

	<V> IIGRPWhereOnlyQuery<E> notEqualToIf(SingularAttribute<E, V> attribute, V value,
												   Predicate<V> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Boolean value, Predicate<Boolean> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Byte value, Predicate<Byte> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, byte[] value, Predicate<byte[]> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Date value, Predicate<Date> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Double value, Predicate<Double> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Float value, Predicate<Float> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Integer value, Predicate<Integer> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Short value, Predicate<Short> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, String value, Predicate<String> validateExpression);

	IIGRPWhereOnlyQuery<E> notEqualToIf(String column, Long value, Predicate<Long> validateExpression);

}
