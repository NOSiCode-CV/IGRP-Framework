package cv.nosi.core.webapp.component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Marcel Iekiny
 * Apr 25, 2017
 */
public interface IComponent { 

	public void init(HttpServletRequest request);
	public void destroy();
	
}
