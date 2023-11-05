package nosi.core.data.querybuilder.joinclause;

import nosi.core.data.querybuilder.whereclause.IGRPWhereQuery;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import java.util.Objects;
import java.util.function.Consumer;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPJoinWhereQuery<E> extends IGRPJoinSubWhereQuery<E> {

   public IGRPJoinWhereQuery(IGRPWhereQuery<E> parent, Join<Object, Object> join) {
      super(parent, join);
   }

   @Override
   public IGRPWhereQuery<E> end() {
      final Predicate[] predicates = this.getPredicates().toArray(new Predicate[0]);
      final Predicate and = this.parent.getCriteriaBuilder().and(predicates);
      this.parent.addPredicate(and);
      return this.parent;
   }

}
