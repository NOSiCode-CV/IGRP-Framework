
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
		try {
			Part jarFile = Igrp.getInstance().getRequest().getPart("p_arquivo");
			List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles(jarFile);
			String msg = null;
			for(FileOrderCompile file:un_jar_files){
				if(file.getNome().endsWith(".java")){
					msg = this.compileFiles(file);
					if(msg!=FlashMessage.MESSAGE_SUCCESS){	
						break;					
					}
				}else if(!file.getNome().startsWith("configApp") && !file.getNome().startsWith("configPage"))
					this.saveFiles(file);
				else if(file.getNome().startsWith("configApp"))
					this.saveConfigApp(file);
				else if(file.getNome().startsWith("configPage"))
					this.saveConfigPage(file);				
			}
			Igrp.getInstance().getFlashMessage().addMessage(msg==FlashMessage.MESSAGE_SUCCESS?FlashMessage.SUCCESS:FlashMessage.ERROR, msg);
		} catch (ServletException e) {
			e.printStackTrace();
		}		
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}


	private void saveConfigApp(FileOrderCompile file) {
		StringReader inputApp = new StringReader(file.getConteudo());
		XMLApplicationReader xmlApplication = JAXB.unmarshal(inputApp, XMLApplicationReader.class); 
		Application app = new Application();
		app.setDad(xmlApplication.getDad());
		if(app.find().andWhere("dad", "=", app.getDad()).one()==null){
			app.setDescription(xmlApplication.getDescription());
			app.setExternal(xmlApplication.getExternal());
			app.setImg_src(xmlApplication.getImg_src());
			app.setName(xmlApplication.getName());
			app.setStatus(xmlApplication.getStatus());
			app.setUrl(xmlApplication.getUrl());
			app.setAction(null);
			app = app.insert();
		}
	}


	private void saveConfigPage(FileOrderCompile file) {
		StringReader input = new StringReader(file.getConteudo());
		XMLPageReader xmlPage = JAXB.unmarshal(input, XMLPageReader.class);
		Action page = new Action();
		page.setAction(xmlPage.getAction());
		page.setPage(xmlPage.getPage());
		page.setPackage_name(xmlPage.getPackage_name());
		Application app = new Application().find().andWhere("dad", "=",xmlPage.getDad()).one();
		if(app!=null && new Action().find().andWhere("page", "=", page.getPage()).andWhere("action", "=", page.getAction()).andWhere("package_name", "=", page.getPackage_name()).andWhere("application.dad", "=", xmlPage.getDad()).one()==null){
			page.setAction_descr(xmlPage.getAction_desc());
			page.setPackage_name(xmlPage.getPackage_name());
			page.setPage(xmlPage.getPage());
			page.setPage_descr(xmlPage.getPage_desc());
			page.setStatus(xmlPage.getStatus());
			page.setVersion(xmlPage.getVersion());
			page.setXsl_src(xmlPage.getXsl_src()); 
			page.setApplication(app);
			page = page.insert();
		}
	}


	private void saveFiles(FileOrderCompile file) {
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
								  .andWhere("application.dad", "=", partPage[1])
								  .andWhere("page", "=", partPage[2])
								  .andWhere("action", "=", partPage[3])
								  .one();
		String path = Config.getBasePahtXsl(page);		
		FileHelper.createDiretory(path);
		try {
			//Guarda ficheiros no workspace caso existe
			if(FileHelper.fileExists(Config.getWorkspace())){
				String path_xsl_work_space = Config.getWorkspace()+File.separator+"WebContent"+File.separator+"images"+File.separator+"IGRP"+File.separator+"IGRP"+page.getVersion()+File.separator+"app"+File.separator+page.getApplication().getDad()+File.separator+page.getPage().toLowerCase();			
				FileHelper.save(path_xsl_work_space,partPage[4], file.getConteudo());
			}
			FileHelper.save(path, partPage[4], file.getConteudo());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private String compileFiles(FileOrderCompile file) {
		String[] partPage = file.getNome().split("/");
		Action page = new Action().find()
				  .andWhere("application.dad", "=", partPage[1])
				  .andWhere("page", "=", partPage[2])
				  .one();		
		String path_class = Config.getBasePathClass() + page.getPackage_name().replace(".",File.separator);
		try {
			FileHelper.save(path_class,partPage[3],file.getConteudo());
			if(FileHelper.fileExists(Config.getWorkspace())){
				String path_class_work_space = Config.getBasePahtClass(page.getApplication().getDad())+"pages"+File.separator+page.getPage().toLowerCase();
				FileHelper.save(path_class_work_space,partPage[3],file.getConteudo());
			}
			if(CompilerHelper.compile(path_class,partPage[3]))
				return FlashMessage.MESSAGE_SUCCESS;
			else
				return CompilerHelper.getError();
		} catch (IOException e) {
			return e.getMessage();
		}
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
	
}