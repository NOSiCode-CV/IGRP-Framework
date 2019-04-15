package nosi.webapps.igrp_studio.pages.listapage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.import_export_v2.exports.ExportHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
/*----#end-code----*/
		
public class ListaPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		model.setBtn_import("igrp_studio","ImportArquivo","index");
		model.setCrud_generator("igrp_studio","CRUDGenerator","index");
		model.setLink_btn_nova_pagina("igrp","Page","index");
		ListaPageView view = new ListaPageView();
		view.id_page.setParam(true);
		view.env_fk.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as status_page,'Adipiscing omnis deserunt dolo' as descricao_page,'1' as id_page,'1' as nome_page "));
		model.loadTable_2(Core.query(null,"SELECT '/IGRP/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg' as my_app_img,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/listapage/ListaPage.xml' as my_aplicacao,'1' as env_fk "));
		view.application.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		view.id_page.setParam(true);
		Map<Object, Object> listApp = new Application().getListApps();
		if(listApp!=null && listApp.size()==2) {
			model.setApplication(listApp.keySet().stream().filter(a->a!=null).findFirst().get().toString());
		}
		String uri = Igrp.getInstance().getRequest().getRequestURI();
		Core.log(uri);
		if(!uri.equals("/IGRP/app/webapps"))
			if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("GET")) {
				final Application dad = Core.findApplicationByDad(uri.split("/")[1].toLowerCase());
				if(dad!=null)
					model.setApplication(dad.getId().toString());
				
			}
				
		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();
		ArrayList<ListaPage.Table_2> apps = new ArrayList<>();

		String app = Core.getParam("app");

		if (Core.isNotNull(app)) {
			if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("GET")) {
				model.setApplication(app);
			}
		}

		if (Core.isNotNull(model.getApplication())) {
			model.getBtn_import().addParam("p_list_aplicacao", model.getApplication())
								.addParam("tab-tabcontent_1-importar_pagina", "1");
			model.setLink_btn_nova_pagina("igrp", "Page", "index")
              	.addParam("p_env_fk", model.getApplication());
			model.getCrud_generator().addParam("p_aplicacao",
					model.getApplication());
		} else {
			model.getBtn_import().addParam("tab-tabcontent_1-importar_pagina","1");
			model.setLink_btn_nova_pagina("igrp", "Page", "index");
		

		}

		List<Action> actions = new ArrayList<Action>();
	
		if (Core.getParamArray("p_modulo") != null) {
			for (String m : Core.getParamArray("p_modulo")) {
				List<Action> actions_ = new Action().find().andWhere("nomeModulo", "=", m) 
						.andWhere("application", "=", Core.toInt(model.getApplication()))
						.andWhere("isComponent", "<>",(short) 2).all();
				if (actions_ != null)
					actions.addAll(actions_);
			}
		} else {
			actions = new Action().find().andWhere("application", "=", Core.toInt(model.getApplication()))
					.andWhere("isComponent", "<>", (short)2).all();
		}   
		Collections.sort(actions, new SortbyStatus());
      
   
		for (Action ac : actions) {
			ListaPage.Table_1 table1 = new ListaPage.Table_1();
			table1.setId_page("" + ac.getId());
			table1.setNome_page(ac.getPage());
			table1.setDescricao_page(ac.getPage_descr() + " (" + ac.getPage() + ")");
			int check = ac.getStatus() == 1 ? ac.getStatus() : -1;
			table1.setStatus_page(ac.getStatus());
			table1.setStatus_page_check(check);

			lista.add(table1);
		}

		List<Profile> myApp = new Application().getMyApp();
		if (Core.isNotNull(myApp)) {
			myApp = myApp.stream().filter(profile -> profile.getOrganization().getApplication().getStatus() == 1)
					.filter(profile -> !profile.getOrganization().getApplication().getDad().toLowerCase()
							.equals("tutorial"))
					.filter(profile -> !profile.getOrganization().getApplication().getDad().toLowerCase()
							.equals("igrp_studio"))
					.collect(Collectors.toList());
			for (Profile p : myApp) {
				ListaPage.Table_2 myapps = new ListaPage.Table_2();
				String page = p.getOrganization().getApplication().getDad().toLowerCase() + "/default-page";
				if (p.getOrganization().getApplication().getAction() != null) {
					Action ac = p.getOrganization().getApplication().getAction();
					page = (ac != null && ac.getPage() != null) ? ac.getPage() : page;
					page = ac.getApplication().getDad().toLowerCase() + "/" + page;
				}
				myapps.setMy_app_img(this.getConfig().getLinkImg() + "/assets/img/iconApp/"
						+ (Core.isNotNull(p.getOrganization().getApplication().getImg_src())
								? p.getOrganization().getApplication().getImg_src()
								: "default.svg"));
				myapps.setMy_aplicacao("igrp_studio", "env", "openApp")
						.addParam("app", p.getOrganization().getApplication().getDad())
						.addParam("page", page + "/index&title=\"");
				myapps.setMy_aplicacao_desc(p.getOrganization().getApplication().getName());
				myapps.setEnv_fk(p.getOrganization().getApplication().getId());
				apps.add(myapps);
			}
			// model.setInfopanel_3_val(""+apps.size());
		}

		
		view.application.setValue(listApp );
		final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(Core.toInt(model.getApplication())), "name",
				"descricao", "-- Selecionar --");
		view.modulo.setValue(map);
	   	view.modulo.setVisible(map.size() > 1);

		view.table_1.addData(lista);
		view.table_2.addData(apps);
		view.btn_eliminar.setVisible(false);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNova_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","Env","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(nova_aplicacao)----*/

		/*----#end-code----*/
		return this.redirect("igrp_studio","Env","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp","Page","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(editar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "Page", "index&p_id=" + p_id_page);
		}

		/*----#end-code----*/
		return this.redirect("igrp","Page","index", this.queryString());	
	}
	
	public Response actionVisualizar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","ListaPage","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(visualizar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.redirect("igrp", "Page", "visualizar&p_id=" + p_id_page);
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaPage","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","ListaPage","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(eliminar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "Page", "eliminar&id=" + p_id_page);
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaPage","index", this.queryString());	
	}
	
	public Response actionGerar_codigo() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","Env","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gerar_codigo)----*/
		String p_id_page = Core.getParam("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "generator", "index&target=_blank&id=" + p_id_page);
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","Env","index", this.queryString());	
	}
	
	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","ListaPage","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(download)----*/
		int id = Core.getParamInt(("p_id_page"));
		if (Core.isNotNullOrZero(id)){
			Action page = new Action().findOne(id);
			Wizard_export_step_2 model_w = new Wizard_export_step_2();
			model_w.setApplication_id(page.getApplication().getId());
			model_w.setFile_name(page.getApplication().getName()+"-"+page.getPage_descr()+"("+page.getPage()+")_igrpweb_v."+config.VERSION);
			Core.setAttribute("p_pagina_ids_check",new String[] {""+id});
			// insert data on import/export table
			ImportExportDAO ie_dao = new ImportExportDAO(page.getPage(), this.getConfig().getUserName(),DateHelper.getCurrentDataTime(), "Export");
			ie_dao = ie_dao.insert();
			
			byte[] bytes = new ExportHelper().export(model_w);
			if(bytes!=null) {
				return this.xSend(bytes,model_w.getFile_name() + ".jar", Core.MimeType.APPLICATION_JAR, true);
			}
		} else {
			Core.setMessageError();
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaPage","index", this.queryString());	
	}
	
	public Response actionFile_editor() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		 this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		 return this.forward("igrp_studio","File_editor","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(file_editor)----*/
		this.addQueryString("p_env_fk", Core.getParam("p_env_fk"));
		/*----#end-code----*/
		return this.redirect("igrp_studio","File_editor","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	public Response actionChangeStatus()
			throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;
		Core.log("pelo menos chama");
		String id = Core.getParam("p_id_page");
		String status = Core.getParam("p_status_page");
		boolean response = false;
		if (Core.isNotNull(id)) {
			Action page = new Action().findOne(Integer.parseInt(id));
			if (page != null) {
				page.setStatus(Integer.parseInt(status));
				if (page.update() != null)
					response = true;
			}
		}

		JSONObject json = new JSONObject();
		json.put("status", response);
		Gson res = new Gson();
		res.toJson(json);
		return this.renderView(json.toString());
	}

	class SortbyStatus implements Comparator<Action> {
		// Used for sorting in ascending order of
		// roll number
		public int compare(Action a, Action b) {
			return b.getStatus() - a.getStatus();
		}
	}
	/*----#end-code----*/
}
