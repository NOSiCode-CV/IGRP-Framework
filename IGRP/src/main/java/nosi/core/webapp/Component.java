package nosi.core.webapp;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Marcel Iekiny
 * Apr 25, 2017
 */
public interface Component { 

	public void init(HttpServletRequest request);
	public void destroy();
	
}
