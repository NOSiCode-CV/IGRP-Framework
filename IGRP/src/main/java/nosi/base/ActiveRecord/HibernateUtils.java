package nosi.base.ActiveRecord;

import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Emanuel
 * 29 May 2018
 */

public class HibernateUtils {

   private static final Logger LOG = LoggerFactory.getLogger(HibernateUtils.class);

   private static final Map<String, SessionFactory> SESSION_FACTORY = new ConcurrentHashMap<>();
   private static final SessionFactory SESSION_FACTORY_IGRP;
   public static final StandardServiceRegistryBuilder REGISTRY_BUILDER_IGRP;

   public static final String SUFIX_HIBERNATE_CONFIG = ".cfg.xml";

   private HibernateUtils() {
      throw new IllegalStateException("Utility class");
   }

   static {
      final String cfgName = ConfigApp.getInstance().getBaseConnection() + SUFIX_HIBERNATE_CONFIG;
      final Properties properties = getProperties(ConfigApp.getInstance().getBaseConnection() + ".properties");
      REGISTRY_BUILDER_IGRP = new StandardServiceRegistryBuilder().applySettings(properties).configure(cfgName);
      SESSION_FACTORY_IGRP = buildSessionFactory(cfgName);
   }

   public static SessionFactory getSessionFactory(String connectionName) {
      return getSessionFactory(connectionName, Core.getCurrentDadParam());
   }

   public static SessionFactory getSessionFactory(String connectionName, String dad) {

      if (connectionName != null && connectionName.equalsIgnoreCase(ConfigApp.getInstance().getBaseConnection()))
         return SESSION_FACTORY_IGRP;

      final String fileName = (dad != null && !dad.isEmpty()) ? connectionName + "." + dad : connectionName;

      return SESSION_FACTORY.compute(connectionName, (key, existingSessionFactory) -> {
         if (existingSessionFactory == null || !existingSessionFactory.isOpen()) {
            return buildSessionFactory(fileName + SUFIX_HIBERNATE_CONFIG);
         }
         return existingSessionFactory;
      });
   }

   public static Session getSession(String connectionName) {
      SessionFactory sessionFactory = getSessionFactory(connectionName);
      if (sessionFactory != null) {
         if (sessionFactory.isOpen() && sessionFactory.getCurrentSession() != null
             && sessionFactory.getCurrentSession().isOpen()) {
            return sessionFactory.getCurrentSession();
         }
         sessionFactory.close();
         removeSessionFactory(connectionName);
         sessionFactory = getSessionFactory(connectionName);
         if (sessionFactory != null)
            return sessionFactory.getCurrentSession();

      }
      throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
   }

   private static SessionFactory buildSessionFactory(String cfgName) {
      try {
         ServiceRegistry serviceRegistry;

         if (cfgName.startsWith(ConfigApp.getInstance().getBaseConnection()))
            serviceRegistry = REGISTRY_BUILDER_IGRP.build();
         else
            serviceRegistry = getServiceRegistryBuilder(cfgName).build();

         return new Configuration().buildSessionFactory(serviceRegistry);

      } catch (Exception ex) {
         LOG.error("Initial SessionFactory creation failed.", ex);
         throw new ExceptionInInitializerError(ex);
      }
   }

   public static Map<String, Object> getSettings() {
      return HibernateUtils.REGISTRY_BUILDER_IGRP.getSettings();

   }

   private static StandardServiceRegistryBuilder getServiceRegistryBuilder(String cfgName) {
      return new StandardServiceRegistryBuilder().applySettings(getProperties(cfgName.replace(SUFIX_HIBERNATE_CONFIG, ".properties"))).configure(cfgName);
   }

   public static Map<String, Object> getSettings(String cfgName) {
      return getServiceRegistryBuilder(cfgName).getSettings();
   }


