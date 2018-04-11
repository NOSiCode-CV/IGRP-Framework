package nosi.base.ActiveRecord;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.resource.transaction.spi.TransactionStatus;

import nosi.core.config.Config;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
public class BaseActiveRecord <T> implements ActiveRecordIterface<T>{
	
	private SessionFactory entityManagerFactory;
	private T className;
	private CriteriaBuilder builder = null;
	private CriteriaQuery<T> criteria = null;
	private Root<T> root = null;
	private List<Predicate> predicates = new ArrayList<Predicate>();
	private String connectionName;
	
	@SuppressWarnings("unchecked")
	public BaseActiveRecord() {
		this.connectionName = Config.getBaseConnection();
		this.className = (T) this;
		//this.opeConnection();
	}
	
	/*Inserted data into database
	 * 
	 * @see com.hib.base.ActiveRecordIterface#insert()
	 */
	
	@Override
	public T insert() {		
		this.opeConnection();
		Session session = null;
		Transaction transaction = null;
		try{
			session = this.entityManagerFactory.getCurrentSession();
			transaction = session.beginTransaction();
			session.persist(this.className);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
	      if (transaction != null) {
	          transaction.rollback();
	      }
		} finally {
		   session.close();
		}
		Object key = this.getValuePrimaryKey();
		return this.findOne(key);
	}
	
