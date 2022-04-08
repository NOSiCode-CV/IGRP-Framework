package nosi.core.data.querybuilder.selectclause;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.interfaces.IIGRPSelectQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPSelectQuery<E> extends IGRPQueryBase<E> implements IIGRPSelectQuery<E> {

	public IGRPSelectQuery(Session session, Class<E> clazz, CriteriaQuery<E> criteriaQuery, Root<E> root) {
		super(session, clazz, criteriaQuery, root);
	}
	
	@Override
	public List<E> all() {
		TypedQuery<E> query = this.getSession().createQuery(this.getCriteriaQuery());
		//TODO REMOVER
		String sql = query.unwrap(org.hibernate.Query.class).getQueryString();
		System.out.println("sql: "+sql);;
        return query.getResultList();
	}

	@Override
	public E one() {
		TypedQuery<E> query = this.getSession().createQuery(this.getCriteriaQuery());
        return query.getSingleResult();
	}

	@Override
	public String sql() {
		TypedQuery<E> query = this.getSession().createQuery(this.getCriteriaQuery());
		String sql = query.unwrap(org.hibernate.Query.class).getQueryString();
		return sql;
	}


}
