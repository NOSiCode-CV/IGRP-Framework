package nosi.core.webapp.databse.helpers;

import java.util.List;

/**
 * Emanuel
 * 21 Dec 2017
 */
public interface IFQuery {

	public int execute();
	public List<?> getResultList();
	public Object getSigleResult();
}
