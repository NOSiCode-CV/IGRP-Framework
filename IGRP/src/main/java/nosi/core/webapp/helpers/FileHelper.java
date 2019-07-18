package nosi.core.webapp.helpers;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Predicate;
import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import org.apache.commons.io.FileUtils;
import nosi.core.webapp.Core;


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

	public static byte[] convertInputStreamToByte(InputStream inputStream) throws IOException {
		 ByteArrayOutputStream output = new ByteArrayOutputStream();
		 int length;
		 byte[] imageBytes = new byte[inputStream.available()];
	     while ((length = inputStream.read(imageBytes)) != -1){
	        output.write(imageBytes, 0, length);
	     }
		 byte[] b = output.toByteArray();
		 inputStream.close();
	     output.close();
		return b ;
	}
	
	public static String convertInputStreamToBase64(InputStream inputStream) throws IOException {
		return Base64.getEncoder().encodeToString(convertInputStreamToByte(inputStream));
	}
	
	public static String convertInputStreamToBase64(byte[] bytes) throws IOException {
		return Base64.getEncoder().encodeToString(bytes);
	}
	/*public static void reset(){
		files = new HashMap<>();
	}*/
	
	public Map<String,String> readAllFileDirectory(String path){
		if(FileHelper.fileExists(path)){
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();
		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isDirectory()) 
		         this.listFilesDirectory(path+listOfFiles[i].getName());
		      else
		    	  this.files.put(listOfFiles[i].getName(), listOfFiles[i].getAbsolutePath());
		    }
		    return this.files;
			}
		return null;
	}
	
	public static InputStream convertStringToInputStream(String value) throws UnsupportedEncodingException {
		return new ByteArrayInputStream(value.getBytes(FileHelper.ENCODE_UTF8));
	}
	
	//Converte file to string 
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
		    } finally {
		    	is.close();
		        in.close();
		        d.close();
		        file.delete();
		    }
		   return code.toString();
		}
		return null;
	}

	//Converte InputStream to String
	public static String convertToString(InputStream inputStream) throws IOException{
		if(inputStream!=null){   
		    StringBuilder  code = new StringBuilder();		    
		    String         ls = System.getProperty("line.separator");
		    String         line = null;
		    DataInputStream in = new DataInputStream(inputStream);   
		    BufferedReader d = new BufferedReader(new InputStreamReader(in));
		   try {
		        while((line = d.readLine()) != null) {
		            code.append(line);
		            code.append(ls);
		        }
		    }catch(Exception e) {
		    	e.printStackTrace();
		    } finally {
		    	inputStream.close();
		        in.close();
		        d.close();
		    }
		   return code.toString();
		}
		return null;
	}
	//Save file in a specific directory
	public static boolean save(String path,String file_name,String data,String encode_in,String encode_out)  throws IOException{	
		boolean isSaved = true;
		String fileName = path+(file_name!=null?(File.separator+file_name):"");
		File file = new File(fileName);	
		try {
			FileHelper.createDiretory(path);
			if(Core.isNotNull(encode_in))
				FileUtils.writeByteArrayToFile(file,data.getBytes(encode_in));
			else
				FileUtils.writeByteArrayToFile(file,data.getBytes());
				
		} catch (IOException e) {
			isSaved = false;
			e.printStackTrace();
		}
		return isSaved;				
	}
	
	//Save file in a specific directory
	public static boolean save(String path,String file_name,String data)  throws IOException{	
		return FileHelper.save(path, file_name, data, null, null);			
	}
		
	//Write data using default encode UTF-8
	public static boolean save(String path,String filename,Part file) throws IOException{
		return FileHelper.save(path,filename,convertToString(file));
	}
	
	//Write data using default encode UTF-8
	public static boolean saveFile(String path,String filename,Part file) throws IOException{
		return FileHelper.saveFile(path, filename, file, ENCODE_UTF8,ENCODE_UTF8);
	}
	
	public static boolean saveFile(String path,String filename,Part file,String encode_in,String encode_out) throws IOException{
		boolean isSaved = true;
		String fileName = path+(filename!=null?(File.separator+filename):"");
		try {			
			FileHelper.createDiretory(path);		
			FileUtils.writeByteArrayToFile(new File(fileName),FileHelper.convertInputStreamToByte(file.getInputStream()));
		} catch (IOException e) {
			e.printStackTrace();
			isSaved = false;
		}
		return isSaved;
	}
	
	
	//save image using default encode UTF-8
	public static boolean saveImage(String path,String filename,String formatName,Part file) throws IOException{
		return saveImage(path, filename, formatName, file, ENCODE_UTF8,ENCODE_UTF8);
	}
	
	public static boolean saveImage(String path,String filename,String formatName,Part filePart,String encode_in,String encode_out) throws IOException{
		FileHelper.createDiretory(path);
		boolean isSaved = true;
		BufferedImage bImage = null;
		try {
			 String fileName = path+(filename!=null?(File.separator+filename):"");
			 File file = new File(fileName);
			 bImage = ImageIO.read(filePart.getInputStream());
			 ImageIO.write(bImage, formatName,file);
			 bImage.flush();
		}catch(IOException e) {
			isSaved = false;
			e.printStackTrace();
		}
		return isSaved;
	}
		
	//Create directories
	public static boolean createDiretory(String path){
		Path dir = Paths.get(path);
		try {
			if(!Files.exists(dir)){
				FileUtils.forceMkdir(new File(path));
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
		String  code = new String();
		String file = fileName;
		if(Core.isNotNull(file))
			file = basePath+File.separator+fileName;
		else
			file = basePath;
		if(fileExists(file)){
			try {
				code = FileUtils.readFileToString(new File(file),ENCODE_UTF8);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return code.toString();
	}
	
	
	//Read file and return your content
	public static String readImage(String basePath,String fileName){
		return FileHelper.readFile(basePath, fileName);
	}
	
	public static String readFileFromServer(String basePath,String fileName){
		return FileHelper.readFile(basePath, fileName);
	}
	
	
	public static boolean renameFile(String classPath, String oldName, String newName) throws IOException {
		Path pathFile = Paths.get(classPath + oldName);
		if(Files.move(pathFile, pathFile.resolveSibling(newName))!=null)
			return true;
		else 
			return false;
	}

	public static File saveFilesJavaControllerAndReplace(String classPath,String fileName,String content) {
		try {
			FileHelper.save(classPath, fileName+"Controller.java", content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new File(classPath+File.separator +fileName+"Controller.java");
	}
	
	public static File saveFilesJavaAndNotReplace(String classPath,String fileName,String content) {
		try {
			if(!fileExists(classPath+File.separator+ fileName+".java"))
				FileHelper.save(classPath, fileName+".java", content);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new File(classPath+File.separator +fileName+".java");
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
	
	//Save files json, xml and xsl of the page
	public static boolean saveFilesPageConfig(String path,String page,String[] content) throws IOException{
		boolean r = FileHelper.save(path,page+".xml",content[0]) && // Save xml;
			   FileHelper.save(path,page+".xsl",content[1]) && //Save xsl
			   FileHelper.save(path,page+".json",content[2]); // save json
		return r;
	}
	
	public static boolean saveFilesJava(String path,String page,String[] content) throws IOException{
 		return FileHelper.save(path,page+".java",content[0]) && // Save Model;	 
 			   FileHelper.save(path,page+"View.java",content[1]) && //Save View  
 			   FileHelper.save(path,page+"Controller.java",content[2]); // save controller
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
	
	public static boolean saveFilesJava(String path, String page, String[] content, String encode_in,String encode_out) throws IOException {
		boolean r = FileHelper.save(path,page+".java",content[0],encode_in,encode_out) && // Save Model;
				   FileHelper.save(path,page+"View.java",content[1],encode_in,encode_out) && //Save View
				   FileHelper.save(path,page+"Controller.java",content[2],encode_in,encode_out); // save controller
			return r;
	}
	
	public static boolean saveFilesJava(String path, String page, Part[] content, String encode_in,String encode_out) throws IOException {
		boolean r = FileHelper.saveFile(path,page+".java",content[0],encode_in,encode_out) && // Save Model;
				   FileHelper.saveFile(path,page+"View.java",content[1],encode_in,encode_out) && //Save View
				   FileHelper.saveFile(path,page+"Controller.java",content[2],encode_in,encode_out); // save controller
			return r;
	}
}
