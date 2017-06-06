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
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
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
	public static void saveJarFiles(String jarName,HashMap<String,String>files,int level){
		if(jarName.contains(".jar") && files.size() > 0 && (level >= 0 && level <= 9))
		try{
			FileOutputStream fos = new FileOutputStream(jarName);
			CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());
			JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos));
			Set<Entry<String, String>> entry = files.entrySet();
			for(Entry<String,String> e:entry){
				JarEntry je = new JarEntry(e.getValue());
				jos.putNextEntry(je);
				FileInputStream fis = new FileInputStream(e.getKey());
				for(int r=fis.read();r!=-1;r=fis.read()){
					jos.write(r);
				}
				fis.close();
			}
			jos.close();
		}catch(IOException e){
			e.printStackTrace();
		}
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
					byte data[] = new byte[2048];
					String content = "";
					while((jis.read(data))!=-1){
				        String st = new String(data);
				        content+=st;
					}
					contents.put(entry.getName(), content);
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
