package nosi.base.ActiveRecord;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.util.List;
import javax.persistence.criteria.CriteriaQuery;

public interface ActiveRecordIterface<T> {

	public T insert();
	public T update();
	public boolean delete(Object id);
	public T findOne(Object value);
	public T findOne(CriteriaQuery<T> criteria);
	public T find();
	public T one();
	public List<T> all();
	public T andWhere(String columnName,String operator);
	public T andWhere(String columnName,String operator,Object value);
	public T andWhere(String columnName,String operator,java.sql.Date value);
	public T andWhere(String columnName,String operator,Number value);
	public List<T> findAll();
	public List<T> findAll(CriteriaQuery<T> criteria);
	public CriteriaQuery<T> getCriteria();
	public void setConnectionName(String connectionName);
	public String getConnectionName();
	public Object getValuePrimaryKey();
	public String getNamePrimaryKey();
	public Long getCount();
}
