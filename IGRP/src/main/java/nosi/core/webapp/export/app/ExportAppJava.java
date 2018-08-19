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
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.ResourceService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.RepTemplate;

/**
 * Emanuel
 * 3 Apr 2018
 */
public class ExportAppJava {

	private Application app;
	private List<JavaClasse> files;
	
	public ExportAppJava(Integer applicationId) {
		this.app = new Application().findOne(applicationId);
		this.files = new ArrayList<>();
	}
	
	private String getStoredApp() {
		if(this.app!=null) {
			StoredApplication stapp = new StoredApplication();
			Core.mapper(this.app, stapp);
			
			List<StoredModulo> sm = getStoredModulos();
			if(sm != null && sm.size() > 0)
				stapp.setModulos(sm);
			
			return new Gson().toJson(stapp);
		}
		return null;
	}
	
	private List<StoredModulo> getStoredModulos() {
		List<StoredModulo> sm = null;
		List<Modulo> modulos = new Modulo().getModuloByApp(this.app.getId());
		if(modulos != null && modulos.size() > 0) {
			sm = new ArrayList<StoredModulo>();
			for(Modulo obj : modulos) {
				StoredModulo aux = new StoredModulo();
				Core.mapper(obj, aux);
				sm.add(aux);
			}
		}
		return sm;
	}
	
	private String getStoredPages() {
		if(this.app!=null) {
			List<Action> actions = new Action().find().andWhere("application","=", this.app.getId()).all();
			List<StoredPages> stpages = new ArrayList<>();
			actions.stream().forEach(a->{
				StoredPages stp = new StoredPages();				
				Core.mapper(a, stp);
				if(a.getModulo() != null)
					stp.setModule_fk(a.getModulo().getId());
				stpages.add(stp);
			});			
			return new Gson().toJson(stpages);
		}
		return null;
	}
	
	private String getStoredConfigDb() {		
		if(this.app!=null) {
			List<Config_env> configs = new Config_env().find().andWhere("application","=",this.app.getId()).all();
			//Get Hibernate Config
			String pathHc = new Config().getBasePathClass();
			List<StoredConfigDB> stconfigs = new ArrayList<>();
			configs.stream().forEach(c->{
				StoredConfigDB stc = new StoredConfigDB();
				Core.mapper(c, stc);
				stconfigs.add(stc);
				JavaClasse jcHC = new JavaClasse();
				jcHC.setName(c.getName()+".cfg.xml");
				jcHC.setContent(FileHelper.readFile(pathHc,jcHC.getName()));
				jcHC.setType("hibernate-config");				
				files.add(jcHC);
			});
			return new Gson().toJson(stconfigs);
		}
		return null;
	}
	
	
	private String getStoredReports() {		
		if(this.app != null) {
			List<RepTemplate> reports = new RepTemplate().find().andWhere("application","=",this.app.getId()).all();			
			List<StoredReports> storedRp = new ArrayList<>();	
			reports.stream().forEach(r->{
				StoredReports report = new StoredReports();				
				List<StoredRepSource> storedRs = new ArrayList<>();
				r.getReptemplatesources().stream().forEach(rt->{
					StoredRepSource srs = new StoredRepSource();
					Core.mapper(rt.getRepSource(), srs);
					StoredConfigDB configDb = new StoredConfigDB();
					Core.mapper(rt.getRepSource().getConfig_env(), configDb);
					srs.setConfig_env(configDb);
					storedRs.add(srs);
				});
				List<StoredRepTemplateParam> parmas = new ArrayList<>();
				r.getParams().stream().forEach(p->{
					StoredRepTemplateParam srtp = new StoredRepTemplateParam();
					Core.mapper(p, srtp);
					parmas.add(srtp);
				});
				Core.mapper(r, report);
				report.setReptemplatesources(storedRs);
				report.setParams(parmas);
				storedRp.add(report);
			});
			return new Gson().toJson(storedRp);
		}
		return null;
	}

	private String getStoredBpmns() {
		if(this.app!=null) {
			List<String> bpmns = new ArrayList<>();
			List<ProcessDefinitionService> list = new ProcessDefinitionService().getProcessDefinitionsAtivos(this.app.getDad());
			list.stream().forEach(d->{
				ProcessDefinitionService process = new ProcessDefinitionService().getProcessDefinition(d.getId());
				String link = process.getResource().replace("/resources/", "/resourcedata/");
				String resource = new ResourceService().getResourceData(link);
				resource = resource.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "<?xml version='1.0' encoding='UTF-8'?>");
				bpmns.add(resource);
			});
			return new Gson().toJson(bpmns);
		}
		return null;
	}
	
	private String getConfigurationPages() {
		if(this.app!=null) {
			Config config = new Config();
			
			//Get xml, json and xsl
			//String xslXMLJsonPath = config.getBaseServerPahtXsl(this.app)+File.separator;
			
			//Get xml, json and xsl
			String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getAbsolutePath();
			String xslXMLJsonPath =  warName + File.separator + config.getImageAppPath(this.app,"2.3") + File.separator;
				
			this.getJavaFiles(xslXMLJsonPath,"xsl-xml-json");			
			
			if(Core.isNotNull(config.getWorkspace()) && FileHelper.dirExists(config.getWorkspace())) {
				String classJavaPath = config.getBasePahtClassWorkspace(this.app.getDad()) + File.separator;
				//Get classes Pages in format .java and .class 
				String pathPages = classJavaPath+"pages"+File.separator;
				this.getJavaFiles(pathPages,"pages");
				//Get class DAO 
				String pathDao = classJavaPath+"dao"+File.separator;	
				
				this.getJavaFiles(pathDao,"dao");
				// Get class Services 
				String pathServices = classJavaPath+"services"+File.separator;			
				this.getJavaFiles(pathServices,"services");	
			}else {
				String classJavaPath = config.getPathServerClass(this.app.getDad());
				//Get classes Pages in format .java and .class 
				String pathPages = classJavaPath+"pages"+File.separator;
				this.getJavaFiles(pathPages,"pages");
				//Get class DAO
				String pathDao = classJavaPath+"dao"+File.separator;			
				this.getJavaFiles(pathDao,"dao");
				//Get class Services
				String pathServices = classJavaPath+"services"+File.separator;			
				this.getJavaFiles(pathServices,"services");	
			}
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
				
				if(type.equalsIgnoreCase("dao") || type.equalsIgnoreCase("services"))
					jcJavaPageC.setFolder("");
				else 
					jcJavaPageC.setFolder(folder);
				
				this.files.add(jcJavaPageC);
			});
		}
	}
	
	public byte[] export() {	
		Map<String,String> fileMap = new LinkedHashMap<>();
		fileMap.put("StoredApp", getStoredApp());
		fileMap.put("StoredPage", getStoredPages());
		fileMap.put("StoredConfigDb", getStoredConfigDb());
		fileMap.put("StoredBpmns", getStoredBpmns());
		fileMap.put("StoredReports", getStoredReports());
		fileMap.put("ConfigurationPages", getConfigurationPages());
		return JarUnJarFile.convertFilesToJarBytes(fileMap, 9);
	}
	
}
