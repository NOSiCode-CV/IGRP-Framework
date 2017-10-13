/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;

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
		Map<String , String> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\ListaEnv.jar");
		boolean status_compile = false;
		for(Map.Entry<String, String> un_jar_file:un_jar_files.entrySet()) {
			if(un_jar_file.getKey().contains(".java")) {
				//FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getKey(), un_jar_file.getValue());
			    status_compile = CompilerHelper.compile("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getKey()); 
			}
			
			if(un_jar_files.containsKey(".xml")) {
				
			}
			//System.out.println(un_jar_file.getKey());
			//System.out.println(un_jar_file.getValue());
		}
		//System.out.println(un_jar_files); 
		if(status_compile){
			Igrp.getInstance().getFlashMessage().addMessage("success", "Arquivo Importado com sucesso");
		}else {
			Igrp.getInstance().getFlashMessage().addMessage("error", "Ups!!! Ocorreu um Erro...");
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
	
	
	public static void main(String [] args) throws IOException {
		
		Map<String , String> un_jar_files = JarUnJarFile.getJarFiles("C:\\Users\\isaias.nunes\\Downloads\\Dominio.jar");
		//boolean status_compile = false;
		
		for(Map.Entry<String, String> un_jar_file:un_jar_files.entrySet()) {
			//if(un_jar_file.getKey().contains(".xml")) {
				FileHelper.save("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getKey(), un_jar_file.getValue());
			    //status_compile = CompilerHelper.compile("C:\\Users\\isaias.nunes\\Downloads", un_jar_file.getKey()); 
			//System.out.println(un_jar_file.getKey());	
			//System.out.println(un_jar_file.getValue()); 
			//}
			/*
			if(un_jar_files.containsKey(".xml")) {
				
			}*/
			//System.out.println(un_jar_file.getKey());
			//System.out.println(un_jar_file.getValue());
		}
		
		
		//System.out.println(status_compile); 
	}
	
	
	
	
	
	
	
}
