package nosi.core.webapp.compiler.helpers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.eclipse.jdt.core.compiler.CompilationProgress;
import org.eclipse.jdt.core.compiler.batch.BatchCompiler;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;


/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class Compiler {
	private Config config;
	private CompilationProgress progress = null;
	private List<ErrorCompile> errors;
	private String jars = "";
    private final static int TIME_SLEEP = 1000;
	
	public Compiler(){
		  this.errors = new ArrayList<>();
		  this.config = new Config();
	}
	  
	public void compile(File[] files) {
		if(files!=null) {	
			listFilesDirectory(this.config.getPathLib());
			for(File file:files) {	
				this.compile(file);
			}
		}
	}
	
	public void compile(File file) {
		final String buildArgs = 
				 " -encoding UTF-8 "+file.getAbsolutePath()+"[Cp1252]"
				+" -cp ."+System.getProperty("path.separator")+jars+this.config.getBasePathClass()+System.getProperty("path.separator")
				+" -classpath "+this.config.getBasePathClass()
				+" -d "+this.config.getBasePathClass()
				+" -1.7"
				+" -Xemacs";
		 Thread t = new Thread(new Runnable(){
				@Override
				public void run() {
					StringWriter swS = new StringWriter();
					StringWriter swE = new StringWriter();
				    PrintWriter outSuccess = new PrintWriter(swS);
				    PrintWriter outError = new PrintWriter(swE);
					BatchCompiler.compile( 
			 				 buildArgs, 
							 outSuccess, 
							 outError, 
							 progress
						 );
					System.gc();
					extractError(outSuccess,outError,swS,swE,file);
				}
		});
		t.start();
		try {
			Thread.sleep(TIME_SLEEP);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void extractError(PrintWriter outSuccess, PrintWriter outError, StringWriter swS,StringWriter swE,File file) {		
		try {
			outError.flush();
			outError.close();
			outSuccess.flush();
			outSuccess.close();
			if(Core.isNotNull(swE.toString())){
				this.extractError(swE.toString(),file);
			}
		}finally {
			try {
				swE.close();
				swS.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	 /*
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
	*/
	
	/*
	 * Extract the error occurred
	 * Example:
	 * 		FileName: File1.java, Error: Error Syntax, Line: 30
	 */
	private void extractError(String error,File file){
		error = error.replaceAll("\n", " ");			
		for(String e:error.split(file.getName())){	
			if(e.startsWith(":")){		
				int start = e.indexOf(":");		
				int start2 = e.indexOf("error:");		
				if(start!=-1 && start2!=-1){		
					 start += ":".length();		
					 start2 += "error:".length();	
					 ErrorCompile err = new ErrorCompile(e.substring(start2,e.indexOf("^")), Long.parseLong(e.substring(start,e.indexOf(":",start))), this.resolveName(file));
					 this.errors.add(err);		
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
	
	public boolean hasError() {
		return this.errors!=null && !this.errors.isEmpty();
	}
}