	/*Update data into database
	 * 
	 * @see com.hib.base.ActiveRecordIterface#update()
	 */
	@Override
	public T update() {	
		this.opeConnection();
		Session session = null;
		Transaction transaction = null;
		try{
			session = this.entityManagerFactory.getCurrentSession();
			transaction = session.beginTransaction();
			session.merge(this.className);
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
		   session.close();
		}
		Object key = this.getValuePrimaryKey();
		return this.findOne(key);
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
		this.opeConnection();
		Session session = null;
		Transaction transaction = null;
		boolean deleted = false;
		try{
			session = this.entityManagerFactory.getCurrentSession();
			transaction = session.beginTransaction();
			this.className = (T) session.find(this.className.getClass(),id);
			session.remove(this.className);
			transaction.commit();
			deleted = true;
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	          deleted = false;
	      }
	      e.printStackTrace();
		} finally {
			session.close();
		}
		this.closeConnection();
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
		Object key = this.getValuePrimaryKey();
		return this.delete(key);
	}

	/* Connection name for Database, default value is h2
	 * 
	 * @see com.hib.base.ActiveRecordIterface#getConnectionName()
	 */
	@Override
	public String getConnectionName() {
		return this.connectionName;
	}

	@Override
	public void setConnectionName(String connectionName){
		this.connectionName = connectionName;
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
		return (T) this.className;
	}

	@Override
	public List<T> findAll(CriteriaQuery<T> criteria) {
		this.criteria = criteria;
		List<T> list = this.all();
		this.closeConnection();
		return list;
	}

	@Override
	public CriteriaQuery<T> getCriteria() {	
		this.startCriteria();
		return this.criteria;
	}

	
	
	@SuppressWarnings("unchecked")
	private void startCriteria() {	
		this.opeConnection();
		if(this.entityManagerFactory!=null){
			if(this.entityManagerFactory.isOpen()){
				this.builder = this.entityManagerFactory.getCriteriaBuilder();
				this.criteria = (CriteriaQuery<T>) builder.createQuery(this.className.getClass());
				criteria.select(root);
				this.root = (Root<T>) this.criteria.from(this.className.getClass());
			}
		}
	}

	@Override
	public T findOne(Object value) {
		this.startCriteria();
		this.builder.equal(this.root.get(this.getNamePrimaryKey()),value);
		this.criteria.where(this.builder.equal(this.root.get(this.getNamePrimaryKey()),value));
		this.className = this.one();
		return this.className;
	}

	@Override
	public List<T> findAll() {
		this.startCriteria();
		List<T> list = this.all();
		this.closeConnection();
		return list;
	}
	
	private void closeConnection(){
		this.builder = null;
		this.criteria = null;
		this.root = null;
	}

	private void opeConnection(){
		if(this.entityManagerFactory==null){
			this.entityManagerFactory = PersistenceUtils.getSessionFactory(this.getConnectionName());
		}
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
		if(value!=null && !value.toString().equals("") && this.entityManagerFactory!=null){
			if(this.entityManagerFactory.isOpen()){
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
					String val = !value.toString().contains("%")?value.toString().toLowerCase().trim()+"%":value.toString().toLowerCase().trim();
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<String> x = this.getRoot().join(aux[0]).get(aux[1]);
						e = this.getBuilder().like(this.getBuilder().lower(x ), val);
					}else{
						Expression<String> x = this.getRoot().get(columnName);
						e = this.getBuilder().like(this.getBuilder().lower(x ), val);
					}
					break;
				}
				this.predicates.add(e);
			}
		}
		return this.className;
	}

	@Override
	public T andWhere(String columnName, String operator) {
		if((operator.toString().equalsIgnoreCase("notnull") || operator.toString().equalsIgnoreCase("notnull"))&& this.entityManagerFactory!=null){
			if(this.entityManagerFactory.isOpen()){
				Predicate e = null;
				switch (operator.toLowerCase()) {
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
				}
				this.predicates.add(e);
			}
		}
		return this.className;
	}
	
	@Override
	public T andWhere(String columnName, String operator, Date value) {
		if(value!=null && !value.toString().equals("") && this.entityManagerFactory!=null){
			if(this.entityManagerFactory.isOpen()){
				Predicate e = null;
				switch (operator.toLowerCase()) {
				case "=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
						if(value!=null)
							e = this.getBuilder().equal(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().equal(this.getRoot().<Date>get(columnName),value);
					}
					break;
					
				case ">":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
						if(value!=null)
							e = this.getBuilder().greaterThan(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().greaterThan(this.getRoot().<Date>get(columnName),value);
					}
					break;

				case ">=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
						if(value!=null)
							e = this.getBuilder().greaterThanOrEqualTo(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().greaterThanOrEqualTo(this.getRoot().<Date>get(columnName),value);
					}
					break;

				case "<":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
						if(value!=null)
							e = this.getBuilder().lessThan(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().lessThan(this.getRoot().get(columnName),value);
					}
					break;

				case "<=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
						if(value!=null)
							e = this.getBuilder().lessThanOrEqualTo(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().lessThanOrEqualTo(this.getRoot().get(columnName),value);
					}
					break;
				}
				this.predicates.add(e);
			}
		}
		return this.className;
	}
	
	
	@Override
	public T andWhere(String columnName, String operator, Number value) {
		if(value!=null && !value.toString().equals("") && this.entityManagerFactory!=null){
			if(this.entityManagerFactory.isOpen()){
				Predicate e = null;
				switch (operator.toLowerCase()) {
				case "=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().equal(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().equal(this.getRoot().get(columnName),value);
					}
					break;
					
				case ">":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().gt(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().gt(this.getRoot().get(columnName),value);
					}
					break;

				case ">=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().ge(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().ge(this.getRoot().get(columnName),value);
					}
					break;

				case "<":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().lt(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().lt(this.getRoot().get(columnName),value);
					}
					break;

				case "<=":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().le(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().le(this.getRoot().get(columnName),value);
					}
					break;

				case "<>":
					if(columnName.contains(".")){
						String[] aux = columnName.split("\\.");
						Expression<Number> x = this.getRoot().join(aux[0]).get(aux[1]);
						if(value!=null)
							e = this.getBuilder().notEqual(x,value);
					}else{
						if(value!=null)
							e = this.getBuilder().notEqual(this.getRoot().get(columnName),value);
					}
					break;
				}
				this.predicates.add(e);
			}
		}
		return this.className;
	}
	
	@Override
	public T one() {
		this.opeConnection();
		Session session = null;
		Transaction transaction = null;
		try{
			try{
				session = this.entityManagerFactory.getCurrentSession();
				transaction = session.beginTransaction();
				try{
					if(this.predicates.size() > 0){
						this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
						this.predicates = null;
					}
					if( session.createQuery(this.criteria).setMaxResults(1).getResultList().size() > 0)
						this.className = session.createQuery(this.criteria).setMaxResults(1).getSingleResult();
					else
						this.className = null;
				}catch (javax.persistence.NoResultException e) {}
				transaction.commit();
			}catch(NullPointerException e){}
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
			 if(session != null){
				/* transaction = session.getTransaction();
		            if(transaction != null && transaction.isActive() && transaction.getStatus() != TransactionStatus.ROLLING_BACK &&
		            		transaction.getStatus() != TransactionStatus.ROLLED_BACK){
		            	transaction.rollback();
		            	System.out.println("Rollback efetuado 1");
		            }*/
		            session.close();
		        }
		}
		this.closeConnection();
		return this.className;
	}

	@Override
	public List<T> all() {
		this.opeConnection();
		List<T> list = null;
		Session session = null;
		Transaction transaction = null;
		try{
			session = this.entityManagerFactory.getCurrentSession();
			transaction = session.beginTransaction();
			if(this.predicates.size() > 0){
				this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
				this.predicates = null;
			}
			list = (List<T>) session.createQuery(this.criteria).getResultList();
			transaction.commit();
		} catch (Exception e) {
	      if (transaction != null) {
	          transaction.rollback();
	      }
	      e.printStackTrace();
		} finally {
			if(session != null){
				/* transaction = session.getTransaction();
		            if(transaction != null && transaction.isActive() && transaction.getStatus() != TransactionStatus.ROLLING_BACK &&
		            		transaction.getStatus() != TransactionStatus.ROLLED_BACK){
		            	transaction.rollback();
		            	System.out.println("Rollback efetuado 2");
		            }*/
		       session.close();
		        }
		}
		this.closeConnection();
		return list;
	}
	
	@Override
	public Long getCount(){
		List<T> list = this.all();
		return list!=null?(long)list.size():0;
	}

	public SessionFactory getEntityManagerFactory() {
		this.opeConnection();
		return entityManagerFactory;
	}
	
}