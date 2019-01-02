package nosi.webapps.igrp_studio.pages.listaenv;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.Comparator;
import java.util.Collections;
import com.google.gson.Gson;
/*----#end-code----*/
		
public class ListaEnvController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		ListaEnvView view = new ListaEnvView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as status,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/listaenv/ListaEnv.xml' as name,'Lorem natus doloremque dolor i' as dad,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/listaenv/ListaEnv.xml' as t_page_builder,'1' as id "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		ArrayList<ListaEnv.Table_1> lista = new ArrayList<>();
		Application app = new Application();		
		List<Application> apps = new ArrayList<>();
		User user = (User) Igrp.getInstance().getUser().getIdentity();
		if (Core.getCurrentUser().getUser_name().compareTo("igrpweb@nosi.cv")==0) {
			apps = app.find()
					// .andWhere("dad", "like", app.getDad())
					// .andWhere("name", "like", app.getName())
					.all();
			apps = apps.stream()
		     .distinct().collect(Collectors.toList());
		} else {
			apps = app.getListMyApp(user.getId());
		}
		Collections.sort(apps, new SortbyStatus());
		for (Application a : apps) {
			//Don't list app IGRP
			if (!a.getDad().toLowerCase().equals("igrp")) {
				ListaEnv.Table_1 table = new ListaEnv.Table_1();
          	    String page = a.getDad().toLowerCase() + "/default-page";
				table.setDad(a.getDad());
           		Action ac = a.getAction();
              if (ac != null) {					
					page = (ac != null && ac.getPage() != null) ? ac.getPage() : page;
					page = ac.getApplication().getDad().toLowerCase() + "/" + page;
				}				
             	table.setName("igrp_studio", "env", "openApp")
						.addParam("app", a.getDad())
						.addParam("page", page + "/index&title=\"");
				table.setName_desc(a.getName());
				table.setStatus(a.getStatus());
				if (a.getStatus() == 1) {
					table.setStatus_check(a.getStatus());
				} else
					table.setStatus_check(-1);
				table.setId("" + a.getId());
				table.setT_page_builder("igrp_studio", "ListaPage", "index&app=" + a.getId());
				table.setT_page_builder_desc("Page builder");
				lista.add(table);
			}
		}
		view.table_1.addData(lista);		
		view.btn_eliminar.setVisible(false);
		view.btn_exportar.setTarget("modal|refresh");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionImportar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","ImportArquivo","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(importar)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","ImportArquivo","index", this.queryString());	
	}
	
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","Env","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(novo)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","Env","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","ListaEnv","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(editar)----*/
		String p_id = Core.getParam("p_id");
		if (Core.isNotNull(p_id)) {
			return this.forward("igrp_studio", "Env", "editar&target=_blank&id=" + p_id);
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaEnv","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","ListaEnv","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(eliminar)----*/
		String id = Core.getParam("p_id");
		Application app = new Application();
		if (app.delete(Integer.parseInt(id)))
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaEnv","index", this.queryString());	
	}
	
	public Response actionConfigurar_base_dados() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","ListaEnv","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(configurar_base_dados)----*/
		String id = Core.getParam("p_id");
		if (Core.isNotNull(id)) {
			return this.redirect("igrp", "ConfigDatabase", "index&target=_blank&p_aplicacao=" + id,this.queryString());
		}
		return this.forward("igrp_studio", "ListaEnv", "index");
		/*----#end-code----*/
			
	}
	
	public Response actionExportar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaEnv model = new ListaEnv();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp_studio","ListaEnv","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(exportar)----*/
		String id = Core.getParam("p_id");
		if (Core.isNotNull(id)) {
			this.addQueryString("p_application_id", id);
			return this.redirect("igrp_studio","Wizard_export_step_1","index", this.queryString());	
			/*Application app = new Application().findOne(id);
			if (app != null) {
				// Insert data on Export/Import
				ImportExportDAO ie_dao = new ImportExportDAO(app.getName(), this.getConfig().getUserName(),
						DateHelper.getCurrentDataTime(), "Export");
				ie_dao = ie_dao.insert();
				return this.exportApp(app);
			} else {
				Core.setMessageError();
			}*/
		}
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaEnv","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
//	private Response exportApp(Application app) {
//		
//		for (Action a : new Action().find().andWhere("application", "=", app.getId()).all()) {
//			iea.putFilesPageConfig(a);
//		}
//
//		Map<String, String> files = iea.getFilesPageClasses();
//
//		for (Config_env configDb : new Config_env().find().andWhere("application", "=", app.getId()).all()) {
//			files.put("configHibernate/" + configDb.getName(),
//					this.getConfig().getBasePathClass() + configDb.getName() + ".cfg.xml");
//		}
//
//		if (iea.getFilesDaoClasses() != null)
//			files.putAll(iea.getFilesDaoClasses());
//
//		String pathConfigApp = this.getConfig().getPathExport() + "ConfigApp" + File.separator + app.getDad().toLowerCase();
//		try {
//			FileHelper.save(pathConfigApp, "Config" + app.getDad() + ".xml",
//					ImportExportApp.genereteXMLApplication(app));
//			FileHelper.save(pathConfigApp, "Config" + app.getDad() + "DB.xml",
//					ImportExportApp.generateXMLConfigDB(app));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		files.put("configDBApp/" + app.getDad().toLowerCase() + 
//				"/" + app.getDad().toLowerCase() + ".xml",
//				pathConfigApp + File.separator + "Config" + 
//				app.getDad().toLowerCase() + "DB.xml");
//		
//		files.put("configApp/" + app.getDad().toLowerCase() + "/" + app.getDad().toLowerCase() + ".xml",
//				pathConfigApp + File.separator + "Config" + app.getDad().toLowerCase() + ".xml");
//		
//		String pathJar = this.getConfig().getPathExport() + app.getDad().toLowerCase() + File.separator
//				+ app.getDad().toLowerCase() + ".app.jar";
//		
//		FileHelper.createDiretory(this.getConfig().getPathExport() + app.getDad().toLowerCase());
//		
//		/*String aux = this.getConfig().getPathExport() + app.getDad().toLowerCase(); 
//		aux = aux.replace(File.separator + app.getDad().toLowerCase(), ""); 
//		new File(aux).deleteOnExit();*/
//		
//		JarUnJarFile.saveJarFiles(pathJar, files, 9);
//		
//	//	System.out.println(pathJar); 
//		
//		return this.sendFile(new File(pathJar), app.getDad().toLowerCase() + ".app.jar", "application/jar", true);
//		return this.xSend(new ExportAppJava(app.getId()).export(),app.getDad().toLowerCase() + ".app.jar", "application/jar", true);
//	}

	public Response actionChangeStatus()
			throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;
		String idAplicacao = Core.getParam("p_id");
		String status = Core.getParam("p_status");
		boolean response = false;

		if (Core.isNotNull(idAplicacao)) {
			Application aplica_db = new Application().findOne(Integer.parseInt(idAplicacao));
			if (aplica_db != null) {
				aplica_db.setStatus(Integer.parseInt(status));
				if (aplica_db.update() != null)
					response = true;
			}
		}

		JSONObject json = new JSONObject();
		json.put("status", response);
		Gson res = new Gson();
		res.toJson(json);
		return this.renderView(json.toString());
	}
	  class SortbyStatus implements Comparator<Application> {
		// Used for sorting in ascending order of
		// roll number
		public int compare(Application a, Application b) {
			return b.getStatus() - a.getStatus();
		}
      }
	/*----#end-code----*/
}
