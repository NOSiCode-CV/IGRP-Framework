/**
 * @author: Emanuel Pereira
 * 
 * Apr 24, 2017
 *
 * Description: class to operation files and directories
 */

package nosi.core.webapp.helpers;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.Part;


public class FileHelper {

	//COnverte file to string
	public static String convertToString(Part file) throws IOException{
		if(file!=null){
			InputStream is = file.getInputStream();		   
		    StringBuilder  code = new StringBuilder();
		    String         ls = System.getProperty("line.separator");
		    String         line = null;
		    DataInputStream in = new DataInputStream(is);   
		    BufferedReader d = new BufferedReader(new InputStreamReader(in));
		   try {
		        while((line = d.readLine()) != null) {
		            code.append(line);
		            code.append(ls);
		        }
		        is.close();
		        in.close();
		        d.close();
		    } finally {
		    	is.close();
		        in.close();
		        d.close();
		    }
		   return code.toString();
		}
		return null;
	}
	
	//Save file in a specific directory
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
	
	//Create directories
	public static boolean createDiretory(String path){
		Path dir = Paths.get(path);
		try {
			if(!Files.exists(dir)){
				Files.createDirectories(dir);
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}	
	
	public static boolean fileExists(String fileName){
		Path dir = Paths.get(fileName);
		return Files.exists(dir);
	}
	
	//Read file and return your content
	public static String readFile(String basePath,String fileName){
		StringBuilder  code = new StringBuilder();
		fileName = basePath+"/"+fileName;
		if(fileExists(fileName)){
			try {
				InputStream is = new FileInputStream(new File(fileName));				
			    String         ls = System.getProperty("line.separator");
			    String         line = null;
			    DataInputStream in = new DataInputStream(is);   
			    BufferedReader d = new BufferedReader(new InputStreamReader(in));
			    while((line=d.readLine())!=null){
			    	code.append(line);
			    	code.append(ls);
			    }
			    is.close();
			    in.close();
			    d.close();
			} catch (IOException e) {
				System.err.println(e.getMessage());
			}
		}else{
			System.err.println("File not found");
		}
		return code.toString();
	}
}
