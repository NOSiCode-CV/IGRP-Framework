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
		Predicate[] predicates = this.getPredicates().stream().toArray(Predicate[]::new);
		Predicate and = this.parent.getCriteriaBuilder().and(predicates);
		this.parent.addPredicate(and);
		return this.parent;
	}

}
