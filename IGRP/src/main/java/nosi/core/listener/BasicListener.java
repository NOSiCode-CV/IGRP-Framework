package nosi.core.listener;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.Config;
import nosi.core.db.migration.api.MigrationIGRPInitConfig;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.UUID;

/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
public class BasicListener implements ServletContextListener {

   @Override
   public void contextInitialized(ServletContextEvent arg0) {
      System.out.println("||| IGRP: BasicListener will start migration check! |||");
      MigrationIGRPInitConfig.start();
      printBanner();
      arg0.getServletContext().setAttribute("startupUUID", UUID.randomUUID().toString().substring(0, 3));
   }



   @Override
   public void contextDestroyed(ServletContextEvent arg0) {
      HibernateUtils.closeAllConnection();
      HibernateUtils.unregisterAllDrivers();
      System.out.println("||| IGRP: BasicListener will see you soon! Txau |||");
   }

   private void printBanner() {
        try (InputStream inputStream = BasicListener.class.getResourceAsStream("/banner.txt")) {
            if (inputStream == null) {
                System.out.println("banner.txt not found");
            } else {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                    StringBuilder content = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        content.append(line).append("\n");
                    }
                    final String out = content.toString();
                    System.out.print(out.replace("#version", Config.VERSION));

                }
            }
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

}
