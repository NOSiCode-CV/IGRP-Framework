/**
 *
 */
package nosi.core.data;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Objects;
import java.util.concurrent.Callable;

/**
 * frant
 * 25/10/2021
 */

public class AppSession {

    private final Session session;

    private AppSession(Session session) {
        this.session = Objects.requireNonNull(session, "Session must not be null");
    }

    public static AppSession with(Session session) {
        return new AppSession(session);
    }

    public void runInTransaction(Runnable body) {
        final Transaction transaction = session.getTransaction();
        try {
            if (!transaction.isActive())
                transaction.begin();
            body.run();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction.isActive())
                transaction.rollback();
            throw e;
        } finally {
            if (session.isOpen())
                session.close();
        }
    }

    public <R> R runInTransaction(Callable<R> body) throws Exception {
        final Transaction transaction = session.getTransaction();
        final R result;
        try {
            if (!transaction.isActive())
                transaction.begin();

            result = body.call();

            transaction.commit();

            return result;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction.isActive())
                transaction.rollback();
            throw e;
        } finally {
            if (session.isOpen())
                session.close();
        }
    }
}

