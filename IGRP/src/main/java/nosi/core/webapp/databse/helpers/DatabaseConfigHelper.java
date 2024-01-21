package nosi.core.webapp.databse.helpers;

import static nosi.core.i18n.Translator.gt;

import java.util.LinkedHashMap;

/**
 * Emanuel
 * 8 Aug 2018
 */
public class DatabaseConfigHelper {


	public static final String POSTGRESQL = "postgresql";
	public static final String H2 = "h2";
	public static final String MYSQL = "mysql";
	public static final String ORACLE = "oracle";
	public static final String MSSQL = "mssql";
	public static final String HSQLDB = "hsqldb";
	public static final String SYBASE = "sybase";
	public static final String DERBY = "derby";
	public static final String IBM = "ibm";
	public static final String INFORMIX = "informix";
	public static final String MONGODB = "mongodb";
	public static final String OTHER = "other";
	
	public static String getUrl(String type, String host, String port, String db_name) {
       return switch (type) {
          case H2 -> host.equalsIgnoreCase("mem") ? ("jdbc:h2:" + host + ":" + db_name) : ("jdbc:h2:" + host + "/" + db_name);
          case MYSQL -> "jdbc:mysql://" + host + ":" + port + "/" + db_name;
          case POSTGRESQL -> "jdbc:postgresql://" + host + ":" + port + "/" + db_name;
          case ORACLE -> "jdbc:oracle:thin:@" + host + ":" + port + "/" + db_name;
          case MSSQL -> "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + db_name;
          case HSQLDB -> "jdbc:hsqldb:" + host + ":" + db_name;
          case SYBASE -> "jdbc:sybase:Tds:" + host + ":" + port + "/" + db_name;
          case DERBY -> "jdbc:derby:" + host + "/" + db_name + ";create=true";
          case IBM -> "jdbc:db2://" + host + ":" + port + "/" + db_name;
          case INFORMIX -> "jdbc:informix-sqli://" + host + ":" + port + "/" + db_name;
          default -> "";
       };
    }

	public static String getHibernateDialect(String type) {
       return switch (type.toLowerCase()) {
          case H2 -> "org.hibernate.dialect.H2Dialect";
          case MYSQL -> "org.hibernate.dialect.MySQLDialect";
          case POSTGRESQL -> "org.hibernate.dialect.PostgreSQLDialect";
          case ORACLE -> "org.hibernate.dialect.OracleDialect";
          case MSSQL -> "org.hibernate.dialect.SQLServerDialect";
          case HSQLDB -> "org.hibernate.dialect.HSQLDialect";
          case SYBASE -> "org.hibernate.dialect.SybaseASEDialect";
          case DERBY -> "org.hibernate.dialect.DerbyDialect";
          case IBM -> "org.hibernate.dialect.DB2Dialect";
          case INFORMIX -> "org.hibernate.dialect.InformixDialect";
          case MONGODB -> "org.hibernate.ogm.datastore.mongodb.MongoDBDialect";
          default -> "";
       };
    }
	
	public static String getUrlConnections(String dbType) {
       return switch (dbType.toLowerCase()) {
          case MYSQL -> "jdbc:mysql://[machine-name/ip]:3306/[database-name]";
          case POSTGRESQL -> "jdbc:postgresql://[host]:5432/[database-name]";
          case H2 -> "jdbc:h2:tcp:[host]:[port]/[database-name]";
          case ORACLE -> "jdbc:oracle:thin:@[host]:1521/[service_name]";
          case MSSQL -> "jdbc:sqlserver://[host]:1433;databaseName=[database-name]";
          case HSQLDB -> "jdbc:hsqldb:[path]";
          case SYBASE -> "jdbc:sybase:Tds:[host]:2048/[database-name]";
          case DERBY -> "jdbc:derby:[path-to-data-file]";
          case IBM -> "jdbc:db2:[database-name]";
          case INFORMIX -> "jdbc:informix-sqli://[host]:[port]/[database-name]:INFORMIXSERVER=[server-name]";
          case MONGODB ->
                  "mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]";
          default -> "";
       };
    }
	
	public static String getUrlConnectionsExamples(String dbType,String dbName) {
       return switch (dbType.toLowerCase()) {
          case MYSQL -> "jdbc:mysql://localhost:3306/" + dbName;
          case POSTGRESQL -> "jdbc:postgresql://localhost:5432/" + dbName;
          case H2 -> "jdbc:h2:tcp:men:/" + dbName;
          case ORACLE -> "jdbc:oracle:thin:@nosidev02.gov.cv:1521/" + dbName;
          case MSSQL -> "jdbc:sqlserver://localhost:1433;databaseName=" + dbName;
          case HSQLDB -> "jdbc:hsqldb:mem:" + dbName;
          case SYBASE -> "jdbc:sybase:Tds:localhost:2048/" + dbName;
          case DERBY -> "jdbc:derby:/home/test/databases/" + dbName + ";create=true";
          case IBM -> "jdbc:db2:" + dbName;
          case INFORMIX -> "jdbc:informix-sqli://localhost/" + dbName + ":INFORMIXSERVER=demo_on";
          case MONGODB -> "mongodb://localhost:27017/?gssapiServiceName=mongodb";
          default -> "";
       };
    }
	public static LinkedHashMap<String,String> getDatabaseTypes() {
		LinkedHashMap<String,String> dbTypes = new LinkedHashMap<>();
		dbTypes.put(null, gt("-- Selecionar --"));
		dbTypes.put(POSTGRESQL, "Postgresql");
		dbTypes.put(ORACLE, "Oracle");				
		dbTypes.put(MYSQL, "MySql");	
		dbTypes.put(MSSQL, "Microsoft SQL Server");
		dbTypes.put(H2, "H2");
		dbTypes.put(HSQLDB, "HSQLDB");
		dbTypes.put(SYBASE, "Sybase ASE");
		dbTypes.put(DERBY, "Apache Derby");
		dbTypes.put(IBM, "IBM DB2");
		dbTypes.put(INFORMIX, "Informix");	
//		dbTypes.put(MONGODB, "Mongo DB");		
		dbTypes.put(OTHER, "Outro");	
		
		return dbTypes;
	}

	
	public  static String getDatabaseDriversExamples(String dbType) {
       return switch (dbType.toLowerCase()) {
          case MYSQL -> "com.mysql.cj.jdbc.Driver";
          case POSTGRESQL -> "org.postgresql.Driver";
          case H2 -> "org.h2.Driver";
          case ORACLE -> "oracle.jdbc.OracleDriver";
          case MSSQL -> "com.microsoft.sqlserver.jdbc.SQLServerDriver";
          case HSQLDB -> "org.hsqldb.jdbcDriver";
          case SYBASE -> "com.sybase.jdbc3.jdbc.SybDriver";
          case DERBY -> "org.apache.derby.jdbc.EmbeddedDriver";
          case IBM -> "com.ibm.db2.jcc.DB2Driver";
          case INFORMIX -> "com.informix.jdbc.IfxDriver";
          default -> "";
       };
    }
	
}
