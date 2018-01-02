package nosi.core.webapp.import_export;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXB;
import nosi.core.config.Config;
import nosi.core.gui.page.Page;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLApplicationReader;
import nosi.core.xml.XMLPageReader;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.compiler.helpers.Compiler;
/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 */
public class Import {

	protected String encode = FileHelper.ENCODE_ISO;
	public boolean importApp(IFImportExport ie) {
		return ie.importApp();
	}

	public boolean importPage(IFImportExport ie,Application app) {
		return ie.importPage(app);
	}	

	protected boolean compileFiles(List<FileImportAppOrPage> filesToCompile, Application app) {
		File[] files = new File[filesToCompile.size()];
		int i = 0;
		for(FileImportAppOrPage file:filesToCompile){
			if(file.getNome()!=null){
				String[] partPage = file.getNome().split("/");
				if(partPage.length > 2 && partPage[2].equalsIgnoreCase("DefaultPage")){
					files[i] = this.addFileDesfaultPage(file,app);				
				}
				if(file.getNome().startsWith("dao")){
					files[i] = this.addFileDao(file,app);	
				}
				if(!file.getNome().startsWith("dao") && !partPage[2].equalsIgnoreCase("DefaultPage")){
					files[i] = this.addFileMVC(file,app);	
				}
				i++;
			}
		}
		try {
			return new Compiler().compile(files);
		} catch (IOException | URISyntaxException e) {
			e.printStackTrace();
		}
		return false;
	}


	private File addFileMVC(FileImportAppOrPage file,Application app) {
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
				  .andWhere("application.dad", "=", app.getDad())
				  .andWhere("page", "=", Page.resolvePageName(partPage[2]))
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
			return new File(path_class+"/"+partPage[3]);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}


	private File addFileDao(FileImportAppOrPage file,Application app) {
		String[] partPage = file.getNome().split("/");
		String dir = Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/dao";
		if(!FileHelper.fileExists(dir))
			FileHelper.createDiretory(dir);
		try {
			FileHelper.save(dir, partPage[1],file.getConteudo());
			if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/dao")){
				FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"dao",partPage[1], file.getConteudo());
			}	
			return new File(dir+"/"+ partPage[1]);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}


	private File addFileDesfaultPage(FileImportAppOrPage file,Application app) {
		String dir = Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage";
		if(!FileHelper.fileExists(dir))
			FileHelper.createDiretory(dir);
		
		try {
			FileHelper.save(dir, "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
			if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
				FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
			}	
			return new File(dir+"/"+ "DefaultPageController.java");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	protected boolean saveFiles(FileImportAppOrPage file, Application app){
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
								  .andWhere("application.dad", "=", app.getDad())
								  .andWhere("page", "=", Page.resolvePageName(partPage[2]))
								  .one();
		String path = Config.getBasePathXsl()+Config.getResolvePathPage(app.getDad(), page.getPage(), page.getVersion());
		FileHelper.createDiretory(path);
		String content = file.getConteudo();
		
		//Substitui nome de pacotes tanto no arquivo xml como tambem no json
		if(file.getNome().endsWith(".xml")){
			content = content.substring(0, content.indexOf("<package_db>")+"<package_db>".length())+page.getPackage_name() +content.substring(content.indexOf("</package_db>"));
		}else if(file.getNome().endsWith(".json") && content.indexOf("\"package\":") >=0 ){		
			String package_name = page.getPackage_name();
			package_name = package_name.substring(0, package_name.indexOf(".",package_name.indexOf("pages")));
			content = content.substring(0, content.indexOf("\"html\":")+"\"html\":\"".length())+page.getPage()+"\""+content.substring(content.indexOf(",\"replace\""));
			content = content.substring(0, content.indexOf("\"package\":")+"\"package\":\"".length())+package_name+"\"" +content.substring(content.indexOf(",\"html\""));
		}
		try {
			boolean result = false;
			//Guarda ficheiros no workspace caso existe
			if(FileHelper.fileExists(Config.getWorkspace())){
				String path_xsl_work_space = Config.getBasePahtXsl(page);		
				result = FileHelper.save(path_xsl_work_space,partPage[4], content);
			}
			result = FileHelper.save(path, partPage[4], content);
			return result;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	protected Application saveApp(FileImportAppOrPage file){
		InputStream is;
		try {
			is = new ByteArrayInputStream(file.getConteudo().getBytes(this.encode));
			XMLApplicationReader listApp = JAXB.unmarshal(is, XMLApplicationReader.class);
			for(Application app:listApp.getRow()){
				if(new Application().find().andWhere("dad", "=", app.getDad()).one()==null){
					app.setAction(null);
					app.setId(null);
					app = app.insert();
					return app;
				}else{
					return new Application().find().andWhere("dad", "=", app.getDad()).one();
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	protected List<Action> savePageJava(FileImportAppOrPage file,Application app){
		return this.savePage(file, app, "java");
	}
	
	protected List<Action> savePagePlsql(FileImportAppOrPage file,Application app){
		return this.savePage(file, app, "plsql");
	}
	
	private List<Action> savePage(FileImportAppOrPage file,Application app,String type){
		InputStream is;
		try {
			is = new ByteArrayInputStream(file.getConteudo().getBytes(this.encode));			
			XMLPageReader listPage = JAXB.unmarshal(is, XMLPageReader.class);
			List<Action> pages = new ArrayList<>();
			for(Action page:listPage.getRow()){
				//Depois validar nome de classe
				if(type.equals("plsql")){//Se for de psql, assume Page como Action
					page.setPage(Page.resolvePageName(page.getPage()+"_"+page.getAction()));
					page.setPage_descr(page.getAction_descr());
				}
				Action action = new Action();
				action.setId(null);
				action.setAction("index");
				action.setPage(page.getPage());
				action.setVersion(page.getVersion());
				action.setAction_descr(page.getAction_descr());
				action.setPage_descr(page.getPage_descr());
				action.setStatus(page.getStatus());
				action.setXsl_src(page.getXsl_src());
				action.setApplication(app);		
				Action pageCheck = new Action().find().andWhere("page", "=", page.getPage()).andWhere("application.dad", "=", app.getDad()).one();
	
				if(type.equals("java")){
					if(nosi.core.gui.page.Page.validatePage(page.getPage()) && pageCheck==null){
						action.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".pages."+page.getPage().toLowerCase());
						action = action.insert();
						pages.add(action);
					}else if(pageCheck!=null){
						pages.add(pageCheck);
					}
				}else if(type.equals("plsql")){// Caso for de psql, valida nome de classe e versao da pagina
					if(
						page.getPage()!=null
						&& !page.getPage().equals("")
						&& pageCheck ==null 
						&& nosi.core.gui.page.Page.validatePage(page.getPage())
						&& page.getImg_src()==null){
							action.setPackage_name("nosi.webapps."+app.getDad().toLowerCase()+".pages."+page.getPage().toLowerCase());
							action.setXsl_src(app.getDad().toLowerCase()+"/"+page.getPage().toLowerCase()+"/"+page.getPage()+".xsl");
							action.setVersion("2.3");	
							action = action.insert();
							action.setSrc_xsl_plsql(page.getXsl_src());
							action.setId_plsql(page.getId());
							action.setVersion_src(page.getVersion_src());
							pages.add(action);
					}else if(pageCheck!=null){
						pageCheck.setId_plsql(page.getId());
						pageCheck.setSrc_xsl_plsql(page.getXsl_src());
						pages.add(pageCheck);
					}
				}	
			}
			return pages;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
