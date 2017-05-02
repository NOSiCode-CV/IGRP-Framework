/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Menu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;


public class PesquisarMenuController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarMenu model = new PesquisarMenu();
		PesquisarMenuView view = new PesquisarMenuView(model);
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
}
