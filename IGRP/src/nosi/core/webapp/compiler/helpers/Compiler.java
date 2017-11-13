package nosi.core.webapp.compiler.helpers;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;
import javax.tools.JavaCompiler.CompilationTask;
import nosi.core.config.Config;
import nosi.core.webapp.helpers.FileHelper;


/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class Compiler {

	private List<ErrorCompile> errors;
	  
	  public Compiler(){
		  this.errors = new ArrayList<>();
	  }
	 private String jars = "";
	 
	 //Compile java files
	 public boolean compile(File[] files) throws IOException, URISyntaxException {
		 if(files.length >0 ){
			 listFilesDirectory(Config.getPathLib());
		  	 final JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();        
		       final DiagnosticCollector< JavaFileObject > diagnostics = new DiagnosticCollector<>();
		       Iterable<String> options = Arrays.asList(
			    		   	"-classpath",Config.getBasePathClass(),
							"-cp",this.jars+Config.getBasePathClass()+System.getProperty("path.separator"),
							"-d",Config.getBasePathClass()
						);
		       try(final StandardJavaFileManager manager = compiler.getStandardFileManager( diagnostics, null, null ) ) {
		           final Iterable<? extends JavaFileObject> sources = manager.getJavaFileObjectsFromFiles(Arrays.asList(files));         
		           final CompilationTask task = compiler.getTask( null, manager, diagnostics, options, null, sources );            
		           task.call();
		       }        
		       for(final Diagnostic< ? extends JavaFileObject> diagnostic: diagnostics.getDiagnostics()){
		    	 String[] fileName = diagnostic.getSource().getName().split(File.separator+File.separator);
		      	 ErrorCompile error = new ErrorCompile(diagnostic.getMessage( null ), diagnostic.getLineNumber(),fileName[fileName.length-1]);
		      	 this.errors.add(error);
		       }
		 }
         return errors.isEmpty();
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
