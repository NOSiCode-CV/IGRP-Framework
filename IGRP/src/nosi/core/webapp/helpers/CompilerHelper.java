
/**
 * @author: Emanuel Pereira
 * 9 Jun 2017
 * 
 * Description: class to compiler and decompiler files java
 */

package nosi.core.webapp.helpers;
import java.io.File;

import jd.core.JavaDecompiler;
import nosi.core.config.Config;

public class CompilerHelper {

	//Compile files and saves
	private static String jars = "";
	
	public static boolean compile(String pathDestination,String className){
		className = pathDestination+"/"+className;
		listFilesForFolder(Config.getPathLib(),new File(Config.getPathLib()));
		return com.sun.tools.javac.Main.compile(new String[]{
				"-classpath",Config.getBasePathClass(),
				"-cp",jars+Config.getBasePathClass()+System.getProperty("path.separator"),
				"-d",Config.getBasePathClass(),
				className}) == 0;
	}
	
	public static void listFilesForFolder(String path,final File folder) {
	    for (final File fileEntry : folder.listFiles()) {
	        if (fileEntry.isDirectory()) {
	            listFilesForFolder(path,fileEntry);
	        } else {
	            jars += (path+(fileEntry.getName())+System.getProperty("path.separator"));
	        }
	    }
	}
	public static String decompile(String basePath,String className){
		JavaDecompiler jd = new JavaDecompiler();		
		String file_decompile = jd.decompile(basePath, className);
		return file_decompile;
	}
}
