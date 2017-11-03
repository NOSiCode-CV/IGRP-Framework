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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.xml.bind.JAXB;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp.FileOrderCompile;
import nosi.core.webapp.helpers.JarUnJarFile;
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
			//System.out.println(file.getNome());
			/*if(file.getConteudo()!=null && !file.getConteudo().equals("") && file.getNome().startsWith("FTP") && file.getNome().endsWith(".xml") && !file.getNome().endsWith("navigation.xml") && !file.getNome().endsWith("slide-menu.xml")){
				if(file.getNome().startsWith("FTP/IGRP")){
					String content = file.getConteudo();
					String className = content.substring(content.indexOf("<package_html>")+"<package_html>".length(),content.indexOf("</package_html>"));
					//Verifica se o xml possui package_html que será o nome da classe
					//Caso não exista, assumi o nome do ficheiro como nome da classe
					if(className==null || className.equals("")){
						className = file.getNome().substring(file.getNome().indexOf("xml/")+"xml/".length(), file.getNome().indexOf(".xml"));
						content = content.substring(0, content.indexOf("<package_html>")+"<package_html>".length())+ className+content.substring(content.indexOf("</package_html>"));
					}
					String package_name = Config.getBasePackage(app.getDad()).contains(".pages")?Config.getBasePackage(app.getDad())+"."+className.toLowerCase():Config.getBasePackage(app.getDad())+".pages."+className.toLowerCase();
					content = content.substring(0, content.indexOf("<package_db>")+"<package_db>".length())+package_name +content.substring(content.indexOf("</package_db>"));
					
					System.out.println(content);
//					try {
//						System.out.println(XMLTransform.tranform(file.getNome(), Config.getBasePathXsl()+"images/IGRP/IGRP2.3/core/formgen/util/java/XSL_GENERATOR.xsl"));
//					} catch (TransformerConfigurationException e) {
//					}
				}
			}else */
			if(file.getNome().startsWith("SQL/CONFIG")  && file.getNome().endsWith("_ENV.xml")){
				app = this.saveConfigApp(file);
			}
			if(file.getNome().startsWith("SQL/CONFIG")  && file.getNome().endsWith("_ACTION.xml")){
				this.saveConfigPage(file, app.getDad(),"plsql");
			}
		}
		/*ImportExportDAO ie_dao = new ImportExportDAO(fileName.getSubmittedFileName().replace(".jar", ""), Config.getUserName(), DateHelper.getCurrentDataTime(), "Import");
		ie_dao = ie_dao.insert();*/
		Igrp.getInstance().getFlashMessage().addMessage(msg==FlashMessage.MESSAGE_SUCCESS?FlashMessage.SUCCESS:FlashMessage.ERROR, msg);
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


	private void saveConfigPage(FileOrderCompile file,String dad,String type) {
		StringReader input = new StringReader(file.getConteudo());
		XMLPageReader listPage = JAXB.unmarshal(input, XMLPageReader.class);
		for(Action p:listPage.getRow()){
			Action page = new Action();
			page.setAction(p.getAction());
			page.setAction_descr(p.getAction_descr());
			page.setPage(p.getPage());
			page.setPage_descr(p.getPage_descr());				
			page.setStatus(p.getStatus());
			page.setVersion(p.getVersion());
			page.setXsl_src(p.getXsl_src()); 			
			page.setPage(p.getPage());
			if(type.equals("psql")){//Se for de psql, assume Page como Action
				page.setPage(p.getAction());
				page.setPage_descr(p.getAction_descr());
			}
			Application app = new Application().find().andWhere("dad", "=",dad).one();
			if(app!=null && new Action().find().andWhere("page", "=", p.getPage()).andWhere("action", "=", p.getAction()).andWhere("application.dad", "=", dad).one()==null){
				page.setApplication(app);
				page.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".pages."+page.getPage().toLowerCase());
				page = page.insert();			
			}
		}
	}


	private void saveFiles(FileOrderCompile file,String dad) {
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
								  .andWhere("application.dad", "=", dad)
								  .andWhere("page", "=", partPage[2])
								  .andWhere("action", "=", partPage[3])
								  .one();
		String path = Config.getBasePahtXsl(page);		
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
				String path_xsl_work_space = Config.getWorkspace()+File.separator+"WebContent"+File.separator+"images"+File.separator+"IGRP"+File.separator+"IGRP"+page.getVersion()+File.separator+"app"+File.separator+page.getApplication().getDad()+File.separator+page.getPage().toLowerCase();			
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