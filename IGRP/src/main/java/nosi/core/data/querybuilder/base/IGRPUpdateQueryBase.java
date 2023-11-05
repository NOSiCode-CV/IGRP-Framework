package nosi.core.data.querybuilder.base;

import nosi.core.data.querybuilder.interfaces.IIGRPQuery;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPUpdateQueryBase<E> implements IIGRPQuery<E> {

   private Session session;
   private final CriteriaUpdate<E> criteriaUpdateQuery;
   private final Root<E> root;
   private final Class<E> clazz;

   public IGRPUpdateQueryBase(Session session, Class<E> clazz, CriteriaUpdate<E> criteriaUpdateQuery, Root<E> root) {
      super();
      this.session = session;
      this.criteriaUpdateQuery = criteriaUpdateQuery;
      this.root = root;
      this.clazz = clazz;
   }

   public Session getSession() {
      return this.session;
   }

   public void setSession(Session session) {
      this.session = session;
   }

   public CriteriaBuilder getCriteriaBuilder() {
      return this.session.getCriteriaBuilder();
   }

   public CriteriaUpdate<E> getCriteriaUpdateQuery() {
      return this.criteriaUpdateQuery;
   }

   public Root<E> getRoot() {
      return this.root;
   }

   public Class<E> getClazz() {
      return this.clazz;
   }

}
