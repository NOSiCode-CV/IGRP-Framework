package nosi.core.webapp.business;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import org.hibernate.Session;

/**
 * Helper class for Igrp pages.
 * Provides common functionality for working with Hibernate sessions, models, and views.
 *
 * @param <M> The type of the model.
 * @param <V> The type of the view.
 */
public abstract class IgrpPageHelper<M extends Model, V extends View> {

   /**
    * The Hibernate session.
    */
   protected Session session;

   /**
    * The model associated with the page.
    */
   protected M model;

   /**
    * The view associated with the page.
    */
   protected V view;

   /**
    * Constructs an IgrpPageHelper with a Hibernate session, model, and view.
    *
    * @param session The Hibernate session.
    * @param model   The model.
    * @param view    The view.
    */
   protected IgrpPageHelper(Session session, M model, V view) {
      this.session = session;
      this.model = model;
      this.view = view;
   }

   /**
    * Constructs an IgrpPageHelper with a model and view.
    * Assumes that no Hibernate session is associated when building instances of this class.
    * Recommended to be used when Using AppSession class with methods that accept java.util.consumer and java.util.Function
    *
    * @param model The model.
    * @param view  The view.
    */
   protected IgrpPageHelper(M model, V view) {
      this(null, model, view);
   }
}
