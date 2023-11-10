package nosi.core.data.querybuilder.updateclause;

import nosi.core.data.querybuilder.whereclause.IGRPUpdateWhereQuery;

import javax.persistence.metamodel.SingularAttribute;
import java.util.function.Predicate;

public interface IIGRPUpdateQuery<E> {

   <V> IIGRPUpdateQuery<E> setIf(SingularAttribute<E, V> attribute, V value, Predicate<V> validateExpression);

   <V> IIGRPUpdateQuery<E> set(SingularAttribute<E, V> attribute, V value);

   IIGRPUpdateQuery<E> setIf(String attributeName, Object value, Predicate<Object> validateExpression);

   IIGRPUpdateQuery<E> set(String attributeName, Object value);

   IGRPUpdateWhereQuery<E> where();
}
