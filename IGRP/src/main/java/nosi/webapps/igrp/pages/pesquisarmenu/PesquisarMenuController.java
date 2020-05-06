package nosi.webapps.igrp.pages.pesquisarmenu;

import nosi.core.webapp.Controller;

import java.io.IOException;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/
import nosi.core.webapp.activit.rest.business.ProcessInstanceIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;
import java.util.Map.Entry;
import javax.servlet.http.Cookie;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;

import nosi.core.config.ConfigApp;
import nosi.core.gui.components.IGRPTopMenu;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Menu.MenuProfile;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;

import static nosi.core.i18n.Translator.gt; 
/*----#end-code----*/
		
public class PesquisarMenuController extends Controller { 
	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		PesquisarMenuView view = new PesquisarMenuView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Sit anim consectetur sed elit doloremque accusantium doloremque stract ipsum natus accusantium strac' as t1_menu_principal,'1' as ativo,'1' as ordem,'Anim natus unde sed iste lorem omnis lorem sit ut voluptatem elit laudantium consectetur omnis rem m' as table_titulo,'Voluptatem lorem doloremque voluptatem aperiam voluptatem laudantium ut aperiam deserunt omnis volup' as pagina,'1' as checkbox,'hidden-5145_d428' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		//model.setLink_doc(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=menu"));
		
