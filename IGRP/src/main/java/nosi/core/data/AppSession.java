package nosi.core.data;

import nosi.core.webapp.Core;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.function.Consumer;
import java.util.function.Function;

/**
 * A utility class for managing Hibernate sessions and transactions.
 * <p>
 * This class provides methods for running operations within a transactional context.
 * It encapsulates the boilerplate code for beginning, committing, and handling exceptions during transactions.
 *
 * @author william.fonseca
 * @since 25/10/2021
 */
public final class AppSession {

   private static final Logger LOGGER = LoggerFactory.getLogger(AppSession.class);

   private final Session session;

   /**
    * Private constructor to create an instance of AppSession.
    *
    * @param session The Hibernate Session to be managed.
    */
   private AppSession(Session session) {
      this.session = Objects.requireNonNull(session, "Session must not be null");
   }

   /**
    * Creates a new AppSession instance with the provided Hibernate Session.
    *
    * @param session The Hibernate Session to be managed.
    * @return A new AppSession instance.
    */
   public static AppSession with(Session session) {
      return new AppSession(session);
   }

   /**
    * Creates a new AppSession instance with a default Hibernate Session obtained from the app default connection
    *
    * @return A new AppSession instance with the default session
    */
   public static AppSession withDefaultConnection() {
      return with(Core.getSession());
   }

   /**
    * Runs the specified Runnable within a transaction.
    *
    * @param body The Runnable to be executed within the transaction.
    */
   public void runInTransaction(Runnable body) {
      final Transaction transaction = session.getTransaction();
      try {
         if (!transaction.isActive())
            transaction.begin();
         body.run();
         transaction.commit();
      } catch (Exception e) {
         handleException(transaction, e);
         throw e;
      } finally {
         closeSession();
      }
   }

   /**
    * Runs the specified Callable within a transaction.
    *
    * @param body The Callable returning a result to be executed within the transaction.
    * @param <R>  The type of the result.
    * @return The result of the Callable.
    * @throws Exception If an exception occurs during the transaction.
    */
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
         handleException(transaction, e);
         throw e;
      } finally {
         closeSession();
      }
   }

   /**
    * Runs the specified Consumer within a transaction, providing access to the Hibernate Session.
    *
    * @param consumer The Consumer accepting a Session to be executed within the transaction.
    */
   public void runInTransaction(Consumer<Session> consumer) {
      final Transaction transaction = session.getTransaction();
      try {
         if (!transaction.isActive())
            transaction.begin();
         consumer.accept(session);
         transaction.commit();
      } catch (Exception e) {
         handleException(transaction, e);
         throw e;
      } finally {
         closeSession();
      }
   }

   /**
    * Runs the specified Function within a transaction, providing access to the Hibernate Session.
    *
    * @param function The Function accepting a Session and returning a result to be executed within the transaction.
    * @param <R>      The type of the result.
    * @return The result of the Function.
    */
   public <R> R runInTransaction(Function<Session, R> function) {
      final Transaction transaction = session.getTransaction();
      try {
         if (!transaction.isActive())
            transaction.begin();
         final R result = function.apply(session);
         transaction.commit();
         return result;
      } catch (Exception e) {
         handleException(transaction, e);
         throw e;
      } finally {
         closeSession();
      }
   }

   /**
    * Handles exceptions that occur during a transaction.
    *
    * @param transaction The current Hibernate Transaction.
    * @param e           The exception that occurred.
    */
   private void handleException(Transaction transaction, Exception e) {
      LOGGER.error(e.getMessage(), e);
      if (transaction.isActive())
         transaction.rollback();
   }

   /**
    * Closes the Hibernate Session if it is open.
    */
   private void closeSession() {
      if (session.isOpen())
         session.close();
   }
}
