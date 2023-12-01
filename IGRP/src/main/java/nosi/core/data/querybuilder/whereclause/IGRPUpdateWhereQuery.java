package nosi.core.data.querybuilder.whereclause;

import nosi.core.data.querybuilder.interfaces.IIGRPWhereQuery;
import nosi.core.data.querybuilder.updateclause.IGRPUpdateExecutionQuery;
import nosi.core.data.querybuilder.updateclause.IGRPUpdateQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.criteria.CriteriaBuilder.In;
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
public class IGRPUpdateWhereQuery<E> extends IGRPUpdateExecutionQuery<E> implements IIGRPWhereQuery<E> {

   private static final Logger LOGGER = LoggerFactory.getLogger(IGRPUpdateWhereQuery.class);

   private final List<javax.persistence.criteria.Predicate> predicates;

   public IGRPUpdateWhereQuery(IGRPUpdateQuery<E> parent) {
      super(parent.getSession(), parent.getClazz(), parent.getCriteriaUpdateQuery(), parent.getRoot());
      this.predicates = new ArrayList<>();
   }

   public void addPredicate(javax.persistence.criteria.Predicate predicate) {
      this.predicates.add(predicate);
   }

   @Override
   public int update() {
      final javax.persistence.criteria.Predicate[] restrictions = this.predicates.toArray(new javax.persistence.criteria.Predicate[0]);
      if (restrictions.length > 0) {
         this.getCriteriaUpdateQuery().where(restrictions);
         return super.update();
      }
      LOGGER.info("For security reasons no update query has been executed, due to no restrictions found");
      return 0;
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Date... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Date... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Double... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Double... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Float... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Float... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Integer... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Integer... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Long... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Long... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, Short... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, Short... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, String... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, String... values) {
      return this.internalNotIn(column, values);
   }

   @Override
   public IGRPUpdateWhereQuery<E> in(String column, UUID... values) {
      return this.internalIn(column, values);
   }

   public IGRPUpdateWhereQuery<E> notIn(String column, UUID... values) {
      return this.internalNotIn(column, values);
   }

