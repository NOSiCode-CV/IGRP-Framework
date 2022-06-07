package nosi.core.data.repository;

import java.beans.Transient;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;

import nosi.core.data.querybuilder.IGRPQuery;

/**
 * Augusto Correia 30/09/2020
 */
public abstract class IGRPCrudRepository<T, ID extends Serializable> implements IIGRPCrudRepository<T, ID> {

	private Class<T> clazz;
	public Session session;

	public IGRPCrudRepository(Session session) {
		super();
		this.session = session;
		this.clazz = this.getClassType();
	}

	@Override
	public Iterable<T> findAll() {

		Transaction transaction = this.session.getTransaction();

		List<T> list = new ArrayList<>();

		if (!transaction.isActive())
			transaction.begin();

		CriteriaBuilder cb = this.session.getCriteriaBuilder();
		CriteriaQuery<T> cq = cb.createQuery(this.clazz);
		Root<T> rootEntry = cq.from(this.clazz);
		CriteriaQuery<T> all = cq.select(rootEntry);

		TypedQuery<T> allQuery = this.session.createQuery(all);
		list = allQuery.getResultList();

		return list;
	}

	@Override
	public Optional<T> findById(ID id) {
		Transaction transaction = this.session.getTransaction();

		T entity = null;

		if (!transaction.isActive())
			transaction.begin();

		entity = this.session.get(this.clazz, id);

		return Optional.ofNullable(entity);
	}

	@Override
	public IGRPQuery<T> query() {
		CriteriaQuery<T> criteriaQuery = this.session.getCriteriaBuilder().createQuery(this.clazz);
		Root<T> root = criteriaQuery.from(this.clazz);
		return new IGRPQuery<T>(this.session, this.clazz, criteriaQuery, root);
	}

	@Override
	public boolean existsById(ID id) {

		return false;
	}

	@Override
	public long count() {
		return 0;
	}

	@Override
	public <S extends T> S save(S entity) {
		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		this.session.persist(entity);

		return entity;
	}

	@Override
	public <S extends T> Iterable<S> saveAll(Iterable<S> entities) {
		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		for (T o : entities)
			this.save(o);

		return entities;

	}

	@Override // -------------------
	public void deleteById(ID id) {

		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		Optional<T> entityOp = this.findById(id);
		if (!entityOp.isPresent())
			return;

		this.delete(entityOp.get());

	}

	@Override
	public void deleteById(Iterable<ID> ids) {

		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		for (ID id : ids) {
			this.deleteById(id);
		}
	}

	@Override
	public void delete(T entity) {

		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		this.session.delete(entity);

	}

	@Override // -----------------
	public void deleteAll(Iterable<? extends T> entities) {

		Transaction transaction = this.session.getTransaction();

		if (!transaction.isActive())
			transaction.begin();

		for (T entity : entities)
			this.session.delete(entity);

	}

	@Override // --------------------------
	public void deleteAll() {
		// EntityManager entityManager = null;
		// CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	}

	@SuppressWarnings("unchecked")
	@Transient
	protected Class<T> getClassType() {
		ParameterizedType genericType = (ParameterizedType) this.getClass().getGenericSuperclass();
		return (Class<T>) genericType.getActualTypeArguments()[0];
	}

}
