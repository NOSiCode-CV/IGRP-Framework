package nosi.core.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import nosi.base.ActiveRecord.HibernateUtils;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener { 
	

    @Override
    public void contextDestroyed(ServletContextEvent arg0)  {
    	HibernateUtils.closeAllConnection();
    	HibernateUtils.unregisterAllDrivers();
		//System.gc();
    }
    
	@Override
	public void contextInitialized(ServletContextEvent arg0)  {
		nosi.core.db.migration.api.MigrationIGRPInitConfig.start();
	}
	
}
