package nosi.core.webapp.compiler.helpers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.eclipse.jdt.core.compiler.CompilationProgress;
import org.eclipse.jdt.core.compiler.batch.BatchCompiler;
import com.google.gson.Gson;
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
	
	public Compiler(){
		  this.errors = new ArrayList<>();
		  this.config = new Config();
	}
	
	public String compile(File[] files) {
		if(files!=null) {	
			listFilesDirectory(this.config.getPathLib());
			for(File file:files) {	
				if(file!=null)
					this.compile(file);
			}
			if (this.hasError()) {
				Map<String, List<ErrorCompile>> er = this.getErrors().stream()
						.collect(Collectors.groupingBy(ErrorCompile::getFileName));
				 return new Gson().toJson(new MapErrorCompile("Falha na compilação", er));
			}
		}
		return "";
	}
	
	public void compile(File file) {
		final String buildArgs = 
				 " -encoding UTF-8 "+file.getAbsolutePath()+"[UTF-8]"
				+" -cp ."+System.getProperty("path.separator")+jars+this.config.getBasePathClass()+System.getProperty("path.separator")
				+" -classpath "+this.config.getBasePathClass()
				+" -d "+this.config.getBasePathClass()
				+" -1.8"
				+" -Xemacs";
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
		extractError(outSuccess,outError,swS,swE,file);
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
