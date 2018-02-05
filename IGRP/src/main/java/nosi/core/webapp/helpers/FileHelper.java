package nosi.core.webapp.helpers;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Predicate;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;


public class FileHelper {

	private Map<String,String> files = new HashMap<>();
	public static final String ENCODE_UTF8 = "UTF-8";
	public static final String ENCODE_ISO = "ISO-8859-1";
	public static final String ENCODE_CP1252 = "Cp1252";
	
	
	public Map<String,String> listFilesDirectory(String path) {
		if(FileHelper.fileExists(path)){
			File folder = new File(path);
		    for (final File fileEntry : folder.listFiles()) {
		        if (fileEntry.isDirectory()) {
		            return listFilesDirectory(fileEntry.toString());
		        } else {
		        	this.files.put(fileEntry.getName(), fileEntry.getAbsolutePath());
		        }
		    }
		    return this.files;
			}
		return null;
	}

	/*public static void reset(){
		files = new HashMap<>();
	}*/
	
	public Map<String,String> readAllFileDirectory(String path){
		if(FileHelper.fileExists(path)){
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();
		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isDirectory()) {
		         this.listFilesDirectory(path+listOfFiles[i].getName());
		      }
		    }
		    return this.files;
			}
		return null;
	}
	
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

	//Converte InputStream to String
	public static String convertToString(InputStream file) throws IOException{
		if(file!=null){   
		    StringBuilder  code = new StringBuilder();		    
		    String         ls = System.getProperty("line.separator");
		    String         line = null;
		    DataInputStream in = new DataInputStream(file);   
		    BufferedReader d = new BufferedReader(new InputStreamReader(in));
		   try {
		        while((line = d.readLine()) != null) {
		            code.append(line);
		            code.append(ls);
		        }
		        file.close();
		        in.close();
		        d.close();
		    } finally {
		    	file.close();
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
				File file = new File(path+File.separator+file_name);
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
	
	//Write data using default encode UTF-8
	public static boolean save(String path,String filename,Part file) throws IOException{
		return save(path,filename,convertToString(file));
	}
	
	//Write data using default encode UTF-8
	public static boolean saveFile(String path,String filename,Part file) throws IOException{
		return saveFile(path, filename, file, ENCODE_UTF8,ENCODE_UTF8);
	}
	
	public static boolean saveFile(String path,String filename,Part file,String encode_in,String encode_out) throws IOException{
		createDiretory(path);
		OutputStream out = null;
		InputStream filecontent = file.getInputStream();
		boolean isSaved = false;
		try {
	        out = new FileOutputStream(new File(path + File.separator+ filename));
			BufferedReader d = new BufferedReader(new InputStreamReader(filecontent,encode_in));
			Writer       outputStreamWriter = new OutputStreamWriter(out, encode_out);
			StringBuilder  code = new StringBuilder();
			String         ls = System.getProperty("line.separator");
		    String         line = null;
	        while((line = d.readLine()) != null) {
	            code.append(line);
	            code.append(ls);
	        }
	        outputStreamWriter.write(code.toString());
	        d.close();
	        outputStreamWriter.close();
	        isSaved = true;
	    } catch (FileNotFoundException e) {
	    	isSaved = false;
	    	System.err.println(e.getMessage());
	    } finally {
	        if (out != null) {
	            out.close();
	        }
	        if (filecontent != null) {
	            filecontent.close();
	        }
	    }
		return isSaved;
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
		if(Core.isNotNull(fileName)) {
			Path dir = Paths.get(fileName);
			return Files.exists(dir);
		}
		return false;
	}

	public static boolean dirExists(String dirName){
		return fileExists(dirName);
	}
	
	//Read file and return your content
	public static String readFile(String basePath,String fileName){
		StringBuilder  code = new StringBuilder();
		fileName = basePath+File.separator+fileName;
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
		}
		return code.toString();
	}
	
	public static String readFileFromServer(String basePath,String fileName){
		StringBuilder  code = new StringBuilder();
		fileName = basePath+File.separator+fileName;
		if(fileExists(fileName)) {
			try {
				ServletContext context = Igrp.getInstance().getServlet().getServletContext();
				InputStream is = context.getResourceAsStream(fileName);			
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
		}
		return code.toString();
	}
	
	//Save MVC code java
	public static boolean saveFilesJava(String path,String page,Part[] content) throws IOException{
		boolean r = FileHelper.saveFile(path,page+".java",content[0]) && // Save Model;
			   FileHelper.saveFile(path,page+"View.java",content[1]) && //Save View
			   FileHelper.saveFile(path,page+"Controller.java",content[2]); // save controller
		return r;
	}
	
	//Save files json, xml and xsl of the page
	public static boolean saveFilesPageConfig(String path,String page,Part[] content) throws IOException{
		boolean r = FileHelper.saveFile(path,page+".xml",content[0]) && // Save xml;
			   FileHelper.saveFile(path,page+".xsl",content[1]) && //Save xsl
			   FileHelper.saveFile(path,page+".json",content[2]); // save json
		return r;
	}
	
	public static boolean saveFilesJava(String path,String page,String[] content) throws IOException{
 		return FileHelper.save(path,page+".java",content[0]+"*/") && // Save Model;		 
 			   FileHelper.save(path,page+"View.java","/*"+content[1]+"*/") && //Save View		 
 			   FileHelper.save(path,page+"Controller.java","/*"+content[2]); // save controller
  	}
	
	public static void deletePartFile(Part file) throws IOException{
		if(file!=null){
			file.delete();
		}
	}
	public static void deletePartFile(Part file,Predicate<Part> test) throws IOException{
		if(test.test(file)){
			file.delete();
		}
	}
	
	public static void deletePartFile(Collection<Part> files) throws IOException{
		for(Part file:files)
			deletePartFile(file);
	}

	public static void deletePartFile(Collection<Part> files,Predicate<Part> test) throws IOException{
		for(Part file:files){
			deletePartFile(file, test);
		}
	}

	public static boolean saveFilesJava(String path, String page, Part[] content, String encode_in,String encode_out) throws IOException {
		boolean r = FileHelper.saveFile(path,page+".java",content[0],encode_in,encode_out) && // Save Model;
				   FileHelper.saveFile(path,page+"View.java",content[1],encode_in,encode_out) && //Save View
				   FileHelper.saveFile(path,page+"Controller.java",content[2],encode_in,encode_out); // save controller
			return r;
	}
}
