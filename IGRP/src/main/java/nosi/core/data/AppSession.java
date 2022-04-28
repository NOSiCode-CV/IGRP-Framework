/**
 * 
 */
package nosi.core.data;

import java.util.concurrent.Callable;

import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 * frant
 * 25/10/2021
 */
/**
 * @author frant
 *
 */
public class AppSession {

	private Session session;

	private AppSession(Session session) {
		this.session = session;
	}

	public static AppSession with(Session session) {
		return new AppSession(session);
	}	
	
	public void runInTransaction(Runnable body) {
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			body.run();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive())
				transaction.rollback();			
			throw e;			
		} finally {
			if (session != null && session.isOpen())
				session.close();
		}
	}
	
	public <R> R runInTransaction(Callable<R> body) throws Exception {
		Transaction transaction = session.getTransaction();
		R result = null;
		try {
			transaction.begin();
			result = body.call();
			transaction.commit();	
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive())
				transaction.rollback();			
			throw e;
		} finally {
			if (session != null && session.isOpen())
				session.close();
		}		
	}
}

