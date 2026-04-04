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

   // Key is the fully-qualified factory name: connectionName[.dad]
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

// derive name from the base connection, e.g. "igrp" → "pool-igrp"
      properties.putIfAbsent("hibernate.hikari.poolName",
              "HikariPool-" + ConfigApp.getInstance().getBaseConnection());

      REGISTRY_BUILDER_IGRP = new StandardServiceRegistryBuilder()
              .applySettings(properties)
              .configure(cfgName);
      SESSION_FACTORY_IGRP = buildSessionFactory(cfgName);
   }

   // -------------------------------------------------------------------------
   // Key helpers
   // -------------------------------------------------------------------------

   /**
    * Builds the stable map key for a given (connectionName, dad) pair.
    * This is the single source of truth — every code path that touches
    * SESSION_FACTORY must derive its key from here.
    */
   private static String factoryKey(String connectionName, String dad) {
      return (dad != null && !dad.isEmpty())
              ? connectionName + "." + dad
              : connectionName;
   }

   // -------------------------------------------------------------------------
   // Public SessionFactory accessors
   // -------------------------------------------------------------------------

   public static SessionFactory getSessionFactory(String connectionName) {
      return getSessionFactory(connectionName, Core.getCurrentDadParam());
   }

   public static SessionFactory getSessionFactory(String connectionName, String dad) {

      if (connectionName != null
              && connectionName.equalsIgnoreCase(ConfigApp.getInstance().getBaseConnection()))
         return SESSION_FACTORY_IGRP;

      // FIX 1: the map key must include the dad so that different dad values
      //        for the same connectionName don't collide and overwrite each other.
      final String key      = factoryKey(connectionName, dad);
      final String cfgFile  = key + SUFIX_HIBERNATE_CONFIG;

      // FIX 2: compute() is atomic per-key in ConcurrentHashMap, so the
      //        lambda below is guaranteed to run for only one thread at a time
      //        for a given key.  No two threads can both see null and both
      //        call buildSessionFactory() for the same key.
      return SESSION_FACTORY.compute(key, (k, existing) -> {
         if (existing == null || !existing.isOpen()) {
            // If a stale (closed) factory is in the slot, close it cleanly
            // before replacing — avoids leaking connection-pool resources.
            if (existing != null) {
               LOG.warn("Replacing closed SessionFactory for key '{}'", k);
               try { existing.close(); } catch (Exception ignored) { /* already closed */ }
            }
            return buildSessionFactory(cfgFile);
         }
         return existing;
      });
   }

   // -------------------------------------------------------------------------
   // Public Session accessor
   // -------------------------------------------------------------------------

   public static Session getSession(String connectionName) {
      // getSessionFactory already guarantees an open factory (or throws).
      // getCurrentSession() is safe to call without further null/open checks
      // because Hibernate itself will raise if the session context is missing.
      final SessionFactory sf = getSessionFactory(connectionName);
      if (sf == null)
         throw new HibernateException(
                 Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));

      try {
         final Session session = sf.getCurrentSession();
         if (session != null && session.isOpen())
            return session;
      } catch (HibernateException e) {
         // getCurrentSession() may throw when no active session exists — that
         // is a normal condition; fall through to the recovery path below.
         LOG.debug("getCurrentSession() threw for '{}', will invalidate and retry: {}",
                 connectionName, e.getMessage());
      }

      // Session isn't usable.  Invalidate the factory so getSessionFactory()
      // rebuilds it on the next call.  We close it inside compute() so the
      // removal and close happen atomically with respect to other threads
      // looking up the same key.
      invalidateFactory(connectionName, Core.getCurrentDadParam());
      final SessionFactory fresh = getSessionFactory(connectionName);
      if (fresh != null)
         return fresh.getCurrentSession();

      throw new HibernateException(
              Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
   }

   // -------------------------------------------------------------------------
   // Factory lifecycle helpers
   // -------------------------------------------------------------------------

   /**
    * Atomically removes and closes the SessionFactory for (connectionName, dad).
    * Because this uses compute() on the same key as getSessionFactory(), it is
    * impossible for a concurrent getSessionFactory() call to see a half-removed
    * entry or to lose a freshly built factory.
    */
   private static void invalidateFactory(String connectionName, String dad) {
      final String key = factoryKey(connectionName, dad);
      SESSION_FACTORY.compute(key, (k, existing) -> {
         if (existing != null && existing.isOpen()) {
            LOG.info("Closing SessionFactory for key '{}'", k);
            try { existing.close(); } catch (Exception ignored) { /* best-effort */ }
         }
         return null; // removes the entry
      });
   }

   /** Public API kept for backwards compatibility (no dad variant). */
   public static void removeSessionFactory(String connectionName) {
      invalidateFactory(connectionName, Core.getCurrentDadParam());
   }

   public static void closeAllConnection() {
      SESSION_FACTORY.values().forEach(sf -> {
         try { sf.close(); } catch (Exception ignored) { /* best-effort */ }
      });
      SESSION_FACTORY.clear();
      if (SESSION_FACTORY_IGRP != null)
         try { SESSION_FACTORY_IGRP.close(); } catch (Exception ignored) { /* best-effort */ }
   }

   // -------------------------------------------------------------------------
   // Internal factory builder
   // -------------------------------------------------------------------------

   private static SessionFactory buildSessionFactory(String cfgName) {
      try {
         final ServiceRegistry serviceRegistry;
         if (cfgName.startsWith(ConfigApp.getInstance().getBaseConnection()))
            serviceRegistry = REGISTRY_BUILDER_IGRP.build();
         else
            serviceRegistry = getServiceRegistryBuilder(cfgName).build();

         return new Configuration().buildSessionFactory(serviceRegistry);

      } catch (Exception ex) {
         LOG.error("SessionFactory creation failed for '{}'.", cfgName, ex);
         throw new ExceptionInInitializerError(ex);
      }
   }

   // -------------------------------------------------------------------------
   // Settings / registry helpers
   // -------------------------------------------------------------------------

   public static Map<String, Object> getSettings() {
      return HibernateUtils.REGISTRY_BUILDER_IGRP.getSettings();
   }

   private static StandardServiceRegistryBuilder getServiceRegistryBuilder(String cfgName) {
      final Properties props = getProperties(cfgName.replace(SUFIX_HIBERNATE_CONFIG, ".properties"));

      // Derive a readable pool name from the cfg file name, e.g.:
      // "oracle-app.dad1.cfg.xml" → "HikariPool-oracle-app.dad1"
      final String poolName = "HikariPool-" + cfgName.replace(SUFIX_HIBERNATE_CONFIG, "");
      props.setProperty("hibernate.hikari.poolName", poolName);

      return new StandardServiceRegistryBuilder()
              .applySettings(props)
              .configure(cfgName);
   }

   public static Map<String, Object> getSettings(String cfgName) {
      return getServiceRegistryBuilder(cfgName).getSettings();
   }

   // -------------------------------------------------------------------------
   // Driver management
   // -------------------------------------------------------------------------

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

   // -------------------------------------------------------------------------
   // Properties loader
   // -------------------------------------------------------------------------

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

   private static void processEnvironmentVariables(Properties properties) {
      if (!ConfigCommonMainConstants.isEnvironmentVariableScanActive())
         return;

      LOG.info("Loading environment variables for database access...");

      for (String propertyKey : properties.stringPropertyNames()) {
         String propertyValue = properties.getProperty(propertyKey);
         if (isEnvVariableFormat(propertyValue)) {
            String envName = propertyValue.substring(2, propertyValue.length() - 1);
            String envValue = System.getenv(envName);
            if (envValue != null)
               properties.setProperty(propertyKey, envValue.trim());
            else
               LOG.error("Environment Variable: {} not found", envName);
         }
      }
   }

   private static boolean isEnvVariableFormat(String propertyValue) {
      return propertyValue != null
              && propertyValue.startsWith("${")
              && propertyValue.endsWith("}");
   }

   // -------------------------------------------------------------------------
   // Audit context helpers — unchanged logic, kept as-is
   // -------------------------------------------------------------------------

   public static void setSessionAudit(Session s) {
      final String hcdc = (String) s.getSessionFactory().getProperties()
              .get("hibernate.connection.driver_class");
      if (hcdc.contains("postgresql")) {
         final User currentUser = Core.getCurrentUser();
         s.doWork(connection -> {
            if (currentUser != null) {
               setAuditContext(connection, "audit.AUDIT_USER_CONTEXT", currentUser.getEmail());
               setAuditContext(connection, "audit.AUDIT_USER_ID", currentUser.getId() + "");
            } else {
               setAuditContext(connection, "audit.AUDIT_USER_CONTEXT", "anonymous@igrp");
               setAuditContext(connection, "audit.AUDIT_USER_ID", "0");
            }
            if (null != Igrp.getInstance() && null != Igrp.getInstance().getRequest())
               setAuditContext(connection, "audit.AUDIT_USER_IP",
                       Igrp.getInstance().getRequest().getRemoteAddr());
         });
      }
   }

   public static void setSessionAudit(java.sql.Connection connection, StringBuilder parsedQuery) {
      try {
         String databaseType = connection.getMetaData().getDatabaseProductName().toLowerCase();
         if (databaseType.contains("postgresql")) {
            final User currentUser = Core.getCurrentUser();
            if (currentUser != null) {
               parsedQuery.append(String.format(
                       "SET session audit.AUDIT_USER_CONTEXT = '%s'; ", currentUser.getEmail()));
               parsedQuery.append(String.format(
                       "SET session audit.AUDIT_USER_ID = '%s'; ", currentUser.getId() + ""));
            } else {
               parsedQuery.append("SET session audit.AUDIT_USER_CONTEXT = 'anonymous@igrp'; ");
               parsedQuery.append("SET session audit.AUDIT_USER_ID = '0'; ");
            }
            if (null != Igrp.getInstance() && null != Igrp.getInstance().getRequest()) {
               parsedQuery.append(String.format(
                       "SET session audit.AUDIT_USER_IP = '%s'; ",
                       Igrp.getInstance().getRequest().getRemoteAddr()));
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

   private static void setAuditContext(Connection connection, String settingName, String settingValue)
           throws SQLException {
      final String sql = String.format("SET session %s = '%s'", settingName, settingValue);
      try (PreparedStatement stmt = connection.prepareStatement(sql)) {
         stmt.execute();
      }
   }
}