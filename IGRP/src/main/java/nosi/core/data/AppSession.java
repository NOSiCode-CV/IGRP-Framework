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
 * frant
 * 25/10/2021
 */

public final class AppSession {

   private static final Logger LOGGER = LoggerFactory.getLogger(AppSession.class);

   private final Session session;

   private AppSession(Session session) {
      this.session = Objects.requireNonNull(session, "Session must not be null");
   }

   public static AppSession with(Session session) {
      return new AppSession(session);
   }

   public static AppSession newInstance() {
      return with(Core.getSession());
   }

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

   private void handleException(Transaction transaction, Exception e) {
      LOGGER.error(e.getMessage(), e);
      if (transaction.isActive())
         transaction.rollback();
   }

   private void closeSession() {
      if (session.isOpen())
         session.close();
   }
}

