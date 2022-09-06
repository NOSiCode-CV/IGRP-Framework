package nosi.core.data.querybuilder.base;

import nosi.core.data.querybuilder.interfaces.IIGRPQuery;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPQueryBase<E> implements IIGRPQuery<E> {

    private Session session;
    private final CriteriaQuery<E> criteriaQuery;
    private final Root<E> root;
    private final Class<E> clazz;

    public IGRPQueryBase(Session session, Class<E> clazz, CriteriaQuery<E> criteriaQuery, Root<E> root) {
        super();
        this.session = session;
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
