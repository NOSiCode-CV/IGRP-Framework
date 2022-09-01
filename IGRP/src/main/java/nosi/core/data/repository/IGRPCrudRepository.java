package nosi.core.data.repository;

import nosi.core.data.querybuilder.IGRPQuery;
import org.hibernate.Session;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.beans.Transient;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Optional;

/**
 * Augusto Correia 30/09/2020
 */
public abstract class IGRPCrudRepository<T, ID extends Serializable> implements IIGRPCrudRepository<T, ID> {

    private final Class<T> clazz;
    private final Session session;

    protected IGRPCrudRepository(Session session) {
        super();
        this.session = session;
        this.clazz = this.getClassType();
    }

    @Override
    public long count() {
        final CriteriaBuilder criteriaBuilder = this.session.getCriteriaBuilder();
        final CriteriaQuery<Long> count = criteriaBuilder.createQuery(Long.class);
        final Root<T> root = count.from(this.clazz);
        count.select(criteriaBuilder.count(root));
        return this.session.createQuery(count).getSingleResult();
    }

    @Override
    public void delete(T entity) {
        this.session.delete(entity);
    }

    @Override
    public void deleteAll() {
        final CriteriaBuilder criteriaBuilder = this.session.getCriteriaBuilder();
        final CriteriaDelete<T> deleteAll = criteriaBuilder.createCriteriaDelete(this.clazz);
        deleteAll.from(this.clazz);
        this.session.createQuery(deleteAll).executeUpdate();
    }

    @Override
    public void deleteAll(Iterable<? extends T> entities) {
        final CriteriaBuilder criteriaBuilder = this.session.getCriteriaBuilder();
        final CriteriaDelete<T> deleteAll = criteriaBuilder.createCriteriaDelete(this.clazz);
        final Root<T> root = deleteAll.from(this.clazz);
        deleteAll.where(root.in(entities));
        this.session.createQuery(deleteAll).executeUpdate();
    }

    @Override
    public void deleteById(ID id) {

        final Optional<T> entityOp = this.findById(id);
        if (!entityOp.isPresent())
            return;

        this.delete(entityOp.get());
    }

    @Override
    public void deleteById(Iterable<ID> ids) {
        for (ID id : ids)
            this.deleteById(id);
    }

    @Override
    public boolean existsById(ID id) {
        return this.findById(id).isPresent();
    }

    @Override
    public Iterable<T> findAll() {
        CriteriaBuilder criteriaBuilder = this.session.getCriteriaBuilder();
        CriteriaQuery<T> criteriaQuery = criteriaBuilder.createQuery(this.clazz);
        Root<T> root = criteriaQuery.from(this.clazz);
        criteriaQuery.select(root);
        TypedQuery<T> query = this.session.createQuery(criteriaQuery);
        return query.getResultList();
    }

    @Override
    public Optional<T> findById(ID id) {
        final T entity = this.session.get(this.clazz, id);
        return Optional.ofNullable(entity);
    }

    @SuppressWarnings("unchecked")
    @Transient
    protected Class<T> getClassType() {
        final ParameterizedType genericType = (ParameterizedType) this.getClass().getGenericSuperclass();
        return (Class<T>) genericType.getActualTypeArguments()[0];
    }

    @Override
    public IGRPQuery<T> query() {
        final CriteriaQuery<T> criteriaQuery = this.session.getCriteriaBuilder().createQuery(this.clazz);
        final Root<T> root = criteriaQuery.from(this.clazz);
        return new IGRPQuery<>(this.session, this.clazz, criteriaQuery, root);
    }

    @Override
    public <S extends T> S save(S entity) {
        this.session.persist(entity);
        return entity;
    }

    @Override
    public <S extends T> Iterable<S> saveAll(Iterable<S> entities) {
        entities.forEach(this::save);
        return entities;
    }
}
