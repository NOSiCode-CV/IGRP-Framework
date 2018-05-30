package nosi.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import nosi.base.ActiveRecord.HibernateUtils;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener {

    public BasicListener() {} 

    public void contextDestroyed(ServletContextEvent arg0)  {
    	HibernateUtils.destroy(); 
    	HibernateUtils.unregisterAllDrivers();
    }
    
	public void contextInitialized(ServletContextEvent arg0)  {}
	
}
