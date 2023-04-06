package nosi.webapps.igrp.pages.page;

import nosi.core.webapp.ApplicationManager;
import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import javax.persistence.Tuple;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.logging.log4j.util.Strings;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Invocation;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.HttpHeaders;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.compiler.helpers.MapErrorCompile;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.webapp.helpers.ExtractReserveCode;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Route;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Historic;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.Share;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.pages.dominio.DomainHeper;

/*----#end-code----*/
		
public class PageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page model = new Page();
		model.load();
		model.setHelp("igrp","Dominio","index");
		model.setNovo_modulo("igrp","Page","index");
		model.setEditar_modulo("igrp","Dominio","index");
		PageView view = new PageView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.version.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		boolean isEdit = false;
		Integer idPage = Core.getParamInt("p_id_page");
		view.btn_eliminar_pagina.setVisible(false);

		if (idPage == 0)
			idPage = model.getId_pagin_hidd();

		if (Core.isNotNull(idPage)) {
			// EDIT/UPDATE PAGE
			Action a = new Action().findOne(idPage);
			if (a != null) {
				model.setAction_descr(a.getAction_descr());
				model.setEnv_fk("" + a.getApplication().getId());
				model.setAction(a.getAction());
				model.setPage_descr(a.getPage_descr());
				model.setPage(a.getPage());
				model.setId("" + a.getId());
				model.setId_pagin_hidd(a.getId());
				model.setVersion(a.getVersion());
				model.setXsl_src(a.getXsl_src());
				model.setStatus(a.getStatus());
				model.setPublico(a.getTipo());
				model.setComponente(a.getIsComponent());
				if (a.getNomeModulo() != null && !a.getNomeModulo().isEmpty())
					model.setModulo(a.getNomeModulo());
				Application app = Core.findApplicationById(a.getApplication().getId());
				if (app != null && app.getAction() != null)
					model.setPrimeira_pagina(idPage.equals(app.getAction().getId()) ? 1 : 0);
			}
			isEdit = true;
			model.setGen_auto_code(0);
			view.criar_menu.setVisible(false);
		} else {
			// NEW page
			model.setStatus(1);
			model.setCriar_menu(1);
			model.setGen_auto_code(1);
		}

		view.env_fk.setValue(new Application().getListApps());
		view.version.setValue(this.getConfig().getVersions());
		view.version.setVisible(false);
		view.id.setParam(true);
		view.modulo.setValue(IgrpHelper.toMap(new Modulo().getModuloByApp(Core.toInt(model.getEnv_fk())), "name",
				"descricao", "-- Selecionar --"));

		model.setNovo_modulo("igrp_studio", "modulo", "index").addParam("p_aplicacao", model.getEnv_fk());
		model.setEditar_modulo("igrp_studio", "modulo", "index").addParam("p_aplicacao", model.getEnv_fk());

		if (Boolean.TRUE.equals(isEdit)) {
			view.sectionheader_1_text.setValue("Page builder - Atualizar");
			view.page.propertie().setProperty("disabled", "true");
			view.btn_eliminar_pagina.setVisible(true);
		}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page model = new Page();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gravar)  *//* End-Code-Block  */
		/*----#start-code(gravar)----*/
		int idPage = Core.getParamInt("p_id");

		Application app = new Application();
		Action action = new Action();

		/****** EDITANDO UMA PÁGINA ********/

		if (idPage != 0) {

			action = action.findOne(idPage);
			action.setPage_descr(model.getPage_descr());
			action.setAction_descr(model.getPage_descr());
			action.setStatus(model.getStatus());
			action.setTipo(model.getPublico());
			action.setIsComponent((short) model.getComponente());

			if (model.getModulo() != null && !model.getModulo().isEmpty())
				action.setNomeModulo(model.getModulo());
			else
				action.setNomeModulo(null);

			action = action.update();

			if (action != null) {
				Core.setMessageSuccess("Página atualizada com sucesso.");

				Historic hitoric_page = new Historic();
				hitoric_page.setNome(Core.getCurrentUser().getName());
				hitoric_page.setIdUtilizador(Core.getCurrentUser().getId());
				hitoric_page.setPage(action);
				hitoric_page.setDescricao("Informações da Página Alterada");
				hitoric_page.insert();

				Application app2 = Core.findApplicationById(action.getApplication().getId());

				if (model.getPrimeira_pagina() == 1) {
					app2.setAction(action);
					app2.update();
				} else {
					app2.setAction(null);
					app2.update();
				}
			} else
				Core.setMessageError();

			this.addQueryString("p_id_page", idPage);
			return this.redirect("igrp", "page", "index", this.queryString());

			/****** ADICIONANDO NOVA PÁGINA ********/

		} else if (checkifexists(model)) {

			if (model.getPage().equals("import") || model.getPage().equals("package")
					|| model.getPage().equals("public") || model.getPage().equals("private")
					|| model.getPage().equals("abstracts")) {
				Core.setMessageError("Reserved code: " + model.getPage() + ". Try another!");
				return this.forward("igrp", "page", "index");
			}
			app = app.findOne(Integer.parseInt(model.getEnv_fk()));
			action.setApplication(app);
			action.setAction_descr(model.getPage_descr());
			action.setPage_descr(model.getPage_descr());
			action.setStatus(model.getStatus());
			action.setTipo(model.getPublico());
			action.setPage(nosi.core.gui.page.Page.getPageName(model.getPage()));
			action.setPackage_name("nosi.webapps." + action.getApplication().getDad().toLowerCase() + ".pages");
			action.setVersion(model.getVersion() == null ? "2.3." + this.getConfig().VERSION
					: model.getVersion() + "." + this.getConfig().VERSION);
			action.setAction("index");
			action.setIsComponent((short) model.getComponente());
			action.setXsl_src(action.getApplication().getDad().toLowerCase() + "/" + action.getPage().toLowerCase()
					+ "/" + action.getPage() + ".xsl");
			if (!nosi.core.gui.page.Page.validatePage(action.getPage())) {
				Core.setMessageWarning(FlashMessage.WARNING_PAGE_INVALID);
				return this.forward("igrp", "page", "index");
			}

			if (model.getModulo() != null && !model.getModulo().isEmpty())
				action.setNomeModulo(model.getModulo());
			else
				action.setNomeModulo(null);

			action = action.insert();

			Historic hitoric_page = new Historic();
			hitoric_page.setNome(Core.getCurrentUser().getName());
			hitoric_page.setIdUtilizador(Core.getCurrentUser().getId());
			hitoric_page.setDescricao("Criação da página");
			hitoric_page.setPage(action);
			hitoric_page.insert();

			if (action != null) {

				// createSvnRepo(action);

				String json = "{\"rows\":[{\"columns\":[{\"size\":\"col-md-12\",\"containers\":[]}]}],\"plsql\":{\"instance\":\"\",\"table\":\"\",\"package\":\"nosi.webapps."
						+ action.getApplication().getDad().toLowerCase() + ".pages\",\"html\":\"" + action.getPage()
						+ "\",\"replace\":false,\"label\":false,\"biztalk\":false,\"subversionpath\":\"\"},\"css\":\"\",\"js\":\"\"}";
				String path_xsl = this.getConfig().getCurrentBaseServerPahtXsl(action);
				FileHelper.save(path_xsl, action.getPage() + ".json", json);
				if (Core.isNotNull(this.getConfig().getWorkspace())
						&& FileHelper.fileExists(this.getConfig().getWorkspace())) {
					FileHelper.save(this.getConfig().getWorkspace() + File.separator + this.getConfig().getWebapp()
							+ File.separator + "images" + File.separator + "IGRP/IGRP" + action.getVersion() + "/app/"
							+ action.getApplication().getDad().toLowerCase() + "/" + action.getPage().toLowerCase(),
							action.getPage() + ".json", json);
				}
				if (model.getCriar_menu() != 0 && model.getComponente() == 0) {
					List<Menu> ordem_dao = new Menu().find().where("application","=",app).all();
					Menu pageMenu = new Menu(action.getPage_descr(), ordem_dao.size()+1, 1, 0, "_self", action, action.getApplication(),
							null);
					pageMenu.setMenu(pageMenu);
					pageMenu.insert();

					if (!pageMenu.hasError()) {
						Core.setMessageInfo("Página adicionada ao gestor de menu.");
					}

				}
				Core.setMessageSuccess();
				if (model.getPrimeira_pagina() == 1) {
					Application app2 = Core.findApplicationById(action.getApplication().getId());
					app2.setAction(action);
					app2.update();
				}

				this.addQueryString("p_env_fk", model.getEnv_fk());
				return this.redirect("igrp", "page", "index", this.queryString());

			} else {
				Core.setMessageError();
				return this.forward("igrp", "page", "index");
			}

		} else {

			/****** RECUPERANDO UMA PÁGINA ********/

			Action recover = new Action().find()
					.where("page", "=", nosi.core.gui.page.Page.getPageName(model.getPage())).andWhere("status", "=", 2)
					.andWhere("application.id", "=", Core.toInt(model.getEnv_fk())).one();

			if (recover != null) {

				recover.setStatus(1);
				recover.update();

				Historic hitoric_page = new Historic();
				hitoric_page.setNome(Core.getCurrentUser().getName());
				hitoric_page.setIdUtilizador(Core.getCurrentUser().getId());
				hitoric_page.setPage(recover);
				hitoric_page.setDescricao("Página Recuperada");
				hitoric_page.insert();

				Core.setMessageInfo("Página Recuperada Com Sucesso!");
				return this.forward("igrp", "page", "index");
			} else {
				Core.setMessageWarning("Este code já existe. Por favor editar.");
				return this.forward("igrp", "page", "index");

			}
		}

		/*----#end-code----*/
			
	}
	
	public Response actionEliminar_pagina() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page model = new Page();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Page","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (eliminar_pagina)  *//* End-Code-Block  */
		/*----#start-code(eliminar_pagina)----*/

		Action eliminar_page = new Action().findOne(Core.toInt(model.getId()));
		eliminar_page.setStatus(2);
		eliminar_page.update();
		
		Historic hitoric_page = new Historic();
		hitoric_page.setNome(Core.getCurrentUser().getName());
		hitoric_page.setIdUtilizador(Core.getCurrentUser().getId());
		hitoric_page.setPage(eliminar_page);
		hitoric_page.setDescricao("Página Eliminada.");
		hitoric_page.insert();

		List<Menu> menu_delete = new Menu().find().where("action", "=", Core.toInt(model.getId())).all();
		for (Menu menu_del : menu_delete) {
			menu_del.delete();
		}
		Core.setMessageSuccess("Página eliminada com Sucesso!");

		/*----#end-code----*/
		return this.redirect("igrp","Page","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	public Response actionSetModuloEditar(Page model) {
		String xml = "<content>" + "<editar_modulo>"
				+ StringEscapeUtils.escapeXml11(
						Core.getIGRPLink("igrp_studio", "modulo", "index&p_modulo_cod=" + model.getModulo()))
				+ "</editar_modulo>" + "</content>";
		return this.renderView(xml);
	}

	private boolean checkifexists(Page model) {

		return Core.isNull(new Action().find().andWhere("application.id", "=", Core.toInt(model.getEnv_fk()))
				.andWhere("page", "=", nosi.core.gui.page.Page.getPageName(model.getPage())).one());
	}
	
	// Save page generated
	public Response actionSaveGenPage() throws IOException {
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id_objeto");
		Action ac = new Action().findOne(Integer.parseInt(p_id));
		Compiler compiler = null;
		PageFile pageFile = null;
		Boolean workspace = false;
		String messages = "";
		if (null!=ac) {
			pageFile = new PageFile();
			String path_class = Igrp.getInstance().getRequest().getParameter("p_package").trim();
			path_class = path_class.replaceAll("(\r\n|\n)", "");
			path_class = path_class.replace(".", File.separator) + File.separator + ac.getPage().toLowerCase().trim();
			String path_xsl = this.getConfig().getCurrentBaseServerPahtXsl(ac);
			String path_xsl_work_space = null;
			String path_class_work_space = null;

			if (Core.isNotNull(this.getConfig().getWorkspace())) {
				workspace = true;
				path_xsl_work_space = this.getConfig().getWorkspace() + File.separator + this.getConfig().getWebapp()
						+ File.separator + "images" + File.separator + "IGRP" + File.separator + "IGRP"
						+ ac.getVersion() + File.separator + "app" + File.separator + ac.getApplication().getDad()
						+ File.separator + ac.getPage().toLowerCase();

				path_class_work_space = this.getConfig().getBasePahtClassWorkspace(ac.getApplication().getDad(),
						ac.getPage());
			}
			path_class = this.getConfig().getBasePathClass() + path_class;
			if (pageFile.isAllFileExists() && path_xsl != null && !path_xsl.equals("") && path_class != null
					&& !path_class.equals("")) {
				this.processJson(pageFile.getFileJson(), ac);

				if (Boolean.TRUE.equals(workspace))
					FileHelper.saveFilesPageConfig(path_xsl_work_space, ac.getPage(),
							new String[] { pageFile.getFileXml(), pageFile.getFileXsl(), pageFile.getFileJson() });
				
				 FileHelper.saveFilesPageConfig(path_xsl, ac.getPage(),
						new String[] { pageFile.getFileXml(), pageFile.getFileXsl(), pageFile.getFileJson() });
				 boolean r;
				if (ac.getIsComponent() == 0) {
					r = FileHelper.saveFilesJava(path_class, ac.getPage(), new String[] { pageFile.getFileModel(),
							pageFile.getFileView(), pageFile.getFileController() });
					compiler = this.processCompile(path_class, ac.getPage());
					if (r && !compiler.hasError() && Boolean.TRUE.equals(workspace)) {// Check if not error on the compilation class
						
							if (!FileHelper.fileExists(path_class_work_space)) {// check directory
								FileHelper.createDiretory(path_class_work_space);// create directory if not exist
							}
							FileHelper.saveFilesJava(path_class_work_space, ac.getPage(),
									new String[] { pageFile.getFileModel(), pageFile.getFileView(),
											pageFile.getFileController() },
									FileHelper.ENCODE_UTF8, FileHelper.ENCODE_UTF8);// ENCODE_UTF8 for default encode
																					// eclipse
						
					}
				} else
					messages += ("<message type=\"" + FlashMessage.INFO + "\">"
							+ StringEscapeUtils.escapeXml10(
									Core.toJson(new MapErrorCompile(Core.gt("Componente registado com sucesso"), null)))
							+ "</message>");
			}
			Historic hitoric_page = new Historic();
			hitoric_page.setNome(Core.getCurrentUser().getName());
			hitoric_page.setIdUtilizador(Core.getCurrentUser().getId());
			hitoric_page.setPage(ac);
			hitoric_page.setDescricao("Alterações no Gerador.");
			hitoric_page.insert();
		}

		if (compiler != null && compiler.hasError())
			messages += ("<message type=\"" + FlashMessage.ERROR + "\">"
					+ StringEscapeUtils.escapeXml11(compiler.getErrorToJson()) + "</message>");
		if (compiler != null && compiler.hasWarning())
			messages += ("<message type=\"" + FlashMessage.WARNING + "\">"
					+ StringEscapeUtils.escapeXml11(compiler.getWarningToJson()) + "</message>");
		if (compiler != null && !compiler.hasError() && ac != null) {
			messages += ("<message type=\"" + FlashMessage.SUCCESS + "\">"
					+ StringEscapeUtils.escapeXml10(Core.toJson(new MapErrorCompile(
							ac.getIsComponent() == 0 ? Core.gt("CompSuc") : Core.gt("Componente registado com sucesso"),
							null)))
					+ "</message>");
		}
		return this.renderView("<messages>" + messages + "</messages>");
	}

	private Compiler processCompile(String path_class, String page) {
		String path_class_ = path_class + File.separator;
		Compiler compiler = new Compiler();
		String fileName = path_class_ + page;
		compiler.addFileName(fileName + ".java");
		compiler.addFileName(fileName + "View.java");
		compiler.addFileName(fileName + "Controller.java");
		compiler.compile();
		return compiler;
	}

	// Read json and extract transactions
	private void processJson(String fileJson, Action ac) {
		JSONObject objJson;
		if (fileJson.contains("\"transaction\":true")) {
			try {
				objJson = new JSONObject(fileJson);

				this.processBoxContent(objJson, ac);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void processBoxContent(JSONObject contents, Action ac) {
		if (contents != null) {
			JSONArray rowsc = contents.getJSONArray("rows");
			for (int ic = 0; ic < rowsc.length(); ic++) {
				JSONArray collumnsc = rowsc.optJSONObject(ic).optJSONArray("columns");
				if (collumnsc != null) {
					for (int jc = 0; jc < collumnsc.length(); jc++) {
						JSONArray containersc = collumnsc.optJSONObject(jc).optJSONArray("containers");
						if (containersc != null) {
							for (int hc = 0; hc < containersc.length(); hc++) {
								JSONArray fieldsc = containersc.optJSONObject(hc).optJSONArray("fields");
								if (fieldsc != null && fieldsc.toString().contains("\"transaction\":true"))
									this.processTransactions(fieldsc, ac);
								JSONArray contextMenuc = containersc.optJSONObject(hc).optJSONArray("contextMenu");
								if (contextMenuc != null && contextMenuc.toString().contains("\"transaction\":true"))
									this.processTransactions(contextMenuc, ac);
								JSONArray contentsX = containersc.optJSONObject(hc).optJSONArray("contents");
								if (contentsX != null && contentsX.toString().contains("\"transaction\":true"))
									this.processBoxContent(contentsX.optJSONObject(0), ac);
							}
						}
					}
				}

			}
		}
	}

	// Extract transactions
	private void processTransactions(JSONArray fields, Action ac) {
		for (int i = 0; i < fields.length(); i++) {
			JSONObject p;
			try {
				p = fields.getJSONObject(i).getJSONObject("properties");
				if (p.get("transaction") != null && p.get("transaction").toString().equals("true")) {
						this.saveTransaction(p.get("name").toString(), p.get("label").toString(),
								p.get("action").toString(), p.get("tag").toString(), ac);
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

	// Save transactions
	private void saveTransaction(String name, String label, String action, String tag, Action ac) {
		if (ac != null && name != null && tag != null) {
			Transaction t = new Transaction();
			String code = ac.getApplication().getDad().toLowerCase() + "_" + ac.getPage() + "_" + tag;
			t = t.find().andWhere("code", "=", code).one();
			if (t == null) {
				t = new Transaction(code, label, 1, ac.getApplication());
				t = t.insert();
			}
		}
	}

	// list all page of an application
	public Response actionListPage()  {
		final String dad = Core.getParam("p_dad");
		int app = Core.findApplicationByDad(dad).getId();
		String json = "[";
		List<Share> shares = new Share().find().andWhere("env.id", "=", app).andWhere("type", "=", "PAGE")
				.andWhere("status", "=", 1).all();
		List<Action> aux = new ArrayList<Action>();
		if (shares != null)
			for (Share share : shares) {
				Action action = new Action().findOne(share.getType_fk());
				if (action != null)
					aux.add(action);
			}
		List<Action> actions = new Action().find().andWhere("isComponent", "<>", (short) 2)
				.andWhere("application.id", "=", app).andWhere("status", "=", 1).all();
		if (actions != null) {
			if (aux != null) actions.addAll(aux);
			for (Action ac : actions) {
				json += "{";
				json += "\"action\":\"" + ac.getAction() + "\",";
				final String dad2 = ac.getApplication().getDad();
				json += "\"app\":\"" + dad2 + "\",";
				json += "\"page\":\"" +(dad.equalsIgnoreCase(dad2) ? "" : dad2+"@")+ ac.getPage() + "\",";
				json += "\"id\":\"" + ac.getId() + "\",";
				json += "\"description\":\"" + (dad.equalsIgnoreCase(dad2) ? "" : dad2 + "/")
						+ (ac.getPage_descr() != null ? ac.getPage_descr() + " (" + ac.getPage() + ")" : ac.getPage())
						+ "\",";
				json += "\"link\":\"" + this.getConfig().getResolvePathPage(dad2, ac.getPage(), ac.getVersion()) + "/"
						+ ac.getPage() + ".xml\"";
				json += "},";
			}
		}
		json = json.substring(0, json.length() - 1);
		json += "]";
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}

	// get detail page
	public Response actionDetailPage() {
		int p_id = Core.getParamInt("p_id");
		Action ac = new Action().findOne(p_id);
		String json = "{";
		if (ac != null) {
			json += "\"action\":\"" + ac.getAction() + "\",";
			json += "\"action_descr\":\"" + ac.getAction_descr() + "\",";
			json += "\"app\":\"" + ac.getApplication().getDad() + "\",";
			json += "\"page\":\"" + ac.getPage() + "\",";
			json += "\"id\":\"" + ac.getId() + "\",";
			json += "\"filename\":\"" + this.getConfig().getCurrentResolvePathPage(ac.getApplication().getDad(),
					ac.getPage(), ac.getVersion()) + "/" + ac.getPage() + ".xsl\",";
			json += "\"page_descr\":\"" + ac.getPage_descr() + "\"";
		}
		json += "}";
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}

	public Response actionImageList()  {
		String param = Core.getParam("name");
		String menu = "";
		if (param.equals("menu")) {
			menu = "[\"themes/default/img/icon/menu/CVM_agente.png\",\"themes/default/img/icon/menu/CVM_cell.png\",\"themes/default/img/icon/menu/CVM_data.png\",\"themes/default/img/icon/menu/CVM_gestor_agente.png\",\"themes/default/img/icon/menu/CVM_pontos_venda.png\",\"themes/default/img/icon/menu/CVM_spots.png\",\"themes/default/img/icon/menu/CVM_torre.png\",\"themes/default/img/icon/menu/Minhas_tarefas.png\",\"themes/default/img/icon/menu/Registo_distribuicao.png\",\"themes/default/img/icon/menu/Registo_extracao.png\",\"themes/default/img/icon/menu/Tarefas_concluidas.png\",\"themes/default/img/icon/menu/abono.png\",\"themes/default/img/icon/menu/accao_topologia.png\",\"themes/default/img/icon/menu/alerta.png\",\"themes/default/img/icon/menu/alteracao_PIN.png\",\"themes/default/img/icon/menu/autotanque.png\",\"themes/default/img/icon/menu/bancos.png\",\"themes/default/img/icon/menu/basemaps.png\",\"themes/default/img/icon/menu/bloco_notas_privado.png\",\"themes/default/img/icon/menu/bonificados.png\",\"themes/default/img/icon/menu/cabimento.png\",\"themes/default/img/icon/menu/clientes.png\",\"themes/default/img/icon/menu/colocacoes.png\",\"themes/default/img/icon/menu/componentes.png\",\"themes/default/img/icon/menu/condecoracao.png\",\"themes/default/img/icon/menu/confirmacao_PIN.png\",\"themes/default/img/icon/menu/consultas.png\",\"themes/default/img/icon/menu/conta-corrente.png\",\"themes/default/img/icon/menu/conteudos.png\",\"themes/default/img/icon/menu/context_menu.png\",\"themes/default/img/icon/menu/contrato.png\",\"themes/default/img/icon/menu/contribuicoes.png\",\"themes/default/img/icon/menu/descendentes.png\",\"themes/default/img/icon/menu/desenpenho.png\",\"themes/default/img/icon/menu/dessalinizadora.png\",\"themes/default/img/icon/menu/dique_1.png\",\"themes/default/img/icon/menu/disponibilidade.png\",\"themes/default/img/icon/menu/dividas.png\",\"themes/default/img/icon/menu/documentos.png\",\"themes/default/img/icon/menu/duplicar.png\",\"themes/default/img/icon/menu/enquadramento.png\",\"themes/default/img/icon/menu/espelhos.png\",\"themes/default/img/icon/menu/est.especies.png\",\"themes/default/img/icon/menu/est.fiscalizacao.png\",\"themes/default/img/icon/menu/estabelecimento.png\",\"themes/default/img/icon/menu/estast.performance-global.png\",\"themes/default/img/icon/menu/estatistica-bonificados.png\",\"themes/default/img/icon/menu/estatistica-financeira.png\",\"themes/default/img/icon/menu/estatistica.png\",\"themes/default/img/icon/menu/estatistica_contratos.png\",\"themes/default/img/icon/menu/etapas.png\",\"themes/default/img/icon/menu/exames.png\",\"themes/default/img/icon/menu/fim.png\",\"themes/default/img/icon/menu/flag_eng.png\",\"themes/default/img/icon/menu/flag_france.png\",\"themes/default/img/icon/menu/flg_port.png\",\"themes/default/img/icon/menu/fotografias.png\",\"themes/default/img/icon/menu/historico.png\",\"themes/default/img/icon/menu/historico_clinico.png\",\"themes/default/img/icon/menu/identificacao-.png\",\"themes/default/img/icon/menu/identificacao.png\",\"themes/default/img/icon/menu/idioma.png\",\"themes/default/img/icon/menu/info-menu-.png\",\"themes/default/img/icon/menu/info-menu.png\",\"themes/default/img/icon/menu/iniciar.png\",\"themes/default/img/icon/menu/internamento.png\",\"themes/default/img/icon/menu/investidores.png\",\"themes/default/img/icon/menu/layers.png\",\"themes/default/img/icon/menu/legenda.png\",\"themes/default/img/icon/menu/m_BAU.png\",\"themes/default/img/icon/menu/m_alerta_caducidade.png\",\"themes/default/img/icon/menu/m_alerta_prazos_.png\",\"themes/default/img/icon/menu/m_caixas.png\",\"themes/default/img/icon/menu/m_calendario.png\",\"themes/default/img/icon/menu/m_categoria.png\",\"themes/default/img/icon/menu/m_classificacao.png\",\"themes/default/img/icon/menu/m_empresa.png\",\"themes/default/img/icon/menu/m_empresa_.png\",\"themes/default/img/icon/menu/m_error.png\",\"themes/default/img/icon/menu/m_especies.png\",\"themes/default/img/icon/menu/m_est.licenca.png\",\"themes/default/img/icon/menu/m_est.trofeus.png\",\"themes/default/img/icon/menu/m_fiscalizacao.png\",\"themes/default/img/icon/menu/m_fontenario.png\",\"themes/default/img/icon/menu/m_frequencia_estimativa.png\",\"themes/default/img/icon/menu/m_furos.png\",\"themes/default/img/icon/menu/m_gerencia.png\",\"themes/default/img/icon/menu/m_guia.png\",\"themes/default/img/icon/menu/m_integracao.png\",\"themes/default/img/icon/menu/m_licenca.png\",\"themes/default/img/icon/menu/m_licenca_ambiental.png\",\"themes/default/img/icon/menu/m_lista.png\",\"themes/default/img/icon/menu/m_mapa.png\",\"themes/default/img/icon/menu/m_material.png\",\"themes/default/img/icon/menu/m_movimentos.png\",\"themes/default/img/icon/menu/m_outras-licencas.png\",\"themes/default/img/icon/menu/m_pesquisa_licenca_.png\",\"themes/default/img/icon/menu/m_pesquisa_mapa.png\",\"themes/default/img/icon/menu/m_pesquisa_projecto.png\",\"themes/default/img/icon/menu/m_ponto.fscalizacao.png\",\"themes/default/img/icon/menu/m_proj_investimento.png\",\"themes/default/img/icon/menu/m_reservatorio.png\",\"themes/default/img/icon/menu/m_taxas.png\",\"themes/default/img/icon/menu/m_transportes.png\",\"themes/default/img/icon/menu/m_trofeus.png\",\"themes/default/img/icon/menu/mapa_menu.png\",\"themes/default/img/icon/menu/marcacoes.png\",\"themes/default/img/icon/menu/menu_lista.png\",\"themes/default/img/icon/menu/meta-type.png\",\"themes/default/img/icon/menu/morada.png\",\"themes/default/img/icon/menu/movimentos.png\",\"themes/default/img/icon/menu/nascente.png\",\"themes/default/img/icon/menu/nivel_habilitacao.png\",\"themes/default/img/icon/menu/notas.png\",\"themes/default/img/icon/menu/notificacoes-.png\",\"themes/default/img/icon/menu/notificacoes.png\",\"themes/default/img/icon/menu/obitos.png\",\"themes/default/img/icon/menu/observacoes.png\",\"themes/default/img/icon/menu/origem.png\",\"themes/default/img/icon/menu/outdoor-menu.png\",\"themes/default/img/icon/menu/partilhados.png\",\"themes/default/img/icon/menu/partilhar.png\",\"themes/default/img/icon/menu/penas.png\",\"themes/default/img/icon/menu/perda_bonificacao.png\",\"themes/default/img/icon/menu/perda_bonificacao_2.png\",\"themes/default/img/icon/menu/permissao.png\",\"themes/default/img/icon/menu/pino_amarelo-(digital).png\",\"themes/default/img/icon/menu/pino_amarelo.png\",\"themes/default/img/icon/menu/pino_preto-(digital).png\",\"themes/default/img/icon/menu/pino_preto.png\",\"themes/default/img/icon/menu/pino_verde-(digital).png\",\"themes/default/img/icon/menu/pino_verde.png\",\"themes/default/img/icon/menu/pino_vermelho-(digital).png\",\"themes/default/img/icon/menu/pino_vermelho.png\",\"themes/default/img/icon/menu/pino_vermelho_ponto-preto-(digital).png\",\"themes/default/img/icon/menu/pino_vermelho_ponto-preto.png\",\"themes/default/img/icon/menu/poco_1.png\",\"themes/default/img/icon/menu/poco_2.png\",\"themes/default/img/icon/menu/poco_3.png\",\"themes/default/img/icon/menu/prestacoes.png\",\"themes/default/img/icon/menu/processos.png\",\"themes/default/img/icon/menu/qualidade_agua2.png\",\"themes/default/img/icon/menu/qualidade_agua4.png\",\"themes/default/img/icon/menu/regime_trab.png\",\"themes/default/img/icon/menu/registos_ligacao.png\",\"themes/default/img/icon/menu/registos_tratamento.png\",\"themes/default/img/icon/menu/regras_topologia.png\",\"themes/default/img/icon/menu/reinicializacao_PIN.png\",\"themes/default/img/icon/menu/renovacoes.png\",\"themes/default/img/icon/menu/retiradas.png\",\"themes/default/img/icon/menu/saneamento_ETAR_.png\",\"themes/default/img/icon/menu/saneamento_UDR.png\",\"themes/default/img/icon/menu/saneamento_reg_equip_recolha.png\",\"themes/default/img/icon/menu/saneamento_reg_recolha.png\",\"themes/default/img/icon/menu/saneamento_tratamento_residuos.png\",\"themes/default/img/icon/menu/seg_social.png\",\"themes/default/img/icon/menu/seguros.png\",\"themes/default/img/icon/menu/sis_abastecimento.png\",\"themes/default/img/icon/menu/sis_abastecimento2.png\",\"themes/default/img/icon/menu/sis_abastecimento3.png\",\"themes/default/img/icon/menu/sis_abastecimento4.png\",\"themes/default/img/icon/menu/tarefas.png\",\"themes/default/img/icon/menu/tarefas_pendentes.png\",\"themes/default/img/icon/menu/taxas.png\",\"themes/default/img/icon/menu/tema.png\",\"themes/default/img/icon/menu/tipo_cor.png\",\"themes/default/img/icon/menu/tipo_energia.png\",\"themes/default/img/icon/menu/tipo_equipamento.png\",\"themes/default/img/icon/menu/tipo_identificacao.png\",\"themes/default/img/icon/menu/tipo_tratamento.png\",\"themes/default/img/icon/menu/tipos.png\",\"themes/default/img/icon/menu/tratamento.png\",\"themes/default/img/icon/menu/tratamento_residuos.png\",\"themes/default/img/icon/menu/tratamento_residuos2.png\",\"themes/default/img/icon/menu/ultimas_consultas.png\",\"themes/default/img/icon/menu/ultimos_exames.png\",\"themes/default/img/icon/menu/ultimos_internamentos.png\"]";
		} else {
			menu = "[\"themes/default/img/icon/tools-bar/Book_phones.png\",\"themes/default/img/icon/tools-bar/Folha_C.png\",\"themes/default/img/icon/tools-bar/Folha_F.png\",\"themes/default/img/icon/tools-bar/Folha_M.png\",\"themes/default/img/icon/tools-bar/Folha_RC.png\",\"themes/default/img/icon/tools-bar/Folha_RF.png\",\"themes/default/img/icon/tools-bar/Folha_S.png\",\"themes/default/img/icon/tools-bar/PDF_C.png\",\"themes/default/img/icon/tools-bar/PDF_F.png\",\"themes/default/img/icon/tools-bar/PDF_M-.png\",\"themes/default/img/icon/tools-bar/PDF_M.png\",\"themes/default/img/icon/tools-bar/PDF_RC.png\",\"themes/default/img/icon/tools-bar/PDF_RF.png\",\"themes/default/img/icon/tools-bar/PDF_S.png\",\"themes/default/img/icon/tools-bar/activar.png\",\"themes/default/img/icon/tools-bar/add-temp.png\",\"themes/default/img/icon/tools-bar/add.png\",\"themes/default/img/icon/tools-bar/alterar-assinatura.png\",\"themes/default/img/icon/tools-bar/alterar-digital.png\",\"themes/default/img/icon/tools-bar/alterar-foto.png\",\"themes/default/img/icon/tools-bar/apply.png\",\"themes/default/img/icon/tools-bar/assumir_tarefas.png\",\"themes/default/img/icon/tools-bar/avaliar.png\",\"themes/default/img/icon/tools-bar/back.png\",\"themes/default/img/icon/tools-bar/balcoes.png\",\"themes/default/img/icon/tools-bar/calendario.png\",\"themes/default/img/icon/tools-bar/cancel.png\",\"themes/default/img/icon/tools-bar/circulo.png\",\"themes/default/img/icon/tools-bar/clientes_tb.png\",\"themes/default/img/icon/tools-bar/close.png\",\"themes/default/img/icon/tools-bar/contas.png\",\"themes/default/img/icon/tools-bar/contrato_tb.png\",\"themes/default/img/icon/tools-bar/ctx-acount.png\",\"themes/default/img/icon/tools-bar/ctx-attachment.png\",\"themes/default/img/icon/tools-bar/ctx-close.png\",\"themes/default/img/icon/tools-bar/ctx-delete.png\",\"themes/default/img/icon/tools-bar/ctx-demote.png\",\"themes/default/img/icon/tools-bar/ctx-details.png\",\"themes/default/img/icon/tools-bar/ctx-payment.png\",\"themes/default/img/icon/tools-bar/ctx_benefic.png\",\"themes/default/img/icon/tools-bar/ctx_disponive.png\",\"themes/default/img/icon/tools-bar/ctx_documents.png\",\"themes/default/img/icon/tools-bar/ctx_family.png\",\"themes/default/img/icon/tools-bar/ctx_group.png\",\"themes/default/img/icon/tools-bar/ctx_house.png\",\"themes/default/img/icon/tools-bar/ctx_info.png\",\"themes/default/img/icon/tools-bar/ctx_mudar_prop.png\",\"themes/default/img/icon/tools-bar/ctx_process.png\",\"themes/default/img/icon/tools-bar/ctx_selecionado.png\",\"themes/default/img/icon/tools-bar/ctx_text_list.png\",\"themes/default/img/icon/tools-bar/delete.png\",\"themes/default/img/icon/tools-bar/desativar.png\",\"themes/default/img/icon/tools-bar/disable.png\",\"themes/default/img/icon/tools-bar/distribuir.png\",\"themes/default/img/icon/tools-bar/document-excel.png\",\"themes/default/img/icon/tools-bar/document-pdf.png\",\"themes/default/img/icon/tools-bar/down.png\",\"themes/default/img/icon/tools-bar/edit.png\",\"themes/default/img/icon/tools-bar/emitir_factura.png\",\"themes/default/img/icon/tools-bar/enable.png\",\"themes/default/img/icon/tools-bar/entrar.png\",\"themes/default/img/icon/tools-bar/enviar_notificacoes.png\",\"themes/default/img/icon/tools-bar/enviar_roxo.png\",\"themes/default/img/icon/tools-bar/enviar_verde.png\",\"themes/default/img/icon/tools-bar/error.png\",\"themes/default/img/icon/tools-bar/et-add.png\",\"themes/default/img/icon/tools-bar/excel.png\",\"themes/default/img/icon/tools-bar/exportar.png\",\"themes/default/img/icon/tools-bar/familiares.png\",\"themes/default/img/icon/tools-bar/filtro.png\",\"themes/default/img/icon/tools-bar/fim.png\",\"themes/default/img/icon/tools-bar/gerencia.png\",\"themes/default/img/icon/tools-bar/grosso.png\",\"themes/default/img/icon/tools-bar/help.png\",\"themes/default/img/icon/tools-bar/imagem.png\",\"themes/default/img/icon/tools-bar/importar.png\",\"themes/default/img/icon/tools-bar/indutria.png\",\"themes/default/img/icon/tools-bar/iniciar_processo.png\",\"themes/default/img/icon/tools-bar/invoice.png\",\"themes/default/img/icon/tools-bar/keepass.png\",\"themes/default/img/icon/tools-bar/key__pencil.png\",\"themes/default/img/icon/tools-bar/key_arrow.png\",\"themes/default/img/icon/tools-bar/key_delete.png\",\"themes/default/img/icon/tools-bar/key_go.png\",\"themes/default/img/icon/tools-bar/key_plus.png\",\"themes/default/img/icon/tools-bar/keys.png\",\"themes/default/img/icon/tools-bar/liberar_tarefa.png\",\"themes/default/img/icon/tools-bar/lista.png\",\"themes/default/img/icon/tools-bar/mail.png\",\"themes/default/img/icon/tools-bar/mapa.png\",\"themes/default/img/icon/tools-bar/modulos.png\",\"themes/default/img/icon/tools-bar/mostrar.png\",\"themes/default/img/icon/tools-bar/new_modulo.png\",\"themes/default/img/icon/tools-bar/new_page.png\",\"themes/default/img/icon/tools-bar/next.png\",\"themes/default/img/icon/tools-bar/novo_cliente.png\",\"themes/default/img/icon/tools-bar/novo_contrato.png\",\"themes/default/img/icon/tools-bar/ocultar.png\",\"themes/default/img/icon/tools-bar/pagar.png\",\"themes/default/img/icon/tools-bar/pdf.png\",\"themes/default/img/icon/tools-bar/percentage.png\",\"themes/default/img/icon/tools-bar/perda_bonificacao.png\",\"themes/default/img/icon/tools-bar/preview.png\",\"themes/default/img/icon/tools-bar/print.png\",\"themes/default/img/icon/tools-bar/printer.png\",\"themes/default/img/icon/tools-bar/publish.png\",\"themes/default/img/icon/tools-bar/reenviar_notficacoes.png\",\"themes/default/img/icon/tools-bar/refresh.png\",\"themes/default/img/icon/tools-bar/regularizar.png\",\"themes/default/img/icon/tools-bar/retalho.png\",\"themes/default/img/icon/tools-bar/save.png\",\"themes/default/img/icon/tools-bar/search.png\",\"themes/default/img/icon/tools-bar/self-service.png\",\"themes/default/img/icon/tools-bar/send.png\",\"themes/default/img/icon/tools-bar/sitemap.png\",\"themes/default/img/icon/tools-bar/sms.png\",\"themes/default/img/icon/tools-bar/start.png\",\"themes/default/img/icon/tools-bar/switch.png\",\"themes/default/img/icon/tools-bar/tab.png\",\"themes/default/img/icon/tools-bar/tb_acercar.png\",\"themes/default/img/icon/tools-bar/tb_agregado-seriado.png\",\"themes/default/img/icon/tools-bar/tb_agregado-trocar.png\",\"themes/default/img/icon/tools-bar/tb_apartment.png\",\"themes/default/img/icon/tools-bar/tb_building.png\",\"themes/default/img/icon/tools-bar/tb_caderno.png\",\"themes/default/img/icon/tools-bar/tb_categoria.png\",\"themes/default/img/icon/tools-bar/tb_classification.png\",\"themes/default/img/icon/tools-bar/tb_close.png\",\"themes/default/img/icon/tools-bar/tb_community-equipment.png\",\"themes/default/img/icon/tools-bar/tb_distanciar.png\",\"themes/default/img/icon/tools-bar/tb_document.png\",\"themes/default/img/icon/tools-bar/tb_entrega_cartao.png\",\"themes/default/img/icon/tools-bar/tb_evaluation.png\",\"themes/default/img/icon/tools-bar/tb_habitacao.png\",\"themes/default/img/icon/tools-bar/tb_historico.png\",\"themes/default/img/icon/tools-bar/tb_housing-complex.png\",\"themes/default/img/icon/tools-bar/tb_imoveis.png\",\"themes/default/img/icon/tools-bar/tb_janela-dupla.png\",\"themes/default/img/icon/tools-bar/tb_licenca.png\",\"themes/default/img/icon/tools-bar/tb_link.png\",\"themes/default/img/icon/tools-bar/tb_lista.png\",\"themes/default/img/icon/tools-bar/tb_livrete.png\",\"themes/default/img/icon/tools-bar/tb_market.png\",\"themes/default/img/icon/tools-bar/tb_medir.png\",\"themes/default/img/icon/tools-bar/tb_medir_area.png\",\"themes/default/img/icon/tools-bar/tb_observacoes.png\",\"themes/default/img/icon/tools-bar/tb_print_actualizar.png\",\"themes/default/img/icon/tools-bar/tb_processos.png\",\"themes/default/img/icon/tools-bar/tb_refresh.png\",\"themes/default/img/icon/tools-bar/tb_search_land.png\",\"themes/default/img/icon/tools-bar/tb_statistically.png\",\"themes/default/img/icon/tools-bar/tb_vista-anterior.png\",\"themes/default/img/icon/tools-bar/tb_vista-inicial.png\",\"themes/default/img/icon/tools-bar/tb_zoom-janela.png\",\"themes/default/img/icon/tools-bar/transferir.png\",\"themes/default/img/icon/tools-bar/turismo.png\",\"themes/default/img/icon/tools-bar/view.png\"]";
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(menu);
	}

	// Extracting reserve code inserted by programmer
	public Response actionPreserveUrl() {

		String page = Core.getParam("page");
		String app = Core.getParam("app");

		String json = ExtractReserveCode.extract(app, page);

		this.format = Response.FORMAT_JSON;

		return this.renderView(json);

	}

	// View page with xml
	public Response actionVisualizar()  {
		String p_id = Core.getParam("p_id");
		if (Core.isNotNull(p_id)) {
			Action ac = new Action().findOne(Integer.parseInt(p_id));
			if (ac != null) {
				String content = FileHelper.readFile(this.getConfig().getCurrentBaseServerPahtXsl(ac),
						ac.getPage() + ".xml");			
				int index1 = content.indexOf("<rows>");
				if (index1 > 0) {
					String c= "<?xml version=\"1.0\" encoding=\"UTF-8\"?><?xml-stylesheet href=\"../";
					c += content.substring(content.indexOf("images/IGRP/"), index1 + "<rows>".length());
					c += "<link_img>" + this.getConfig().getLinkImg() + "</link_img>";
					c += content.substring(content.indexOf("</link_img>") + "</link_img>".length());
					return this.renderView(c);
				}
				return this.renderView(content);
			}
		}
		return null;
	}

	public Response actionGetXsl() throws IOException {
		String page = Core.getParam("page");
		String app = Core.getParam("app");
		if (Core.isNotNull(page) && Core.isNotNull(app)) {
			Action ac = new Action().find().andWhere("page", "=", page).andWhere("application", "=", Core.toInt(app))
					.one();
			String path_xsl = this.getConfig().getCurrentBaseServerPahtXsl(ac);
			String content = FileHelper.readFile(path_xsl, ac.getPage() + ".xsl");
			this.format = Response.FORMAT_XSL;
			return this.renderView(content.replaceAll("<xsl:include href=\"../../../",
					"<xsl:include href=\"" + this.getConfig().getLinkImg() + "/"));
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}

	// For Editor

	private Set<Map<String, Set<String>>> getMethod(Class<?>... params) {
		Set<Map<String, Set<String>>> metodos = new HashSet<>();
		for (Class<?> c : params) {
			for (Method method : c.getDeclaredMethods()) {
				if (!method.getName().contains("lambda")) {
					Map<String, Set<String>> m = new HashMap<>();
					Set<String> mm = new HashSet<>();
					for (Parameter param : method.getParameters()) {
						int i = param.toString().lastIndexOf(".");
						if (i != -1)
							mm.add(param.toString().substring(i + 1));
						else
							mm.add(param.toString());
					}
					m.put(method.getName(), mm);
					metodos.add(m);
				}
			}
		}
		return metodos;
	}

	public Response actionMetodosCore() {
		Set<Map<String, Set<String>>> metodos = getMethod(Core.class, QueryHelper.class);
		this.format = Response.FORMAT_JSON;
		return this.renderView(Core.toJson(metodos));
	}

	public Response actionListDomains() {
		int p_id = Core.getParamInt("p_id");
		Action ac = new Action().findOne(p_id);
		if (ac != null && ac.getApplication() != null) {
			final String dad = ac.getApplication().getDad();
			List<String> domains = new ArrayList<>();
			for (Tuple t : Core.query(this.configApp.getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value()), DomainHeper.SQL_DOMINIO_PRIVATE)
					.addInt("env_fk", ac.getApplication().getId()).getResultList()) {
				try {
					domains.add(t.get("dominio") + " « " + dad);
				} catch (IllegalArgumentException e) {
				}
			}
			for (Tuple t : Core.query(this.configApp.getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value()), DomainHeper.SQL_DOMINIO_PUB)
					.getResultList()) {
				try {
					domains.add(t.get("dominio") + "");
				} catch (IllegalArgumentException e) {
				}
			}
			Properties p = new Properties();
			p.put("list", domains);
			this.format = Response.FORMAT_JSON;
			return this.renderView(Core.toJson(p));
		}
		return null;
	}

	public Response actionDomainsValues() {
		String p_id = Core.getParam("p_id");
		String[] ids = p_id.split(" « ");
		List<Properties> list = new ArrayList<>();
		try {
			List<Tuple> queryDomain;
			if (ids.length > 1)
				queryDomain = Core.query(this.configApp.getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value()), DomainHeper.SQL_ITEM_DOMINIO)
						.addString("dominio", ids[0]).addInt("env_fk", Core.findApplicationByDad(ids[1]).getId())
						.getResultList();
			else
				queryDomain = Core.query(this.configApp.getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value()), DomainHeper.SQL_ITEM_DOMINIO_PUB)
						.addString("dominio", ids[0] == null ? p_id : ids[0]).getResultList();
			for (Tuple t : queryDomain) {
				Properties domains = new Properties();
				domains.put("value", t.get("key").toString());
				domains.put("text", t.get("description").toString());
				list.add(domains);
			}
		} catch (IllegalArgumentException e) { 
			e.printStackTrace();
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(Core.toJson(list));
	}

	public Response actionGetPageJson() {
		String p_id = Core.getParam("p_id");
		String p_app = Core.getParam("p_app");
		String json = "";
		if (p_id != null && !p_id.isEmpty()) {
			Action ac = null;
			if (Core.isInt(p_id))
				ac = new Action().findOne(Core.toInt(p_id));
			else {
				if(p_id.contains("@")) {
					String splittedId[] = p_id.split("@");
					p_app = splittedId[0];
					p_id = splittedId[1];
				}
				ac = new Action().find().where("page", "=", p_id).andWhere("application.dad", "=", p_app).one();
			}
			if (ac != null) {
				String contextName = Core.getDeployedWarName();
				if (ac.getApplication().getExterno() == 2 && !contextName.equals(ac.getApplication().getUrl())) {
		            String resourcePath = String.format("%s/%s.json", this.getConfig().getImageAppPath(ac), ac.getPage());
		            json = getJsonFromHttp(resourcePath, contextName, ac.getApplication().getUrl());
		        }else
		        	json = FileHelper.readFile(this.getConfig().getCurrentBaseServerPahtXsl(ac) + "/", ac.getPage() + ".json");
			}
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}
	
	private String getJsonFromHttp(String resourcePath, String contextName, String externalContextName) {
		String json = "";
		String url = ApplicationManager.requestUrl(Igrp.getInstance().getRequest());
		url = url.replace(Igrp.getInstance().getRequest().getRequestURI(), String.format("/%s/%s", externalContextName,resourcePath));
	
		System.out.println("getJsonFromHttp: " + url);
		Client client = ClientBuilder.newClient(); 
		try {
			WebTarget webTarget = client.target(url);
			jakarta.ws.rs.core.Response response  = webTarget.request().get(); 
			json = response.readEntity(String.class);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			client.close();
		}
		return json;
	}

	public Response actionFileExists() {
		final String fileName = Core.getParam("uri").replace("\\", File.separator);
		final Properties p = new Properties();
		final boolean fileExists = FileHelper.fileExists(basePath + fileName);
		p.put("status", fileExists);
		p.put("content", fileExists ? FileHelper.readFile(basePath, fileName) : "");
		p.put("filename", fileName);
		this.format = Response.FORMAT_JSON;
		return this.renderView(Core.toJson(p));
	}

	public Response actionGenerateLink() throws IllegalArgumentException {

		final int app_id = Core.getParamInt("p_env_fk");
		final String page = Core.getParam("p_page");
		final Application app = Core.findApplicationById(app_id);
		final String dad = Core.isNotNull(app) ? app.getDad() : Strings.EMPTY;
		final String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();

		final String publicLink = Core.isNotNull(app) ? baseUrl + "?r=" + dad + "/" + page + "/index&dad=" + dad + "&target=_blank&isPublic=1&lang=pt_PT" : Strings.EMPTY;
		final String encryptedLink = Core.isNotNull(app) ? baseUrl.replace("webapps", "") + Route.getResolveUrl(dad, page, "index", dad, 2).replace(" ", "+") : Strings.EMPTY;

		final XMLWritter xml = new XMLWritter();
		xml.startElement("content");
		xml.setElement("public_link", publicLink);
		xml.setElement("public_link_desc", publicLink);
		xml.setElement("public_link_2", encryptedLink);
		xml.setElement("public_link_desc_2", encryptedLink);
		xml.endElement();

		this.format = Response.FORMAT_XML;
		return this.renderView(xml.toString());
	}
	
	final String basePath = this.getConfig().basePathServer() + "images" + File.separator + "IGRP" + File.separator
			+ "IGRP2.3" + File.separator + "core" + File.separator + "formgen" + File.separator + "types"
			+ File.separator;
	
	/*----#end-code----*/
}
