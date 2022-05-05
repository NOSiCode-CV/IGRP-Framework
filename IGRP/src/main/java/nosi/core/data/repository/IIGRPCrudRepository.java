package nosi.core.data.repository;

import java.io.Serializable;
import java.util.Optional;
import org.hibernate.Transaction;
import nosi.core.data.querybuilder.IGRPQuery;

/**
 * Interface for generic CRUD operations on a repository for a specific type.
 *
 * @author Augusto Correia
 * @author Brocy Centeio
 */
public interface IIGRPCrudRepository<T, ID extends Serializable> extends IIGRPRepository<T, ID> {

	/**
	 * Returns all instances of the type.
	 *
	 * @return all entities
	 */
	Iterable<T> findAll();

	/**
	 * Retrieves an entity by its id.
	 *
	 * @param id must not be {@literal null}.
	 * @return the entity with the given id or {@literal Optional#empty()} if none
	 *         found.
	 * @throws IllegalArgumentException if {@literal id} is {@literal null}.
	 */
	Optional<T> findById(ID id);

	/**
	 * Returns IgrpQueryble instance of the type.
	 *
	 * @return IgrpQuery
	 */
	IGRPQuery<T> query();

	/**
	 * Returns whether an entity with the given id exists.
	 *
	 * @param id must not be {@literal null}.
	 * @return {@literal true} if an entity with the given id exists,
	 *         {@literal false} otherwise.
	 * @throws IllegalArgumentException if {@literal id} is {@literal null}.
	 */
	boolean existsById(ID id);

	/**
	 * Returns the number of entities available.
	 *
	 * @return the number of entities.
	 */
	long count();

	/**
	 * Saves a given entity. Use the returned instance for further operations as the
	 * save operation might have changed the entity instance completely.
	 *
	 * @param entity must not be {@literal null}.
	 * @return the saved entity; will never be {@literal null}.
	 * @throws IllegalArgumentException in case the given {@literal entity} is
	 *                                  {@literal null}.
	 */
	<S extends T> S save(S entity);

	/**
	 * Saves all given entities.
	 *
	 * @param entities must not be {@literal null} nor must it contain
	 *                 {@literal null}.
	 * @return the saved entities; will never be {@literal null}. The returned
	 *         {@literal Iterable} will have the same size as the
	 *         {@literal Iterable} passed as an argument.
	 * @throws IllegalArgumentException in case the given {@link Iterable entities}
	 *                                  or one of its entities is {@literal null}.
	 */
	<S extends T> Iterable<S> saveAll(Iterable<S> entities);

	/**
	 * Deletes the entity with the given id.
	 *
	 * @param id must not be {@literal null}.
	 * @throws Exception
	 * @throws IllegalArgumentException in case the given {@literal id} is
	 *                                  {@literal null}
	 */
	void deleteById(ID id);

	/**
	 * Deletes the entity with the given id.
	 *
	 * @param ids must not be {@literal null}.
	 * @throws Exception
	 * @throws IllegalArgumentException in case the given {@literal id} is
	 *                                  {@literal null}
	 */
	void deleteById(Iterable<ID> ids);

	/**
	 * Deletes a given entity.
	 *
	 * @param entity must not be {@literal null}.
	 * @throws IllegalArgumentException in case the given entity is {@literal null}.
	 */
	void delete(T entity);

	/**
	 * Deletes the given entities.
	 *
	 * @param entities must not be {@literal null}. Must not contain {@literal null}
	 *                 elements
	 * @throws Exception
	 * @throws IllegalArgumentException in case the given {@literal entities} or one
	 *                                  of its entities is {@literal null}.
	 */
	void deleteAll(Iterable<? extends T> entities);


	/**
	 * Deletes all entities managed by the repository.
	 */
	void deleteAll();

}
