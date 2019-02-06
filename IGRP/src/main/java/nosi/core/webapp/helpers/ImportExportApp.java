package nosi.core.webapp.helpers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Isaias.Nunes
 * Oct 11, 2017
 */
public class ImportExportApp {
	private Config config = new Config();
	
	public static String generateXMLConfigDB(Application app) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
		for(Config_env c:new Config_env().find().andWhere("application","=",app.getId()).all()){
			xml.startElement("row");
				xml.setElement("host", c.getHost());
				xml.setElement("username", c.getUsername());
				xml.setElement("password", c.getPassword());
				xml.setElement("port", c.getPort());
				xml.setElement("chartset", c.getCharset());
				xml.setElement("name", c.getName());
				xml.setElement("name_db", c.getName_db());
				xml.setElement("type_db", c.getType_db());
			xml.endElement();
		}
		xml.endElement();
		return xml.toString();
	}
	
	public static String generateXMLPage(Action pagina) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
			xml.startElement("row");
				xml.setElement("id", pagina.getId()+"");
				xml.setElement("action", pagina.getAction());
				xml.setElement("action_descr", pagina.getAction_descr());
				xml.setElement("package_name", pagina.getPackage_name());
				xml.setElement("page", pagina.getPage());
				xml.setElement("page_descr", pagina.getPage_descr());
				xml.setElement("status", pagina.getStatus()+"");
				xml.setElement("version", pagina.getVersion());
				xml.setElement("xsl_src", pagina.getXsl_src());
				xml.setElement("dad", pagina.getApplication().getDad()+"");
			xml.endElement();
		xml.endElement();
		return xml.toString();
	}
	
	public static String genereteXMLApplication(Application app) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
			xml.startElement("row");
				xml.setElement("dad", app.getDad());
				xml.setElement("description", app.getDescription());
				xml.setElement("external", app.getExternal()+"");
				xml.setElement("img_src", app.getImg_src());
				xml.setElement("name", app.getName());
				xml.setElement("status", app.getStatus()+"");
				xml.setElement("url", app.getUrl());
				xml.setElement("action_fk", (app != null) && (app.getAction() != null) ? app.getAction().getId() + "" : "");
			xml.endElement();
		xml.endElement();
		return xml.toString();
	}

	public void ExportPage(Action page) throws IOException {
		if(page!=null){
			this.putFilesPageConfig(page);
		}
	}
	
	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	private Map<String,String> filesPageClasses;
	private Map<String,String> filesDaoClasses;
	
	public ImportExportApp(){
	}
	
	public boolean validateExportPage(Action page){
		FileHelper fileH = new FileHelper();
		
		String pathPageClass = this.getConfig().getBasePathClass() + "nosi" + File.separator + "webapps" + File.separator + page.getApplication().getDad().toLowerCase() + File.separator+"pages" + File.separator + page.getPage().toLowerCase() + File.separator;
		
		this.filesPageClasses = fileH.listFilesDirectory(pathPageClass);	
		if(this.filesPageClasses!=null){
			Map<String,String> newFilesPage = new HashMap<>();
			for(Map.Entry<String, String> file:this.filesPageClasses.entrySet()){
				if(file.getKey().trim().endsWith(".class")) continue; 
				String p = file.getKey().replaceAll("View.java", "").replaceAll("Controller.java", "").replaceAll(".java", "");
				newFilesPage.put("pages/"+page.getApplication().getDad().toLowerCase()+"/"+p+"/"+file.getKey(), file.getValue());
			}
			this.filesPageClasses = newFilesPage;
		}
		return this.filesPageClasses!=null && this.filesPageClasses.size() > 0;
	}
	
	public boolean validateExportApp(Application app){
		String pathPageClass = this.getConfig().getBasePathClass() + "nosi" + File.separator + "webapps" + File.separator + app.getDad().toLowerCase()+File.separator+"pages"+File.separator;
		
		this.filesPageClasses = new FileHelper().readAllFileDirectory(pathPageClass);	
		
		if(this.filesPageClasses!=null){
			Map<String,String> newFilesPage = new HashMap<>();
			for(Map.Entry<String, String> file : this.filesPageClasses.entrySet()){
				if(file.getKey().trim().endsWith(".class")) continue; 
				String page = file.getKey().replaceAll("View.java", "").replaceAll("Controller.java", "").replaceAll(".java", "");
				newFilesPage.put("pages/"+app.getDad()+"/"+page+"/"+file.getKey(), file.getValue());
			}
			this.filesPageClasses = newFilesPage;
		}
		
		//String pathDaoClass =this.getConfig().getBasePahtClassWorkspace(app.getDad().toLowerCase())+File.separator+"dao"+File.separator;
		
		String pathDaoClass = this.getConfig().getBasePathClass() + "nosi" + File.separator + "webapps" + File.separator + app.getDad().toLowerCase() + File.separator + "dao" + File.separator;
		
		this.filesDaoClasses = new FileHelper().listFilesDirectory(pathDaoClass);		
		Map<String,String> newFilesDao = new HashMap<>();
		if(this.filesDaoClasses!=null){
			for(Map.Entry<String, String> file:this.filesDaoClasses.entrySet()){
				newFilesDao.put("dao/"+file.getKey(), file.getValue());
			}
			this.filesDaoClasses = newFilesDao;
		}
		
		//Optional<Map<String,String>> opt1 = Optional.of(this.filesPageClasses);
		Optional<Set<Action>> opt1 = Optional.of(app.getActions());
		
		return opt1.isPresent() && opt1.get().size() > 0;
	}
	
	public Map<String,String> getFilesPageClasses(){
		return this.filesPageClasses;
	}
		
	public Map<String,String> getFilesDaoClasses(){
		return this.filesDaoClasses;
	}
	
	public void putFilesPageConfig(Action page){
		
		String pathPageXsl = this.getConfig().getPathOfXslByPage(page).replace("images", this.getConfig().getPathOfImagesFolder());
		
		// Core.setMessageInfo("Caminho XSL: " + pathPageXsl); 
		
		if(page.getXsl_src() !=null && FileHelper.fileExists(pathPageXsl)){
			//String pathPageXsl = this.getConfig().getBasePahtXslWorkspace(page)+File.separator;
			pathPageXsl += File.separator;
			//System.out.println(pathPageXsl);
			
			Core.setMessageInfo("Caminho XSL: " + pathPageXsl);
			
			Map<String,String> list = new FileHelper().listFilesDirectory(pathPageXsl);
			
			if(list!=null){
				for(Map.Entry<String, String> file : list.entrySet()){
					
					this.filesPageClasses.put("configs/"+page.getApplication().getDad().toLowerCase()+"/"+page.getPage()+"/"+page.getAction()+"/"+file.getKey(), file.getValue());
				}
			}
			String pathPageExport =this.getConfig().getPathExport()+"ConfigPage"+File.separator+page.getPage()+File.separator;
			FileHelper.createDiretory(pathPageExport);
			try {
				FileHelper.save(pathPageExport, "Config"+page.getPage()+".xml", ImportExportApp.generateXMLPage(page));
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.filesPageClasses.put("configPage/"+page.getPage()+"/"+page.getPage()+".xml",pathPageExport+"Config"+page.getPage()+".xml");
		}
	}
}