		Menu menu = new Menu();
		int idApp = Core.getParamInt("p_id_app");
		int idOrg = 0;
		// int idMen = 0; 
		// If in a app, choose automatically the app in the combobox 
		String dad = Core.getCurrentDad();

		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			idApp = Core.findApplicationByDad(dad).getId();
			view.aplicacao.propertie().add("disabled", "true");
		} else {
			idApp = Core.toInt(model.getAplicacao());
		}

		if (idApp != 0) {
			model.setAplicacao("" + idApp);
			Core.setAttribute("p_aplicacao", "" + idApp);
			view.btn_btn_novo.addParameter("p_aplicacao", idApp);
		}

		model.setId_app(idApp);
		menu.setApplication(idApp != 0 ? new Application().findOne(idApp) : null);
		List<Menu> menus = null;

		if (idOrg == 0 && idApp != 0) {
			if (Core.getCurrentUser().getEmail().compareTo("igrpweb@nosi.cv") == 0) {// User master
				menus = menu.find().andWhere("application.id", "=", idApp).all();
			} else {
				menus = menu.find().andWhere("application.id", "=", idApp).andWhere("application", "<>", 1)// Oculta
																											// IGRP Core
						.andWhere("application", "<>", 2)// Oculta IGRP Tutorial
						.andWhere("application", "<>", 3)// Oculta IGRP Studio
						.all();
			}

			Collections.sort(menus, new SortbyStatus());

			ArrayList<PesquisarMenu.Table_1> lista = new ArrayList<>();
			// Preenchendo a tabela
			for (Menu menu_db1 : menus) {
				PesquisarMenu.Table_1 table1 = new PesquisarMenu.Table_1();
				table1.setT1_menu_principal("-");
				if (Core.isNull(menu_db1.getMenu())) {
					table1.setT1_menu_principal(menu_db1.getDescr());
				} else if (menu_db1.getMenu().getId() != menu_db1.getId()) {
					table1.setT1_menu_principal(menu_db1.getMenu().getDescr());
				}
				if (menu_db1.getAction() != null) {
					String mdad = "";
					if (menu_db1.getAction().getApplication().getId() != idApp)
						mdad = menu_db1.getAction().getApplication().getDad() + " / ";
					table1.setPagina(mdad+gt(menu_db1.getAction().getPage_descr()) + " (" + menu_db1.getAction().getPage()
							+ ")" );
					table1.setTable_titulo(gt(menu_db1.getDescr()));
				}
				table1.setOrdem(menu_db1.getOrderby());
				table1.setAtivo(menu_db1.getStatus());
				table1.setAtivo_check(menu_db1.getStatus() == 1 ? menu_db1.getStatus() : -1);
				table1.setCheckbox(menu_db1.getId());
				table1.setId("" + menu_db1.getId());
				if (menu_db1.getFlg_base() == 1) {
					table1.setCheckbox_check(menu_db1.getId());
				}
				lista.add(table1);
			}
			if (!lista.isEmpty())
				lista.sort(Comparator.comparing(PesquisarMenu.Table_1::getT1_menu_principal));
			view.table_1.addData(lista);
		}
		
		// Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		view.aplicacao.setValue(new Application().getListApps());
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionBtn_novo() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(btn_novo)----*/
		this.addQueryString("p_app", Core.getParam("p_aplicacao"));
		return this.redirect("igrp", "NovoMenu", "index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","PesquisarMenu","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(editar)----*/
		String id = Core.getParam("p_id");
		if (Core.isNotNull(id)) {
			this.addQueryString("p_id", id);
			return this.redirect("igrp", "NovoMenu", "index", this.queryString());
		}

		/*----#end-code----*/
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","PesquisarMenu","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(eliminar)----*/
		int id = Core.getParamInt("p_id");
		Menu menu_db = new Menu();
		if (Core.isNotNullOrZero(id)) {
			if (menu_db.delete(id))
				Core.setMessageSuccess();
			else
				Core.setMessageError();
		}
		return this.redirect("igrp", "PesquisarMenu", "index", model, this.queryString());
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/

	// Menu list I have access to 
	public Response actionMyMenu() throws IOException { 
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("menus");
		if (Igrp.getInstance().getUser().isAuthenticated()) {
			Menu x = new Menu();
			LinkedHashMap<String, List<MenuProfile>> menu = x.getMyMenu();
			if (menu != null) {
				for (Entry<String, List<MenuProfile>> m : menu.entrySet()) {
					xml_menu.startElement("menu");
					xml_menu.setElement("title", gt(m.getKey()));
					
					for (MenuProfile main : m.getValue()) {
						if (main.isSubMenuAndSuperMenu()) {
							
							if(main.getType() == 2) { // Fazer sso obrigatorio 
								xml_menu.setElement("link", main.getLink()); 
							}else {
								xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
							}
							
							xml_menu.setElement("target", main.getTarget());
						}
						xml_menu.setElement("order", "" + main.getOrder());
						xml_menu.startElement("submenu");
						xml_menu.writeAttribute("title", gt(main.getTitle()));
						xml_menu.writeAttribute("id", "" + main.getId());
						
						if(main.getType() == 2) { // Fazer sso obrigatorio 
							xml_menu.setElement("link", main.getLink()); 
						}else {
							xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
						}
						
						xml_menu.setElement("title", gt(main.getTitle()));
						xml_menu.setElement("target", main.getTarget());
						xml_menu.setElement("id", "" + main.getId());
						xml_menu.setElement("status", "" + main.getStatus());
						xml_menu.setElement("order", "" + main.getOrder());
						xml_menu.endElement();
					}
					xml_menu.endElement();
				}
			}
		}
		
		displayMenusPlSql(xml_menu); 
		
		xml_menu.endElement();
		this.format = Response.FORMAT_XML;
		return this.renderView(xml_menu.toString());
	}
	
	private void displayMenusPlSql(XMLWritter xml_menu) {
		List<IgrpPLSQLMenu> menus = getAllMyMenusFromPlSql();
		if(menus != null && !menus.isEmpty()) {
			
			xml_menu.startElement("menu");
			xml_menu.setElement("title", "IGRP-PLSQL SSO");
			xml_menu.setElement("order", "99");
			xml_menu.setElement("id", "2020");
			xml_menu.setElement("status", "1");
			
			for(IgrpPLSQLMenu m : menus) {
				if(m.getSelf_id() == null || m.getSelf_id().isEmpty()) {
					boolean hasChild = false;
					xml_menu.startElement("submenu");
					xml_menu.setElement("title", gt(m.getTitle()));
					xml_menu.setElement("target", m.getArea());
					xml_menu.setElement("id", "" + m.getId());
					xml_menu.setElement("status", "" + m.getEstado());
					xml_menu.setElement("order", "99");
					for(IgrpPLSQLMenu submenu : menus) {
						if(submenu.getSelf_id() != null && m.getId() != null && submenu.getSelf_id().equalsIgnoreCase(m.getId())) {
							xml_menu.startElement("submenu");
							xml_menu.writeAttribute("title", gt(submenu.getTitle()));
							xml_menu.writeAttribute("id", "" + submenu.getId());
							xml_menu.setElement("title", gt(submenu.getTitle()));
							xml_menu.setElement("target", submenu.getArea());
							xml_menu.setElement("id", "" + submenu.getId());
							xml_menu.setElement("status", "" + submenu.getEstado());
							xml_menu.setElement("order", "99");
							xml_menu.setElement("link", "" + submenu.getUrl()); 
							xml_menu.endElement();
							hasChild = true;
						}
					}
					if(!hasChild)
						xml_menu.setElement("link", "" + m.getUrl()); 
					xml_menu.endElement();
				}
			}
			
			xml_menu.endElement();
			
		}
	}

	// Get Top Menu 
	public Response actionTopMenu() throws IOException {
		boolean isStartProc = ProcessInstanceIGRP.isStartPermission();
		boolean isTask = TaskServiceIGRP.isTaskPermission();
		IGRPTopMenu topMenu = new IGRPTopMenu("top_menu");
		String dad = Core.getParam("dad");
		if (!(dad.compareTo("igrp") == 0)) {
			Application app = Core.getCurrentApp();
			String page = "tutorial/DefaultPage/index&title=" + app.getName();
			if (app.getAction() != null) {
				page = app.getAction().getApplication().getDad().toLowerCase() + "/" + app.getAction().getPage() + "/"
						+ app.getAction().getAction();
			}
			topMenu.addItem("Home", "igrp_studio", "env", "openApp" + "&app=" + dad + "&page=" + page, "_self",
					"home.png", "webapps?r=");
		} else {
			topMenu.addItem("Home", "igrp", "DefaultPage", "index", "_self", "home.png", "webapps?r=");
		}
		String flag = "english_flag.png";
		for (Cookie cookie : Igrp.getInstance().getRequest().getCookies()) {
			if (cookie.getName().equals("igrp_lang")) {
				switch (cookie.getValue()) {
				case "pt_PT":
					flag = "portuguese_flag.png";
					break;
				case "es_ES":
					flag = "spanish_flag.png";
					break;
				case "fr_FR":
					flag = "french_flag.png";
					break;
				}
			}
		}

		topMenu.addItem("Settings", "igrp", "Settings", "index", "modal", flag, "webapps?r=");
		if (isStartProc) {
			topMenu.addItem("Mapa Processos", "igrp", "Dash_board_processo", "index", "_self", "process.png",
					"webapps?r=");
		}
		if (isTask) {
			topMenu.addItem("Tarefas", "igrp", "ExecucaoTarefas", "index", "_self", "tasks.png", "webapps?r=");
		}
		this.format = Response.FORMAT_XML;
		return this.renderView(topMenu.toString());
	}

	public Response actionChangeStatus()
			throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;
		String id = Core.getParam("p_id");
		String status = Core.getParam("p_status");
		boolean response = false;
		if (Core.isNotNull(id)) {
			Menu menu = new Menu().findOne(Integer.parseInt(id));
			if (menu != null) {
				menu.setStatus(Integer.parseInt(status));
				if (menu.update() != null)
					response = true;
			}
		}
		JSONObject json = new JSONObject();
		json.put("status", response);
		return this.renderView(json.toString());
	}

	class SortbyStatus implements Comparator<Menu> {
		public int compare(Menu a, Menu b) {
			return b.getStatus() - a.getStatus();
		}
	} 
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	
	public static class IgrpPLSQLMenu implements Serializable{ 
		
		private String title;
		private String imgsrc; 
		private String url; 
		private String area;
		private String id;
		private String description;
		private String estado;
		private String self_id;
		
		public IgrpPLSQLMenu() {}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getImgsrc() {
			return imgsrc;
		}

		public void setImgsrc(String imgsrc) {
			this.imgsrc = imgsrc;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getArea() {
			return area;
		}

		public void setArea(String area) {
			this.area = area;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getEstado() {
			return estado;
		}

		public void setEstado(String estado) {
			this.estado = estado;
		}

		public String getSelf_id() {
			return self_id;
		}

		public void setSelf_id(String self_id) {
			this.self_id = self_id;
		}
		
	}
	
	private List<IgrpPLSQLMenu> getAllMyMenusFromPlSql() { 
		List<IgrpPLSQLMenu> menus = new ArrayList<IgrpPLSQLMenu>();
		try {
		
			Properties properties =  ConfigApp.getInstance().loadConfig("common", "main.xml"); 
			String endpoint = properties.getProperty("igrp.plsql.mymenus.url"); 
			String token = properties.getProperty("igrp.plsql.mymenus.token"); 
			if(endpoint == null || endpoint.isEmpty() || token == null || token.isEmpty()) 
				throw new Exception("Invalid url ..."); 
			
			String appCode = ""; 
			String profCode = ""; 
			String orgCode = ""; 
			
			try {
				appCode = Core.getCurrentApp().getPlsql_code(); 
				profCode = new ProfileType().findOne(Core.getCurrentProfile()).getPlsql_code(); 
				orgCode = new Organization().findOne(Core.getCurrentOrganization()).getPlsql_code(); 
			} catch (Exception e) { 
				
			}
			
			endpoint += "?prof_code=" + profCode + "&org_code=" + orgCode + "&app_code=" + appCode; 
			
			Client client = ClientBuilder.newClient(); 
			WebTarget webTarget = client.target(endpoint); 
			Invocation.Builder invocationBuilder  = webTarget.request().header(HttpHeaders.AUTHORIZATION, token); 
			javax.ws.rs.core.Response response  = invocationBuilder.get(); 
			
			String json = response.readEntity(String.class); 
			
			client.close(); 
			
			JSONObject obj = new JSONObject(json); 
			JSONObject userAppMenus_t = obj.getJSONObject("Entries"); 
			if(userAppMenus_t != null && userAppMenus_t.has("Entry")) {
				JSONArray UserAppMenu_o = userAppMenus_t.getJSONArray("Entry"); 
				
				if(UserAppMenu_o != null) { 

					for(int i = 0; i < UserAppMenu_o.length(); i++) {
						try {
							JSONObject m = UserAppMenu_o.getJSONObject(i); 
							IgrpPLSQLMenu menu = new IgrpPLSQLMenu(); 
							
							menu.setId("" + m.getLong("id"));
							menu.setTitle("" + m.getString("title")); 
							menu.setArea("" + m.getString("area"));
							try {
								menu.setEstado("" + m.getInt("estado")); 
							} catch (Exception e) {
								menu.setEstado("0");
							}
							
							try {
								menu.setDescription("" + m.getString("description"));
							} catch (Exception e) {
								menu.setDescription(""); 
							}
							
							try {
								menu.setUrl("" + m.getString("link"));
							} catch (Exception e) {
								menu.setUrl("https://www.google.com/"); 
							}
							try {
								menu.setImgsrc("" + m.getString("imgsrc"));
							} catch (Exception e) {
								menu.setImgsrc("#");
							}
							try {
								menu.setSelf_id("" + m.getString("self_id"));
							} catch (Exception e) {
								menu.setSelf_id("");
							}
							
							menus.add(menu); 
							
						} catch (Exception e) {
							e.printStackTrace(); 
						}
					}
				}
			}
		
		}catch(Exception e) { 
			// e.printStackTrace(); 
		} 
		
		return menus;
	} 
	
	/*----#end-code----*/
}
