package nosi.core.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import nosi.core.webapp.Component;
/**
 * @author Marcel Iekiny
 * Apr 16, 2017
 */
public class IgrpDb implements Component{
	
	/*
	 * This class implement the "FlyWeigth" Design Pattern ...
	 * */
	
	private static Map<String, Db> conns = new HashMap<String, Db>(); // A pool of connections
	
	public IgrpDb(){
		
	}
	
	private class Db{
		
		private String driverName;
		private String connectionName;
		
		private String username;
		private String password;
		private String dbName;
		
		private String hostName;
		private int hostPort;
		
		private Connection conn;
		
		private String dbmsName;
		
		
		public Db(String hostName, int hostPort, String dbName, String username, String password){
			this.hostName = hostName;
			this.hostPort = hostPort;
			this.dbName = dbName;
			this.username = username;
			this.password = password;
		}
		
		public Db(String dbName, String username, String password){
			this("localhost", 0, dbName, username, password);
		}
		
		public void newConnection(String dbmsName){
		
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
					this.conn = DriverManager.getConnection(this.connectionName, this.username, this.password);
					this.dbmsName = dbmsName;
					System.out.println("Connection is ok ...");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				
		}
		
		public void closeConnection(){
			try {
				if(!this.conn.isClosed())
					this.conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public Connection getConnection(){
			return this.conn;
		}
		
	}
	
	public Connection unwrap(String connectionName){
		return this.conns.get(connectionName).getConnection();
	}

	@Override
	public void init() { // Defaults connections ...
		this.newConnection("db1", "db_igrp", "imarcelf", "");// Connection to PostgreSQL (default)
	}
	
	public void newConnection(String connectionName,String dbName, String username, String password){
		Db db = new Db(dbName, username, password);
		db.newConnection(dbName);
		if(db.getConnection() != null)
			IgrpDb.conns.put(connectionName, db);
	}
	
	public void newConnection(String hostName, int hostPort, String connectionName, String dbName, String username, String password){
		Db db = new Db(hostName, hostPort, dbName, username, password);
		db.newConnection(dbName);
		if(db.getConnection() != null)
			IgrpDb.conns.put(connectionName, db);
	}

	@Override
	public void destroy() { // Close all connection
		Iterator<Db> i = IgrpDb.conns.values().iterator();
		try {
			while(i.hasNext())
			if(!i.next().getConnection().isClosed())
				i.next().getConnection().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	IgrpDb.conns.clear(); // Clear all connection
	}
}
