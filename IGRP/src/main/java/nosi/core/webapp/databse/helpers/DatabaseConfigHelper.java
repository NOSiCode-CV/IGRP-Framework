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
	
	public static String getUrl(String type, String host, String port, String db_name) {
		switch (type) {
			case H2:
				return host.equalsIgnoreCase("mem") ? ("jdbc:h2:" + host + ":" + db_name): ("jdbc:h2:" + host + "/" + db_name);
			case MYSQL:
				return "jdbc:mysql://" + host + ":" + port + "/" + db_name;
			case POSTGRESQL:
				return "jdbc:postgresql://" + host + ":" + port + "/" + db_name;
			case ORACLE:
				return "jdbc:oracle:thin:@" + host + ":" + port + "/" + db_name;
			case MSSQL:
				return "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + db_name;
			case HSQLDB:
				return "jdbc:hsqldb:" + host + ":" + db_name;
			case SYBASE:
				return "jdbc:sybase:Tds:" + host + ":" + port + "/" + db_name;
			case DERBY:
				return "jdbc:derby:" + host + "/" + db_name + ";create=true";
			case IBM:
				return "jdbc:db2://" + host + ":" + port +"/" + db_name;
			case INFORMIX:
				return "jdbc:informix-sqli://" + host + ":" + port + "/" + db_name;
		}
		return "";
	}

	public static String getHibernateDialect(String type) {
		switch (type.toLowerCase()) {
			case H2:
				return "org.hibernate.dialect.H2Dialect";
			case MYSQL:
				return "org.hibernate.dialect.MySQL5InnoDBDialect";
			case POSTGRESQL:
				return "org.hibernate.dialect.PostgreSQLDialect";
			case ORACLE:
				return "org.hibernate.dialect.Oracle10gDialect";
			case MSSQL:
				return "org.hibernate.dialect.SQLServer2008Dialect";
			case HSQLDB:
				return "org.hibernate.dialect.HSQLDialect";
			case SYBASE:
				return "org.hibernate.dialect.SybaseDialect";
			case DERBY:
				return "org.hibernate.dialect.DerbyDialect";
			case IBM:
				return "org.hibernate.dialect.DB2Dialect";
			case INFORMIX:
				return "org.hibernate.dialect.InformixDialect";
			case MONGODB:
				return "org.hibernate.ogm.datastore.mongodb.MongoDBDialect";
		}
		return "";
	}
	
	public static String getUrlConnections(String dbType) {
		switch (dbType.toLowerCase()) {
			case MYSQL:
				return "jdbc:mysql://[machine-name/ip]:3306/[database-name]";
			case POSTGRESQL:
				return "jdbc:postgresql://[host]:5432/[database-name]";
			case H2:
				return "jdbc:h2:tcp:[host]:[port]/[database-name]";
			case ORACLE:
				return "jdbc:oracle:thin:@[host]:1521/[service_name]";
			case MSSQL:
				return "jdbc:sqlserver://[host]:1433;databaseName=[database-name]";
			case HSQLDB:
				return "jdbc:hsqldb:[path]";
			case SYBASE:
				return "jdbc:sybase:Tds:[host]:2048/[database-name]";
			case DERBY:
				return "jdbc:derby:[path-to-data-file]";
			case IBM:
				return "jdbc:db2:[database-name]";
			case INFORMIX:
				return "jdbc:informix-sqli://[host]:[port]/[database-name]:INFORMIXSERVER=[server-name]";
			case MONGODB:
				return "mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]";
		}
		return "";		
	}
	
	public static String getUrlConnectionsExamples(String dbType,String dbName) {
		switch (dbType.toLowerCase()) {
			case MYSQL:
				return "jdbc:mysql://localhost:3306/"+dbName;
			case POSTGRESQL:
				return "jdbc:postgresql://localhost:5432/"+dbName;
			case H2:
				return "jdbc:h2:tcp:men:/"+dbName;
			case ORACLE:
				return "jdbc:oracle:thin:@nosidev02.gov.cv:1521/"+dbName;
			case MSSQL:
				return "jdbc:sqlserver://localhost:1433;databaseName="+dbName;
			case HSQLDB:
				return "jdbc:hsqldb:mem:"+dbName;
			case SYBASE:
				return "jdbc:sybase:Tds:localhost:2048/"+dbName;
			case DERBY:
				return "jdbc:derby:/home/test/databases/"+dbName+";create=true";
			case IBM:
				return "jdbc:db2:"+dbName;
			case INFORMIX:
				return "jdbc:informix-sqli://localhost/"+dbName+":INFORMIXSERVER=demo_on";
			case MONGODB:
				return "mongodb://localhost:27017/?gssapiServiceName=mongodb";
		}
		return "";		
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
		
		return dbTypes;
	}

	
	public  static String getDatabaseDriversExamples(String dbType) {
		switch (dbType.toLowerCase()) {
			case MYSQL:
				return "com.mysql.jdbc.Driver";
			case POSTGRESQL:
				return "org.postgresql.Driver";
			case H2:
				return "org.h2.Driver";
			case ORACLE:
				return "oracle.jdbc.driver.OracleDriver";
			case MSSQL:
				return "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			case HSQLDB:
				return "org.hsqldb.jdbcDriver";
			case SYBASE:
				return "com.sybase.jdbc3.jdbc.SybDriver";
			case DERBY:
				return "org.apache.derby.jdbc.EmbeddedDriver";
			case IBM:
				return "com.ibm.db2.jcc.DB2Driver";
			case INFORMIX:
				return "com.informix.jdbc.IfxDriver";
		}
		return "";
	}
	
}
