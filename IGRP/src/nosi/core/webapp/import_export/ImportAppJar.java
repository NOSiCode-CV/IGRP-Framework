package nosi.core.webapp.import_export;

import java.util.List;
import javax.servlet.http.Part;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 * Importa aplicações/pagínas de IGRP Java
 */
public class ImportAppJar extends Import implements IFImportExport{

	protected List<FileOrderCompile> un_jar_files = null;
	//Variavel para mapear ficheiros de configuracao de paginas de plsql
	protected Application app;
	
	public ImportAppJar(Part fileName){
		this.app = new Application();
		if(fileName!=null){
			this.un_jar_files = JarUnJarFile.getJarFiles(fileName);
		}
	}

	
	@Override
	public boolean importApp() {
		boolean result = true;
		for(FileOrderCompile file:this.un_jar_files){
			if(file.getNome().endsWith(".java") && this.app!=null){
				if(!this.compileFiles(file,this.app)){
					result = false;
					break;
				}
			}else if(!file.getNome().startsWith("configApp") && !file.getNome().startsWith("configPage") && this.app!=null){
				if(!this.saveFiles(file,this.app)){
					result = false;
					break;
				}
			}else if(file.getNome().startsWith("configApp")){
				this.app = this.saveApp(file);
				if(this.app==null){
					result = false;
					break;
				}
			}else if(file.getNome().startsWith("configPage")  && this.app!=null){
				List<Action> pages = this.savePageJava(file,this.app);
				if(pages.isEmpty()){
					result = false;
					break;
				}
			}
		}
		return result;
	}
	
	@Override
	public boolean importPage(Application app) {
		this.app = app;
		return this.importApp();
	}
}
