
package nosi.webapps.igrp.pages.listaenv;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
/*----#END-PRESERVED-AREA----*/

public class ListaEnvController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		ListaEnv model = new ListaEnv();
		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application app = new Application();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			
			//app.setDad(model.getDad());
			//app.setName(model.getNome());
		}
		List<Application> apps = new ArrayList<>();
		User user = (User) Igrp.getInstance().getUser().getIdentity();
		String dad = Permission.getCurrentEnv();		
		if("igrp".equalsIgnoreCase(dad)){
			apps = 	app.find()
						//.andWhere("dad", "like", app.getDad())
						//.andWhere("name", "like", app.getName())
						.all();
		}else{
			apps = app.getListMyApp(user.getId());
		}
		
		for(Application a:apps){
			if(!a.getDad().toLowerCase().equals("igrp")){
				ListaEnv.Table_1 table = new ListaEnv.Table_1();
				table.setDad(a.getDad());
				table.setName(""+a.getName());
				table.setStatus(a.getStatus());
				if(a.getStatus()==1){
					table.setStatus_check(a.getStatus());
				}
				table.setP_id(""+a.getId());
               table.setT_page_builder("igrp","ListaPage","index&amp;app="+a.getId());
                table.setT_page_builder_desc("Page builder");
				lista.add(table);
			}
		}
		model.setTable_1(lista);
		
		ListaEnvView view = new ListaEnvView(model);
		view.table_1.addData(model.getTable_1());
		//view.title = gt("Lista Aplicação");
		view.p_id.setParam(true);
       view.btn_eliminar.setVisible(false);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionImportar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(IMPORTAR)----*/
			return this.redirect("igrp_studio","ImportArquivo","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(NOVO)----*/
		return this.redirect("igrp","Env","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEditar() throws IOException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(p_id!=null && !p_id.equals("")){
			return this.forward("igrp","Env","editar&target=_blank&id="+p_id);
		}
      return this.redirect("igrp","lista-env","index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEliminar() throws IOException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		Application app = new Application();
		if(app.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MESSAGE_ERROR);
		return this.redirect("igrp","lista-env","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionConfigurar_base_dados() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(CONFIGURAR_BASE_DADOS)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			return this.redirect("igrp", "ConfigDatabase", "index&target=_blank&id="+id);
		}
		return this.forward("igrp", "ListaEnv", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionExportar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EXPORTAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id != null && !id.equals("")) {
			Application app = new Application().findOne(id);
			if(app!=null){
				ImportExportApp iea = new ImportExportApp();
				if(iea.validateExportApp(app)){					
					//Insert data on Export/Import
					ImportExportDAO ie_dao = new ImportExportDAO(app.getName(), Config.getUserName(), DateHelper.getCurrentDataTime(), "Export");
					ie_dao =  ie_dao.insert();
					
					return this.exportApp(app,iea);
				}else{	
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, FlashMessage.WARNING_EXPORT_APP);
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.ERROR);
			}
		}
		return this.redirect("igrp","ListaEnv","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private Response exportApp(Application app,ImportExportApp iea) {
		for(Action a:new Action().find().andWhere("application", "=", app.getId()).all()){
			iea.putFilesPageConfig(a);
		}

		Map<String,String> files = iea.getFilesPageClasses();
		
		for(Config_env configDb:new Config_env().find().andWhere("application", "=", app.getId()).all()){
			files.put("configHibernate/"+configDb.getName(), Config.getBasePathClass()+configDb.getName()+".cfg.xml");
		}
		
		if(iea.getFilesDaoClasses()!=null)
			files.putAll(iea.getFilesDaoClasses());

		String pathConfigApp = Config.getPathExport()+"ConfigApp"+File.separator+app.getDad().toLowerCase();
		try {
			FileHelper.save(pathConfigApp , "Config"+app.getDad()+".xml", ImportExportApp.genereteXMLApplication(app));
			FileHelper.save(pathConfigApp , "Config"+app.getDad()+"DB.xml", ImportExportApp.generateXMLConfigDB(app));
		} catch (IOException e) {
			e.printStackTrace();
		}
		files.put("configDBApp/"+app.getDad().toLowerCase()+"/"+app.getDad().toLowerCase()+".xml",pathConfigApp+File.separator+"Config"+app.getDad().toLowerCase()+"DB.xml");
		files.put("configApp/"+app.getDad().toLowerCase()+"/"+app.getDad().toLowerCase()+".xml",pathConfigApp+File.separator+"Config"+app.getDad().toLowerCase()+".xml");
		String pathJar = Config.getPathExport()+app.getDad().toLowerCase()+File.separator+app.getDad().toLowerCase()+".app.jar";
		FileHelper.createDiretory(Config.getPathExport()+app.getDad().toLowerCase());
		JarUnJarFile.saveJarFiles(pathJar, files,9);
		return this.sendFile(new File(pathJar), app.getDad().toLowerCase()+".app", "application/jar", true);
	}
	
	/*----#END-PRESERVED-AREA----*/
}
