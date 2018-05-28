package nosi.core.webapp.export.app;

import javax.servlet.http.Part;
import javax.ws.rs.core.MediaType;
import com.google.gson.reflect.TypeToken;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.DeploymentService;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.import_export.FileImportAppOrPage;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateParam;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.User;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Emanuel
 * 4 Apr 2018
 */
public class ImportAppJava {

	private Part file;
	private Application app;
	private Config config;
	private User user;
	private List<String> errors;
	private List<FileImportAppOrPage> pagesToCompile;
	
	public ImportAppJava(Part file) {
		this.file = file;
		this.config = new Config();
		this.errors = new ArrayList<>();
		this.user = new User().findOne(0);
	}

	@SuppressWarnings("unchecked")
	public void importApp() {
		JarUnJarFile.readJarFile(this.file).entrySet().stream().forEach(j->{
			if(j.getKey().equalsIgnoreCase("ConfigurationPages")){
				List<JavaClasse> configPages = (List<JavaClasse>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<JavaClasse>>(){}.getType());
				this.saveConfigPages(configPages);
			}else if(j.getKey().equalsIgnoreCase("StoredApp")){
				StoredApplication app = (StoredApplication) ResponseConverter.convertJsonToDao(j.getValue(), StoredApplication.class);
				this.saveApp(app);
			}else if(j.getKey().equalsIgnoreCase("StoredPage")){
				List<StoredPages> pages = (List<StoredPages>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<StoredPages>>(){}.getType());
				this.savePages(pages);
			}else if(j.getKey().equalsIgnoreCase("StoredBpmns")){
				List<String> bpmns = (List<String>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<String>>() {}.getType());
				this.saveBpmns(bpmns);
			}else if(j.getKey().equalsIgnoreCase("StoredReports")){
				List<StoredReports> reports = (List<StoredReports>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<StoredReports>>(){}.getType());
				this.saveReports(reports);
			}else if(j.getKey().equalsIgnoreCase("StoredConfigDb")){
				List<StoredConfigDB> configsBd = (List<StoredConfigDB>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<StoredConfigDB>>(){}.getType());
				this.saveConfigDb(configsBd);
			}
		});
		this.processCompile();
		try {
			if(file!=null)
				file.delete();
		} catch (IOException e) {
			this.errors.add(e.getMessage());
		}
	}

	private void saveConfigPages(List<JavaClasse> configPages) {
		this.pagesToCompile = new ArrayList<>();
		configPages.stream().forEach(c->{
			try {
				this.saveConfigPage(c);
			} catch (IOException e) {
				this.errors.add(e.getMessage());
			}
		});
	}

	private void saveConfigPage(JavaClasse c) throws IOException {
		String path = "";
		String pathWorkSpace = "";
		String folderPage = c.getName().substring(0, c.getName().indexOf("."));
		String classJavaPath = config.getPathServerClass(this.app.getDad());
		pathWorkSpace = this.config.getBasePahtClassWorkspace(this.app.getDad())+File.separator+folderPage.toLowerCase();
		if(c.getType().equalsIgnoreCase("hibernate-config")) {
			path = this.config.getBasePathClass();
			pathWorkSpace = this.config.getRawBasePathResourcesWorkspace();
		}else if(c.getType().equalsIgnoreCase("xsl-xml-json")) {
			
			//Get xml, json and xsl
			String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getAbsolutePath();
			path =  warName + File.separator + config.getImageAppPath(this.app) + File.separator + folderPage.toLowerCase();
			//path = this.config.getBaseServerPahtXsl(this.app) + File.separator + folderPage.toLowerCase();
			pathWorkSpace = this.config.getBasePahtXslWorkspace(this.app)+File.separator+folderPage.toLowerCase();
			
		}else if(c.getType().equalsIgnoreCase("pages")) {
			path = classJavaPath+"pages"+File.separator+c.getFolder().toLowerCase();
			pathWorkSpace = this.config.getBasePahtClassWorkspace(this.app.getDad())+File.separator+"pages"+File.separator+c.getFolder().toLowerCase();
		}else if(c.getType().equalsIgnoreCase("dao")) {
			path = classJavaPath+"dao"+File.separator+c.getFolder().toLowerCase();	
			pathWorkSpace = this.config.getBasePahtClassWorkspace(this.app.getDad())+File.separator+"dao"+File.separator+c.getFolder().toLowerCase();	
		}else if(c.getType().equalsIgnoreCase("services")) {
			path = classJavaPath+"services"+File.separator+c.getFolder().toLowerCase();	
			pathWorkSpace = this.config.getBasePahtClassWorkspace(this.app.getDad())+File.separator+"services"+File.separator+c.getFolder().toLowerCase();
		}
		
		if(Core.isNotNull(this.config.getWorkspace()) && FileHelper.dirExists(this.config.getWorkspace())) 
			if(!c.getName().endsWith(".class")) 
				FileHelper.save(pathWorkSpace, c.getName(), c.getContent());
		
		FileHelper.save(path, c.getName(), c.getContent());
		if(c.getName().endsWith(".java")){
			FileImportAppOrPage fileJava = new FileImportAppOrPage(c.getName(), c.getContent(), 0);
			if(c.getName().endsWith("View.java"))
				fileJava.setOrder(1);
			if(c.getName().endsWith("Controller.java"))
				fileJava.setOrder(2);
			fileJava.setFolder(c.getFolder());
			this.pagesToCompile.add(fileJava);
		}
	}
	
