
/**
 * @author: Emanuel Pereira
 * 9 Jun 2017
 * 
 * Description: class to compiler and decompiler files java
 */

package nosi.core.webapp.helpers;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Map;
import jd.core.JavaDecompiler;
import nosi.core.config.Config;

public class CompilerHelper {

	//Compile files and saves
	private static String jars = "";
	private static String error = "";
	public static boolean compile(String pathDestination,String className){
		className = pathDestination+"/"+className;
		listFilesDirectory(Config.getPathLib());
		StringWriter sw = new StringWriter();
	    PrintWriter out = new PrintWriter(sw);
		boolean x = com.sun.tools.javac.Main.compile(new String[]{
				"-classpath",Config.getBasePathClass(),
				"-cp",jars+Config.getBasePathClass()+System.getProperty("path.separator"),
				"-d",Config.getBasePathClass(),
				className},out ) == 0;
		out.flush();
		out.close();
		error = sw.toString();
		try {
			sw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;
	}
	
	
	public static String getError(){
		String e = error;
		error = "";
		return e;
	}
	
	public static void listFilesDirectory(String path) {
		Map<String,String> files = FileHelper.listFilesDirectory(path);
		for(Map.Entry<String, String> file:files.entrySet()){
			jars += (file.getValue()+System.getProperty("path.separator"));
		}
	}
	
	public static String decompile(String basePath,String className){
		JavaDecompiler jd = new JavaDecompiler();		
		String file_decompile = jd.decompile(basePath, className);
		return file_decompile;
	}
}
