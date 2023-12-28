package nosi.core.data.querybuilder.whereclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.groupbyclause.IGRPGroupByQuery;
import nosi.core.data.querybuilder.interfaces.IIGRPWhereQuery;
import nosi.core.data.querybuilder.joinclause.IGRPJoinWhereQuery;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.Join;
import javax.persistence.metamodel.SingularAttribute;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.function.BiPredicate;
import java.util.function.Consumer;
import java.util.function.Predicate;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPWhereQuery<E> extends IGRPSelectQuery<E> implements IIGRPWhereQuery<E> {

   public final IGRPQueryBase<E> parent;
   private final List<javax.persistence.criteria.Predicate> predicates;

   public IGRPWhereQuery(IGRPQueryBase<E> parent) {
      super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
      this.parent = parent;
      this.predicates = new ArrayList<>();
   }

   public void addPredicate(javax.persistence.criteria.Predicate predicate) {
      this.predicates.add(predicate);
   }

   private void applyWhereClause() {
      javax.persistence.criteria.Predicate[] ps = this.predicates.toArray(new javax.persistence.criteria.Predicate[0]);
      this.getCriteriaQuery().select(this.getRoot());
      this.getCriteriaQuery().where(ps);
   }

   public IGRPOrWhereQuery<E> beginOr() {
      return new IGRPOrWhereQuery<>(this);
   }

   public IGRPAndWhereQuery<E> beginAnd() {
      return new IGRPAndWhereQuery<>(this);
   }

   public IGRPJoinWhereQuery<E> beginJoin(Consumer<JoinAttributeHolder> builderConsumer) {

      final JoinAttributeHolder joinAttributeHolder = new JoinAttributeHolder();
      builderConsumer.accept(joinAttributeHolder);

      Join<Object, Object> join = null;

      final List<String> attributes = joinAttributeHolder.attributes;

      for (String attribute : attributes) {
         Objects.requireNonNull(attribute, "attributes contains null references");
         join = Objects.isNull(join) ? this.getRoot().join(attribute) : join.join(attribute);
      }

      return new IGRPJoinWhereQuery<>(this, join);
   }

   public static class JoinAttributeHolder {
      private final List<String> attributes = new ArrayList<>();

      public <X, Y> JoinAttributeHolder join(SingularAttribute<X, Y> attribute) {
         this.attributes.add(attribute.getName());
         return this;
      }

      public JoinAttributeHolder join(String attribute) {
         this.attributes.add(attribute);
         return this;
      }
   }

   public IGRPGroupByQuery<E> groupBy(String attribute) {
      this.applyWhereClause();
      return new IGRPGroupByQuery<>(this, attribute);
   }

   public <V> IGRPGroupByQuery<E> groupBy(SingularAttribute<E, V> attribute) {
      this.applyWhereClause();
      return new IGRPGroupByQuery<>(this, attribute);
   }

   public IGRPGroupByQuery<E> groupBy(String... columns) {
      this.applyWhereClause();
      return new IGRPGroupByQuery<>(this, columns);
   }

   public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String attribute) {
      this.applyWhereClause();
      return new IGRPOrderByQuery<>(this, order, attribute);
   }

   public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String... columns) {
      this.applyWhereClause();
      return new IGRPOrderByQuery<>(this, order, columns);
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

   @Override
   public long count() {
      this.applyWhereClause();
      return super.count();
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Date... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Date... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Double... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Double... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Float... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Float... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Integer... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Integer... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Long... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Long... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, Short... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, Short... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, String... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, String... values) {
      return this.internalNotIn(attribute, values);
   }

   @Override
   public IGRPWhereQuery<E> in(String attribute, UUID... values) {
      return this.internalIn(attribute, values);
   }

   public IGRPWhereQuery<E> notIn(String attribute, UUID... values) {
      return this.internalNotIn(attribute, values);
   }

   @SafeVarargs
   @Override
   public final <V> IGRPWhereQuery<E> inIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      return validateExpression.test(values) ? in(attribute, values) : this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPWhereQuery<E> notInIf(SingularAttribute<E, V> attribute, Predicate<V[]> validateExpression, V... values) {
      return validateExpression.test(values) ? notIn(attribute, values) : this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPWhereQuery<E> notIn(SingularAttribute<E, V> attribute, V... values) {
      final javax.persistence.criteria.Predicate notInClause = this.getCriteriaBuilder().in(this.getRoot().get(attribute)).not();
      notInClause.in(Arrays.asList(values));
      this.addPredicate(notInClause);
      return this;
   }

   @SafeVarargs
   @Override
   public final <V> IGRPWhereQuery<E> in(SingularAttribute<E, V> attribute, V... values) {
      final In<V> inClause = this.getCriteriaBuilder().in(this.getRoot().get(attribute));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   private <V> IGRPWhereQuery<E> internalIn(String attribute, V[] values) {
      final In<V> inClause = this.getCriteriaBuilder().in(this.getRoot().get(attribute));
      Arrays.asList(values).forEach(inClause::value);
      this.addPredicate(inClause);
      return this;
   }

   private <V> IGRPWhereQuery<E> internalNotIn(String attribute, V[] values) {
      final javax.persistence.criteria.Predicate notInClause = this.getCriteriaBuilder().not(this.getRoot().get(attribute).in(Arrays.asList(values)));
      this.addPredicate(notInClause.not());
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Date from, Date to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Double from, Double to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Float from, Float to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Integer from, Integer to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Long from, Long to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, Short from, Short to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, LocalDate from, LocalDate to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> between(String attribute, LocalDateTime from, LocalDateTime to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> between(SingularAttribute<E, V> attribute, V from, V to) {
      this.addPredicate(this.getCriteriaBuilder().between(this.getRoot().get(attribute), from, to));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> betweenIf(SingularAttribute<E, V> attribute, V from, V to, BiPredicate<V, V> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Date from, Date to, BiPredicate<Date, Date> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Double from, Double to, BiPredicate<Double, Double> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Float from, Float to, BiPredicate<Float, Float> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Integer from, Integer to, BiPredicate<Integer, Integer> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Long from, Long to, BiPredicate<Long, Long> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, Short from, Short to, BiPredicate<Short, Short> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, LocalDate from, LocalDate to, BiPredicate<LocalDate, LocalDate> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> betweenIf(String attribute, LocalDateTime from, LocalDateTime to, BiPredicate<LocalDateTime, LocalDateTime> validateExpression) {
      return validateExpression.test(from, to) ? this.between(attribute, from, to) : this;
   }

   @Override
   public IGRPWhereQuery<E> contains(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> containsIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.contains(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> contains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getCriteriaBuilder().lower(this.getRoot().get(attribute)), '%' + value.toLowerCase() + '%'));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> containsIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.contains(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> notContains(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), "%" + value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notContainsIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notContains(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> notContains(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), '%' + value + '%'));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notContainsIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notContains(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> beginsWith(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), "%" + value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> beginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), "%" + value));
      return this;
   }


   @Override
   public IGRPWhereQuery<E> beginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.beginsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> beginsWithIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.beginsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> notBeginsWith(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), "%" + value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notBeginsWithIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notBeginsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> notBeginsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), "%" + value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notBeginsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notBeginsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> endsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> endsWith(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().like(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> endsWithIf(SingularAttribute<E, String> attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.endsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> endsWithIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.endsWith(attribute, value) : this;
   }


   @Override
   public IGRPWhereQuery<E> notEndsWith(String attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notEndsWithIf(String attribute, String value, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notEndsWith(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> notEndsWith(SingularAttribute<E, String> attribute, String value) {
      this.addPredicate(this.getCriteriaBuilder().notLike(this.getRoot().get(attribute), value + "%"));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notEndsWithIf(SingularAttribute<E, String> attribute, String value,
                                          Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.notEndsWith(attribute, value) : this;
   }

   private <V> IGRPWhereQuery<E> internalEqualTo(String attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Boolean value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Byte value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, byte[] value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Integer value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Long value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Double value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Float value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, Short value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, String value) {
      return this.internalEqualTo(attribute, value);
   }

   public <V> IGRPWhereQuery<E> equalTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> equalTo(String attribute, UUID value) {
      return this.internalEqualTo(attribute, value);
   }

   @Override
   public <V> IGRPWhereQuery<E> equalToIfOrDefault(SingularAttribute<E, V> attribute, V value, V defaultValue, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Boolean value, Boolean defaultValue,
                                               Predicate<Boolean> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Byte value, Byte defaultValue,
                                               Predicate<Byte> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, byte[] value, byte[] defaultValue,
                                               Predicate<byte[]> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Double value, Double defaultValue,
                                               Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Float value, Float defaultValue,
                                               Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Integer value, Integer defaultValue, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Long value, Long defaultValue, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, Short value, Short defaultValue, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, String value, String defaultValue, Predicate<String> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   @Override
   public IGRPWhereQuery<E> equalToIfOrDefault(String attribute, UUID value, UUID defaultValue, Predicate<UUID> validateExpression) {
      return validateExpression.test(value) ? this.equalTo(attribute, value) : this.equalTo(attribute, defaultValue);
   }

   private <V> IGRPWhereQuery<E> internalEqualToIf(String attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().equal(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Byte value, Predicate<Byte> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, String value, Predicate<String> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> equalToIf(String attribute, UUID value, Predicate<UUID> validateExpression) {
      return this.internalEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public <V> IGRPWhereQuery<E> equalToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.equalTo(attribute, value);
      return this;
   }

   private <V> IGRPWhereQuery<E> internalNotEqualTo(String attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V> IGRPWhereQuery<E> notEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V> IGRPWhereQuery<E> notEqualToIf(SingularAttribute<E, V> attribute, V value,
                                             Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.notEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Boolean value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Byte value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, byte[] value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Date value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Double value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Float value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Integer value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Long value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, Short value) {
      return this.internalNotEqualTo(attribute, value);
   }

   @Override
   public IGRPWhereQuery<E> notEqualTo(String attribute, String value) {
      return this.internalNotEqualTo(attribute, value);
   }


   /**
    *
    */
   private <V> IGRPWhereQuery<E> internalNotEqualToIf(String attribute, V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.addPredicate(this.getCriteriaBuilder().notEqual(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Boolean value, Predicate<Boolean> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Byte value, Predicate<Byte> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Date value, Predicate<Date> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, String value, Predicate<String> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> notEqualToIf(String attribute, byte[] value, Predicate<byte[]> validateExpression) {
      return this.internalNotEqualToIf(attribute, value, validateExpression);
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThan(String attribute, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> lessThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> lessThanIf(SingularAttribute<E, V> attribute, V value,
                                                                         Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.greaterThan(attribute, value);
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> lessThanOrEqualTo(SingularAttribute<E, V> attribute,
                                                                                V value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }


   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> lessThanOrEqualToIf(SingularAttribute<E, V> attribute,
                                                                                  V value, Predicate<V> validateExpression) {
      if (validateExpression.test(value))
         this.lessThanOrEqualTo(attribute, value);
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Date value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Double value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Float value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Long value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualTo(String attribute, Short value) {
      this.addPredicate(this.getCriteriaBuilder().lessThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> greaterThan(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThan(String attribute, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThan(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Date value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Double value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Float value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Integer value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Long value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualTo(String attribute, Short value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   public <V extends Comparable<? super V>> IGRPWhereQuery<E> greaterThanOrEqualTo(SingularAttribute<E, V> attribute, V value) {
      this.addPredicate(this.getCriteriaBuilder().greaterThanOrEqualTo(this.getRoot().get(attribute), value));
      return this;
   }

   public <V extends Comparable<? super V>> IGRPWhereQuery<E> greaterThanOrEqualToIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public <V extends Comparable<? super V>> IGRPWhereQuery<E> greaterThanIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Date value, Predicate<Date> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.greaterThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Date value, Predicate<Date> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }


   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }


   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }


   @Override
   public IGRPWhereQuery<E> greaterThanOrEqualToIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.greaterThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> isNullIf(String attribute, boolean condition) {
      return condition ? isNull(attribute) : this;
   }

   @Override
   public IGRPWhereQuery<E> isNull(String attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public <V> IGRPWhereQuery<E> isNotNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public <V> IGRPWhereQuery<E> isNotNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      return condition ? isNotNull(attribute) : this;
   }

   @Override
   public IGRPWhereQuery<E> isNotNullIf(String attribute, boolean condition) {
      return condition ? isNotNull(attribute) : this;
   }

   @Override
   public IGRPWhereQuery<E> isNotNull(String attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNotNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public <V> IGRPWhereQuery<E> isNullIf(SingularAttribute<E, V> attribute, boolean condition) {
      return condition ? isNull(attribute) : this;
   }

   @Override
   public <V> IGRPWhereQuery<E> isNull(SingularAttribute<E, V> attribute) {
      this.addPredicate(this.getCriteriaBuilder().isNull(this.getRoot().get(attribute)));
      return this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Date value, Predicate<Date> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.lessThan(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Date value, Predicate<Date> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Double value, Predicate<Double> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Float value, Predicate<Float> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Integer value, Predicate<Integer> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Long value, Predicate<Long> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }

   @Override
   public IGRPWhereQuery<E> lessThanOrEqualToIf(String attribute, Short value, Predicate<Short> validateExpression) {
      return validateExpression.test(value) ? this.lessThanOrEqualTo(attribute, value) : this;
   }
}
