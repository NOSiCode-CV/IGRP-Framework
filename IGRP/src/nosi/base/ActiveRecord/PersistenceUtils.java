package nosi.base.ActiveRecord;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author Emanuel Pereira
 * 4 Jul 2017
 */
public class PersistenceUtils {

//	public static final EntityManagerFactory ENTITY_MANAGER_FACTORY = javax.persistence.Persistence.createEntityManagerFactory("mysql");
	public static Map<String,EntityManagerFactory> ENTITY_MANAGER_FACTORY = new HashMap<>();
	static{
//		ENTITY_MANAGER_FACTORY.put("mysql", Persistence.createEntityManagerFactory("mysql"));
//		ENTITY_MANAGER_FACTORY.put("postgres", Persistence.createEntityManagerFactory("postgres"));
//		ENTITY_MANAGER_FACTORY.put("oracle", Persistence.createEntityManagerFactory("oracle"));
		ENTITY_MANAGER_FACTORY.put("h2", Persistence.createEntityManagerFactory("h2"));
	}
}
