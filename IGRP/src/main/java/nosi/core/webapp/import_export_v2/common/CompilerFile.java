package nosi.core.webapp.import_export_v2.common;

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
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class CompilerFile {

	private List<String> dirs;
	private String error = "";
	private Config config;
	private String files = "";
	private String jars = "";
	
	public CompilerFile() {
		this.dirs = new ArrayList<>();
		this.config = new Config();
	}
	
	public void addFileName(String dir) {
		if(dir!=null)
			this.dirs.add(dir);
	}
	
	public void compile() {
		if(this.dirs!=null) {
			this.dirs.stream().forEach(dir->{
				files += dir+" ";
			});
			listFilesDirectory(this.config.getPathLib());
			String pathTomcat = Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
			int index = pathTomcat.indexOf("webapps");
			if(index!=-1) {
				//Using jar files available in tomcat/lib
				pathTomcat = pathTomcat.substring(0,index);
				pathTomcat+="lib";
				listFilesDirectory(pathTomcat);
			}
			CompilationProgress progress = null;
			final String buildArgs = 
					 " -encoding UTF-8 "+files
					+" -cp "+System.getProperty("path.separator")+jars+this.config.getBasePathClass()+System.getProperty("path.separator")
					+" -classpath "+this.config.getBasePathClass()
					+" -d "+this.config.getBasePathClass() //lugar onde é colocado os arquivos compilados
					+" -warn:none"
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
			extractError(outSuccess,outError,swS,swE);
		}
	}
	
		
	private void extractError(PrintWriter outSuccess, PrintWriter outError, StringWriter swS,StringWriter swE) {		
		try {
			outError.flush();
			outError.close();
			outSuccess.flush();
			outSuccess.close();
			if(Core.isNotNull(swE.toString())){
				this.addError(swE.toString());	
			}
		}finally {
			try {
				swE.close();
				swS.close();
			} catch (IOException e) {
				this.addError(e.getMessage());
			}
		}
		
	}


	//Get jar files
	public void listFilesDirectory(String path) {
		if(FileHelper.dirExists(path)) {
			Map<String,String> files = new FileHelper().listFilesDirectory(path);
			for(Map.Entry<String, String> file:files.entrySet()){
				this.jars += (file.getValue()+System.getProperty("path.separator"));
			}
		}
	}
	
	private void addError(String error) {
		if(Core.isNotNull(error))
			this.error += error+"\n";
	}
	
	public String getError() {
		return this.error;
	}
}
