package nosi.core.webapp.compiler.helpers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nosi.core.config.Config;
import nosi.core.webapp.helpers.FileHelper;
import com.sun.tools.javac.*;


/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class Compiler {
	private Config config;

	private List<ErrorCompile> errors;
	  
	  public Compiler(){
		  this.errors = new ArrayList<>();
		  this.config = new Config();
	  }
	 private String jars = "";
	 
	 //Compile java files
	 public boolean compile(File[] files) throws IOException, URISyntaxException {
		 if(files.length >0 ){
			 listFilesDirectory(this.config.getPathLib());
	  		 this.compilerWithJavac(files);
		 }
         return errors.isEmpty();
	 }
	 

	private void compilerWithJavac(File[] files) {
		for(File file:files){
			this.compilerWithJavac(file);
		}
	}
	
	public  void compilerWithJavac(File file){
//			className = pathDestination+"/"+className;
		listFilesDirectory(this.config.getPathLib());
		StringWriter sw = new StringWriter();
	    PrintWriter out = new PrintWriter(sw);
		Main.compile(new String[]{
				"-classpath",this.config.getBasePathClass(),
				"-cp","."+System.getProperty("path.separator")+jars+this.config.getBasePathClass()+System.getProperty("path.separator"),
				"-d",this.config.getBasePathClass(),
				file.getAbsolutePath()},out );
		out.flush();
		out.close();
		if(sw.toString()!=null && !sw.toString().equals("")){
			this.processErrorWithJavac(sw.toString(),file.getName(),file);
		}
		try {
			sw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void processErrorWithJavac(String error,String split,File file){			
		error = error.replaceAll("\n", " ");				
		if(error!=null && !error.equals("")){			
			for(String e:error.split(split)){		
				if(e.startsWith(":")){		
					int start = e.indexOf(":");		
					int start2 = e.indexOf("error:");		
					if(start!=-1 && start2!=-1){		
						 start += ":".length();		
						 start2 += "error:".length();	
						 ErrorCompile err = new ErrorCompile(e.substring(start2,e.indexOf("^")), Long.parseLong(e.substring(start,e.indexOf(":",start))), this.resolveName(file));
				      	 errors.add(err);		
					}		
				}		
			}	
		}				
 	}
	 private String resolveName(File file) {
		String[] n = file.getName().split("/");
		if(n.length > 1) {
			return n[n.length-1];
		}
		return file.getName();
	}



	//Get jar files
	public void listFilesDirectory(String path) {
		Map<String,String> files = new FileHelper().listFilesDirectory(path);
		for(Map.Entry<String, String> file:files.entrySet()){
			this.jars += (file.getValue()+System.getProperty("path.separator"));
		}
	}
			 
	public List<ErrorCompile> getErrors(){
		 return this.errors;
	}
}
