package nosi.core.data.querybuilder.groupbyclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.orderbyclause.IGRPOrderByQuery;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

import javax.persistence.metamodel.SingularAttribute;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPGroupByQuery<E> extends IGRPSelectQuery<E> {

    private final IGRPQueryBase<E> parent;

    private IGRPGroupByQuery(IGRPQueryBase<E> parent) {
        super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
        this.parent = parent;
    }

    public IGRPGroupByQuery(IGRPQueryBase<E> parent, String column) {
        this(parent);
        this.getCriteriaQuery().groupBy(this.getRoot().get(column));
    }

    public <V> IGRPGroupByQuery(IGRPQueryBase<E> parent, SingularAttribute<E, V> attribute) {
        this(parent);
        this.getCriteriaQuery().groupBy(this.getRoot().get(attribute));
    }


    public IGRPGroupByQuery(IGRPQueryBase<E> parent, String... columns) {
        super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
        this.parent = parent;

        for (String c : columns)
            this.getCriteriaQuery().groupBy(this.getRoot().get(c));
    }

    public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String column) {
        return new IGRPOrderByQuery<>(this, order, column);
    }

    public <V> IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, SingularAttribute<E, V> attribute) {
        return new IGRPOrderByQuery<>(this, order, attribute);
    }

    public IGRPOrderByQuery<E> orderBy(IGRPOrderByQuery.Order order, String... columns) {
        return new IGRPOrderByQuery<>(this, order, columns);
    }

}
