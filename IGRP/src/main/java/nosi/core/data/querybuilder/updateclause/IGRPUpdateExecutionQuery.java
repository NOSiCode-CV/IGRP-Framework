package nosi.core.data.querybuilder.updateclause;

import nosi.core.data.querybuilder.base.IGRPUpdateQueryBase;
import nosi.core.data.querybuilder.interfaces.IIGRPUpdateQuery;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;

/**
 * venceslau.gama
 * 09/10/2020
 */
public class IGRPUpdateExecutionQuery<E> extends IGRPUpdateQueryBase<E> implements IIGRPUpdateQuery<E> {

   public IGRPUpdateExecutionQuery(Session session, Class<E> clazz, CriteriaUpdate<E> criteriaUpdate, Root<E> root) {
      super(session, clazz, criteriaUpdate, root);
   }

   @Override
   public int update() {
      return this.getQuery().executeUpdate();
   }

   @Override
   public String sql() {
      return this.getQuery().unwrap(Query.class).getQueryString();
   }

   private Query<E> getQuery() {
      return this.getSession().createQuery(this.getCriteriaUpdateQuery());
   }
}
