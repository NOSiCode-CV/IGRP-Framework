/**
 * @author: Emanuel Pereira
 * 
 * Apr 24, 2017
 *
 * Description: class to operation files and directories
 */

package nosi.core.webapp.helpers;

import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URISyntaxException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.annotation.Resources;
import javax.servlet.http.Part;

import nosi.core.config.Config;
import nosi.core.webapp.Igrp;

public class FileHelper {

	public static String convertToString(Part file) throws IOException{
		if(file!=null){
			InputStream fileContent1 = file.getInputStream();		   
		    StringBuilder  stringBuilder = new StringBuilder();
		    String         ls = System.getProperty("line.separator");
		    String         line = null;
		    DataInputStream in = new DataInputStream(fileContent1);   
		   try {
		        while((line = in.readLine()) != null) {
		            stringBuilder.append(line);
		            stringBuilder.append(ls);
		        }	        
		    } finally {
		        in.close();
		    }
		   return stringBuilder.toString();
		}
		return null;
	}
	
	public static boolean save(String path,String file_name,String data) throws IOException{	
		createDiretory(path);
			BufferedWriter bw = null;
			FileWriter fw = null;
			try {
				File file = new File(path+"/"+file_name);
				// if file doesnt exists, then create it
				if (!file.exists()) {
					file.createNewFile();
				}
				// true = append file
				fw = new FileWriter(file.getAbsoluteFile(), false);
				bw = new BufferedWriter(fw);
				bw.write(data);
				return true;
			} catch (IOException e) {
				e.printStackTrace();	
			} finally {
				try {	
					if (bw != null)
						bw.close();	
					if (fw != null)
						fw.close();
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}		
		return false;
	}
	
	public static boolean save(String path,String filename,Part file) throws IOException{
		return save(path,filename,convertToString(file));
	}
	
	public static boolean createDiretory(String path){
		File dir = new File(path);
		boolean result = false;
		// if the directory does not exist, create it
		if (!dir.exists()) {
		    try{
		        dir.mkdir();
		        result = true;
		    } 
		    catch(SecurityException se){
		    }  
		}
		return result;
	}
}