   public static synchronized void unregisterAllDrivers() {
      final Enumeration<Driver> drivers = DriverManager.getDrivers();
      while (drivers.hasMoreElements()) {
         try {
            DriverManager.deregisterDriver(drivers.nextElement());
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }

   public static void closeAllConnection() {
      SESSION_FACTORY.values().forEach(SessionFactory::close);
      SESSION_FACTORY.clear();
      if (SESSION_FACTORY_IGRP != null)
         SESSION_FACTORY_IGRP.close();
   }

   public static void removeSessionFactory(String connectionName) {
      final SessionFactory sessionFactory = SESSION_FACTORY.remove(connectionName);
      if (null != sessionFactory && sessionFactory.isOpen())
         sessionFactory.close();
   }

   private static Properties getProperties(String fileName) {
      final Properties properties = new Properties();
      try (InputStream inputStream = HibernateUtils.class.getClassLoader().getResourceAsStream(fileName)) {
         if (Objects.nonNull(inputStream)) {
            properties.load(inputStream);
            processEnvironmentVariables(properties);
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      return properties;
   }

   /**
    * This method processes environment variables for database access.
    * It checks if the system environment variable 'ENABLE_ENV_VARIABLE_SCANNING' is set to true,
    * and if so, it loads environment variables specified in the properties object
    * by replacing placeholders with corresponding environment variable values.
    *
    * @param properties The properties object containing key-value pairs with potential environment variable placeholders.
    */
   private static void processEnvironmentVariables(Properties properties) {

      if (!ConfigCommonMainConstants.isEnvironmentVariableScanActive())
         return;

      LOG.info("Loading environment variables for database access...");

      for (var propertyKey : properties.stringPropertyNames()) {
         var propertyValue = properties.getProperty(propertyKey);
         if (isEnvVariableFormat(propertyValue)) {
            var environmentVariableName = propertyValue.substring(2, propertyValue.length() - 1);
            var environmentVariableValue = System.getenv(environmentVariableName);
            if (environmentVariableValue != null)
               properties.setProperty(propertyKey, environmentVariableValue.trim());
            else
               LOG.error("Environment Variable: {} not found", environmentVariableName);
         }
      }
   }

   /**
    * This method checks if the given property value is in the format of an environment variable placeholder.
    *
    * @param propertyValue The value of a property to be checked.
    * @return True if the property value is in the format "${...}", false otherwise.
    */
   private static boolean isEnvVariableFormat(String propertyValue) {
      return propertyValue != null &&
             propertyValue.startsWith("${") &&
             propertyValue.endsWith("}");
   }
   public static void setSessionAudit(Session s) {
      final String hcdc = (String) s.getSessionFactory().getProperties().get("hibernate.connection.driver_class");
      if(hcdc.contains("postgresql")){
         final User currentUser = Core.getCurrentUser();
      // Set the session variables
         s.doWork(connection -> {
            if(currentUser!=null){
            setAuditContext(connection, "audit.AUDIT_USER_CONTEXT", currentUser.getEmail());
               setAuditContext(connection, "audit.AUDIT_USER_ID", currentUser.getId()+"");
            }else{
               setAuditContext(connection, "audit.AUDIT_USER_CONTEXT", "anonymous@igrp");
               setAuditContext(connection, "audit.AUDIT_USER_ID",  "0");
            }
            if (null != Igrp.getInstance() && null != Igrp.getInstance().getRequest())
               setAuditContext(connection, "audit.AUDIT_USER_IP", Igrp.getInstance().getRequest().getRemoteAddr());
         });
   }


   }
   public static void setSessionAudit(Connection connection, StringBuilder parsedQuery) {
       try {
         // Check the database type
         String databaseType = connection.getMetaData().getDatabaseProductName().toLowerCase();

         if (databaseType.contains("postgresql")) {
            // PostgreSQL-specific logic
              final User currentUser = Core.getCurrentUser();
              if(currentUser!=null){
                 parsedQuery.append(String.format("SET session audit.AUDIT_USER_CONTEXT = '%s'; ", currentUser.getEmail()));
                 parsedQuery.append(String.format("SET session audit.AUDIT_USER_ID = '%s'; ", currentUser.getId()+""));
              }else{
                 parsedQuery.append(String.format("SET session audit.AUDIT_USER_CONTEXT = '%s'; ", "anonymous@igrp"));
                 parsedQuery.append(String.format("SET session audit.AUDIT_USER_ID = '%s'; ", "0"));
              }
            if (null != Igrp.getInstance() && null != Igrp.getInstance().getRequest()) {
                 parsedQuery.append(String.format("SET session audit.AUDIT_USER_IP = '%s'; ", Igrp.getInstance().getRequest().getRemoteAddr()));

           }
         }
//         else
//            if (databaseType.contains("oracle")) {
//            // Oracle-specific logic
//            final User currentUser = Core.getCurrentUser();
//            String email = (currentUser != null) ? currentUser.getEmail() : "anonymous@igrp";
//            String userId = (currentUser != null) ? currentUser.getId() + "" : "0";
//            String userIp = (null != Igrp.getInstance() && null != Igrp.getInstance().getRequest()) ? Igrp.getInstance().getRequest().getRemoteAddr() : "0.0.0.0";
//
//            // Execute each Oracle PL/SQL block separately
//            try (java.sql.Statement stmt = connection.createStatement()) {
//               stmt.execute("BEGIN DBMS_SESSION.SET_IDENTIFIER('" + email + "'); END;");
//               stmt.execute("BEGIN DBMS_SESSION.SET_CONTEXT('AUDIT_CTX', 'AUDIT_USER_ID', '" + userId + "'); END;");
//               stmt.execute("BEGIN DBMS_SESSION.SET_CONTEXT('AUDIT_CTX', 'AUDIT_USER_IP', '" + userIp + "'); END;");
//            }
//         }
//         else {
//            System.out.println("In setSessionAudit - Unsupported database type: " + databaseType);
//         }
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
   }

   private static void setAuditContext(Connection connection, String settingName, String settingValue) throws SQLException {
      String sql = String.format("SET session %s = '%s'", settingName, settingValue);
      try (PreparedStatement stmt = connection.prepareStatement(sql)) {
         stmt.execute();
      }
   }
}