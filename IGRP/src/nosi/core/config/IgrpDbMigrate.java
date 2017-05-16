package nosi.core.config;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import nosi.core.webapp.Igrp;

/**
 * @author Marcel Iekiny
 * May 3, 2017
 */
public class IgrpDbMigrate {

	// H2
	public static void createIgrpSchemaH2(Connection conn) throws IOException{
		/*
		 * Load H2 Igrp DB Schema  (Begin)
		 * */
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/db/schema/h2.sql");
		File file = new File(path);
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		String content = "";
		String aux;
		while((aux = in.readLine()) != null)
			content += aux + System.lineSeparator();
		in.close();
		String []arrayHelper = content.split("\\[SPLIT\\]");
		String ddl = "";
		String dml = "";
		if(arrayHelper != null && arrayHelper.length == 2){
			 ddl = arrayHelper[0];
			 dml = arrayHelper[1]; // For insert data
		}
		/*
		 * Create Igrp DB Schema (Begin)
		 * */
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean result = false;
		try {
			Statement s1 = conn.createStatement();
			result = s1.execute(ddl);
			conn.commit();
			s1.close();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		Statement s2;
		int r = 0;
		
		try {
			s2 = conn.createStatement();
			ResultSet rs1 = s2.executeQuery("select * from glb_t_user");
			if(!rs1.next()){
				r = s2.executeUpdate(dml);
			}
			conn.commit();
		s2.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		/*
		 * */
	}
	
	// MySQL
	public static void createIgrpSchemaMySql(Connection conn) throws IOException{
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/db/schema/mysql.sql");
		File file = new File(path);
		DataInputStream in = null;
		try {
			in = new DataInputStream(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String content = "";
		String aux;
		while((aux = in.readLine()) != null)
			content += aux + System.lineSeparator();
		in.close();
		String []arrayHelper = content.split("\\[SPLIT\\]");
		String ddl = "";
		String dml = "";
		if(arrayHelper != null && arrayHelper.length == 2){
			 ddl = arrayHelper[0];
			 dml = arrayHelper[1]; // For insert data
		}
	}
	
	// Postgres
	public static void createIgrpSchemaPostgres(Connection conn){
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/db/schema/postgres.sql");
	}
	
}
