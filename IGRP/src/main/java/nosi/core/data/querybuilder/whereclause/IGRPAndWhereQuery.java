package nosi.core.data.querybuilder.whereclause;

import javax.persistence.criteria.Predicate;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPAndWhereQuery<E> extends IGRPSubWhereQuery<E> {

	public IGRPAndWhereQuery(IGRPWhereQuery<E> parent) {
		super(parent);
	}

	@Override
	public IGRPWhereQuery<E> end() {
		final Predicate[] predicates = this.getPredicates().toArray(new Predicate[0]);
		final Predicate and = this.parent.getCriteriaBuilder().and(predicates);
		this.parent.addPredicate(and);
		return this.parent;
	}

}