	private void processCompile() {
		Collections.sort(this.pagesToCompile);
		for(FileImportAppOrPage file:this.pagesToCompile){
			String path = config.getPathServerClass(this.app.getDad())+"pages"+File.separator+file.getFolder().toLowerCase();
			Compiler compiler = new Compiler();
			compiler.compile(new File[] { new File(path + File.separator+file.getNome()) });
			compiler.hasError();
			if (compiler.hasError()) {
				this.errors.add("Ocorreu um erro ao compilar o ficheiro "+file.getNome());
			}
		}
	}

	private void saveReports(List<StoredReports> reports) {
		reports.stream().forEach(report->{
			this.saveReport(report);
		});
	}

	private void saveReport(StoredReports report) {
		CLob xml = new CLob();
		CLob xsl = new CLob();
		if(report.getXml_content() != null) {
			Core.mapper(report.getXml_content(), xml);
			xml = xml.insert();
		}
		if(report.getXsl_content() != null) {
			Core.mapper(report.getXml_content(), xsl);
			xsl = xsl.insert();
		}

		RepTemplate rep = new RepTemplate().find().andWhere("code", "=",report.getCode()).andWhere("application", "=",this.app.getId()).one();
		if(rep==null) {
			rep = new RepTemplate();
			Core.mapper(report, rep);
			rep.setUser_created(user);
			rep.setUser_updated(user);
			rep.setXml_content(xml);
			rep.setXsl_content(xsl);
			rep.setApplication(this.app);
			rep = rep.insert();
			for(StoredRepTemplateParam p:report.getParams()){
				RepTemplateParam param = new RepTemplateParam().find().andWhere("parameter", "=",p.getParameter()).andWhere("reptemplate", "=",rep.getId()).one();
				if(param==null) {
					param = new RepTemplateParam();
					param.setParameter(p.getParameter());
					param.setReptemplate(rep);
					param.insert();
				}
			}
		}
		
		for(StoredRepSource repsource:report.getReptemplatesources()){
			RepSource repS = new RepSource().find()
											.andWhere("application", "=",this.app.getId())
											.andWhere("name", "=",repsource.getName())
											.andWhere("type", "=",repsource.getName())
											.one();
			if(repS==null) {
				Config_env config_env = new Config_env().find().andWhere("name", "=",repsource.getConfig_env().getName()).andWhere("application", "=",this.app.getId()).one();
				repS = new RepSource();
				Core.mapper(repsource, repS);
				repS.setUser_created(user);
				repS.setUser_updated(user);
				repS.setConfig_env(config_env);
				repS.setApplication(this.app);
				repS.setApplication_source(this.app);
				repS = repS.insert();
				
				RepTemplateSource repTs = new RepTemplateSource();
				repTs.setRepSource(repS);
				repTs.setRepTemplate(rep);
			}
		}
	}

	private void saveBpmns(List<String> bpmns) {
		bpmns.stream().forEach(content->{
			int index = content.indexOf("<process id=\"");
			if(index != -1) {
				String fileName = content.substring(index+"<process id=\"".length(), content.indexOf("\" name",content.indexOf("<process id=\"")))+"_"+this.app.getDad()+".bpmn20.xml";
				InputStream file;
				try {
					file = FileHelper.convertStringToInputStream(content);
					DeploymentService deploy = new DeploymentService().getDeploymentByName(fileName);
					if(Core.isNull(deploy.getName()))
						deploy.create(file, this.app.getDad(), fileName, MediaType.APPLICATION_OCTET_STREAM);
				} catch (Exception e) {
					this.errors.add(e.getMessage());
				} 
			}
		});
	}

	private void saveConfigDb(List<StoredConfigDB> configsBd) {
		configsBd.stream().forEach(c->{
			this.saveConfigDb(c);
		});
	}

	private void saveConfigDb(StoredConfigDB c) {
		Config_env config = new Config_env().find().andWhere("name", "=",c.getName()).andWhere("application", "=",this.app.getId()).one();
		if(config == null) {
			config = new Config_env();
			Core.mapper(c, config);
			config.setApplication(this.app);
			config = config.insert();
		}
	}

	private void savePages(List<StoredPages> pages) {
		pages.stream().forEach(page->{
			this.savePage(page);
		});
	}

	private void savePage(StoredPages page) {
		Action action = new Action().find().andWhere("page", "=", page.getPage()).andWhere("application", "=", this.app.getId()).one();
		if(action == null) {
			action = new Action();
			Core.mapper(page, action);
			action.setApplication(this.app);
			
			Modulo modulo = new Modulo();
			modulo.setId(page.getModule_fk());
			action.setModulo(modulo);
			
			action = action.insert();
		}
	}
	
	private void saveApp(StoredApplication sapp) {
		this.app = new Application().find().andWhere("dad", "=", sapp.getDad()).one();
		if(app == null) {
			this.app = new Application();
			Core.mapper(sapp, this.app);
			this.app = this.app.insert();	
			if(this.app != null && sapp.getModulos() != null) {
				saveModulo(sapp.getModulos());
			}
		}
	}
	
	private void saveModulo(List<StoredModulo> sM) {
		try {
			for(StoredModulo obj : sM) {
				Modulo modulo = new Modulo();
				modulo.setName(obj.getName());
				modulo.setApplication(this.app);
				modulo.insert();
			}
		}catch(Exception e) {
			 this.errors.add("Ocorreu um erro ao tentar gravar modulos.");
		}
		
	}

	public boolean hasError() {
		return this.errors!=null && !errors.isEmpty();
	}

	public List<String> getErros() {
		return this.errors;
	}

}
