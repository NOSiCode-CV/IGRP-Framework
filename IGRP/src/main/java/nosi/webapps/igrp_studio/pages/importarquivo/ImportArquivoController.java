package nosi.webapps.igrp_studio.pages.importarquivo;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.Collection;
import java.util.Map;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.export.app.ImportAppJava;
import nosi.core.webapp.export.app.ImportJavaPage;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export.Import;
import nosi.core.webapp.import_export.ImportAppZip;
import nosi.core.webapp.import_export.ImportPluginIGRP;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.imports.ImportHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.ImportExportDAO;
		/*----#end-code----*/
		
public class ImportArquivoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ImportArquivo model = new ImportArquivo();
		model.load();
		ImportArquivoView view = new ImportArquivoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao_script.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao_combo_img.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.list_aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
			view.tipo.setQuery(Core.query(null,"SELECT '2' as ID,'Image asset' as NAME union all SELECT '1' as ID,'Icon App' as NAME union all  SELECT '3' as ID,'[Report] Image' as NAME"));
      	if(Core.isNullOrZero(model.getTipo()))
      		model.setTipo(2);
      	
      //	model.getForm_5_link_1_desc()
      	view.list_aplicacao.setValue(new Application().getListApps());	
		view.aplicacao_script.setValue(new Application().getListApps());
		view.aplicacao_combo_img.setValue(new Application().getListApps());   
     	String dad = Core.getCurrentDad();
        Integer id_dad=Core.getParamInt("p_env_fk");
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {     
			id_dad=(Core.findApplicationByDad(dad)).getId();
          	view.list_aplicacao.propertie().add("disabled","true");
       		view.aplicacao_script.propertie().add("disabled","true");
          	view.aplicacao_combo_img.propertie().add("disabled","true");      	
			
		}
      		model.setList_aplicacao(""+id_dad);
        	model.setAplicacao_script(""+id_dad);
          	model.setAplicacao_combo_img(""+id_dad);      
		if(Core.isNotNull(model.getAplicacao_script())) {			
			final Map<Object, Object> listDSbyEnv = new Config_env().getListDSbyEnv(Core.toInt(model.getAplicacao_script()));
			if(listDSbyEnv.size() == 2){
				model.setData_source(listDSbyEnv.keySet().toArray()[1].toString());
			}
			view.data_source.setValue(listDSbyEnv);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionBtm_import_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ImportArquivo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(btm_import_aplicacao)----*/
			try {
			
			if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
				boolean result = false;
				String descricao = "";
				try {
					Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_aplicacao");
					descricao += file.getSubmittedFileName().replace(".app.jar", "").replace(".zip", "");
					descricao += " "+file.getSize()+" KB";
					if(file.getSubmittedFileName().endsWith(".zip") || file.getSubmittedFileName().endsWith(".jar")) {
						if(file.getSubmittedFileName().endsWith(".zip")){
							result = new Import().importApp(new ImportAppZip(file));
						}else if(file.getSubmittedFileName().endsWith(".jar") && !file.getSubmittedFileName().endsWith(".app.jar")){					
							ImportHelper importApp = new ImportHelper();
							importApp.importFile(file);
							if(!importApp.hasError() && !importApp.hasWarning()) {
								result = true;
							}
							else {
								if(importApp.hasError()) {
									importApp.getErrors().stream().forEach(e->{
										Core.setMessageError(e);
									});
								}
								if(importApp.hasWarning()) {
									importApp.getWarnings().stream().forEach(e->{
										Core.setMessageWarning(e);
									});
								}
							}
						}else if(file.getSubmittedFileName().endsWith(".app.jar")){//Old import (deprecated)			
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
					}else {
						Core.setMessageError("Extensão válido tem de ser .zip ou .app.jar... tente de novo!!");
					}
					
					FileHelper.deletePartFile(file);
				} catch (ServletException e) {		
					ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import - Exception");
					ie_dao = ie_dao.insert();
				
					Core.setMessageError(e.getMessage());
					return this.forward("igrp_studio", "ImportArquivo", "index");
				}	
				if(result){
					ImportExportDAO ie_dao = new ImportExportDAO(descricao, Core.getCurrentUser().getUser_name(), Core.getCurrentDataTime(), "Import");
					ie_dao = ie_dao.insert();
					Core.setMessageSuccess();
				}
					
			}
			
		} catch (Exception e) {
			e.printStackTrace(); 
			Core.setMessageError(); 
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionImportar_jar_file() throws IOException, IllegalArgumentException, IllegalAccessException{
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ImportArquivo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(importar_jar_file)----*/
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
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
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ImportArquivo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(importar_script)----*/
	try {
           String dad = Core.getCurrentDad();        
            this.addQueryString("p_env_fk",model.getAplicacao_script());
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad))     			
        	model.setAplicacao_script(""+(Core.findApplicationByDad(dad)).getId());
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
	
	public Response actionImport_images() throws IOException, IllegalArgumentException, IllegalAccessException{
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ImportArquivo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(import_images)----*/
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
           String dad = Core.getCurrentDad();    
          this.addQueryString("p_env_fk",model.getAplicacao_combo_img());
          this.addQueryString("p_tipo",model.getTipo());
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) 
          	model.setAplicacao_combo_img(""+(Core.findApplicationByDad(dad)).getId());  
			
		try {
				Collection<Part> parts = Core.getFiles();
				boolean imported = false;
             
				Application application = Core.findApplicationById(Core.toInt(model.getAplicacao_combo_img()));
				for(Part part:parts){
					if(part!=null) {
						String fileName = part.getSubmittedFileName();
						if(Core.isNotNull(fileName)) {
							int index = fileName.lastIndexOf(".");
							if(index!=-1) { 
								String extensionName = fileName.substring(index+1); 
								String appImgPath = application.getDad();
                              	if(model.getTipo() != 1){                               		
                              		
                              		if(model.getTipo() == 3) 
                              			appImgPath += File.separator + "reports"; 
                              		String imgWorkSapce = Path.getImageWorkSpace(appImgPath);
                              		
                          		  //Saving in your workspace case exists
                                  if(Core.isNotNull(imgWorkSapce)) 
									imported = FileHelper.saveImage(imgWorkSapce, fileName,extensionName.toLowerCase(), part);
                                  //Saving into server
								 imported = FileHelper.saveImage(Path.getImageServer(appImgPath), fileName,extensionName.toLowerCase(), part);								
								 this.addQueryString("p_form_5_link_1","../images/IGRP/IGRP2.3/assets/img/"+appImgPath.replaceAll("\\\\","/")+"/"+fileName+"\n");		 
                              	}else{
                                  String imgWorkSapce1 = Path.getImageWorkSpace("iconApp");
                                  if(Core.isNotNull(imgWorkSapce1))//Saving in your workspace case exists
									imported = FileHelper.saveImage(imgWorkSapce1, fileName,extensionName.toLowerCase(), part);
                                  imported = FileHelper.saveImage(Path.getImageServer("iconApp"), fileName,extensionName.toLowerCase(), part);    
                               
                         
                              	}	                              	
                 
							}
						}
					}
				}
				if(imported){
					Core.setMessageSuccess();
				}else{
					Core.setMessageError();
				}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionBtm_importar_page() throws IOException, IllegalArgumentException, IllegalAccessException{
		ImportArquivo model = new ImportArquivo();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ImportArquivo","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(btm_importar_page)----*/
		
	if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			boolean result = false;
			String descricao = "";		
			if(model.getList_aplicacao() != null){
				try {
					Part file = Igrp.getInstance().getRequest().getPart("p_arquivo_pagina");
					descricao += file.getSubmittedFileName().replace(".page.jar", "").replace(".zip", "");
					if(file.getSubmittedFileName().endsWith(".zip") || file.getSubmittedFileName().endsWith(".page.jar")) {
						if(file.getSubmittedFileName().endsWith(".zip")){
							result = new Import().importPage(new ImportAppZip(file),new Application().findOne(Integer.parseInt(model.getList_aplicacao())));
					}else if(file.getSubmittedFileName().endsWith(".jar") && !file.getSubmittedFileName().endsWith(".page.jar")){
							ImportHelper importApp = new ImportHelper();
							importApp.importFile(file);
							if(!importApp.hasError() && !importApp.hasWarning()) {
								result = true;
							}
							
							else {
								if(importApp.hasError()) {
									importApp.getErrors().stream().forEach(e->{
										Core.setMessageError(e);
									});
								}
								if(importApp.hasWarning()) {
									importApp.getWarnings().stream().forEach(e->{
										Core.setMessageWarning(e);
									});
								}
							}
						}else if(file.getSubmittedFileName().endsWith(".page.jar")){//Old import (deprecated)
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
					}else {
						Core.setMessageError("Extensão válido tem de ser .zip ou .page.jar... tente de novo!!");
						
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
				}else
					Core.setMessageInfo("Check if the page was added!");
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
