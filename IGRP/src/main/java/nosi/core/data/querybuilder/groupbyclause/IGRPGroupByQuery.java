package nosi.core.data.querybuilder.groupbyclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPGroupByQuery<E> extends IGRPSelectQuery<E> {

	private IGRPQueryBase<E> parent;
	
	public IGRPGroupByQuery(IGRPQueryBase<E> parent, String column) {
		super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
		this.parent = parent;
		
		this.getCriteriaQuery().groupBy(this.getRoot().get(column));
	}
	
	
	public IGRPGroupByQuery(IGRPQueryBase<E> parent, String... columns) {
		super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
		this.parent = parent;
		
		for(String c : columns) {
			this.getCriteriaQuery().groupBy(this.getRoot().get(c));
		}
	}
	

	public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String column) {
		return new IGRPOrderByQuery<E>(this, order, column);
	}
	
	public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String... columns) {
		return new IGRPOrderByQuery<E>(this, order, columns);
	}

}
