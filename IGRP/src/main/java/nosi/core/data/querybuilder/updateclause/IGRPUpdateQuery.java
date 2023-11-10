package nosi.core.data.querybuilder.updateclause;

import nosi.core.data.querybuilder.base.IGRPUpdateQueryBase;
import nosi.core.data.querybuilder.whereclause.IGRPUpdateWhereQuery;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;
import java.util.function.Predicate;

/**
 * william.fonseca
 * 04/11/2023
 */
public class IGRPUpdateQuery<E> extends IGRPUpdateQueryBase<E> implements IIGRPUpdateQuery<E> {

   public IGRPUpdateQuery(Session session, Class<E> clazz, CriteriaUpdate<E> criteriaUpdate, Root<E> root) {
      super(session, clazz, criteriaUpdate, root);
   }

   @Override
   public <V> IGRPUpdateQuery<E> setIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression) {
      return validateExpression.test(value) ? this.set(attribute, value) : this;
   }

   @Override
   public <V> IGRPUpdateQuery<E> set(SingularAttribute<E, V> attribute, V value) {
      this.getCriteriaUpdateQuery().set(this.getRoot().get(attribute), value);
      return this;
   }

   @Override
   public IGRPUpdateQuery<E> setIf(String attribute, Object value, Predicate<Object> validateExpression) {
      return validateExpression.test(value) ? this.set(attribute, value) : this;
   }

   @Override
   public IGRPUpdateQuery<E> set(String attribute, Object value) {
      this.getCriteriaUpdateQuery().set(this.getRoot().get(attribute), value);
      return this;
   }

   @Override
   public IGRPUpdateWhereQuery<E> where() {
      return new IGRPUpdateWhereQuery<>(this);
   }
}
