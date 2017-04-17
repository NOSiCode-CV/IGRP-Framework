package nosi.core.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * @author Marcel Iekiny
 * Apr 16, 2017
 */
public class IgrpDb {
	
	private String driverName;
	private String connectionName;
	
	private String username;
	private String password;
	private String dbName;
	
	private String hostName;
	private int hostPort;
	
	private Connection conn;
	
	private String dbmsName;
	
	
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
	
	public IgrpDb newConnection(String dbmsName){
	
		switch(dbmsName){
		
			case "mysql":
				
				this.driverName = "com.mysql.jdbc.Driver";
				this.connectionName = "jdbc:" + dbmsName + "://" + this.hostName + ":" + (this.hostPort == 0 ? "3306" : this.hostPort) + "/" + this.dbName;
				
			break;
				
			case "oracle":
				
				this.driverName = "oracle.jdbc.driver.OracleDriver";
				this.connectionName = "jdbc:oracle:thin:@" + this.hostName + ":" + (this.hostPort == 0 ? "8080" : this.hostPort) + ":" + this.dbName;
				
			break;
			
			case "PostgreSQL":	
			default: // Default connection
			
		}
		
			try {
				Class.forName(this.driverName);
				this.conn = DriverManager.getConnection(this.connectionName, this.username, this.password);
				this.dbmsName = dbmsName;
				System.out.println("Connection is ok ...");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			
		return this;
	}
	
	public Connection unwrap(){
		return this.conn;
	}
	
	// Para testar connections ...
	public static void main(String []args){
		//new IgrpDb("db_dc", "root", "").getConnection("mysql");
	}
	
}
