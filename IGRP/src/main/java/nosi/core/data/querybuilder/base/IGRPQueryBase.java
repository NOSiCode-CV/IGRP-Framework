package nosi.core.data.querybuilder.base;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;

import nosi.core.data.querybuilder.interfaces.IIGRPQuery;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPQueryBase<E> implements IIGRPQuery<E> {
	
	private Session session;
	private CriteriaQuery<E> criteriaQuery;
	private Root<E> root;
	private Class<E> clazz;

	public IGRPQueryBase(Session session,Class<E> clazz, CriteriaQuery<E> criteriaQuery, Root<E> root) {
        super();
		this.session=session;
        this.criteriaQuery = criteriaQuery;
        this.root = root;
        this.clazz = clazz;
	}
	
	
	public Session getSession() {
		return this.session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public CriteriaBuilder getCriteriaBuilder() {
		return this.session.getCriteriaBuilder();
	}

	public CriteriaQuery<E> getCriteriaQuery() {
		return this.criteriaQuery;
	}

	public Root<E> getRoot() {
		return this.root;
	}

	public Class<E> getClazz() {
		return this.clazz;
	}

}
