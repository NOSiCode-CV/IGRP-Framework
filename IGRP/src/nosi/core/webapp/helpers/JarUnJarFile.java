/**
 * @author: Emanuel Pereira
 * 
 * June 06, 2017
 *
 * Description: save files in jar format and read extract on far format
 */

package nosi.core.webapp.helpers;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;

import javax.servlet.http.Part;

import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;

public class JarUnJarFile {
	
	//save data to jar format
	public static boolean saveJarFiles(String jarName,Map<String,String>files,int level){
		boolean result = false;
		jarName = jarName.endsWith(".jar")?jarName:(jarName+".jar");
		if(files.size() > 0 && (level >= 0 && level <= 9))
		try{
			FileOutputStream fos = new FileOutputStream(jarName);
			CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());
			JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos));
			Set<Entry<String, String>> entry = files.entrySet();
			for(Entry<String,String> e:entry){
				JarEntry je = new JarEntry(e.getKey());
				jos.putNextEntry(je);
				FileInputStream fis = new FileInputStream(e.getValue());
				for(int r=fis.read();r!=-1;r=fis.read()){
					jos.write(r);
				}
				fis.close();
			}
			jos.close();
			result = true;
		}catch(IOException e){
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	//Extract files jar format
	public static List<FileOrderCompile> getJarFiles(String jarName){
		List<FileOrderCompile> contents = null;
		if(jarName.contains(".jar")){
			try{
				contents = new ArrayList<>();
				FileInputStream fis = new FileInputStream(jarName);
				CheckedInputStream cis = new CheckedInputStream(fis, new Adler32());
				JarInputStream jis = new JarInputStream(new BufferedInputStream(cis));
				JarEntry entry = null;
				while((entry=jis.getNextJarEntry())!=null){	
					   String         ls = System.getProperty("line.separator");
					   String         line = null;
					   DataInputStream in = new DataInputStream(jis); 
					   StringBuilder content = new StringBuilder();  
					   BufferedReader d = new BufferedReader(new InputStreamReader(in));
					   while((line=d.readLine())!=null){
					   	content.append(line);
					   	content.append(ls);
					   }
					   int order = 1;
					   if(entry.getName().toLowerCase().endsWith("View.java")){
					   		order = 2;
					   }else if(entry.getName().toLowerCase().endsWith("Controller.java")){
					   		order = 3;
					   }else if(entry.getName().toLowerCase().endsWith(".xml") || entry.getName().toLowerCase().endsWith(".json") || entry.getName().toLowerCase().endsWith(".xsl")){
						   order = -1;
					   }
					   FileOrderCompile f = new ImportExportApp().new FileOrderCompile(entry.getName(), content.toString(), order);
					contents.add(f);
					jis.closeEntry();
				}
				jis.close();
				fis.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		Collections.sort(contents);
		return contents;
	}
	

	//Extract files jar format
	public static List<FileOrderCompile> getJarFiles(Part file){
		List<FileOrderCompile> contents = null;
		try{
			contents = new ArrayList<>();
			CheckedInputStream cis = new CheckedInputStream(file.getInputStream(), new Adler32());
			JarInputStream jis = new JarInputStream(new BufferedInputStream(cis));
			JarEntry entry = null;
			while((entry=jis.getNextJarEntry())!=null){	
				   String         ls = System.getProperty("line.separator");
				   String         line = null;
				   DataInputStream in = new DataInputStream(jis); 
				   StringBuilder content = new StringBuilder();  
				   BufferedReader d = new BufferedReader(new InputStreamReader(in));
				   while((line=d.readLine())!=null){
				   	content.append(line);
				   	content.append(ls);
				   }
				   int order = 1;
				   if(entry.getName().endsWith("View.java")){
				   		order = 2;
				   }
				   if(entry.getName().endsWith("Controller.java")){
				   		order = 3;
				   }
				   if(entry.getName().startsWith("configApp")){
					   order = 4;
				   }
				   if(entry.getName().startsWith("configPage")){
					   order = 5;
				   }
				   if(entry.getName().endsWith(".xml") || entry.getName().endsWith(".json") || entry.getName().endsWith(".xsl")){
					   order = 6;
				   }
				   FileOrderCompile f = new ImportExportApp().new FileOrderCompile(entry.getName(), content.toString(), order);
				contents.add(f);
				jis.closeEntry();
			}
			jis.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		Collections.sort(contents);
		return contents;
	}
}
