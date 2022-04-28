package nosi.core.data.querybuilder;

import org.hibernate.Session;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import nosi.core.data.querybuilder.groupbyclause.IGRPGroupByQuery;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;
import nosi.core.data.querybuilder.whereclause.IGRPWhereQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPQuery<E> extends IGRPSelectQuery<E> {

	public IGRPQuery(Session session, Class<E> clazz, CriteriaQuery<E> criteriaQuery, Root<E> root) {
		super(session, clazz, criteriaQuery, root);
	}
	
		public IGRPWhereQuery<E> where(){
		return new IGRPWhereQuery<E>(this);
	}
	
	public IGRPGroupByQuery<E> groupBy(String column) {
		return new IGRPGroupByQuery<E>(this, column);
	}
	
	public IGRPGroupByQuery<E> groupBy(String... columns) {
		return new IGRPGroupByQuery<E>(this, columns);
	}
	
	public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String column) {
		return new IGRPOrderByQuery<E>(this, order, column);
	}
	
	public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String... columns) {
		return new IGRPOrderByQuery<E>(this, order, columns);
	}
	
}