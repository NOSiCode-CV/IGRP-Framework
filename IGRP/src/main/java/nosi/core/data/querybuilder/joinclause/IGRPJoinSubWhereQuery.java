package nosi.core.data.querybuilder.joinclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.interfaces.IIGRPWhereOnlyQuery;
import nosi.core.data.querybuilder.whereclause.IGRPWhereQuery;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.Join;
import javax.persistence.metamodel.SingularAttribute;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.function.BiPredicate;
import java.util.function.Predicate;

/**
 * venceslau.gama
 * 09/10/2020
 */
public abstract class IGRPJoinSubWhereQuery<E> extends IGRPQueryBase<E> implements IIGRPWhereOnlyQuery<E> {

   protected final IGRPWhereQuery<E> parent;
   private final Join<Object, Object> join;
   private final List<javax.persistence.criteria.Predicate> predicates;

   protected IGRPJoinSubWhereQuery(IGRPWhereQuery<E> parent, Join<Object, Object> join) {
      super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
      this.parent = parent;
      this.predicates = new ArrayList<>();
      this.join = join;
   }

   public abstract IGRPWhereQuery<E> end();

   private void addPredicate(javax.persistence.criteria.Predicate predicate) {
      this.getPredicates().add(predicate);
   }

   public List<javax.persistence.criteria.Predicate> getPredicates() {
      return this.predicates;
   }

