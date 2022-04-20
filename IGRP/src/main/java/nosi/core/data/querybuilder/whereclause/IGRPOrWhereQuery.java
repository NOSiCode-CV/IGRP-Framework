package nosi.core.data.querybuilder.whereclause;

import javax.persistence.criteria.Predicate;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPOrWhereQuery<E> extends IGRPSubWhereQuery<E> {

	public IGRPOrWhereQuery(IGRPWhereQuery<E> parent) {
		super(parent);
	}

	@Override
	public IGRPWhereQuery<E> end() {
		Predicate[] predicates = this.getPredicates().stream().toArray(Predicate[]::new);
		Predicate or = this.parent.getCriteriaBuilder().or(predicates);
		this.parent.addPredicate(or);
		return this.parent;
	}
}
