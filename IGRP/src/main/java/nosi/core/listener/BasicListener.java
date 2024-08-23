package nosi.core.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.Config;
import nosi.core.db.migration.api.MigrationIGRPInitConfig;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Objects;

/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener { 
	
   @Override
   public void contextInitialized(ServletContextEvent arg0) {
      System.out.println("||| iGRP: BasicListener will start migration check! |||");
      MigrationIGRPInitConfig.start();
      printBanner();
   }



    @Override
    public void contextDestroyed(ServletContextEvent arg0)  {
    	HibernateUtils.closeAllConnection();
    	HibernateUtils.unregisterAllDrivers();
      System.out.println("||| iGRP: BasicListener will see you soon! Txau |||");
   }

    private void printBanner() {
        try (InputStream inputStream = BasicListener.class.getResourceAsStream("/banner.txt")) {
            if (inputStream == null) {
                System.out.println("banner.txt not found");
            } else {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        System.out.println(line.replace("#version", Config.VERSION));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
}
