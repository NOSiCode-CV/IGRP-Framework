package nosi.core.webapp.import_export;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.xml.bind.JAXB;
import nosi.core.config.Config;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.xml.XMLConfigDBReader;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;

/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 * Importa aplicações/pagínas de IGRP Java
 */
public class ImportAppJar extends Import implements IFImportExport{

	protected List<FileImportAppOrPage> un_jar_files = null;
	//Variavel para mapear ficheiros de configuracao de paginas de plsql
	protected Application app;
	
	public ImportAppJar(Part fileName){
		this.app = new Application();
		//this.encode = FileHelper.ENCODE_UTF8;
		if(fileName!=null){
			this.un_jar_files = JarUnJarFile.getJarFiles(fileName);
		}
	}

	
	@Override
	public boolean importApp() {
		boolean result = true;
		List<FileImportAppOrPage> filesToCompile = new ArrayList<>();
		for(FileImportAppOrPage file:this.un_jar_files){
			if(file.getNome().endsWith(".java") && this.app!=null){
				filesToCompile.add(file);
			}else if(file.getNome().startsWith("configApp")){
				this.app = this.saveApp(file);
				if(this.app==null){
					result = false;
					break;
				}
			}else if(file.getNome().startsWith("configDBApp")){
				result = this.saveConfigDB(file.getConteudo(),this.app);
			}else if(file.getNome().startsWith("configPage")  && this.app!=null){
				List<Action> pages = this.savePageJava(file,this.app);
				if(pages.isEmpty()){
					result = false;
					break;
				}
			}else if(file.getNome().startsWith("configHibernate") && this.app!=null){
				try {
					String[] fileName = file.getNome().split("/");
					if(!FileHelper.fileExists(fileName[1]+".cfg.xml")){
						result = FileHelper.save(Config.getBasePathClass(),fileName[1]+".cfg.xml", file.getConteudo());
						if(FileHelper.fileExists(Config.getWorkspace())){
							result = FileHelper.save(Config.getWorkspace()+"/src",fileName[1]+".cfg.xml", file.getConteudo());
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(!file.getNome().startsWith("configApp") && !file.getNome().startsWith("configPage")  && !file.getNome().startsWith("configDB")   && !file.getNome().startsWith("dao") && this.app!=null){
				if(!this.saveFiles(file,this.app)){
					result = false;
					break;
				}
			}
		}
		result = this.compileFiles(filesToCompile,this.app);
		return result;
	}


	private boolean saveConfigDB(String conteudo,Application app) {
		StringReader input = new StringReader(conteudo);
		XMLConfigDBReader listConfig = JAXB.unmarshal(input, XMLConfigDBReader.class);
		boolean result = false;
		for(Config_env config:listConfig.getRow()){
			config.setApplication(app);
			config.setCharset("utf-8");
			if(new Config_env().find().andWhere("name", "=", config.getName()).one()==null)
				result = config.insert()!=null;
		}
		return result;
	}


	@Override
	public boolean importPage(Application app) {
		this.app = app;
		return this.importApp();
	}
}
