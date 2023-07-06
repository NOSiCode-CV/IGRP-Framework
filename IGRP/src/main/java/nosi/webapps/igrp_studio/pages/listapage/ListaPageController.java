package nosi.webapps.igrp_studio.pages.listapage;


import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.config.Config;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.mime_type.MimeType;
import nosi.core.webapp.import_export_v2.exports.ExportHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ImportExportDAO;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp_studio.pages.listapage.ListaPage.Table_2;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2;

/*----#end-code----*/
		
public class ListaPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		model.setInfopanel_1_title("Report designer");
		model.setInfopanel_1_val("");
		model.setInfopanel_1_url(Core.getIGRPLink("igrp_studio","WebReport","index"));
		model.setInfopanel_1_bg("cp-black");
		model.setInfopanel_1_icn("fa-file-text");
		model.setInfopanel_2_title("BPMN designer");
		model.setInfopanel_2_val(" ");
		model.setInfopanel_2_url(Core.getIGRPLink("igrp_studio","BPMNDesigner","index"));
		model.setInfopanel_2_bg("cp-lavendar");
		model.setInfopanel_2_icn("fa-sitemap");
		model.setInfopanel_3_title("Application builder");
		model.setInfopanel_3_val(" ");
		model.setInfopanel_3_url(Core.getIGRPLink("igrp_studio","ListaEnv","index"));
		model.setInfopanel_3_bg("cp-starrynight");
		model.setInfopanel_3_icn("fa-folder-open");
		model.setBtn_import("igrp_studio","ImportArquivo","index");
		model.setCrud_generator("igrp_studio","CRUDGenerator","index");
		model.setLink_btn_nova_pagina("undefined","undefined","undefined");
		ListaPageView view = new ListaPageView();
		view.id_page.setParam(true);
		view.env_fk.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as status_page,'Lorem dolo' as modulo_tab,'Voluptatem sed unde totam sit' as descricao_page,'hidden-7a09_e8e3' as id_page,'hidden-e2f7_3fb9' as nome_page "));
		model.loadTable_2(Core.query(null,"SELECT '/IGRP/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg' as my_app_img,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/listapage/ListaPage.xml' as my_aplicacao,'hidden-a550_a411' as env_fk "));
		view.application.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		// model.setDocumento(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=studio"));
		
		model.setDocumento("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT;&p_type=studio");
		model.setForum("https://gitter.im/igrpweb/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link");

		Map<Object, Object> listApp = new Application().getListApps();
		if (listApp != null && listApp.size() == 2) {
			model.setApplication(listApp.keySet().stream().filter(a -> a != null).findFirst().get().toString());
		}

		String app = Core.getParam("app");

		String uri = Igrp.getInstance().getRequest().getRequestURI();
		Core.log(uri);

		if (!uri.equals("/IGRP/app/webapps")) {
			if (Core.isHttpGet()) {
				final Application appX = new Application().find().andWhere("url", "=", uri.split("/")[1].toLowerCase())
						.one();
				if (appX != null)
					model.setApplication(appX.getId().toString());

			}
		} else {
			final Application appExt = Core.findApplicationById(Core.toInt(model.getApplication()));
			if (Core.isNotNull(appExt) && appExt.getExterno() > 0 && !appExt.getUrl().equals("IGRP")) {
				Core.setMessageError(
						"ESTÁ NA PASTA PRINCIPAL /IGRP/app/. ESTA APLICAÇÃO É DO TIPO CUSTOM HOST. MUDAR DE DAD POR FAVOR!");
				// nosi.webapps.igrp.dao.Action ac = Core.findApplicationByDad(dad).getAction();
				// String page = "tutorial/DefaultPage/index&title=";
				// if(ac!=null) {
				// page = ac.getPage();
				// /**
				// * Go to home page of application or go to default page in case not exists
				// home page associate to application
				// */
				// page =
				// (ac.getApplication()!=null)?(ac.getApplication().getDad().toLowerCase() + "/"
				// + page):page+"/DefaultPage";
				// page +="/index&title="+ac.getAction_descr();
				// }
				// this.addQueryString("app", dad);
				// this.addQueryString("page", page);
				// return redirect("igrp_studio", "env", "openApp",this.queryString());
			}

		}

		ArrayList<ListaPage.Table_1> lista = new ArrayList<>();
		List<ListaPage.Table_2> apps = new ArrayList<>();

		if (Core.isNotNull(app) &&  (Core.isHttpGet())) {
				model.setApplication(app);
			
		}

		if (Core.isNotNull(model.getApplication())) {
			model.getBtn_import().addParam("tab-tabcontent_1-importar_pagina", "1").addParam("p_env_fk",
					model.getApplication());
			model.setLink_btn_nova_pagina("igrp", "Page", "index").addParam("p_env_fk", model.getApplication());
			model.getCrud_generator().addParam("p_aplicacao", model.getApplication());
			model.getInfopanel_1_url().addParam("p_env_fk", model.getApplication());
			view.infopanel_2_url.addParam("p_env_fk", model.getApplication());

		} else {
			model.getBtn_import().addParam("tab-tabcontent_1-importar_pagina", "1");
			model.setLink_btn_nova_pagina("igrp", "Page", "index");

		}

		List<Action> actions = new ArrayList<>();

		if (Core.getParamArray("p_modulo") != null) {
			for (String m : Core.getParamArray("p_modulo")) {
				List<Action> actions_ = new Action().find().andWhere("nomeModulo", "=", m)
						.andWhere("application", "=", Core.toInt(model.getApplication()))
						.andWhere("isComponent", "<>", (short) 2).all();
				if (actions_ != null)
					actions.addAll(actions_);
			}
		} else {
			actions = new Action().find().andWhere("application", "=", Core.toInt(model.getApplication()))
					.andWhere("isComponent", "<>", (short) 2).all();
		}
		Collections.sort(actions, new SortbyStatus());
		final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(Core.toInt(model.getApplication())),
				"name", "descricao", "-- Selecionar --");

		actions = actions.stream().filter(m -> m.getStatus() != 2).collect(Collectors.toList());

		for (Action ac : actions) {
			ListaPage.Table_1 table1 = new ListaPage.Table_1();
			table1.setId_page("" + ac.getId());
			table1.setNome_page(ac.getPage());
			String module = "";
			if (map.size() > 1 && Core.isNotNull(ac.getNomeModulo()) && Core.isNotNull(map.get(ac.getNomeModulo())))
				module = "" + map.get(ac.getNomeModulo());
			table1.setModulo_tab(module);
			table1.setDescricao_page(ac.getPage_descr() + " (" + ac.getPage() + ")"+(ac.getVersion().equals("2.4")?"₂.₄":""));
			int check = ac.getStatus() == 1 ? ac.getStatus() : -1;
			table1.setStatus_page(ac.getStatus());
			table1.setStatus_page_check(check);
			lista.add(table1);
		}

		List<Profile> myApp = new Application().getMyApp();
		if (Core.isNotNull(myApp)) {
			myApp = myApp.stream().filter(profile -> profile.getOrganization().getApplication().getStatus() == 1)
					.filter(profile -> !profile.getOrganization().getApplication().getDad()
							.equalsIgnoreCase("tutorial"))
					.filter(profile -> !profile.getOrganization().getApplication().getDad()
							.equalsIgnoreCase("igrp_studio"))
					//ATTENTION .toList() only works in java +17 
					.toList(); 
			for (Profile p : myApp) {
				ListaPage.Table_2 myapps = new ListaPage.Table_2();
				String page = "tutorial/DefaultPage";
				if (p.getOrganization().getApplication().getAction() != null) {
					Action ac = p.getOrganization().getApplication().getAction();
					page = (ac != null && ac.getPage() != null) ? ac.getPage() : page;
					page = ac.getApplication().getDad().toLowerCase() + "/" + page;
				}
				myapps.setMy_app_img(this.getConfig().getLinkImg(Config.DEFAULT_V_PAGE) + "/assets/img/iconApp/"
						+ (Core.isNotNull(p.getOrganization().getApplication().getImg_src())
								? p.getOrganization().getApplication().getImg_src()
								: "default.svg"));
				myapps.setMy_aplicacao("igrp_studio", "env", "openApp")
						.addParam("app", p.getOrganization().getApplication().getDad())
						.addParam("page", page + "/index&title=" + p.getOrganization().getApplication().getName());
				myapps.setMy_aplicacao_desc(p.getOrganization().getApplication().getName());
				myapps.setEnv_fk(p.getOrganization().getApplication().getId());
				apps.add(myapps);
			}
			// model.setInfopanel_3_val(""+apps.size());
		}

		view.application.setValue(listApp);

		view.modulo.setValue(map);
		view.modulo.setVisible(map.size() > 1);

		view.table_1.addData(lista);
		Collections.sort(apps, new SortbyID());
		view.table_2.addData(apps);

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
		  return this.forward("igrp_studio","Env","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(nova_aplicacao)----*/

		/*----#end-code----*/
		return this.redirect("igrp_studio","Env","index", this.queryString());	
	}
	
	public Response actionHistorico() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListaPage model = new ListaPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_page",Core.getParam("p_id_page"));
		  this.addQueryString("p_env_fk",Core.getParam("p_env_fk"));
		  return this.forward("igrp_studio","Historico_page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(historico)----*/
		
		this.addQueryString("p_id_page", Core.getParam("p_id_page"));
		/*----#end-code----*/
		return this.redirect("igrp_studio","Historico_page","index", this.queryString());	
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
		  return this.forward("igrp_studio","Historico_page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar)----*/
		String p_id_page = Core.getParam("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "Page", "index&p_id=" + p_id_page);
		}

		
		/*----#end-code----*/
		return this.redirect("igrp_studio","Historico_page","index", this.queryString());	
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
		  return this.forward("igrp_studio","ListaPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(visualizar)----*/
		String p_id_page = Core.getParam("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.redirect("igrp", "Page", "visualizar&p_id=" + p_id_page);
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
		  return this.forward("igrp_studio","ListaEnv","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gerar_codigo)----*/
		String p_id_page = Core.getParam("p_id_page");
		if (Core.isNotNull(p_id_page)) {
			return this.forward("igrp", "generator", "index&target=_blank&id=" + p_id_page);
		}

		/*----#end-code----*/
		return this.redirect("igrp_studio","ListaEnv","index", this.queryString());	
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
		  return this.forward("igrp_studio","ListaPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(download)----*/
		int id = Core.getParamInt(("p_id_page"));
		if (Core.isNotNullOrZero(id)) {
			Action page = new Action().findOne(id);
			Wizard_export_step_2 model_w = new Wizard_export_step_2();
			model_w.setApplication_id(page.getApplication().getId());
			model_w.setFile_name(page.getApplication().getName() + "-" + page.getPage_descr() + "(" + page.getPage()
					+ ")_igrpweb_v." + Config.VERSION);
			Core.setAttribute("p_pagina_ids_check_fk", new String[] { "" + id });
			// insert data on import/export table
			ImportExportDAO ie_dao = new ImportExportDAO(page.getPage(), this.getConfig().getUserName(),
					DateHelper.getCurrentDataTime(), "Export");
			ie_dao.insert();

			byte[] bytes = ExportHelper.export(model_w);
			if (bytes != null) {
				return this.xSend(bytes, model_w.getFile_name() + ".jar", MimeType.APPLICATION_JAR, true);
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
		  return this.forward("igrp_studio","File_editor","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(file_editor)----*/
		this.addQueryString("p_env_fk", Core.getParam("p_env_fk"));
		/*----#end-code----*/
		return this.redirect("igrp_studio","File_editor","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	public Response actionChangeStatus()
			throws IllegalArgumentException, JSONException {

		this.format = Response.FORMAT_JSON;
		String id = Core.getParam("p_id_page");
		String status = Core.getParam("p_status_page_check");
		boolean response = false;
		if (Core.isNotNull(id)) {
			Action page = new Action().findOne(Integer.parseInt(id));
			if (page != null && Core.isNotNull(status)) {
				page.setStatus(status.equals("true") ? 1 : 0);
				if (page.update() != null) {
					// Core.setMessageSuccess();
					response = true;
				}
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
			if (a.getNomeModulo() == null)
				a.setNomeModulo("");
			if (b.getNomeModulo() == null)
				b.setNomeModulo("");

			int NameCompare = a.getNomeModulo().compareTo(b.getNomeModulo());
			int StatusCompare = b.getStatus() - a.getStatus();

			// 2-level comparison using if-else block
			if (StatusCompare == 0) {
				return ((NameCompare == 0) ? StatusCompare : NameCompare);
			} else {
				return StatusCompare;
			}

		}
	}

	class SortbyID implements Comparator<ListaPage.Table_2> {

		@Override
		public int compare(Table_2 o1, Table_2 o2) {
			return o2.getEnv_fk() - o1.getEnv_fk();

		}
	}

	/*----#end-code----*/
}
