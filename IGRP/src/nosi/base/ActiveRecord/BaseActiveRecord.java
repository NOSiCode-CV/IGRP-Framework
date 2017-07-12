package nosi.base.ActiveRecord;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class BaseActiveRecord <T> implements ActiveRecordIterface<T>{
	
	protected EntityManagerFactory entityManagerFactory;
	private T className;
	private CriteriaBuilder builder = null;
	private CriteriaQuery<T> criteria = null;
	private Root<T> root = null;
	private List<Predicate> predicates = new ArrayList<Predicate>();
	@SuppressWarnings("unchecked")
	public BaseActiveRecord() {
		this.className = (T) this;
		this.entityManagerFactory = PersistenceUtils.ENTITY_MANAGER_FACTORY.get(this.getConnectionName());
	}
	
	/*Inserted data into database
	 * 
	 * @see com.hib.base.ActiveRecordIterface#insert()
	 */
	
	@Override
	public T insert() {		
		EntityManager manager = null;
		EntityTransaction transaction = null;
		try{
			manager = this.entityManagerFactory.createEntityManager();
			transaction = manager.getTransaction();
			transaction.begin();
			manager.persist(this.className);
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
		} finally {
		   manager.close();
		}
		this.resetCriteria();
		return this.findOne(this.getValuePrimaryKey());
	}
	
	/*Update data into database
	 * 
	 * @see com.hib.base.ActiveRecordIterface#update()
	 */
	@Override
	public T update() {		
		EntityManager manager = null;
		EntityTransaction transaction = null;
		try{
			manager = this.entityManagerFactory.createEntityManager();
			transaction = manager.getTransaction();
			transaction.begin();
			manager.merge(this.className);
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
		   manager.close();
		}
		this.resetCriteria();
		return this.findOne(this.getValuePrimaryKey());
	}
	
	/*Deleted data with id parameter
	 * 
	 * @see com.hib.base.ActiveRecordIterface#delete(java.lang.Object)
	 * Example: Student st = new Student();
	 * 			st.delete(1);
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(Object id) {
		EntityManager manager = null;
		EntityTransaction transaction = null;
		boolean deleted = false;
		
		try{
			manager = this.entityManagerFactory.createEntityManager();
			transaction = manager.getTransaction();
			transaction.begin();
			this.className = (T) manager.find(this.className.getClass(),id);
			manager.remove(this.className);
			transaction.commit();
			deleted = true;
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	          deleted = false;
	      }
	      e.printStackTrace();
		} finally {
		   manager.close();
		}
		this.resetCriteria();
		return deleted;
	}

	/*Deleted data with primary key detected
	 * 
	 * @see com.hib.base.ActiveRecordIterface#delete()
	 * Example: Student st = new Student();
	 * 			st.setId(1);
	 * 			st.delete();
	 */
	@Override
	public boolean delete() {
		return this.delete(this.getValuePrimaryKey());
	}

	/* Connection name for Database, default value is h2
	 * 
	 * @see com.hib.base.ActiveRecordIterface#getConnectionName()
	 */
	@Override
	public String getConnectionName() {
		return "h2";
	}

	/*Get table name of Entity class
	 * 
	 */
	public String getTable(){
		for(Annotation a:this.getClass().getAnnotations()){
			if(a.annotationType().getSimpleName().equals("Table")){
				for(Method method:a.annotationType().getDeclaredMethods()){
					try {
						return (method.invoke(a,(Object[])null)).toString();
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						return this.getClass().getSimpleName();
					}
				}
			}
		}
		return this.getClass().getSimpleName();
	}


	/*Get value of primary key of Entity class
	 * 
	 * @see com.hib.base.ActiveRecordIterface#getValuePrimaryKey()
	 */
	@Override
	public Object getValuePrimaryKey() {		
		Object id = this.entityManagerFactory.getPersistenceUnitUtil().getIdentifier(this.className);
		return id;
	}

	/*Get name of primary key of Entity class
	 * (non-Javadoc)
	 * @see com.base.ActiveRecord.ActiveRecordIterface#getNamePrimaryKey()
	 */
	@Override
	public String getNamePrimaryKey() {
		for(Field fields:this.className.getClass().getDeclaredFields()){
			for(Annotation a:fields.getDeclaredAnnotations())
			if(a.annotationType().getSimpleName().equals("Id")){
				return fields.getName();
			}
		}
		return "id";
	}

	@Override
	public T findOne(CriteriaQuery<T> criteria) {
		this.criteria = criteria;
		this.className = this.one();
		this.resetCriteria();
		return (T) this.className;
	}

	@Override
	public List<T> findAll(CriteriaQuery<T> criteria) {
		this.criteria = criteria;
		List<T> list = this.all();
		this.resetCriteria();
		return list;
	}

	@Override
	public CriteriaQuery<T> getCriteria() {	
		this.startCriteria();
		return this.criteria;
	}

	
	
	@SuppressWarnings("unchecked")
	private void startCriteria() {		
		this.builder = this.entityManagerFactory.getCriteriaBuilder();
		this.criteria = (CriteriaQuery<T>) builder.createQuery(this.className.getClass());
		criteria.select(root);
		this.root = (Root<T>) this.criteria.from(this.className.getClass());
	}

	@Override
	public T findOne(Object value) {
		this.startCriteria();
		this.builder.equal(this.root.get(this.getNamePrimaryKey()),value);
		this.criteria.where(this.builder.equal(this.root.get(this.getNamePrimaryKey()),value));
		this.className = this.one();
		this.resetCriteria();
		return this.className;
	}

	@Override
	public List<T> findAll() {
		this.startCriteria();
		List<T> list = this.all();
		this.resetCriteria();
		return list;
	}
	
	private void resetCriteria(){
		this.builder = null;
		this.criteria = null;
		this.root = null;
	}

	/**
	 * @return the builder
	 */
	public CriteriaBuilder getBuilder() {
		return this.builder;
	}

	/**
	 * @return the root
	 */
	public Root<T> getRoot() {
		return this.root;
	}

	@Override
	public T find() {
		this.startCriteria();		
		return this.className;
	}

	@Override
	public T andWhere(String columnName, String operator, Object value) {
		if(value!=null && !value.toString().equals("") && !value.toString().equals("0")){
			Predicate e = null;
			switch (operator.toLowerCase()) {
			case "=":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					e = this.getBuilder().equal(this.getRoot().join(aux[0]).get(aux[1]), value);
				}else{
					e = this.getBuilder().equal(this.getRoot().get(columnName), value);
				}
				break;
			case "like":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					e = this.getBuilder().like(this.getBuilder().lower(this.getRoot().join(aux[0]).get(aux[1])), "%"+ value.toString() +"%");
				}else{
					e = this.getBuilder().like(this.getBuilder().lower(this.getRoot().get(columnName)), "%"+ value.toString() +"%");
				}
				break;
			case "isnull":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					e = this.getBuilder().isNull(this.getRoot().join(aux[0]).get(aux[1]));
				}else{
					e = this.getBuilder().isNull(this.getRoot().get(columnName));
				}
				break;
			case "notnull":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					e = this.getBuilder().isNotNull(this.getRoot().join(aux[0]).get(aux[1]));
				}else{
					e = this.getBuilder().isNotNull(this.getRoot().get(columnName));
				}
				break;
