package nosi.core.data.querybuilder.orderbyclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPOrderByQuery<E> extends IGRPSelectQuery<E> {
	
	public static enum Order{ ASC, DESC }
	private IGRPQueryBase<E> parent;
	
	
	public IGRPOrderByQuery(IGRPQueryBase<E> parent, Order order, String column) {
		super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
		this.parent = parent;
		
		if( order == Order.ASC)
			this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().asc(this.getRoot().get(column)));
		else
			this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().desc(this.getRoot().get(column)));
	}
	
	
	
	public IGRPOrderByQuery(IGRPQueryBase<E> parent, Order order, String... columns) {
		super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
		this.parent = parent;
		
		if( order == Order.ASC) {
			for( String c: columns) {
				this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().asc( this.getRoot().get(c)));
			}
		}
		else {
			for( String c: columns) {
				this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().desc( this.getRoot().get(c)));
			}
		}
	}
	
}
