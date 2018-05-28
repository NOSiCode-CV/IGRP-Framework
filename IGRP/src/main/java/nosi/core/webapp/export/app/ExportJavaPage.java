package nosi.core.webapp.export.app;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;

/**
 * Iekiny Marcel
 * Apr 5, 2018
 */
public class ExportJavaPage {
	
	private Action page;
	private List<JavaClasse> files;
	
	public ExportJavaPage(Action actionId) {
		this.page = actionId;
		this.files = new ArrayList<>();
	}
	
	private String getStoredPage() {
		if(this.page != null) {
			StoredPages stp = new StoredPages();				
			Core.mapper(this.page, stp);	
		return new Gson().toJson(stp);
		}
	return null;
	}
	
	/*private String getStoredApp() {
		if(this.page != null && this.page.getApplication() != null) {
			StoredApplication stapp = new StoredApplication();
			Core.mapper( this.page.getApplication(), stapp);
			return new Gson().toJson(stapp);
		}
		return null;
	}*/
	
	private String getConfigurationPages() {
		if(this.page != null) {
			Config config = new Config();
			
			//Get xml, json and xsl
			String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getAbsolutePath();
			
			//String xslXMLJsonPath = config.getBaseServerPahtXsl(this.page.getApplication())+File.separator;
			String xslXMLJsonPath =  warName + File.separator + config.getImageAppPath(this.page.getApplication()) + File.separator;
			
			this.getJavaFiles(xslXMLJsonPath,"xsl-xml-json");
			
			//String classJavaPath = config.getPathServerClass(this.page.getApplication().getDad());
			String classJavaPath = config.getPathServerClass(this.page.getApplication().getDad());
			
			Core.setMessageInfo("xslXMLJsonPath: " + xslXMLJsonPath);
			
			Core.setMessageInfo("classJavaPath: " + classJavaPath);
			
			Core.setMessageInfo("warName: " + warName);
			
			if(Core.isNotNull(config.getWorkspace()) && FileHelper.dirExists(config.getWorkspace())) {
				classJavaPath = config.getBasePahtClassWorkspace(this.page.getApplication().getDad()) + File.separator; 			
			}
			
			//Get classes Pages in format .java and .class 
			String pathPages = classJavaPath+"pages" + File.separator;
			
			this.getJavaFiles(pathPages,"pages");
			
			this.files.removeIf(obj -> (obj.getType().equalsIgnoreCase("pages") && !obj.getFolder().equalsIgnoreCase(page.getPage())) || (obj.getType().equalsIgnoreCase("xsl-xml-json") && !obj.getFolder().toLowerCase().contains(page.getPage().toLowerCase())));
				
			return new Gson().toJson(files);
		}
		return null;
	}
	
	private void getJavaFiles(String pathPages,String type) {
		if(FileHelper.fileExists(pathPages)) {
			Map<String,String> pagesFiles = new FileHelper().readAllFileDirectory(pathPages);
			pagesFiles.entrySet().stream().forEach(f->{
				JavaClasse jcJavaPageC = new JavaClasse();
				jcJavaPageC.setName(f.getKey());
				jcJavaPageC.setContent(FileHelper.readFile(f.getValue(), ""));
				jcJavaPageC.setType(type);		
				String folder = f.getKey();
				if(folder.contains("$")) {
					folder = folder.substring(0, f.getKey().indexOf("$"));
				}
				folder = folder.replaceAll(".java", "").replaceAll(".class", "").replaceAll("View", "").replaceAll("Controller", "");
				jcJavaPageC.setFolder(folder);
				this.files.add(jcJavaPageC);
			});
		}
	}
	
	public byte[] export() {	
		Map<String,String> fileMap = new LinkedHashMap<>();
		fileMap.put("StoredPage", getStoredPage());
		fileMap.put("ConfigurationPages", getConfigurationPages());
		//fileMap.put("StoredApp", getStoredApp());
		return JarUnJarFile.convertFilesToJarBytes(fileMap, 9);
	}

	public Action getPage() {
		return page;
	}

	public void setPage(Action page) {
		this.page = page;
	}

	public List<JavaClasse> getFiles() {
		return files;
	}

	public void setFiles(List<JavaClasse> files) {
		this.files = files;
	}
	
}
