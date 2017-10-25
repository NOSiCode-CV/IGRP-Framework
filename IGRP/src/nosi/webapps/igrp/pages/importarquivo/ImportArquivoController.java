<<<<<<< HEAD
/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;

import javax.xml.bind.JAXB;

import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.xml.XMLApplicationReader;
import nosi.core.xml.XMLPageReader;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		ImportArquivoView view = new ImportArquivoView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionImport() throws IOException{
		/*---- Insert your code here... ----*/
		List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\teste.jar");
		boolean status_compile = false;
		Application app = null;
		Action page = null;
		for(FileOrderCompile un_jar_file:un_jar_files) {
			FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome(), un_jar_file.getConteudo());
		}
		
		for(FileOrderCompile un_jar_file:un_jar_files) {
			if(un_jar_file.getNome().contains(".java")) {
				status_compile = CompilerHelper.compile("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome());
			}
			
			if(un_jar_file.getNome().contains("Config.xml")) {
				StringReader input = new StringReader(un_jar_file.getConteudo());
				XMLPageReader xmlPage = JAXB.unmarshal(input, XMLPageReader.class);
				
				page = new Action();
				app = new Application();
				page.setAction(xmlPage.getAction());
				page.setAction_descr(xmlPage.getAction_desc());
				page.setPackage_name(xmlPage.getPackage_name());
				page.setPage(xmlPage.getPage());
				page.setPage_descr(xmlPage.getPage_desc());
				page.setStatus(xmlPage.getStatus());
				page.setVersion(xmlPage.getVersion());
				page.setXsl_src(xmlPage.getXsl_src());
				page.setApplication(app.findOne(xmlPage.getEnv_fk()));
				page = page.insert();

				if(un_jar_file.getNome().contains("ConfigApplication.xml")) {
					StringReader inputApp = new StringReader(un_jar_file.getConteudo());
					XMLApplicationReader xmlApplication = JAXB.unmarshal(inputApp, XMLApplicationReader.class); 
					
					app.setDad(xmlApplication.getDad());
					app.setDescription(xmlApplication.getDescription());
					app.setExternal(xmlApplication.getExternal());
					app.setImg_src(xmlApplication.getImg_src());
					app.setName(xmlApplication.getName());
					app.setStatus(xmlApplication.getStatus());
					app.setUrl(xmlApplication.getUrl());
					app.setAction(page.findOne(xmlApplication.getAction_fk()));
					app = app.insert();
				}
			}
		}
		if(status_compile && page != null && app != null){
			Igrp.getInstance().getFlashMessage().addMessage("success", "Arquivo Importado com sucesso");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Ups!!! Ocorreu um Erro...");
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
	
	
	
	
	public static void main(String [] args) throws IOException {
	}
	
	
}
=======
/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;

import javax.xml.bind.JAXB;

import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.xml.XMLApplicationReader;
import nosi.core.xml.XMLPageReader;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		ImportArquivoView view = new ImportArquivoView(model);
		return this.renderView(view);
		/*---- End ----*/
	}

	public Response actionImport() throws IOException{
		/*---- Insert your code here... ----*/
		List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\isaiac.jar");
		boolean status_compile = false;
		Application app = new Application();
		Action page = new Action();
		
		for(FileOrderCompile un_jar_file:un_jar_files) {
			FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome(), un_jar_file.getConteudo());
		}
		String dad = "";
		for(FileOrderCompile un_jar_file:un_jar_files) {
			
			if(un_jar_file.getNome().contains("ConfigApplication.xml")) {
				StringReader inputApp = new StringReader(un_jar_file.getConteudo());
				XMLApplicationReader xmlApplication = JAXB.unmarshal(inputApp, XMLApplicationReader.class); 
				System.out.println("Entrei na application"); 
				System.out.println(xmlApplication.toString());
			    dad = xmlApplication.getDad();
				app = new Application();
				app.setDad(xmlApplication.getDad());
				app.setDescription(xmlApplication.getDescription());
				app.setExternal(xmlApplication.getExternal());
				app.setImg_src(xmlApplication.getImg_src());
				app.setName(xmlApplication.getName());
				app.setStatus(xmlApplication.getStatus());
				app.setUrl(xmlApplication.getUrl());
				//app.setAction(null);//page.findOne(xmlApplication.getAction_fk()));
				//app = app.insert();

				
				
			}
			if(un_jar_file.getNome().contains(".jar")) {
				List<FileOrderCompile> un_jar_files_pages =  JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\"+ dad +"\\"+un_jar_file.getNome());
				for(FileOrderCompile un_jar_files_page : un_jar_files_pages) { 
					FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_files_page.getNome(), un_jar_files_page.getConteudo());
				}
			}
			
			/*
			
			if(un_jar_file.getNome().contains(".java")) {
				status_compile = CompilerHelper.compile("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome());
			}
			
			if(un_jar_file.getNome().contains("ConfigPages.xml")) {
				StringReader input = new StringReader(un_jar_file.getConteudo());
				XMLPageReader xmlPage = JAXB.unmarshal(input, XMLPageReader.class);
				System.out.println("Entrei no paage");
				page = new Action();
				app = new Application();
				page.setAction(xmlPage.getAction());
				page.setAction_descr(xmlPage.getAction_desc());
				page.setPackage_name(xmlPage.getPackage_name());
				page.setPage(xmlPage.getPage());
				page.setPage_descr(xmlPage.getPage_desc());
				page.setStatus(xmlPage.getStatus());
				page.setVersion(xmlPage.getVersion());
				page.setXsl_src(xmlPage.getXsl_src());
				System.out.println(xmlPage.toString()); 
				page.setApplication(app.find().andWhere("dad", "=", xmlPage.getDad()).one());
				page = page.insert();
			}*/
		}
		if(status_compile && page != null && app != null){
			Igrp.getInstance().getFlashMessage().addMessage("success", "Arquivo Importado com sucesso");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Ups!!! Ocorreu um Erro...");
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
	
}
>>>>>>> branch 'master' of https://github.com/NOSiCode-CV/IGRP-Framework.git
