/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.config.Config;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.xml.bind.JAXB;
import javax.xml.transform.TransformerConfigurationException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.helpers.XMLTransform;
import nosi.core.webapp.helpers.ZipUnzipFile;
import nosi.core.xml.XMLApplicationReader;
import nosi.core.xml.XMLPageReader;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;

/*---- End ----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		ImportArquivoView view = new ImportArquivoView(model);
		view.list_aplicacao.setSqlQuery("SELECT dad,name FROM tbl_env");
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionBtm_import_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		try {
			Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_aplicacao");
			if(file.getSubmittedFileName().endsWith(".zip")){
				this.importZipFile(file,null);//Importa aplicação de plsql (Vem no formato zip)
			}else if(file.getSubmittedFileName().endsWith(".jar")){
				this.importJarFile(file,null);//Importa aplicação do porprio IGRP OS (Vem no formato jar)
			}
		} catch (ServletException e) {
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, e.getMessage());
			return this.forward("igrp", "ImportArquivo", "index");
		}		
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	


	/*---- Insert your actions here... ----*/
	
	//Variavel para mapear ficheiros de configuracao de paginas de plsql
	private Map<String,FileOrderCompile> filesConfigPagePlsql = new HashMap<>();
	
	private void importJarFile(Part fileName,String dad) {
		List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles(fileName);
		String msg = null;
		Application app = null;
		for(FileOrderCompile file:un_jar_files){
			if(file.getNome().endsWith(".java")){
				msg = this.compileFiles(file,(dad!=null && !dad.equals(""))?dad:app.getDad());
				if(msg!=FlashMessage.MESSAGE_SUCCESS){	
					break;					
				}
			}else if(!file.getNome().startsWith("configApp") && !file.getNome().startsWith("configPage"))
				this.saveFiles(file,(dad!=null && !dad.equals(""))?dad:app.getDad());
			else if(file.getNome().startsWith("configApp"))
				app = this.saveConfigApp(file);
			else if(file.getNome().startsWith("configPage"))
				this.saveConfigPage(file,(dad!=null && !dad.equals(""))?dad:app.getDad(),"java");				
		}
		ImportExportDAO ie_dao = new ImportExportDAO(fileName.getSubmittedFileName().replace(".jar", ""), Config.getUserName(), DateHelper.getCurrentDataTime(), "Import");
     	ie_dao = ie_dao.insert();
		Igrp.getInstance().getFlashMessage().addMessage(msg==FlashMessage.MESSAGE_SUCCESS?FlashMessage.SUCCESS:FlashMessage.ERROR, msg);
	}


	private void importZipFile(Part fileName,String dad) {
		List<FileOrderCompile> unzip_files = ZipUnzipFile.getZipFiles(fileName);
		String msg = null;
		Application app = new Application();
		for(FileOrderCompile file:unzip_files){
			if(file.getConteudo()!=null && !file.getConteudo().equals("")  && file.getNome().startsWith("FTP/IGRP")){
				String part[] = file.getNome().split("/");
				if(!"navigation.xml".equals(part[part.length-1]) && !"slide-menu.xml".equals(part[part.length-1]))
					this.filesConfigPagePlsql.put(part[part.length-1], file);
			}
		}
		for(FileOrderCompile file:unzip_files){
			if(file.getNome().startsWith("SQL/CONFIG")  && file.getNome().endsWith("_ENV.xml")){
				app = this.saveConfigApp(file);
				FileOrderCompile f = new ImportExportApp().new FileOrderCompile("page/"+((dad!=null && !dad.equals(""))?dad:app.getDad())+"/DefaultPage/index", "", 1);
				msg = this.compileFiles(f, (dad!=null && !dad.equals(""))?dad:app.getDad());
			}
			if(file.getNome().startsWith("SQL/CONFIG")  && file.getNome().endsWith("_ACTION.xml")){
				msg = this.saveConfigPage(file, (dad!=null && !dad.equals(""))?dad:app.getDad(),"plsql");
			}
		}
		ImportExportDAO ie_dao = new ImportExportDAO(fileName.getSubmittedFileName().replace(".jar", ""), Config.getUserName(), DateHelper.getCurrentDataTime(), "Import");
		ie_dao = ie_dao.insert();
		Igrp.getInstance().getFlashMessage().addMessage(msg==FlashMessage.MESSAGE_SUCCESS?FlashMessage.SUCCESS:FlashMessage.ERROR, msg);
	}


	private String saveConfigFilesPlsql(String fileName,Application app,Action page) {
		String part[] = fileName.split("/");
		String xsl = part[part.length-1];
		String xml = xsl.replace(".xsl", ".xml");
		String msg = null;
		if(this.filesConfigPagePlsql.get(xsl)!=null){
			String content = this.filesConfigPagePlsql.get(xsl).getConteudo();
			content = content.replaceAll("../../xsl", "../../../xsl");
			FileOrderCompile file = new ImportExportApp().new FileOrderCompile("configs/"+app.getDad()+"/"+page.getPage()+"/"+page.getAction()+"/"+page.getPage()+".xsl", content, 1);
			this.saveFiles(file , app.getDad());			
		}

		if(this.filesConfigPagePlsql.get(xml)!=null){
			String content = this.filesConfigPagePlsql.get(xml).getConteudo();
			//Verifica se o xml possui package_html que será o nome da classe
			//Caso não exista, assumi o nome do ficheiro como nome da classe
			content = content.substring(0, content.indexOf("<package_html>")+"<package_html>".length())+ page.getPage()+content.substring(content.indexOf("</package_html>"));
			String package_name = Config.getBasePackage(app.getDad()).contains(".pages")?Config.getBasePackage(app.getDad()):Config.getBasePackage(app.getDad())+".pages";
			content = content.substring(0, content.indexOf("<package_db>")+"<package_db>".length())+package_name +content.substring(content.indexOf("</package_db>"));
			FileOrderCompile file = new ImportExportApp().new FileOrderCompile("configs/"+app.getDad()+"/"+page.getPage()+"/"+page.getAction()+"/"+page.getPage()+".xml", content, 1);
			this.saveFiles(file , app.getDad());
			try {
				String path = Config.getBasePathXsl()+Config.getResolvePathXsl(app.getDad(), page.getPage(), page.getVersion())+File.separator+page.getPage()+".xml";
				//Gera codigo MVC a partir de xml, usando gerador xsl
				String modelViewController = XMLTransform.tranform(path, Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/java/XSL_GENERATOR.xsl");
				String[] partsJavaCode = modelViewController.toString().split(" END ");
				if(partsJavaCode.length > 2){
					String model = partsJavaCode[0]+"*/";
					String view = "/*"+partsJavaCode[1]+"*/";
					String controller = "/*"+partsJavaCode[2];
					file.setNome("pages/"+app.getDad()+"/"+page.getPage()+"/"+page.getPage()+".java");
					file.setConteudo(model);
					msg = this.compileFiles(file, app.getDad());
	
					file.setNome("pages/"+app.getDad()+"/"+page.getPage()+"/"+page.getPage()+"View.java");
					file.setConteudo(view);
					msg = this.compileFiles(file, app.getDad());
	
					file.setNome("pages/"+app.getDad()+"/"+page.getPage()+"/"+page.getPage()+"Controller.java");
					file.setConteudo(controller);
					msg = this.compileFiles(file, app.getDad());
				}
			} catch (TransformerConfigurationException e) {
			}
		}
		return msg;
	}


	private Application saveConfigApp(FileOrderCompile file) {
		StringReader input = new StringReader(file.getConteudo());
		XMLApplicationReader listApp = JAXB.unmarshal(input, XMLApplicationReader.class);
		for(Application app:listApp.getRow()){
			Application app1 = new Application();
			if(new Application().find().andWhere("dad", "=", app.getDad()).one()==null){
				app1.setDad(app.getDad());
				app1.setDescription(app.getDescription());
				app1.setExternal(app.getExternal());
				app1.setImg_src(app.getImg_src());
				app1.setName(app.getName());
				app1.setStatus(app.getStatus());
				app1.setUrl(app.getUrl());
				app1.setAction(null);
				return app1.insert();
			}
		}
		return new Application();
	}


	private String saveConfigPage(FileOrderCompile file,String dad,String type) {
		StringReader input = new StringReader(file.getConteudo());
		XMLPageReader listPage = JAXB.unmarshal(input, XMLPageReader.class);
		String msg = null;
		for(Action p:listPage.getRow()){
			Action page = new Action();
			page.setAction(p.getAction());
			page.setAction_descr(p.getAction_descr());
			page.setPage(p.getPage());
			page.setPage_descr(p.getPage_descr());				
			page.setStatus(p.getStatus());
			page.setVersion("2.3");
			page.setXsl_src(p.getXsl_src()); 			
			page.setPage(p.getPage());
			Application app = new Application().find().andWhere("dad", "=",dad).one();
			//Depois validar nome de classe
			if(type.equals("plsql")){//Se for de psql, assume Page como Action
				page.setPage(p.getAction());
				page.setPage_descr(p.getAction_descr());
				page.setApplication(app);
			}
			page.setApplication(app);
			page.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".pages."+page.getPage().toLowerCase());
			Action pageCheck = new Action().find().andWhere("page", "=", page.getPage()).andWhere("application.dad", "=", dad).one();
			if(!type.equals("plsql")){
				if(nosi.core.gui.page.Page.validatePage(page.getPage()) && app!=null && new Action().find().andWhere("page", "=", page.getPage()).andWhere("application.dad", "=", dad).one()==null)
					page = page.insert();
			}else if(type.equals("plsql")){// Caso for de psql, valida nome de classe e versao da pagina
				if(nosi.core.gui.page.Page.validatePage(page.getPage()) && app!=null 
					&& pageCheck ==null 
					&& p.getVersion_src()!=null 
					&& p.getVersion_src().equals("IGRP2.3")){
						page = page.insert();
						this.saveConfigFilesPlsql(page.getXsl_src(),app,page);
				}else if(pageCheck!=null){
					msg = this.saveConfigFilesPlsql(page.getXsl_src(),app,pageCheck);
				}
			}	
		}
		return msg;
	}


	private void saveFiles(FileOrderCompile file,String dad) {
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
								  .andWhere("application.dad", "=", dad)
								  .andWhere("page", "=", partPage[2])
								  .one();
		String path = Config.getBasePathXsl()+Config.getResolvePathXsl(dad, page.getPage(), page.getVersion());
		FileHelper.createDiretory(path);
		String content = file.getConteudo();
		if(file.getNome().endsWith(".xml")){
			content = content.substring(0, content.indexOf("<package_db>")+"<package_db>".length())+page.getPackage_name() +content.substring(content.indexOf("</package_db>"));
		}else if(file.getNome().endsWith(".json")){		
			String package_name = page.getPackage_name();
			package_name = package_name.substring(0, package_name.indexOf(".",package_name.indexOf("pages")));
			content = content.substring(0, content.indexOf("\"package\":")+"\"package\":\"".length())+package_name+"\"" +content.substring(content.indexOf(",\"html\""));
		}
		try {
			//Guarda ficheiros no workspace caso existe
			if(FileHelper.fileExists(Config.getWorkspace())){
				String path_xsl_work_space = Config.getBasePahtXsl(page);		
				FileHelper.save(path_xsl_work_space,partPage[4], content);
			}
			FileHelper.save(path, partPage[4], content);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String compileFiles(FileOrderCompile file,String dad) {
		String[] partPage = file.getNome().split("/");
		if(partPage[2].equalsIgnoreCase("DefaultPage")){
			FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+dad.toLowerCase()+"/"+"pages");
			try {
				Application app = new Application().find().andWhere("dad", "=", dad).one();
				FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				FileHelper.save(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				}	
				if(CompilerHelper.compile(Config.getBasePathClass()+"/"+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java"))
					return FlashMessage.MESSAGE_SUCCESS;
				else
					return CompilerHelper.getError();
			} catch (IOException e) {
				return e.getMessage();
			}
			
		}else{
			Action page = new Action().find()
					  .andWhere("application.dad", "=", dad)
					  .andWhere("page", "=", partPage[2])
					  .one();	
			String path_class = Config.getBasePathClass() + page.getPackage_name().replace(".",File.separator);
			String content = file.getConteudo();
			if(file.getNome().endsWith(".java")){
				content = content.substring(0, content.indexOf("package")+"package".length())+" "+page.getPackage_name() +content.substring(content.indexOf(";", content.indexOf("package")));
			}
			try {
				FileHelper.save(path_class,partPage[3],content);
				if(FileHelper.fileExists(Config.getWorkspace())){
					String path_class_work_space = Config.getBasePahtClass(page.getApplication().getDad())+"pages"+File.separator+page.getPage().toLowerCase();
					FileHelper.save(path_class_work_space,partPage[3],content);
				}
				if(CompilerHelper.compile(path_class,partPage[3]))
					return FlashMessage.MESSAGE_SUCCESS;
				else
					return CompilerHelper.getError();
			} catch (IOException e) {
				return e.getMessage();
			}
		}
	}
	/*---- End ----*/
	
	public Response actionBtm_importar_page() throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		try {
			Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_pagina");
			if(file.getSubmittedFileName().endsWith(".zip")){
				this.importZipFile(file,model.getList_aplicacao());//Importa aplicação de plsql (Vem no formato zip)
			}else if(file.getSubmittedFileName().endsWith(".jar")){
				this.importJarFile(file,model.getList_aplicacao());//Importa aplicação do porprio IGRP OS (Vem no formato jar)
			}
		} catch (ServletException e) {
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, e.getMessage());
			return this.forward("igrp", "ImportArquivo", "index");
		}		
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
}
