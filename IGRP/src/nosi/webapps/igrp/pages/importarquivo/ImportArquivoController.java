/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
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
		List<FileOrderCompile> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\ListaPage.jar");
		boolean status_compile = false;
		Application app = null;
		Action page = null;
		for(FileOrderCompile un_jar_file:un_jar_files) {
			FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome(), un_jar_file.getConteudo());
		}
		
		for(FileOrderCompile un_jar_file:un_jar_files) {
			if(un_jar_file.getNome().contains(".java")) {
				status_compile = CompilerHelper.compile("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getNome());
			}
			
			if(un_jar_file.getNome().contains("Config.xml")) {
				StringReader input = new StringReader(un_jar_file.getConteudo());
				XMLPageReader xml = JAXB.unmarshal(input, XMLPageReader.class);
				page = new Action();
				app = new Application();
				page.setAction(xml.getAction());
				page.setAction_descr(xml.getAction_desc());
				page.setPackage_name(xml.getPackage_name());
				page.setPage(xml.getPage());
				page.setPage_descr(xml.getPage_desc());
				page.setStatus(xml.getStatus());
				page.setVersion(xml.getVersion());
				page.setXsl_src(xml.getXsl_src());
				page.setApplication(app.findOne(xml.getEnv_fk()));
				page = page.insert();
				
			}
		}
		if(status_compile && page != null){
			Igrp.getInstance().getFlashMessage().addMessage("success", "Arquivo Importado com sucesso");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Ups!!! Ocorreu um Erro...");
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
	
	
	
	
	public static void main(String [] args) throws IOException {
	}
	
	
}
