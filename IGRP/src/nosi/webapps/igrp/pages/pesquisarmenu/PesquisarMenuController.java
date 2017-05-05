/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;


public class PesquisarMenuController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		PesquisarMenu model = new PesquisarMenu();
		
		Menu menu_db = new Menu();
		
		//condiccao para pesquisar com filtro
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			menu_db.setEnv_fk(model.getAplicacao());
			Organization objOrg = new Organization();
			objOrg.setId(model.getOrganica());
			menu_db.setOrganica(objOrg);
			menu_db.setId(model.getMenu_principal());
		}
		
		ArrayList<PesquisarMenu.Table_1> lista = new ArrayList<>();
		
		//Preenchendo a tabela
		for(Object ob:menu_db.getAllPisquisarMenu()){
			Menu menu_db1 = (Menu)ob;
			PesquisarMenu.Table_1 table1 = new PesquisarMenu().new Table_1();
			table1.setDescricao(menu_db1.getCode());//aqui entra os valores do menu Principal com flg_base = 1
			table1.setTitulo(menu_db1.getDescr());//aqui fica os subMenus do menu_principal com flg_base = 0
			table1.setPagina(menu_db1.getAction().getPage());
			table1.setAtivo(menu_db1.getStatus());
			lista.add(table1);
		}
		
		PesquisarMenuView view = new PesquisarMenuView(model);
		
		//Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);
		HashMap<String,String> organizations =  new Organization().getListApps();
		view.organica.setValue(organizations);
		HashMap<Integer, String> menu_principal = menu_db.getListPrincipalMenus();
		view.menu_principal.setValue(menu_principal);
		
		//Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);		
		view.table_1.addData(lista);
		this.renderView(view);
	}
	
	//Menu list I have access to
	public PrintWriter actionMyMenu() throws IOException{
		Igrp.getInstance().getResponse().setContentType("text/xml");
		Igrp.getInstance().getResponse().getWriter().append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("menus");
		HashMap<String,String> menus = new HashMap<>();
		for(Object obj:new Menu().getMyMenu()){
			Menu m = (Menu) obj;
			XMLWritter xml = new XMLWritter();
			xml.startElement("submenu");
			xml.writeAttribute("title", m.getDescr());
			xml.writeAttribute("id",""+m.getSelf_id());
			xml.setElement("link", "webapps?r="+m.getLink());
			xml.setElement("title", m.getDescr());
			xml.setElement("target", m.getTarget());
			xml.setElement("id",""+ m.getSelf_id());
			xml.setElement("status",""+ m.getStatus());
			xml.endElement();
			if(menus.get(m.getCode()+":::"+m.getId())!=null){
				xml.addXml(menus.get(m.getCode()+":::"+m.getId()).toString());
			}
			menus.put(m.getCode()+":::"+m.getId(),xml.toString());
		}
		for(Entry<String, String> m:menus.entrySet()){
			xml_menu.startElement("menu");
			xml_menu.setElement("title", m.getKey().substring(0,m.getKey().toString().indexOf(":::")));
			xml_menu.addXml(m.getValue());
			xml_menu.endElement();
		}
		xml_menu.endElement();
		return Igrp.getInstance().getResponse().getWriter().append(xml_menu.toString());
	}
	public void actionEliminar() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		Menu menu_db = new Menu();
		menu_db.setId(Integer.parseInt(id));
		if(menu_db.delete())
			Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		this.redirect("igrp","pesquisar-menu","index");
	}
}
