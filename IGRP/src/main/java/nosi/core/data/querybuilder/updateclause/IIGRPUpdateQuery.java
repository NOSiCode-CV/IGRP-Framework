package nosi.core.data.querybuilder.updateclause;

import nosi.core.data.querybuilder.whereclause.IGRPUpdateWhereQuery;

import javax.persistence.metamodel.SingularAttribute;

public interface IIGRPUpdateQuery<E> {

   <V> IIGRPUpdateQuery<E> set(SingularAttribute<E, V> attribute, V value);

   IIGRPUpdateQuery<E> set(String attributeName, Object value);

   IGRPUpdateWhereQuery<E> where();
}
