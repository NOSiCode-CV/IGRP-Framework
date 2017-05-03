/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;

import java.io.IOException;
/*import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;
*/
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;

public class EnvController extends Controller {		

	public void actionIndex() throws IOException{
		Env model = new Env();
		EnvView view = new EnvView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Application app = new Application();
			app.setAction_fk(model.getAction_fk());
			app.setApache_dad(model.getApache_dad());
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());
			app.setFlg_external(model.getFlg_external());
			app.setFlg_old(model.getFlg_old());
			app.setHost(model.getHost());
			app.setImg_src(model.getImg_src());
			app.setLink_center(model.getLink_center());
			app.setLink_menu(model.getLink_menu());
			app.setName(model.getName());
			app.setStatus(model.getStatus());
			app.setTemplates(model.getTemplates());
			if(app.insert()){
				System.out.println("saved");
				this.redirect("igrp", "lista-env","index");
			}else{
				System.err.println("failed");
			}
		}
		this.redirect("igrp", "env", "index");
	}
	
	public void actionEditar(){
		
	}
	
	public void actionVoltar() throws IOException{
		this.redirect("igrp", "lista-env","index");
	}
	
	//App list I have access to
	public PrintWriter actionMyApps() throws IOException{
		Igrp.getInstance().getResponse().setContentType("text/xml");
		Igrp.getInstance().getResponse().getWriter().append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("applications");
		xml_menu.setElement("title", "Milhas Aplicações");
		xml_menu.setElement("subtitle", "Outras Aplicações");
		xml_menu.setElement("link_img", Config.getLinkImg());
		int i=1;
		for(Object obj:new Application().getAll()){
			Application app = (Application) obj;
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			xml_menu.setElement("link", "webapps?r=igrp/page/defaultPage&amp;title="+app.getName());
			xml_menu.setElement("img", "app_casacidadao.png");
			xml_menu.setElement("title", app.getName());
			xml_menu.setElement("num_alert", ""+i);
			xml_menu.endElement();
			i++;
		}
		xml_menu.endElement();
		return Igrp.getInstance().getResponse().getWriter().append(xml_menu.toString());
	}
}
