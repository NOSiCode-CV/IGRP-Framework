/**
 * @author: Emanuel Pereira
 * 
 * Apr 24, 2017
 *
 * Description: class to operation files and directories
 */

package nosi.core.webapp.helpers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;

import javax.servlet.http.Part;

import nosi.core.config.Config;

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
	
	//Compile files and saves
	public static boolean compile(String pathDestination,String className){
		className = pathDestination+"/"+className;
		return com.sun.tools.javac.Main.compile(new String[]{"-classpath",Config.getBasePathClass(),"-d",Config.getBasePathClass(),className}) == 0;
	}
	
	public static boolean fileExists(String fileName){
		Path dir = Paths.get(fileName);
		return Files.exists(dir);
	}
	
	public static void saveJarFiles(String jarName,String[] files,int level) throws IOException{
		if(jarName.contains(".jar") && files.length>0 && (level>=0 && level<=9)){
			try {
				FileOutputStream fos = new FileOutputStream(jarName);
				CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());
				JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos));
				jos.setLevel(level);
				for(String file:files){
					JarEntry je = new JarEntry(file);
					jos.putNextEntry(je);	
					FileInputStream fis = new FileInputStream(file);
					for(int c=fis.read(); c!=-1;c=fis.read()){
						jos.write(c);
					}
					fis.close();
				}
				jos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
	}
	
	public static void unjarFiles(String fileZip){
		if(fileZip.contains(".jar")){
			try{
				FileInputStream fis = new FileInputStream(fileZip);
				CheckedInputStream cis = new CheckedInputStream(fis, new Adler32());
				JarInputStream jis = new JarInputStream(new BufferedInputStream(cis));
				ZipEntry entry = null;
				while((entry = jis.getNextJarEntry())!=null){
					System.out.println(entry.getTime());
				}
				jis.close();
			}catch(IOException e){
				
			}			
		}
	}
}
