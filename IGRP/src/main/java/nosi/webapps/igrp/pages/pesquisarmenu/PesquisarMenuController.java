
package nosi.webapps.igrp.pages.pesquisarmenu;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import nosi.core.gui.components.IGRPTopMenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/



public class PesquisarMenuController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		PesquisarMenu model = new PesquisarMenu();
		PesquisarMenuView view = new PesquisarMenuView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query("SELECT 't1_menu_principal' as t1_menu_principal,'ativo' as ativo,'table_titulo' as table_titulo,'pagina' as pagina,'checkbox' as checkbox,'id' as id "));
		
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */
		
		/*----#start-code(index)----*/

		Menu menu = new Menu();
		int idApp = 0;
		int idOrg = 0;
		// int idMen = 0;

		if (Core.isInt(Core.getParam("id_app"))) {
			idApp = Core.getParamInt("id_app");
			model.setAplicacao("" + idApp);
		}		

		// If in a app, choose automatically the app in the combobox
		String dad = new Permission().getCurrentEnv();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			idApp = (new Application().find().andWhere("dad", "=", dad).one()).getId();
			model.setAplicacao("" + idApp);
		}	

		// When onChange, it's always a post
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			idApp = Core.isInt(model.getAplicacao()) ? Integer.parseInt(model.getAplicacao()) : 0;
		}
		menu.setApplication(idApp != 0 ? new Application().findOne(idApp) : null);
		List<Menu> menus = null;

		if (idOrg == 0 && idApp!=0) {
			if ("igrp".equalsIgnoreCase(dad)) {
				menus = menu.find().andWhere("application", "=", idApp != 0 ? idApp : null).all();
			} else {
				menus = menu.find().andWhere("application.id", "=", idApp)
						.andWhere("application", "<>", 1)// Oculta IGRP Core
						.andWhere("application", "<>", 2)// Oculta IGRP Tutorial
						.andWhere("application", "<>", 3)// Oculta IGRP Studio
						.all();
			}	
			
			ArrayList<PesquisarMenu.Table_1> lista = new ArrayList<>();
			// Preenchendo a tabela
			for (Menu menu_db1 : menus) {
				PesquisarMenu.Table_1 table1 = new PesquisarMenu.Table_1();
				if (menu_db1.getMenu() != null) {
					table1.setT1_menu_principal(menu_db1.getMenu().getDescr());
				} else {
					table1.setT1_menu_principal(menu_db1.getDescr());
				}
				if (menu_db1.getAction() != null) {
					table1.setPagina(menu_db1.getAction().getPage_descr());
					table1.setTable_titulo(menu_db1.getDescr());
				}

				table1.setAtivo(menu_db1.getStatus());
				table1.setAtivo_check(menu_db1.getStatus() == 1 ? menu_db1.getStatus() : -1);
				table1.setCheckbox(menu_db1.getId());
				table1.setP_id("" + menu_db1.getId());
				if (menu_db1.getFlg_base() == 1) {
					table1.setCheckbox_check(menu_db1.getId());
				}
				lista.add(table1);
			}
					
			view.table_1.addData(lista);
		} 
//		else {
//			menus = menu.searchMen();
//		}
	
		// Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
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
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","NovoMenu","index");
		}
		
		----#gen-example */
		
		/*----#start-code(btn_novo)----*/
		this.addQueryString("app",model.getAplicacao());
				/*----#end-code----*/
		
		return this.redirect("igrp","NovoMenu","index", this.queryString());
		
	}
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","NovoMenu","index");
		}
		
		----#gen-example */
		
		/*----#start-code(editar)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (Core.isNotNull(id)) {
			return this.forward("igrp", "NovoMenu", "index&p_id=" + id);
		}
 	
		/*----#end-code----*/
		
		return this.redirect("igrp","NovoMenu","index", this.queryString());
		
	}
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		PesquisarMenu model = new PesquisarMenu();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","PesquisarMenu","index");
		}
		
		----#gen-example */
		
		/*----#start-code(eliminar)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		Menu menu_db = new Menu();
		if (menu_db.delete(Integer.parseInt(id)))
			Core.setMessageSuccess();
		else
			Core.setMessageError();
 	
		/*----#end-code----*/
		
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());
		
	}
	
	/*----#start-code(custom_actions)----*/

	// Menu list I have access to
	public Response actionMyMenu() throws IOException {
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("menus");
		if (Igrp.getInstance().getUser().isAuthenticated()) {
			Menu x = new Menu();
			HashMap<String, List<Menu>> menu = x.getMyMenu();
			if (menu != null) {
				for (Entry<String, List<Menu>> m : menu.entrySet()) {
					xml_menu.startElement("menu");
					xml_menu.setElement("title", gt(m.getKey()));
					// If the Parent menu id is equal to the submenu id, so merge the 2 and use link
					Menu link1Menu = (Menu) m.getValue().get(0);

					if (link1Menu.getMenu() != null) {

						if (link1Menu.getId() == link1Menu.getMenu().getId()) {
							xml_menu.setElement("link",
									"webapps?r=" + EncrypDecrypt.encrypt(link1Menu.getMenu().getLink()));
							xml_menu.setElement("order", "" + link1Menu.getMenu().getOrderby());
						} else
							xml_menu.setElement("order", "" + link1Menu.getMenu().getOrderby());

					} else
						xml_menu.setElement("order", "" + link1Menu.getMenu().getOrderby());

					for (Menu main : m.getValue()) {
						if (main.getMenu() != null) {
							xml_menu.startElement("submenu");
							xml_menu.writeAttribute("title", gt(main.getMenu().getDescr()));
							xml_menu.writeAttribute("id", "" + main.getMenu().getId());
							xml_menu.setElement("link", "webapps?r=" + EncrypDecrypt.encrypt(main.getMenu().getLink()));
							xml_menu.setElement("title", gt(main.getMenu().getDescr()));
							xml_menu.setElement("target", main.getMenu().getTarget());
							xml_menu.setElement("id", "" + main.getMenu().getId());
							xml_menu.setElement("status", "" + main.getMenu().getStatus());
							xml_menu.setElement("order", "" + main.getMenu().getOrderby());
							xml_menu.endElement();
						}
					}
					xml_menu.endElement();
				}
			}
		}
		xml_menu.endElement();
		return this.renderView(xml_menu + "");
	}

	// Get Top Menu
	public Response actionTopMenu() throws IOException {
		IGRPTopMenu topMenu = new IGRPTopMenu("top_menu");
		topMenu.addItem("Home", "igrp", "DefaultPage", "index", "_self", "home.png", "webapps?r=");
		topMenu.addItem("Settings", "igrp", "Settings", "index", "_self", "settings.png", "webapps?r=");
		topMenu.addItem("Mapa Processos", "igrp", "MapaProcesso", "index", "_self", "process.png", "webapps?r=");
		topMenu.addItem("Tarefas", "igrp", "ExecucaoTarefas", "index", "_self", "tasks.png", "webapps?r=");
		return this.renderView(topMenu.toString());
	}

	public Response actionChangeStatus()
			throws IOException, IllegalArgumentException, IllegalAccessException, JSONException {

		this.format = Response.FORMAT_JSON;
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		String status = Igrp.getInstance().getRequest().getParameter("p_status");
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
		Gson res = new Gson();
		res.toJson(json);

		return this.renderView(json.toString());
	}
	/*----#end-code----*/
	
	
	
	
}