   @SafeVarargs
   private <T> IGRPJoinSubWhereQuery<E> internalIn(String column, T... values) {
      In<T> inClause = this.getCriteriaBuilder().in(join.get(column));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   @SafeVarargs
   private <T> IGRPJoinSubWhereQuery<E> internalNotIn(String column, T... values) {
      final javax.persistence.criteria.Predicate notInClause = this.getCriteriaBuilder().not(join.get(column).in(Arrays.asList(values)));
      this.addPredicate(notInClause);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Date... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Date... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Double... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Double... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Float... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Float... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Integer... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Integer... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Long... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Long... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, Short... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, Short... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, String... values) {
      return this.internalIn(column, values);
   }

   public IGRPJoinSubWhereQuery<E> notIn(String column, String... values) {
      return this.internalNotIn(column, values);
   }

   @SafeVarargs
   @Override
   public final <V> IGRPJoinSubWhereQuery<E> notInIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      if (validateExpression.test(values))
         notIn(attribute, values);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPJoinSubWhereQuery<E> inIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      if (validateExpression.test(values))
         in(attribute, values);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPJoinSubWhereQuery<E> in(SingularAttribute<E, V> attribute, V... values) {
      final In<V> inClause = this.getCriteriaBuilder().in(join.get(attribute.getName()));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPJoinSubWhereQuery<E> notIn(SingularAttribute<E, V> attribute, V... values) {
      final javax.persistence.criteria.Predicate notInClause = join.get(attribute.getName()).in(Arrays.asList(values)).not();
      this.addPredicate(notInClause);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> in(String column, UUID... values) {
      return this.internalIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notIn(String column, UUID... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Date from, Date to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Double from, Double to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Float from, Float to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Integer from, Integer to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Long from, Long to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, Short from, Short to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, LocalDate from, LocalDate to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> between(String column, LocalDateTime from, LocalDateTime to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(column), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> between(SingularAttribute<E, V> attribute, V from, V to) {
      this.addPredicate(this.getCriteriaBuilder().between(join.get(attribute.getName()), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> betweenIf(SingularAttribute<E, V> attribute, V from, V to, BiPredicate<V, V> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(attribute, from, to);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Date from, Date to, BiPredicate<Date, Date> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Double from, Double to, BiPredicate<Double, Double> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Float from, Float to, BiPredicate<Float, Float> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Integer from, Integer to, BiPredicate<Integer, Integer> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Long from, Long to, BiPredicate<Long, Long> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, Short from, Short to, BiPredicate<Short, Short> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, LocalDate from, LocalDate to,
                                           BiPredicate<LocalDate, LocalDate> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> betweenIf(String column, LocalDateTime from, LocalDateTime to,
                                           BiPredicate<LocalDateTime, LocalDateTime> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> contains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(attribute.getName()), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> containsIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.contains(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> contains(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(column), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> containsIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.contains(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notContains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(attribute.getName()), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notContainsIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notContains(attribute, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notContains(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(column), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notContainsIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notContains(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> beginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(attribute.getName()), "%" + value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> beginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.beginsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> beginsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(column), "%" + value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> beginsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.beginsWith(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notBeginsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(column), "%" + value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notBeginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(attribute.getName()), "%" + value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notBeginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notBeginsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notBeginsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notBeginsWith(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> endsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(attribute.getName()), value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> endsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.endsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> endsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(join.get(column), value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> endsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.endsWith(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEndsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(column), value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEndsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notEndsWith(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEndsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(join.get(attribute.getName()), value + "%"));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEndsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notEndsWith(attribute, value);
      return this;
   }

   private <V> IGRPJoinSubWhereQuery<E> internalEqualTo(String column, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Boolean value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Byte value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, byte[] value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Integer value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Long value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Double value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Float value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, Short value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, String value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalTo(String column, UUID value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> equalTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> equalToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.equalTo(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, UUID value, Predicate<UUID> validateExpression) {
      return this.internalEqualTo(column, value);
   }

   private <V> IGRPJoinSubWhereQuery<E> internalEqualToIf(String column, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().equal(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Byte value, Predicate<Byte> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Long value, Predicate<Long> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Short value, Predicate<Short> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Double value, Predicate<Double> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Float value, Predicate<Float> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, String value, Predicate<String> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> equalToIfOrDefault(SingularAttribute<E, V> attribute, V value, V defaultValue, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Boolean value, Boolean defaultValue,
                                                      Predicate<Boolean> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Byte value, Byte defaultValue,
                                                      Predicate<Byte> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, byte[] value, byte[] defaultValue,
                                                      Predicate<byte[]> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Double value, Double defaultValue,
                                                      Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Float value, Float defaultValue,
                                                      Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Integer value, Integer defaultValue, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Long value, Long defaultValue, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, Short value, Short defaultValue, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, String value, String defaultValue, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> equalToIfOrDefault(String column, UUID value, UUID defaultValue, Predicate<UUID> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }


   private <V> IGRPJoinSubWhereQuery<E> internalNotEqualTo(String column, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Boolean value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Byte value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, byte[] value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Date value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Double value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Float value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Integer value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Long value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, Short value) {
      return this.internalNotEqualTo(column, value);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualTo(String column, String value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> notEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> notEqualToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.notEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   private <V> IGRPJoinSubWhereQuery<E> internalNotEqualToIf(String column, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().notEqual(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Byte value, Predicate<Byte> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, String value, Predicate<String> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }


   @Override
   public IGRPJoinSubWhereQuery<E> notEqualToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, LocalDate value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThan(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, LocalDate value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, LocalDate value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThan(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(column), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> greaterThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> greaterThanIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, LocalDate value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualTo(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(join.get(column), value));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> greaterThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> isNullIf(String column, boolean condition) {
      return condition ? isNull(column) : this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> isNull(String column) {
      this.addPredicate(this.getCriteriaBuilder().isNull(join.get(column)));
      return this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> isNotNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      return condition ? isNotNull(attribute.getName()) : this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> isNotNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(join.get(attribute.getName())));
      return this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> isNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      return condition ? isNull(attribute.getName()) : this;
   }

   @Override
   public <V> IGRPJoinSubWhereQuery<E> isNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNull(join.get(attribute.getName())));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> isNotNullIf(String column, boolean condition) {
      return condition ? isNotNull(column) : this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> isNotNull(String column) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(join.get(column)));
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> lessThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> lessThanIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(attribute, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> lessThanOrEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(join.get(attribute.getName()), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }

   @Override
   public IGRPJoinSubWhereQuery<E> lessThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }
}
