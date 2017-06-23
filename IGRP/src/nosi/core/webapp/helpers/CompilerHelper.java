
/**
 * @author: Emanuel Pereira
 * 9 Jun 2017
 * 
 * Description: class to compiler and decompiler files java
 */

package nosi.core.webapp.helpers;
import jd.core.JavaDecompiler;
import nosi.core.config.Config;

public class CompilerHelper {

	//Compile files and saves
	public static boolean compile(String pathDestination,String className){
		className = pathDestination+"/"+className;
		
		return com.sun.tools.javac.Main.compile(new String[]{
				"-classpath",Config.getBasePathClass(),
				"-cp",Config.getBasePathClass()+System.getProperty("path.separator")+"."+System.getProperty("path.separator")+Config.getPathLib()+"javax.servlet.jar"+System.getProperty("path.separator")+Config.getPathLib()+"IGRP.jar",
				"-d",Config.getBasePathClass(),
				className}) == 0;
	}
	
	public static String decompile(String basePath,String className){
		JavaDecompiler jd = new JavaDecompiler();		
		String file_decompile = jd.decompile(basePath, className);
		return file_decompile;
	}
}
