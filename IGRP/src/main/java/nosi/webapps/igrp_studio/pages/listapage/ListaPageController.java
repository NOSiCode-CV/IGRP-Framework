
package nosi.webapps.igrp_studio.pages.listapage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.export.app.ExportJavaPage;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.ImportExportApp;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.webapps.igrp.dao.Profile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
/*----#end-code----*/

public class ListaPageController extends Controller {

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		ListaPageView view = new ListaPageView();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query("SELECT 'status_page' as status_page,'descricao_page' as descricao_page,'nome_page' as nome_page,'id_page' as id_page "));
		model.loadMyapps_list(Core.query("SELECT 'icon' as icon,'aplicacao' as aplicacao "));
		
		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */

		/*----#start-code(index)----*/

		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();

		ArrayList<ListaPage.Myapps_list> apps = new ArrayList<>();

		Action a = new Action();

		model.setBtn_import("igrp_studio", "ImportArquivo", "index");
		model.setCrud_generator("igrp_studio", "CRUDGenerator", "index");
		model.setLink_btn_nova_pagina("igrp", "Page", "index");

		String app = Igrp.getInstance().getRequest().getParameter("app");

		if (Core.isNotNull(app)) {
			if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("GET")) {
				model.setEnv_fk(app);
			}
		}

		if (Core.isNotNull(model.getEnv_fk())) {
			model.setBtn_import("igrp_studio", "ImportArquivo", "index").addParam("p_list_aplicacao", model.getEnv_fk())
					.addParam("target", "_blank").addParam("tab-tabcontent_1-importar_pagina", "1");
			model.setLink_btn_nova_pagina("igrp", "Page", "index").addParam("target", "_blank").addParam("p_env_fk",
					model.getEnv_fk());
			model.setCrud_generator("igrp_studio", "CRUDGenerator", "index").addParam("target", "_blank")
					.addParam("p_aplicacao", model.getEnv_fk());
		}

		List<Action> actions = a.find().andWhere("application", "=",
				(model.getEnv_fk() != null && !model.getEnv_fk().equals("")) ? Integer.parseInt(model.getEnv_fk()) : -1)
				// .andWhere("page", "like", model.getPage())
				// .andWhere("page_descr", "like", model.getPage_descr())
				.all();

		for (Action ac : actions) {
			ListaPage.Table_1 table1 = new ListaPage.Table_1();
			table1.setP_id_page("" + ac.getId());
			table1.setNome_page(ac.getPage());
			table1.setDescricao_page(ac.getPage_descr()+" ("+ac.getPage()+")");
			int check = ac.getStatus() == 1 ? ac.getStatus() : -1;
			table1.setStatus_page(ac.getStatus());
			table1.setStatus_page_check(check);

			lista.add(table1);
		}

		List<Profile> myApp = new Application().getMyApp();
		if(Core.isNotNull(myApp)){	
		myApp = myApp.stream().filter(profile -> profile.getOrganization().getApplication().getStatus() == 1).filter(
				profile -> !profile.getOrganization().getApplication().getDad().toLowerCase().equals("tutorial"))
				.filter(profile -> !profile.getOrganization().getApplication().getDad().toLowerCase()
						.equals("igrp_studio"))
				.collect(Collectors.toList());
		for (Profile p : myApp) {
			ListaPage.Myapps_list myapps = new ListaPage.Myapps_list();
			String page = p.getOrganization().getApplication().getDad().toLowerCase()+"/default-page";
			if (p.getOrganization().getApplication().getAction() != null) {
				Action ac = p.getOrganization().getApplication().getAction();
				page = (ac != null && ac.getPage() != null) ? ac.getPage() : page;
				page = ac.getApplication().getDad().toLowerCase()+"/"+page;
			}
			myapps.setIcon(this.getConfig().getLinkImg() + "/assets/img/iconApp/"
					+ (Core.isNotNull(p.getOrganization().getApplication().getImg_src())
							? p.getOrganization().getApplication().getImg_src()
							: "default.svg"));
		 myapps.setAplicacao("igrp_studio", "env", "openApp")
			.addParam("app",p.getOrganization().getApplication().getDad()).addParam("page",page + "/index&title=\"");
			myapps.setAplicacao_desc(p.getOrganization().getApplication().getName());
			apps.add(myapps);
		}
		// model.setInfopanel_3_val(""+apps.size());
		}
		view.p_id_page.setParam(true);
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista);
		view.myapps_list.addData(apps);
		view.btn_eliminar.setVisible(false);
		view.infopanel_1_url.setValue(this.getConfig().getResolveUrl("igrp_studio", "WebReport", "index"));
		view.infopanel_2_url.setValue(this.getConfig().getResolveUrl("igrp_studio", "BPMNDesigner", "index"));
		view.infopanel_3_url.setValue(this.getConfig().getResolveUrl("igrp_studio", "ListaEnv", "index"));

		/*----#end-code----*/

		view.setModel(model);

		return this.renderView(view);

	}

	public Response actionNova_aplicacao() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","Env","index");
		}
		
		----#gen-example */

		/*----#start-code(nova_aplicacao)----*/

		/*----#end-code----*/

		return this.redirect("igrp_studio", "Env", "index", this.queryString());

	}

	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException {

		/*----#start-code(editar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "Page", "index&p_id=" + p_id_page);
		}

		/*----#end-code----*/

		return this.redirect("igrp_studio", "ListaPage", "index");

	}

	public Response actionVisualizar() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","ListaPage","index");
		}
		
		----#gen-example */

		/*----#start-code(visualizar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (Core.isNotNull(p_id_page)){		
			return this.redirect("igrp", "Page", "visualizar&p_id=" + p_id_page);
		}

		/*----#end-code----*/

		return this.redirect("igrp_studio", "ListaPage", "index", this.queryString());

	}

	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","ListaPage","index");
		}
		
		----#gen-example */

		/*----#start-code(eliminar)----*/
		String p_id_page = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (p_id_page != null && !p_id_page.equals("")) {
			return this.forward("igrp", "Page", "eliminar&id=" + p_id_page);
		}

		/*----#end-code----*/

		return this.redirect("igrp_studio", "ListaPage", "index", this.queryString());

	}

	public Response actionGerar_codigo() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","Env","index");
		}
		
		----#gen-example */

		/*----#start-code(gerar_codigo)----*/
		String p_id_page = Core.getParam("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "generator", "index&target=_blank&id=" + p_id_page);
		}

		/*----#end-code----*/

		return this.redirect("igrp_studio", "Env", "index", this.queryString());

	}

	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException {

		ListaPage model = new ListaPage();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp_studio","ListaPage","index");
		}
		
		----#gen-example */

		/*----#start-code(download)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id_page");
		if (id != null && !id.equals("")) {

			Action page = new Action().findOne(Integer.parseInt(id));

			// insert data on import/export table
			ImportExportDAO ie_dao = new ImportExportDAO(page.getPage(), this.getConfig().getUserName(),
					DateHelper.getCurrentDataTime(), "Export");
			ie_dao = ie_dao.insert();

			// Core.setMessageWarning(FlashMessage.WARNING_EXPORT_PAGE);

			return xSend(new ExportJavaPage(page).export(), page.getPage() + ".page.jar", "application/jar", true);

		} else {
			Core.setMessageError();
		}

		/*----#end-code----*/

		return this.redirect("igrp_studio", "ListaPage", "index", this.queryString());

	}

	/*----#start-code(custom_actions)----*/
	public Response actionChangeStatus()
			throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;

		String id = Igrp.getInstance().getRequest().getParameter("p_id_page");

		String status = Igrp.getInstance().getRequest().getParameter("p_status_page");

		boolean response = false;

		if (id != null && !id.equals("")) {

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
	/*----#end-code----*/

}
