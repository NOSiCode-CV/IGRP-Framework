package nosi.core.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;
import nosi.base.ActiveRecord.PersistenceUtils;

/**
 * @author: Emanuel Pereira
 * 8 Jul 2017
 */
public class Connection {

	public static java.sql.Connection getConnection(String connectionName){
		EntityManagerFactory entityManagerFactory = PersistenceUtils.getSessionFactory(connectionName);
		if(entityManagerFactory!=null){
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Session hibernateSession = (Session) em.unwrap(Session.class);
			return ((SessionImpl)hibernateSession).connection();
		}
		return null;
	}
}
