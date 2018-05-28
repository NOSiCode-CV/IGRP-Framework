package nosi.core.webapp.export.app;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.Part;
import com.google.gson.reflect.TypeToken;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.import_export.FileImportAppOrPage;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;

/**
 * Iekiny Marcel
 * Apr 5, 2018
 */
public class ImportJavaPage {
	
	private Part file;
	private Action page;
	private Application env;
	private Config config;
	private User user;
	private List<String> errors;
	private List<FileImportAppOrPage> pagesToCompile;
	
	public ImportJavaPage(Part file, Application app) {
		this.file = file;
		this.config = new Config();
		this.errors = new ArrayList<>();
		this.user = new User().findOne(0);
		this.env = app;
	}
	
	
	public void importApp() {
		JarUnJarFile.readJarFile(this.file).entrySet().stream().forEach(j->{
			
			 if(j.getKey().equalsIgnoreCase("StoredPage")){
				StoredPages pagina = (StoredPages) ResponseConverter.convertJsonToDao(j.getValue(), StoredPages.class);
				if(env != null) {
					page = new Action().find().andWhere("page", "=", pagina.getPage()).andWhere("application.id", "=", this.env.getId()).one();
					if(page == null && pagina != null) {
						page = new Action();
						Core.mapper(pagina, page);
						page.setApplication(env);
						if((page = page.insert()) == null)
							this.errors.add("Oooops ! Não foi possivel registar as informações da página.");
					}
				}else
					this.errors.add("Ocorreu um erro ! Aplicação destino inválido.");
				
			}else if(j.getKey().equalsIgnoreCase("ConfigurationPages")){
				System.out.println(j.getValue());
				List<JavaClasse> configPages = (List<JavaClasse>) ResponseConverter.convertJsonToListDao(j.getValue(), new TypeToken<List<JavaClasse>>(){}.getType());
				this.saveConfigPages(configPages);
			}
		});
		
		//if(page != null ) page = page.insert();
		
		this.processCompile();
		
		try {
			if(file!=null)
				file.delete();
		} catch (IOException e) {
			this.errors.add(e.getMessage());
		}
	}
	
	public boolean hasError() {
		return this.errors!=null && !errors.isEmpty();
	}

	public List<String> getErros() {
		return this.errors;
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
		String classJavaPath = config.getPathServerClass(this.page.getApplication().getDad());
		pathWorkSpace = this.config.getBasePahtClassWorkspace(this.page.getApplication().getDad())+File.separator+folderPage.toLowerCase();
		if(c.getType().equalsIgnoreCase("xsl-xml-json")) {
			
		//	path = this.config.getBaseServerPahtXsl(this.page.getApplication())+File.separator+folderPage.toLowerCase();
			
			String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getAbsolutePath();
			//String xslXMLJsonPath = config.getBaseServerPahtXsl(this.page.getApplication())+File.separator;
			 path =  warName + File.separator + config.getImageAppPath(this.page.getApplication()) + File.separator+folderPage.toLowerCase();
			  
			pathWorkSpace = this.config.getBasePahtXslWorkspace(this.page.getApplication())+File.separator+folderPage.toLowerCase();
			
		}else if(c.getType().equalsIgnoreCase("pages")) {
			path = classJavaPath+"pages"+File.separator+c.getFolder().toLowerCase();
			pathWorkSpace = this.config.getBasePahtClassWorkspace(this.page.getApplication().getDad())+File.separator+"pages"+File.separator+c.getFolder().toLowerCase();
		}
		
		if(Core.isNotNull(this.config.getWorkspace()) && FileHelper.dirExists(this.config.getWorkspace())) {
			 
			if(c.getType().equalsIgnoreCase("pages")) {
				String pack = c.getContent().trim();
				String content = pack.substring(pack.indexOf(";",pack.indexOf("package")));
				//pack = pack.substring(0, pack.indexOf("package") +"package".length()) + " " + page.getPackage_name() + "." + page.getPage().toLowerCase()
				pack = "package nosi.webapps." + page.getApplication().getDad().toLowerCase() + ".pages." + page.getPage().toLowerCase() + ";" + System.lineSeparator();
				content = pack + content.replaceFirst(";", "");
				c.setContent(content);
			}
			
			if(!c.getName().contains(".class"))
				FileHelper.save(pathWorkSpace, c.getName(), c.getContent());
		}
		
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
			String path = config.getPathServerClass(this.page.getApplication().getDad())+"pages"+File.separator+file.getFolder().toLowerCase();
			Compiler compiler = new Compiler();
			compiler.compile(new File[] { new File(path + File.separator+file.getNome()) });
			if (compiler.hasError()) {
				this.errors.add("Ocorreu um erro ao compilar o ficheiro "+file.getNome());
			}
		}
	}
	

}
