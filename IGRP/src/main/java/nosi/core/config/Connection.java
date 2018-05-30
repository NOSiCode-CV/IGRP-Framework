package nosi.core.config;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.webapps.igrp.dao.Config_env;

/**
 * @author: Emanuel Pereira
 * 8 Jul 2017
 */
public class Connection {

	public static java.sql.Connection getConnection(String connectionName){
		EntityManagerFactory entityManagerFactory = HibernateUtils.getSessionFactory(connectionName);
		if(entityManagerFactory != null){
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Session hibernateSession = (Session) em.unwrap(Session.class);
			java.sql.Connection aux = ((SessionImpl)hibernateSession).connection();
			return aux;
		}
		return null;
	}
	
	public static java.sql.Connection getConnection(Config_env config_env){
		EntityManagerFactory entityManagerFactory = HibernateUtils.getSessionFactory(config_env);
		if(entityManagerFactory != null){
			EntityManager em = entityManagerFactory.createEntityManager();
			em.getTransaction().begin();
			Session hibernateSession = (Session) em.unwrap(Session.class);
			java.sql.Connection aux = ((SessionImpl)hibernateSession).connection();
			return aux;
		}
		return null;
	}
}
