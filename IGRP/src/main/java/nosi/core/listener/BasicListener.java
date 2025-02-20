package nosi.core.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.db.migration.api.MigrationIGRPInitConfig;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
public class BasicListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        System.out.println("||| iGRP: BasicListener will start migration check! |||");
        MigrationIGRPInitConfig.start();
        printBanner();
        ConfigCommonMainConstants.printConfigurationsForDebugging();
    }


    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        HibernateUtils.closeAllConnection();
        HibernateUtils.unregisterAllDrivers();
        System.out.println("||| iGRP: BasicListener will see you soon! Txau |||");
    }

    private void printBanner() {
        try (var inputStream = BasicListener.class.getResourceAsStream("/banner.txt")) {
            if (inputStream == null) {
                System.out.println("banner.txt not found");
                return;
            }
            try (var reader = new BufferedReader(new InputStreamReader(inputStream))) {
                final var content = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    content.append(line).append("\n");
                }
                final var out = content.toString().replace("#version", Config.VERSION);
                System.out.print(out);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
