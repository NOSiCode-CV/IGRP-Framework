package nosi.core.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/**
 * @author Marcel Iekiny
 * Apr 16, 2017
 */
public class IgrpDb {
	
	/*
	 * This class implement the "FlyWeigth" Design Pattern ...
	 * */
	
	private String driverName;
	private String connectionName;
	
	private String username;
	private String password;
	private String dbName;
	
	private String hostName;
	private int hostPort;
	
	private static Map<String, Connection> conns = new HashMap<String, Connection>(); // A pool of connections
	
	private String dbmsName;
	
	public IgrpDb(){
		// Not set yet
	}
	
	public IgrpDb(String hostName, int hostPort, String dbName, String username, String password){
		this.hostName = hostName;
		this.hostPort = hostPort;
		this.dbName = dbName;
		this.username = username;
		this.password = password;
	}
	
	public IgrpDb(String dbName, String username, String password){
		this("localhost", 0, dbName, username, password);
	}
	
	private Connection newConnection(String dbmsName){
		
		Connection conn = null;
	
		switch(dbmsName){
		
			case "mysql":
				
				this.driverName = "com.mysql.jdbc.Driver";
				this.connectionName = "jdbc:" + dbmsName + "://" + this.hostName + ":" + (this.hostPort == 0 ? "3306" : this.hostPort) + "/" + this.dbName;
				
			break;
				
			case "oracle":
				
				this.driverName = "oracle.jdbc.driver.OracleDriver";
				this.connectionName = "jdbc:oracle:thin:@" + this.hostName + ":" + (this.hostPort == 0 ? "8080" : this.hostPort) + ":" + this.dbName;
				
			break;
			case "sqlite":
				this.driverName = "org.sqlite.JDBC";
				this.connectionName = "jdbc:sqlite:" + this.dbName;
			break;
			
			case "postgresql":	
			default: // Default connection
				this.driverName = "org.postgresql.Driver";
				this.connectionName = "jdbc:postgresql://" + this.hostName +  ":" + (this.hostPort == 0 ? "5432" : this.hostPort) + "/" + this.dbName;
			
			
		}
		
			try {
				Class.forName(this.driverName);
				conn = DriverManager.getConnection(this.connectionName, this.username, this.password);
				this.dbmsName = dbmsName;
				System.out.println("Connection is ok ...");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			
		return conn;
	}
	
	public Connection createUnwrap(String connectionName, String dbmsName){ // create or/and unwrap connection
		if(IgrpDb.conns.containsKey(connectionName))
			return IgrpDb.conns.get(connectionName);
		Connection conn = this.newConnection(dbmsName);
		IgrpDb.conns.put(connectionName, conn);
	return conn;
	}
	
	public Connection unwrap(String connectionName){
		return IgrpDb.conns.get(connectionName);
	}
	
	public void closeAllConnection(){
		Iterator<Connection> i = (Iterator<Connection>) IgrpDb.conns.values();
			try {
				while(i.hasNext())
				if(!i.next().isClosed())
					i.next().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		IgrpDb.conns.clear(); // Clear all connection
	}
	
	public void closeConnection(String connectionName){
		try {
			if(!IgrpDb.conns.get(connectionName).isClosed())
				IgrpDb.conns.get(connectionName).close();
			IgrpDb.conns.remove(connectionName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
