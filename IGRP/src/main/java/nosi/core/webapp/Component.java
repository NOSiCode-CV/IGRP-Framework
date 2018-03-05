package nosi.core.webapp;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Marcel Iekiny
 * Apr 25, 2017
 */
public interface Component { // all app component probably implement this interface

	public void init(HttpServletRequest request);
	public void destroy();
	
}
