package nosi.core.data.querybuilder;

import nosi.core.data.querybuilder.groupbyclause.IGRPGroupByQuery;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;
import nosi.core.data.querybuilder.whereclause.IGRPWhereQuery;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.SingularAttribute;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPQuery<E> extends IGRPSelectQuery<E> {

    public IGRPQuery(Session session, Class<E> clazz, CriteriaQuery<E> criteriaQuery, Root<E> root) {
        super(session, clazz, criteriaQuery, root);
    }

    public IGRPWhereQuery<E> where() {
        return new IGRPWhereQuery<>(this);
    }

    public IGRPGroupByQuery<E> groupBy(String column) {
        return new IGRPGroupByQuery<>(this, column);
    }

    public <V> IGRPGroupByQuery<E> groupBy(SingularAttribute<E, V> attribute) {
        return new IGRPGroupByQuery<>(this, attribute);
    }

    public IGRPGroupByQuery<E> groupBy(String... columns) {
        return new IGRPGroupByQuery<>(this, columns);
    }

    public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String column) {
        return new IGRPOrderByQuery<>(this, order, column);
    }

    public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String... columns) {
        return new IGRPOrderByQuery<>(this, order, columns);
    }

}