//			case ">":
//				e = this.getBuilder().gt(this.getRoot().get(columnName), value);
//				break;
			}
			this.predicates.add(e);
		}
		return this.className;
	}

	@Override
	public T one() {
		EntityManager manager = null;
		EntityTransaction transaction = null;
		try{
			manager = this.entityManagerFactory.createEntityManager();
			transaction = manager.getTransaction();
			transaction.begin();
			try{
				if(this.predicates.size() > 0){
					this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
					this.predicates = null;
				}
				if( manager.createQuery(this.criteria).setMaxResults(1).getResultList().size() > 0)
					this.className = manager.createQuery(this.criteria).setMaxResults(1).getSingleResult();
				else
					this.className = null;
			}catch (javax.persistence.NoResultException e) {}
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
		   manager.close();
		}
		this.resetCriteria();
		return this.className;
	}

	@Override
	public List<T> all() {
		List<T> list = null;
		EntityManager manager = null;
		EntityTransaction transaction = null;
		try{
			manager = this.entityManagerFactory.createEntityManager();
			transaction = manager.getTransaction();
			transaction.begin();
			if(this.predicates.size() > 0){
				this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
				this.predicates = null;
			}
			list = (List<T>) manager.createQuery(this.criteria).getResultList();
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
		   manager.close();
		}
		this.resetCriteria();
		return list;
	}
}
