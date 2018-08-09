package nosi.core.webapp.databse.helpers;

import static nosi.core.i18n.Translator.gt;
import java.util.HashMap;
import java.util.Map;

/**
 * Emanuel
 * 8 Aug 2018
 */
public class DatabaseConfigHelper {


	public static String getUrl(String type, String host, String port, String db_name) {
		switch (type) {
			case "h2":
				return host.equalsIgnoreCase("mem") ? ("jdbc:h2:" + host + ":" + db_name): ("jdbc:h2:" + host + "/" + db_name);
			case "mysql":
				return "jdbc:mysql://" + host + ":" + port + "/" + db_name;
			case "postgresql":
				return "jdbc:postgresql://" + host + ":" + port + "/" + db_name;
			case "oracle":
				return "jdbc:oracle:thin:@" + host + ":" + port + "/" + db_name;
			case "mssql":
				return "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + db_name;
			case "hsqldb":
				return "jdbc:hsqldb:" + host + ":" + db_name;
			case "sybase":
				return "jdbc:sybase:Tds:" + host + ":" + port + "/" + db_name;
			case "derby":
				return "jdbc:derby:" + host + "/" + db_name + ";create=true";
			case "ibm":
				return "jdbc:db2://" + host + ":" + port +"/" + db_name;
			case "informix":
				return "jdbc:informix-sqli://" + host + ":" + port + "/" + db_name; //+ ":INFORMIXSERVER=demo_on";
		}
		return "";
	}

	public static String getHibernateDialect(String type) {
		switch (type.toLowerCase()) {
			case "h2":
				return "org.hibernate.dialect.H2Dialect";
			case "mysql":
				return "org.hibernate.dialect.MySQL5InnoDBDialect";
			case "postgresql":
				return "org.hibernate.dialect.PostgreSQLDialect";
			case "oracle":
				return "org.hibernate.dialect.OracleDialect";
			case "mssql":
				return "org.hibernate.dialect.SQLServerDialect";
			case "hsqldb":
				return "org.hibernate.dialect.HSQLDialect";
			case "sybase":
				return "org.hibernate.dialect.SybaseDialect";
			case "derby":
				return "org.hibernate.dialect.DerbyDialect";
			case "ibm":
				return "org.hibernate.dialect.DB2Dialect";
			case "informix":
				return "org.hibernate.dialect.InformixDialect";
		}
		return "";
	}
	
	public static String getUrlConnectionsExamples(String dbType) {
		switch (dbType.toLowerCase()) {
			case "mysql":
				return "jdbc:mysql://[machine-name/ip]:[3306]/[database-name]";
			case "postgresql":
				return "jdbc:postgresql://[host]:[port5432]/[database-name]";
			case "h2":
				return "jdbc:h2:tcp:[host]:[port]/[database-name]";
			case "oracle":
				return "jdbc:oracle:[drivertype]:[username/password]@[host]:[port]/[database-name]";
			case "mssql":
				return "jdbc:sqlserver://[host]:[port1433];databaseName=[database-name]";
			case "hsqldb":
				return "jdbc:hsqldb:[path]";
			case "sybase":
				return "jdbc:sybase:Tds:[host]:[port2048]/[database-name]";
			case "derby":
				return "jdbc:derby:[path-to-data-file]";
			case "ibm":
				return "jdbc:db2:[database-name]";
			case "informix":
				return "jdbc:informix-sqli://[host]:[port]/[database-name]:INFORMIXSERVER=[server-name]";
		}
		return "";		
	}
	

	public static Map<String,String> getDatabaseTypes() {
		Map<String,String> dbTypes = new HashMap<>();
		dbTypes.put(null, gt("-- Selecionar --"));
		dbTypes.put("h2", "H2");
		dbTypes.put("mysql", "MySql");
		dbTypes.put("postgresql", "Postgresql");
		dbTypes.put("oracle", "Oracle");
		dbTypes.put("mssql", "Microsoft SQL Server");
		dbTypes.put("hsqldb", "HSQLDB");
		dbTypes.put("sybase", "Sybase ASE");
		dbTypes.put("derby", "Apache Derby");
		dbTypes.put("ibm", "IBM DB2");
		dbTypes.put("informix", "Informix");
		return dbTypes;
	}

	
	public  static String getDatabaseDriversExamples(String dbType) {
		switch (dbType.toLowerCase()) {
			case "mysql":
				return "com.mysql.jdbc.Driver";
			case "postgresql":
				return "org.postgresql.Driver";
			case "h2":
				return "org.h2.Driver";
			case "oracle":
				return "oracle.jdbc.driver.OracleDriver";
			case "mssql":
				return "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			case "hsqldb":
				return "org.hsqldb.jdbcDriver";
			case "sybase":
				return "com.sybase.jdbc3.jdbc.SybDriver";
			case "derby":
				return "org.apache.derby.jdbc.EmbeddedDriver";
			case "ibm":
				return "com.ibm.db2.jcc.DB2Driver";
			case "informix":
				return "com.informix.jdbc.IfxDriver";
		}
		return "";
	}
	
}
