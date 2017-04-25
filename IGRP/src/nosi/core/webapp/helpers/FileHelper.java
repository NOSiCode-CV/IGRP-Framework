package nosi.core.webapp.helpers;

import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.Part;

public class FileHelper {

	public static String convertToString(Part file) throws IOException{
		if(file!=null){
			InputStream fileContent1 = file.getInputStream();		   
		    StringBuilder  stringBuilder = new StringBuilder();
		    String         ls = System.getProperty("line.separator");
		    String         line = null;
		    DataInputStream in = new DataInputStream(fileContent1);
		    String []splited=null;	   
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
	
	public static boolean save(String path,String text){
		return true;
	}
	
	public static boolean save(String path,Part file){
		return true;
	}
}
