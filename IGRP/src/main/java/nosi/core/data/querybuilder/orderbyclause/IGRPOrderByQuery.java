package nosi.core.data.querybuilder.orderbyclause;

import nosi.core.data.querybuilder.base.IGRPQueryBase;
import nosi.core.data.querybuilder.selectclause.IGRPSelectQuery;

import javax.persistence.metamodel.SingularAttribute;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPOrderByQuery<E> extends IGRPSelectQuery<E> {

    public enum Order {ASC, DESC}

    private final IGRPQueryBase<E> parent;

    private IGRPOrderByQuery(IGRPQueryBase<E> parent) {
        super(parent.getSession(), parent.getClazz(), parent.getCriteriaQuery(), parent.getRoot());
        this.parent = parent;
    }

    public IGRPOrderByQuery(IGRPQueryBase<E> parent, Order order, String column) {
        this(parent);
        if (order == Order.ASC)
            this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().asc(this.getRoot().get(column)));
        else
            this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().desc(this.getRoot().get(column)));
    }

    public <V> IGRPOrderByQuery(IGRPQueryBase<E> parent, Order order, SingularAttribute<E, V> attribute) {
        this(parent);
        if (order == Order.ASC)
            this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().asc(this.getRoot().get(attribute)));
        else
            this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().desc(this.getRoot().get(attribute)));
    }


    public IGRPOrderByQuery(IGRPQueryBase<E> parent, Order order, String... columns) {
        this(parent);
        if (order == Order.ASC) {
            for (String c : columns) {
                this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().asc(this.getRoot().get(c)));
            }
        } else {
            for (String c : columns) {
                this.getCriteriaQuery().orderBy(this.getCriteriaBuilder().desc(this.getRoot().get(c)));
            }
        }
    }

}
