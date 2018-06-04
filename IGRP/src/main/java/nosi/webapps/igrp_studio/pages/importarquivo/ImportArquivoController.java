
package nosi.webapps.igrp_studio.pages.importarquivo;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.export.app.ImportAppJava;
import nosi.core.webapp.export.app.ImportJavaPage;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export.Import;
import nosi.core.webapp.import_export.ImportAppZip;
import nosi.core.webapp.import_export.ImportPluginIGRP;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.core.webapp.Igrp;
/*----#end-code----*/


public class ImportArquivoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ImportArquivo model = new ImportArquivo();
		model.load();
		ImportArquivoView view = new ImportArquivoView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.list_aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao_script.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/
		view.list_aplicacao.setValue(new Application().getListApps());	
		view.aplicacao_script.setValue(new Application().getListApps());
		if(Core.isNotNull(model.getAplicacao_script())) {
			view.data_source.setValue(new Config_env().getListEnv(Core.toInt(model.getAplicacao_script())));
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionBtm_import_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ImportArquivo","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(btm_import_aplicacao)----*/
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			boolean result = false;
			String descricao = "";
			try {
				Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_aplicacao");
				descricao += file.getSubmittedFileName().replace(".app.jar", "").replace(".zip", "");
				if(file.getSubmittedFileName().endsWith(".zip")){
					result = new Import().importApp(new ImportAppZip(file));
				}else if(file.getSubmittedFileName().endsWith(".app.jar")){					
					ImportAppJava importApp = new ImportAppJava(file);
					importApp.importApp();
					if(importApp.hasError()) {
						importApp.getErros().stream().forEach(err->{
							Core.setMessageError(err);
						});
					}else {
						result = true;
					}
				}else{
					result = false;
				}
				FileHelper.deletePartFile(file);
			} catch (ServletException e) {
				Core.setMessageError(e.getMessage());
				return this.forward("igrp_studio", "ImportArquivo", "index");
			}	
			if(result){
				ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import");
				ie_dao = ie_dao.insert();
				Core.setMessageSuccess();
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionBtm_importar_page() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ImportArquivo","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(btm_importar_page)----*/
		
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			boolean result = false;
			String descricao = "";
			model.load();
			if(model.getList_aplicacao() != null){
				try {
					Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_pagina");
					descricao += file.getSubmittedFileName().replace(".page.jar", "").replace(".zip", "");
					if(file.getSubmittedFileName().endsWith(".zip")){
						result = new Import().importPage(new ImportAppZip(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
					}else if(file.getSubmittedFileName().endsWith(".page.jar")){
						
						//result = new Import().importPage(new ImportAppJar(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
						Application application = new Application().findOne(Integer.parseInt(model.getList_aplicacao()));
						ImportJavaPage importApp = new ImportJavaPage(file, application);
						
						importApp.importApp();
						
						if(importApp.hasError()) {
							importApp.getErros().stream().forEach(err->{
								Core.setMessageError(err);
							});
						}else {
							result = true;
						}
					
					
					}else{
						result = false;
					}
					FileHelper.deletePartFile(file);
				} catch (ServletException e) {
					Core.setMessageError(e.getMessage());;
					return this.forward("igrp_studio", "ImportArquivo", "index");
				}
				if(result){
					ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import");
					ie_dao = ie_dao.insert();
					Core.setMessageSuccess();
				}else
					Core.setMessageError(FlashMessage.ERROR_IMPORT);
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionImportar_jar_file() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ImportArquivo","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(importar_jar_file)----*/
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			Collection<Part> parts;
			try {
				parts = Igrp.getInstance().getRequest().getParts();
				boolean imported = false;
				for(Part part:parts){
					if(part.getSubmittedFileName()!=null && part.getSubmittedFileName().endsWith(".jar")){
						imported = new ImportPluginIGRP().importPlugin(part);
					}
				}
				if(imported){
					Core.setMessageSuccess();
				}else{
					Core.setMessageError(FlashMessage.ERROR_IMPORT);
				}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionImportar_script() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ImportArquivo","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(importar_script)----*/
		try {
			this.loadQueryString();
			Part file = Core.getFile("p_sql_script");
			if(file!=null && Core.isNotNull(model.getData_source())) {
				ResultSet r = Core.executeQuery(new Config_env().find().andWhere("application", "=",Core.toInt(model.getAplicacao_script())).andWhere("id", "=",Core.toInt(model.getData_source())).one(), FileHelper.convertToString(file));
				if(r.hasError()) {
					Core.setMessageError(r.getError());
				}else {
					Core.setMessageSuccess();
				}
				file.delete();
			}else {
				Core.setMessageError();
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
