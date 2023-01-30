package nosi.core.data.querybuilder.selectclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.interfaces.IIGRPSelectQuery;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

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
        return this.getQuery().getResultList();
    }

    @Override
    public List<E> all(int maxResults) {
        final Query<E> query = this.getSession().createQuery(this.getCriteriaQuery()).setMaxResults(maxResults);
        return query.getResultList();
    }

    @Override
    public List<E> all(int maxResults, int offSet) {
        final Query<E> query = this.getQuery().setMaxResults(maxResults).setFirstResult(offSet);
        return query.getResultList();
    }

    /**
     * @return {@code true} if finds one or more results, {@code false} otherwise
     * */
    @Override
    public boolean anyMatch() {
        try {
            this.one();
            return true;
        } catch (NoResultException e) {
            return false;
        } catch (NonUniqueResultException e) {
            return true;
        }
    }

    @Override
    public E one() {
        return this.getQuery().getSingleResult();
    }

    @Override
    public long count() {
        return this.getQuery().getResultList().size();
    }

    @Override
    public String sql() {
        final Query<E> query = this.getQuery();
        return query.unwrap(org.hibernate.query.Query.class).getQueryString();
    }

    private Query<E> getQuery() {
        return this.getSession().createQuery(this.getCriteriaQuery());
    }

}
