package nosi.core.webapp.compiler.helpers;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.eclipse.jdt.core.compiler.CompilationProgress;
import org.eclipse.jdt.core.compiler.batch.BatchCompiler;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.compiler.helpers.ErrorCompile;
import nosi.core.webapp.compiler.helpers.MapErrorCompile;
import nosi.core.webapp.helpers.FileHelper;


/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class Compiler {
	private List<String> dirs;
	private Config config;
	private String files = "";
	private String jars = "";
	private static final String ERROR_SEPARATOR="ERROR_SEPARATOR";
	private List<ErrorCompile> errors;
	private List<ErrorCompile> warnings;
	
	public Compiler() {
		this.dirs = new ArrayList<>();
		this.config = new Config();
		this.errors = new ArrayList<>();
		this.warnings = new ArrayList<>();
	}

	public void addFileName(String file) {
		if (Core.isNotNull(file))
			this.dirs.add(file);
	}

	public void compile() {
		if (this.dirs != null) {
			this.dirs.stream().forEach(dir -> {
				files += dir + " ";
			});
			listFilesDirectory(this.config.getPathLib());
			String pathTomcat = Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
			int index = pathTomcat.indexOf("webapps");
			if (index != -1) {
				// Using jar files available in tomcat/lib
//				pathTomcat = pathTomcat.substring(0, index);
//				pathTomcat += "lib";
				listFilesDirectory(pathTomcat.substring(0, index)+"lib/");
				listFilesDirectory(pathTomcat.substring(0, index)+"igrplib/");
				System.out.println("igrplib: "+pathTomcat.substring(0, index)+"igrplib");
			}
			CompilationProgress progress = null;
			final String buildArgs = " -encoding UTF-8 " + files + " -cp " + System.getProperty("path.separator") + jars
					+ this.config.getBasePathClass() + System.getProperty("path.separator") + " -classpath "
					+ this.config.getBasePathClass() + " -d " + this.config.getBasePathClass() // lugar onde é colocado
																								// os arquivos
																								// compilados
					+ " -warn:none" + " -1.8" + " -Xemacs";
			StringWriter swS = new StringWriter();
			StringWriter swE = new StringWriter();
			PrintWriter outSuccess = new PrintWriter(swS);
			PrintWriter outError = new PrintWriter(swE);
			BatchCompiler.compile(buildArgs, outSuccess, outError, progress);
			this.extractError(outSuccess, outError, swS, swE);
		}
	}

	private void extractError(PrintWriter outSuccess, PrintWriter outError, StringWriter swS, StringWriter swE) {
		try {
			outError.flush();
			outError.close();
			outSuccess.flush();
			outSuccess.close();
			if (Core.isNotNull(swE.toString())) {
				this.extractError(swE.toString());
			}
		} finally {
			try {
				swE.close();
				swS.close();
			} catch (IOException e) {
				ErrorCompile err = new ErrorCompile(e.getMessage(),"",1,e.getLocalizedMessage());
				this.errors.add(err);
			}
		}

	}

	private void extractError(String error) {
		error = error.replace("^", ERROR_SEPARATOR);
		String[] err = error.split(ERROR_SEPARATOR);
		if(err!=null) {
			for(String e:err) {
				if(Core.isNotNull(e)) {
					ErrorCompile errorC = this.errorCompiler(e);
					if(errorC!=null)
						this.errors.add(errorC);
					errorC = this.warningCompiler(e);
					if(errorC!=null)
						this.warnings.add(errorC);
				}
			}
		}
	}
	
	private ErrorCompile errorCompiler(String error) {
		ErrorCompile err = new ErrorCompile();
		err.setFileName(this.resolveFileName(error));
		err.setError(this.resolveError(error,"error:"));
		err.setLine(this.resolveLine(error,err.getFileName()));
		if(Core.isNotNull(err.getError()))
			return err;
		return null;
	}
	

	private ErrorCompile warningCompiler(String error) {
		ErrorCompile err = new ErrorCompile();
		err.setFileName(this.resolveFileName(error));
		err.setWarning(this.resolveError(error,"warning:"));
		err.setLine(this.resolveLine(error,err.getFileName()));
		if(Core.isNotNull(err.getWarning()))
			return err;
		return null;
	}
	
	private long resolveLine(String error,String fileName) {
		int start = error.indexOf(fileName+":")+(fileName+":").length();
		if(start!=-1) {
			int end = error.indexOf(":",start);
			if(end!=-1) {
				String line = error.substring(start, end);
				return Core.toLong(line);
			}
		}
		return 0;
	}

	private String resolveError(String msg,String type) {
		int start = msg.indexOf(type);	
		return start!=-1?msg.substring(start):"";
	}

	private String resolveFileName(String error) {
		int start = error.lastIndexOf(File.separator);
		String fileName = "";
		if(start!=-1) {
			int end =  error.indexOf(".", start);
			if(end!=-1) {
				fileName = error.substring(start+1,end)+".java";
			}
		}
		return fileName;
	}
	public String getErrorToJson() {
		if (this.hasError()) {
			Map<String, List<ErrorCompile>> er = this.getErrors().stream().collect(Collectors.groupingBy(ErrorCompile::getFileName));
			if(er!=null) {
				return Core.toJson(new MapErrorCompile(Core.gt("Falha na compilação")+" - "+er.keySet().stream().findFirst().get(),er));		
			}
		}
		return "";
	}

	public String getWarningToJson() {
		if (this.hasWarning()) {
			Map<String, List<ErrorCompile>> er = this.getWarnings().stream().collect(Collectors.groupingBy(ErrorCompile::getFileName));
			if(er!=null) {
				return Core.toJson(new MapErrorCompile(Core.gt("Warnings")+" - "+er.keySet().stream().findFirst().get(),er));		
			}
		}
		return "";
	}
	
	public List<ErrorCompile> getErrors() {
		return this.errors;
	}

	public boolean hasError() {
		return this.errors != null && !this.errors.isEmpty();
	}

	public List<ErrorCompile> getWarnings() {
		return this.warnings;
	}

	public boolean hasWarning() {
		return this.warnings != null && !this.warnings.isEmpty();
	}
	
	// Get jar files
	public void listFilesDirectory(String path) {
		if (FileHelper.dirExists(path)) {
			Map<String, String> files = new FileHelper().listFilesDirectory(path);
			for (Map.Entry<String, String> file : files.entrySet()) {
				this.jars += (file.getValue() + System.getProperty("path.separator"));
			}
		}
	}

	public String getError() {	
		return this.convertListToString(this.getErrors());
	}
	
	public String getWarning() {		
		return this.convertListToString(this.getWarnings());
	}
	
	private String convertListToString(List<ErrorCompile> list) {
		Function<List<ErrorCompile>, String> listErrorToString = e->{
			e.stream().forEach(err->{
				listToString+=err;
			});
			return listToString;
		};
		return listErrorToString.apply(list);
	}

	private String listToString = "";
}
