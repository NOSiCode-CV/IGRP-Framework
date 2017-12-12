package nosi.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import nosi.base.ActiveRecord.PersistenceUtils;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener {

    public BasicListener() {} 

    public void contextDestroyed(ServletContextEvent arg0)  {
    	PersistenceUtils.destroy(); 
    }

	public void contextInitialized(ServletContextEvent arg0)  { 
		PersistenceUtils.init(arg0.getServletContext().getRealPath("/WEB-INF/config/")); 
    }
}
