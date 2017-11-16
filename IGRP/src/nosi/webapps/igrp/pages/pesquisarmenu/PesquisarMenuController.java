/*-------------------------*/

/*Create Controller*/
package nosi.webapps.igrp.pages.pesquisarmenu;
/*---- Import your packages here... ----*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import nosi.core.gui.components.IGRPTopMenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;

import static nosi.core.i18n.Translator.gt;
/*---- End ----*/
public class PesquisarMenuController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{		
		PesquisarMenu model = new PesquisarMenu();		
		Menu menu = new Menu();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			menu.setApplication(model.getAplicacao()!=0?new Application().findOne(model.getAplicacao()):null);
			menu.setOrganization(model.getOrganica()!=0?new Organization().findOne(model.getOrganica()):null);
			menu.setMenu(model.getMenu_principal()!=0?new Menu().findOne(model.getMenu_principal()):null);
		}
		List<Menu> menus= null;
		if(model.getOrganica()==0){
			menus = menu.find()
					   .andWhere("application", "=",model.getAplicacao()!=0? model.getAplicacao():null)
					   .andWhere("menu", "=", model.getMenu_principal()!=0? model.getMenu_principal():null)
					   .all();
		}else{
			menus = menu.searchMen();
		}	
		ArrayList<PesquisarMenu.Table_1> lista = new ArrayList<>();
		//Preenchendo a tabela
		for(Menu menu_db1:menus){
			PesquisarMenu.Table_1 table1 = new PesquisarMenu().new Table_1();
			if(menu_db1.getMenu()!=null){
				table1.setDescricao(menu_db1.getMenu().getDescr());
			}else{
				table1.setDescricao(menu_db1.getDescr());
			}
			if(menu_db1.getAction()!=null){
				table1.setPagina(menu_db1.getAction().getPage());
				table1.setTitulo(menu_db1.getDescr());
			}
			table1.setAtivo(menu_db1.getStatus()==1?"Ativo":"Inativo");
			table1.setCheckbox(menu_db1.getId());
			table1.setP_id(menu_db1.getId());
			if(menu_db1.getFlg_base()==1){
				table1.setCheckbox_check(menu_db1.getId());
			}
			lista.add(table1);
		}		
		PesquisarMenuView view = new PesquisarMenuView(model);		
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		view.aplicacao.setValue(new Application().getListApps());
		HashMap<String,String> organizations =  new Organization().getListOrganizations();
		view.organica.setValue(organizations);
		HashMap<Integer, String> menu_principal = new Menu().getListPrincipalMenus();
		view.menu_principal.setValue(menu_principal);

		//Para pegar os parametros que queremos enviar para poder editar o menu no view 
		view.p_id.setParam(true);
		view.title = "";
		view.table_1.addData(lista);
		return this.renderView(view);
	}
	
	
	//Menu list I have access to
	public Response actionMyMenu() throws IOException{
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("menus");
		if(Igrp.getInstance().getUser().isAuthenticated()){
			Menu x = new Menu();
			HashMap<String,List<Menu>> menu = x.getMyMenu();
			if(menu !=null){
				for(Entry<String, List<Menu>> m:menu.entrySet()){
					xml_menu.startElement("menu");
					xml_menu.setElement("title", gt(m.getKey()));
						for(Menu main:m.getValue()){
							if(main.getMenu()!=null){
								xml_menu.startElement("submenu");
								xml_menu.writeAttribute("title", gt(main.getMenu().getDescr()));
								xml_menu.writeAttribute("id",""+main.getMenu().getId());
								xml_menu.setElement("link", "webapps?r="+main.getMenu().getLink());
								xml_menu.setElement("title", gt(main.getMenu().getDescr()));
								xml_menu.setElement("target", main.getMenu().getTarget());
								xml_menu.setElement("id",""+main.getMenu().getId());
								xml_menu.setElement("status",""+ main.getMenu().getStatus());
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
	
	public Response actionMenu_base() throws IOException{
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			String[] menu = Igrp.getInstance().getRequest().getParameterValues("p_checkbox");
			boolean x = false;
			for(String m:menu){
				Menu main = new Menu().findOne(Integer.parseInt(m));
				if(main!=null){
					main.setFlg_base(1);main = main.update();
					x = true;
				}
			}
			if(x){
				Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
			}
		}
		return this.redirect("igrp","pesquisar-menu","index");
	}
	
	public Response actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		Menu menu_db = new Menu();
		if(menu_db.delete(Integer.parseInt(id)))
			Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
		else
			Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
		return this.redirect("igrp","pesquisar-menu","index");
	}
	
	//Get Top Menu
	public Response actionTopMenu() throws IOException{	
		IGRPTopMenu topMenu = new IGRPTopMenu("top_menu");
		topMenu.addItem("Home", "webapps?r=igrp", "home", "index", "_self", "home.png");
		topMenu.addItem("Settings", "webapps?r=igrp", "Settings", "index", "_self", "settings.png");
		topMenu.addItem("Mapa Processos", "webapps?r=igrp", "MapaProcesso", "index", "_self", "process.png");
		topMenu.addItem("Tarefas", "webapps?r=igrp", "ExecucaoTarefas", "index", "_self", "tasks.png");
		return this.renderView(topMenu.toString());
	}
}