   @SafeVarargs
   @Override
   public final <V> IGRPUpdateWhereQuery<E> inIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      if (validateExpression.test(values))
         in(attribute, values);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPUpdateWhereQuery<E> notInIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      if (validateExpression.test(values))
         notIn(attribute, values);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPUpdateWhereQuery<E> notIn(SingularAttribute<E, V> attribute, V... values) {
      final javax.persistence.criteria.Predicate notInClause = this.getCriteriaBuilder().in(this.getRoot().get(attribute)).not();
      notInClause.in(Arrays.asList(values));
      this.addPredicate(notInClause);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPUpdateWhereQuery<E> in(SingularAttribute<E, V> attribute, V... values) {
      final In<V> inClause = this.getCriteriaBuilder().in(this.getRoot().get(attribute));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   private <V> IGRPUpdateWhereQuery<E> internalIn(String column, V[] values) {
      final In<V> inClause = this.getCriteriaBuilder().in(this.getRoot().get(column));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   private <V> IGRPUpdateWhereQuery<E> internalNotIn(String column, V[] values) {
      final javax.persistence.criteria.Predicate notInClause = this.getCriteriaBuilder().in(this.getRoot().get(column)).not();
      notInClause.in(Arrays.asList(values));
      this.addPredicate(notInClause);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Date from, Date to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Double from, Double to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Float from, Float to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Integer from, Integer to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Long from, Long to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, Short from, Short to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, LocalDate from, LocalDate to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> between(String column, LocalDateTime from, LocalDateTime to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(column), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> between(SingularAttribute<E, V> attribute, V from, V to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> betweenIf(SingularAttribute<E, V> attribute, V from, V to, BiPredicate<V, V> validateExpression) {
      if (validateExpression.test(from, to))
         this.between(attribute, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Date from, Date to, BiPredicate<Date, Date> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Double from, Double to, BiPredicate<Double, Double> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Float from, Float to, BiPredicate<Float, Float> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Integer from, Integer to, BiPredicate<Integer, Integer> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Long from, Long to, BiPredicate<Long, Long> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, Short from, Short to, BiPredicate<Short, Short> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, LocalDate from, LocalDate to,
                                            BiPredicate<LocalDate, LocalDate> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> betweenIf(String column, LocalDateTime from, LocalDateTime to,
                                            BiPredicate<LocalDateTime, LocalDateTime> validateExpression) {
      if (validateExpression.test(from, to))
         return this.between(column, from, to);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> contains(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(column), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> containsIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.contains(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> contains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getCriteriaBuilder().lower(this.getRoot().get(attribute)),
              '%' + value.toLowerCase() + '%'));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> containsIf(SingularAttribute<E, String> attribute, String value,
                                             Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.contains(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notContains(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(column), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notContainsIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notContains(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notContains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), '%' + value + '%'));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notContainsIf(SingularAttribute<E, String> attribute, String value,
                                                Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.notContains(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> beginsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(column), "%" + value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> beginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), "%" + value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> beginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.beginsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> beginsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.beginsWith(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notBeginsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(column), "%" + value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notBeginsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notBeginsWith(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notBeginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), "%" + value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notBeginsWithIf(SingularAttribute<E, String> attribute, String value,
                                                  Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.notBeginsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> endsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> endsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(column), value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> endsWithIf(SingularAttribute<E, String> attribute, String value,
                                             Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.endsWith(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> endsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.endsWith(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> notEndsWith(String column, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(column), value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEndsWithIf(String column, String value, Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         return this.notEndsWith(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEndsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEndsWithIf(SingularAttribute<E, String> attribute, String value,
                                                Predicate<String> validateExpression) {
      if (validateExpression.test(value))
         this.notEndsWith(attribute, value);
      return this;
   }

   private <V> IGRPUpdateWhereQuery<E> internalEqualTo(String column, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Boolean value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Byte value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, byte[] value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Integer value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Long value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Double value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Float value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, Short value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, String value) {
      return this.internalEqualTo(column, value);
   }

   public <V> IGRPUpdateWhereQuery<E> equalTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalTo(String column, UUID value) {
      return this.internalEqualTo(column, value);
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> equalToIfOrDefault(SingularAttribute<E, V> attribute, V value, V defaultValue, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Boolean value, Boolean defaultValue,
                                                     Predicate<Boolean> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Byte value, Byte defaultValue,
                                                     Predicate<Byte> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, byte[] value, byte[] defaultValue,
                                                     Predicate<byte[]> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Double value, Double defaultValue,
                                                     Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Float value, Float defaultValue,
                                                     Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Integer value, Integer defaultValue, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Long value, Long defaultValue, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, Short value, Short defaultValue, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, String value, String defaultValue, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIfOrDefault(String column, UUID value, UUID defaultValue, Predicate<UUID> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(column, value) : this.equalTo(column, defaultValue);
   }

   private <V> IGRPUpdateWhereQuery<E> internalEqualToIf(String column, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Byte value, Predicate<Byte> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Long value, Predicate<Long> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Short value, Predicate<Short> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Double value, Predicate<Double> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Float value, Predicate<Float> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, String value, Predicate<String> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> equalToIf(String column, UUID value, Predicate<UUID> validateExpression) {
      return this.internalEqualToIf(column, value, validateExpression);
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> equalToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.equalTo(attribute, value);
      return this;
   }

   private <V> IGRPUpdateWhereQuery<E> internalNotEqualTo(String column, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> notEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> notEqualToIf(SingularAttribute<E, V> attribute, V value,
                                                   Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.notEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Boolean value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Byte value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, byte[] value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Date value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Double value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Float value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Integer value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Long value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, Short value) {
      return this.internalNotEqualTo(column, value);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualTo(String column, String value) {
      return this.internalNotEqualTo(column, value);
   }


   /**
    *
    */
   private <V> IGRPUpdateWhereQuery<E> internalNotEqualToIf(String column, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Byte value, Predicate<Byte> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, String value, Predicate<String> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> notEqualToIf(String column, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalNotEqualToIf(column, value, validateExpression);
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThan(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> lessThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> lessThanIf(SingularAttribute<E, V> attribute, V value,
                                                                               Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.greaterThan(attribute, value);
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> lessThanOrEqualTo(SingularAttribute<E, V> attribute,
                                                                                      V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }


   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(SingularAttribute<E, V> attribute,
                                                                                        V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.lessThanOrEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualTo(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> greaterThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThan(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(column), value));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(String column, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(column), value));
      return this;
   }

   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> greaterThanOrEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(attribute, value);
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPUpdateWhereQuery<E> greaterThanIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.greaterThan(attribute, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThan(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> greaterThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.greaterThanOrEqualTo(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> isNullIf(String column, boolean condition) {
      if (condition)
         isNull(column);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> isNull(String column) {
      this.addPredicate(this.getCriteriaBuilder().isNull(this.getRoot().get(column)));
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> isNotNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> isNotNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      if (condition)
         isNotNull(attribute);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> isNotNullIf(String column, boolean condition) {
      if (condition)
         isNotNull(column);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> isNotNull(String column) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(this.getRoot().get(column)));
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> isNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      if (condition)
         isNull(attribute);
      return this;
   }

   @Override
   public <V> IGRPUpdateWhereQuery<E> isNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThan(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Date value, Predicate<Date> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Double value, Predicate<Double> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Float value, Predicate<Float> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Integer value, Predicate<Integer> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }


   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Long value, Predicate<Long> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> lessThanOrEqualToIf(String column, Short value, Predicate<Short> validateExpression) {
      if (validateExpression.test(value))
         return this.lessThanOrEqualTo(column, value);
      return this;
   }

}
