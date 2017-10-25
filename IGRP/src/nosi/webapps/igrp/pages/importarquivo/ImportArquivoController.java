/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
import nosi.core.config.Config;
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
		List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\cidadao.jar");
		boolean status_compile = false;
		Application app = new Application();
		Action page = new Action();
		
		for(FileOrderCompile un_jar_file:un_jar_files) {
			FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome(), un_jar_file.getConteudo());
		}
		for(FileOrderCompile un_jar_file : un_jar_files) {
			
			if(un_jar_file.getNome().contains("ConfigApplication.xml")) {
				StringReader inputApp = new StringReader(un_jar_file.getConteudo());
				XMLApplicationReader xmlApplication = JAXB.unmarshal(inputApp, XMLApplicationReader.class); 
				app = new Application();
				app.setDad(xmlApplication.getDad());
				app.setDescription(xmlApplication.getDescription());
				app.setExternal(xmlApplication.getExternal());
				app.setImg_src(xmlApplication.getImg_src());
				app.setName(xmlApplication.getName());
				app.setStatus(xmlApplication.getStatus());
				app.setUrl(xmlApplication.getUrl());
				app.setAction(null);//page.findOne(xmlApplication.getAction_fk()));
				//app = app.insert();
				
				//criar o Arquivo DefaultPageController no diretorio de classes para compilar 
				FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				FileHelper.save(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				CompilerHelper.compile(Config.getBasePathClass()+"/"+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java");
				
				//criar o Arquivo DefaultPageController no diretorio do packge da application
				if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				}
				
			}
			if(un_jar_file.getNome().contains(".java")) {
				String path_java = "";
				FileHelper.createDiretory(path_java);
				status_compile = CompilerHelper.compile(path_java, un_jar_file.getNome());
				
				FileHelper.save(path_java, un_jar_file.getNome(), un_jar_file.getConteudo());
			}
			
			if(un_jar_file.getNome().contains(".json") || un_jar_file.getNome().contains(".xml") || un_jar_file.getNome().contains(".xsl")) {
				//String path_xsl = Config.getBasePathXsl()+Config.getResolvePathXsl(page.getApplication().getDad(), page.getPage(), page.getVersion());
			}
			
			if(un_jar_file.getNome().contains("ConfigPages.xml")) {
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
				page.setApplication(app.find().andWhere("dad", "=", xmlPage.getDad()).one());
				//page = page.insert();
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
	
}
