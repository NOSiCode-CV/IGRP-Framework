package nosi.core.listener;

import nosi.base.ActiveRecord.HibernateUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener {

   @Override
   public void contextDestroyed(ServletContextEvent arg0) {
      HibernateUtils.closeAllConnection();
      HibernateUtils.unregisterAllDrivers();
   }

   @Override
   public void contextInitialized(ServletContextEvent arg0) {
      nosi.core.db.migration.api.MigrationIGRPInitConfig.start();
   }

}
