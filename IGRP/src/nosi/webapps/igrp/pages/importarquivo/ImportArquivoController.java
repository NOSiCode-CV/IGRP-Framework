
package nosi.webapps.igrp.pages.importarquivo;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Response;
import nosi.core.webapp.import_export.Import;
import nosi.core.webapp.import_export.ImportAppJar;
import nosi.core.webapp.import_export.ImportAppZip;
import nosi.core.webapp.import_export.ImportPluginIGRP;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load(); 
		}
		ImportArquivoView view = new ImportArquivoView(model);
		view.list_aplicacao.setSqlQuery("SELECT id,name FROM tbl_env");
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionBtm_import_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(BTM_IMPORT_APLICACAO)----*/
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			boolean result = false;
			String descricao = "";
			try {
				Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_aplicacao");
				descricao += file.getSubmittedFileName().replace(".app.jar", "").replace(".zip", "");
				if(file.getSubmittedFileName().endsWith(".zip")){
					result = new Import().importApp(new ImportAppZip(file));
				}else if(file.getSubmittedFileName().endsWith(".app.jar")){
					result = new Import().importApp(new ImportAppJar(file));
				}else{
					result = false;
				}
			} catch (ServletException e) {
				Core.setMessageError(e.getMessage());
				return this.forward("igrp", "ImportArquivo", "index");
			}	
			if(result){
				ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import");
				ie_dao = ie_dao.insert();
				Core.setMessageSuccess();
			}else
				Core.setMessageError(FlashMessage.ERROR_IMPORT);		
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionBtm_importar_page() throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		/*----#START-PRESERVED-AREA(BTM_IMPORTAR_PAGE)----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			boolean result = false;
			String descricao = "";
			model.load();
			if(model.getList_aplicacao()!=null){
				try {
					Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_pagina");
					descricao += file.getSubmittedFileName().replace(".page.jar", "").replace(".zip", "");
					if(file.getSubmittedFileName().endsWith(".zip")){
						result = new Import().importPage(new ImportAppZip(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
					}else if(file.getSubmittedFileName().endsWith(".page.jar")){
						result = new Import().importPage(new ImportAppJar(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
					}else{
						result = false;
					}
				} catch (ServletException e) {
					Core.setMessageError(e.getMessage());;
					return this.forward("igrp", "ImportArquivo", "index");
				}
				if(result){
					ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import");
					ie_dao = ie_dao.insert();
					Core.setMessageSuccess();
				}else
					Core.setMessageError(FlashMessage.ERROR_IMPORT);
			}
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionImportar_jar_file() throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		/*----#START-PRESERVED-AREA(IMPORTAR_JAR_FILE)----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
			boolean imported = false;
			for(Part part:parts){
				if(part.getSubmittedFileName()!=null && part.getSubmittedFileName().endsWith(".jar")){
					imported = new ImportPluginIGRP().importPlugin(part);
				}else{
					imported = false;
					break;
				}
			}
			if(imported){
				Core.setMessageSuccess();
			}else{
				Core.setMessageError(FlashMessage.ERROR_IMPORT);
			}
		}
		return this.redirect("igrp","ImportArquivo","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
