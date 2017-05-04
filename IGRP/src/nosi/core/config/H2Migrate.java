package nosi.core.config;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import nosi.core.webapp.Igrp;

/**
 * @author Marcel Iekiny
 * May 3, 2017
 */
public class H2Migrate {

	public static void createIgrpSchema() throws IOException{
		/*
		 * Load H2 Igrp DB Schema  (Begin)
		 * */
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/db/h2.sql");
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
		
	}
	
}
