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
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;

public class JarUnJarFile {
	
	//save data to jar format
	public static boolean saveJarFiles(String jarName,Map<String,String>files,int level){
		boolean result = false;
		if(jarName.contains(".jar") && files.size() > 0 && (level >= 0 && level <= 9))
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
	public static HashMap<String,String> getJarFiles(String jarName){
		HashMap<String,String> contents = null;
		if(jarName.contains(".jar")){
			try{
				contents = new HashMap<>();
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
					contents.put(entry.getName(), content.toString());
					jis.closeEntry();
				}
				jis.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return contents;
	}
}
