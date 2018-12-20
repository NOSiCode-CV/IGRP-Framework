package nosi.base.ActiveRecord;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.AnnotationException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.ORDERBY;


public abstract class BaseActiveRecord<T> implements ActiveRecordIterface<T> {
	private SessionFactory sessionFactory;
	private CriteriaBuilder builder = null;
	private CriteriaQuery<T> criteria = null;
	private Root<T> root = null;
	private List<Predicate> predicates = null;
	private List<Order> listOrder = null;
	private String connectionName;
	private T className;
	private List<String> error;
	private boolean isReadOnly = false;
	private String schema;
	
	@SuppressWarnings("unchecked")
	public BaseActiveRecord() {
		this.className = (T) this;
		this.error = new ArrayList<>();
	}	
	
	private SessionFactory getSessionFactory() {
		if(this.sessionFactory!=null && this.sessionFactory.isOpen()) {
			return sessionFactory;
		}
		this.sessionFactory = HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema);
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void setSchema(String schema) {
		this.schema = schema;
	}
	
	@Override
	public T insert() {
		if(this.isReadOnly())
			return this.className;
		Session session = null;
		Transaction transaction = null;
		try {			
			session = this.getSession();
			transaction = session.beginTransaction();
			session.persist(this.className);
			transaction.commit();
		}catch (Exception e) {
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return this.className;
	}

	@Override
	public T update() {
		if(this.isReadOnly())
			return this.className;
		Session session = null;
		Transaction transaction = null;
		try {
			session = this.getSession();
			transaction = session.beginTransaction();
			session.merge(this.className);
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return this.className;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(Object id) {
		if(this.isReadOnly())
			return false;
		boolean deleted = false;
		Session session = null;
		Transaction transaction = null;
		try {
			session = this.getSession();
			transaction = session.beginTransaction();
			this.className = (T) session.find(this.className.getClass(), id);
			session.remove(this.className);
			transaction.commit();
			deleted=true;
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return deleted;
	}
	

	@Override
	public boolean delete() {
		Object id =this.getValuePrimaryKey();
		return this.delete(id);
	}
	
	@Override
	public T findOne(Object id) {
 		this.startCriteria();
		this.builder.equal(this.root.get(this.getNamePrimaryKey()),id);
		this.criteria.where(this.builder.equal(this.root.get(this.getNamePrimaryKey()),id));
		return this.one();
	}
	@Override
	public T one() throws javax.persistence.NoResultException {
		Session session = null;
		Transaction transaction = null;
		try {
			session = this.getSession();
			transaction = session.beginTransaction();
			this.getCriteria();
			if(this.predicates.size() > 0){
				this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
				this.predicates = null;
			}
			List<T> t = session.createQuery(this.criteria).setMaxResults(1).getResultList();
			if(t!=null && t.size() > 0)
				this.className = t.get(0);
			else
				this.className = null;
			transaction.commit();
		}catch(AnnotationException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.className = null;
			this.setError(e.getMessage());
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.className = null;
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return className;
	}

	@Override
	public T findOne(CriteriaQuery<T> criteria) {
		Session session = null;
		Transaction transaction = null;
		try {
			this.startCriteria();
			session = this.getSession();
			transaction = session.beginTransaction();
			List<T> t = session.createQuery(criteria).setMaxResults(1).getResultList();
			if(t!=null && t.size() > 0)
				this.className = t.get(0);
			else
				this.className = null;
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.className = null;
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return className;
	}

	@Override
	public T find() {
 		this.startCriteria();
		return this.className;
	}

	
	@Override
	public List<T> all() {
		List<T> list = null;
		Session session = null;
		Transaction transaction = null;
		try{
			session = this.getSession();
			transaction = session.beginTransaction();
			this.getCriteria();
			if(this.predicates.size() > 0){
				this.criteria.where(predicates.toArray(new Predicate[predicates.size()]));
				this.predicates = null;
			}
			if(this.listOrder.size() > 0) {
				this.getCriteria().select(this.getRoot());
				this.getCriteria().orderBy(listOrder);
			}
			list = (List<T>) session.createQuery(this.criteria).getResultList();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return list;
	}


	@Override
	public List<T> findAll() {
		List<T> list = null;
		Session session = null;
		Transaction transaction = null;
		try{
			this.startCriteria();
			session = this.getSession();
			transaction = session.beginTransaction();
			list = (List<T>) session.createQuery(this.getCriteria()).getResultList();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return list;
	}

	@Override
	public List<T> findAll(CriteriaQuery<T> criteria) {
		List<T> list = null;
		Session session = null;
		Transaction transaction = null;
		try{
			session = this.getSession();
			transaction = session.beginTransaction();
			list = (List<T>) session.createQuery(criteria).getResultList();
			transaction.commit();
		}catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			this.setError(e.getCause().getCause().getMessage());
		} finally {
			if (session != null) {
				session.close();
			}
		}
		this.closeFactory();
		return list;
	}
 	@Override
 	public T andWhere(String columnName, String operator, Object value) {
 		if(value!=null && !value.toString().equals("")){
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
			case "not in":
				List<String> valuesNotIN = Arrays.asList(new String[] {value.toString()});
				e = this.getRoot().get(columnName).in(valuesNotIN).not();
				break;
			case "in":
				List<String> valuesIn = Arrays.asList(new String[] {value.toString()});
				e = this.getRoot().get(columnName).in(valuesIn);
				break;
			case "<>":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					e = this.getBuilder().notEqual(this.getRoot().join(aux[0]).get(aux[1]), value);
				}else{
					if(value!=null)
						e = this.getBuilder().notEqual(this.getRoot().get(columnName),value);
				}
				break;
			}
			this.predicates.add(e);
 		}
 		return this.className;
 	}
 	
	@Override
 	public T andWhere(String columnName, String operator) {
 		if((operator.toString().equalsIgnoreCase("isnull") || operator.toString().equalsIgnoreCase("notnull"))){
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
 		return this.className;
 	}
 	
 	@Override
 	public T andWhere(String columnName, String operator, Date value) {
 		if(value!=null && !value.toString().equals("")){
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
			case "<>":
				if(columnName.contains(".")){
					String[] aux = columnName.split("\\.");
					Expression<Date> x = this.getRoot().join(aux[0]).<Date>get(aux[1]);
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
 		return this.className;
 	}
 	
 	
 	@Override
 	public T andWhere(String columnName, String operator, Number value) {
 		if(value!=null && !value.toString().equals("")){
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
 		return this.className;
 	}

 	@Override
 	public T orderBy(String columnName){
 		return orderBy(columnName, ORDERBY.ASC);
 	}
 	
 	@Override
	public T orderBy(String columnName, String ascOrDesc){
		if(columnName!=null && (ascOrDesc.equals(ORDERBY.ASC) || ascOrDesc.equals(ORDERBY.DESC))) {
			
	 			CriteriaBuilder cb = this.getBuilder();
	 			CriteriaQuery<T> cq = this.getCriteria();
	 			Root<T> r = this.getRoot();
	 			cq.select(r);
	 			if(ascOrDesc.equals(ORDERBY.ASC))
	 				this.listOrder.add(cb.asc(r.get(columnName)));
	 			else
	 				this.listOrder.add(cb.desc(r.get(columnName)));
		}
		return this.className;
	}
 	
	private Session getSession() {		
		return HibernateUtils.getSessionFactory(this.getConnectionName(),this.schema).getCurrentSession();
	}

	@Override
	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}

	@Override
	public String getConnectionName() {		
		return Core.isNotNull(this.connectionName) ? this.connectionName:Core.defaultConnection();
	}

	@Override
	public Long getCount() {
		List<T> list = this.findAll();
		return list!=null?(long)list.size():0;
	}

	/*Get table name of Entity class
	 * 
	 */
	public String getTable(){
		for(Annotation a:this.getClass().getAnnotations()){
			if(a.annotationType().getSimpleName().equalsIgnoreCase("Table")){
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
		Object id = this.getSessionFactory().getPersistenceUnitUtil().getIdentifier(this.className);
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
			if(a.annotationType().getSimpleName().equalsIgnoreCase("Id")){
				return fields.getName();
			}
		}
		return "id";
	}


	@Override
	public CriteriaQuery<T> getCriteria() {
		this.startCriteria();
		return this.criteria;
	}
	
	/**
	 * @return the builder
	 */
	public CriteriaBuilder getBuilder() {
		this.startCriteria();
		return this.builder;
	}

	/**
	 * @return the root
	 */
	public Root<T> getRoot() {
		this.startCriteria();
		return this.root;
	}
	
	
	public List<String> getError() {
		return error;
	}

	public void setError(String error) {
		this.error.add(error);
	}
	
	public boolean hasError() {
		return this.error!=null && !this.error.isEmpty();
	}

	public void showMessage() {
		if(this.hasError()) {
			this.error.stream().forEach(e->{
				Core.setMessageError(e);
			});
		}
	}
	
	@SuppressWarnings("unchecked")
	private void startCriteria() {
		if(this.predicates==null) {
			this.predicates = new ArrayList<>();
		}
		if(this.listOrder==null) {
			this.listOrder = new ArrayList<>();
		}
		if(this.builder==null) {
			this.builder = this.getSessionFactory().getCriteriaBuilder();
		}
		if(this.criteria==null) {
			this.criteria = (CriteriaQuery<T>) this.builder.createQuery(this.className.getClass());
		}
		if(this.root==null) {
			this.root = (Root<T>) this.criteria.from(this.className.getClass());
		}else {
			this.criteria.select(this.root);
		}
	}
	
	
	
	public boolean isReadOnly() {
		return isReadOnly;
	}

	public void setReadOnly(boolean isReadOnly) {
		this.isReadOnly = isReadOnly;
	}

	protected void closeFactory(){
//		this.getSessionFactory().close();
//		HibernateUtils.removeSessionFactory(this.getConnectionName());
	}

}
