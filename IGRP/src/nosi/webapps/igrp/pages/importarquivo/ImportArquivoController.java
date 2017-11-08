/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;


import nosi.core.config.Config;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.import_export.Import;
import nosi.core.webapp.import_export.ImportAppJar;
import nosi.core.webapp.import_export.ImportAppZip;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
/*---- End ----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		ImportArquivoView view = new ImportArquivoView(model);
		view.list_aplicacao.setSqlQuery("SELECT id,name FROM tbl_env");
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionBtm_import_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		boolean result = false;
		String descricao = "";
		try {
			Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_aplicacao");
			descricao += file.getSubmittedFileName().replace(".jar", "").replace(".zip", "");
			if(file.getSubmittedFileName().endsWith(".zip")){
				result = new Import().importApp(new ImportAppZip(file));
			}else if(file.getSubmittedFileName().endsWith(".jar")){
				result = new Import().importApp(new ImportAppJar(file));
			}
		} catch (ServletException e) {
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, e.getMessage());
			return this.forward("igrp", "ImportArquivo", "index");
		}	
		if(result){
			ImportExportDAO ie_dao = new ImportExportDAO(descricao, Config.getUserName(), DateHelper.getCurrentDataTime(), "Import");
			ie_dao = ie_dao.insert();
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.ERROR_IMPORT);
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	


	/*---- Insert your actions here... ----*/
	

	/*---- End ----*/
	
	public Response actionBtm_importar_page() throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		/*---- Insert your code here... ----*/
		boolean result = false;
		String descricao = "";
		ImportArquivo model = new ImportArquivo();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		if(model.getList_aplicacao()!=null){
			try {
				Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_pagina");
				descricao += file.getSubmittedFileName().replace(".jar", "").replace(".zip", "");
				if(file.getSubmittedFileName().endsWith(".zip")){
					result = new Import().importPage(new ImportAppZip(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
				}else if(file.getSubmittedFileName().endsWith(".jar")){
					result = new Import().importPage(new ImportAppJar(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
				}
			} catch (ServletException e) {
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, e.getMessage());
				return this.forward("igrp", "ImportArquivo", "index");
			}	
		}
		if(result){
			ImportExportDAO ie_dao = new ImportExportDAO(descricao, Config.getUserName(), DateHelper.getCurrentDataTime(), "Import");
			ie_dao = ie_dao.insert();
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.ERROR_IMPORT);
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
}