package nosi.core.webapp.compiler.helpers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
//import java.util.Arrays;
//import javax.tools.Diagnostic;
//import javax.tools.DiagnosticCollector;
//import javax.tools.JavaCompiler;
//import javax.tools.JavaFileObject;
//import javax.tools.StandardJavaFileManager;
//import javax.tools.ToolProvider;
//import jd.core.JavaDecompiler;
//import javax.tools.JavaCompiler.CompilationTask;
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
	  		 this.compilerWithJavac(files);
//		  	 final JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();  
//		  	 if(compiler!=null){
//		  		 System.out.println("Compiling with tools");
//		  		 this.compilerWithTools(compiler,files);		      
//		  	 }else{
//		  		 System.err.println("Compiling with javac");
//		  		 this.compilerWithJavac(files);
//		  	 }
		 }
         return errors.isEmpty();
	 }
	 


//	private void compilerWithTools(JavaCompiler compiler, File[] files) throws IOException {
//		 final DiagnosticCollector< JavaFileObject > diagnostics = new DiagnosticCollector<>();
//	       Iterable<String> options = Arrays.asList(
//		    		   	"-classpath",Config.getBasePathClass(),
//						"-cp",this.jars+Config.getBasePathClass()+System.getProperty("path.separator"),
//						"-d",Config.getBasePathClass()
//					);
//	       try(final StandardJavaFileManager manager = compiler.getStandardFileManager( diagnostics, null, null ) ) {
//	           final Iterable<? extends JavaFileObject> sources = manager.getJavaFileObjectsFromFiles(Arrays.asList(files));         
//	           final CompilationTask task = compiler.getTask( null, manager, diagnostics, options, null, sources );            
//	           task.call();
//	       }        
//	       for(final Diagnostic< ? extends JavaFileObject> diagnostic: diagnostics.getDiagnostics()){
//	    	   if(diagnostic.getSource()!=null){
//		    	 String[] fileName = diagnostic.getSource().getName().split(File.separator+File.separator);
//		      	 ErrorCompile error = new ErrorCompile(diagnostic.getMessage( null ), diagnostic.getLineNumber(),fileName[fileName.length-1]);
//		      	 this.errors.add(error);
//	    	   }else{
//	    		   System.err.println("diagnostic.getSource() = null");
//	    	   }
//	       }
//	 }


	private void compilerWithJavac(File[] files) {
		for(File file:files){
			this.compilerWithJavac(file);
		}
	}
	
	public  void compilerWithJavac(File file){
//			className = pathDestination+"/"+className;
		listFilesDirectory(Config.getPathLib());
		StringWriter sw = new StringWriter();
	    PrintWriter out = new PrintWriter(sw);
		com.sun.tools.javac.Main.compile(new String[]{
				"-classpath",Config.getBasePathClass(),
				"-cp",jars+Config.getBasePathClass()+System.getProperty("path.separator"),
				"-d",Config.getBasePathClass(),
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

	//Decompile .class
//	public String decompile(String basePath,String className){
//		JavaDecompiler jd = new JavaDecompiler();		
//		String file_decompile = jd.decompile(basePath, className);
//		return file_decompile;
//	}
}
