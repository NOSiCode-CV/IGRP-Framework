/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
import java.io.IOException;
/*import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;
*/
import java.io.PrintWriter;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;

public class EnvController extends Controller {		

	public Response actionIndex() throws IOException{
		Env model = new Env();
		EnvView view = new EnvView(model);
		view.action_fk.setValue(new Action().getListActions());
		return this.renderView(view);
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
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
			
			if(app.insert() && FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages") && FileHelper.save(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName())) && CompilerHelper.compile(Config.getBasePathClass()+"/"+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java")){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Aplicação registada com sucesso!");
				app = (Application) app.getOne();
				
				Organization org = new Organization();
				ProfileType proty = new ProfileType();
				
				org.setCode("org." + model.getDad());
				org.setName("org." + model.getName());
				org.setEnv_fk(app.getId());
				org.setStatus(1);
				
				if(org.insert()){
					Igrp.getInstance().getFlashMessage().addMessage("success", "Orgânica registada com sucesso!");
					org = (Organization) org.getOne();
					
					proty.setCode("Admin." + org.getName());
					proty.setDescr("PefilAdmin.default " + org.getName());
					proty.setEnv_fk(app.getId());
					proty.setOrg_fk(org.getId());
					proty.setStatus(1);
					
					if(proty.insert()){
						Igrp.getInstance().getFlashMessage().addMessage("success", "Perfil registado com sucesso!");
					}else{
						Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar o perfil !");
					}
					
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar a Orgânica!");
				}
				
				
				if(FileHelper.fileExists(Config.getProject_loc()) && FileHelper.createDiretory(Config.getProject_loc()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getProject_loc()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				}
				
				return this.redirect("igrp", "lista-env","index");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar a aplicação!");
			}
		}
		return this.redirect("igrp", "env", "index");
	}
	
	public Response actionVoltar() throws IOException{
		return this.redirect("igrp", "lista-env","index");
	}
	
	//App list I have access to
	public PrintWriter actionMyApps() throws IOException{
		Igrp.getInstance().getResponse().setContentType("text/xml");
		Igrp.getInstance().getResponse().getWriter().append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		Object[] myApp = new Application().getMyApp();
		Object[] otherApp = new Application().getOtherApp();
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("applications");
		if(myApp.length>0){
			xml_menu.setElement("title", "Minhas Aplicações");
		}
		if(otherApp.length>0){
			xml_menu.setElement("subtitle", "Outras Aplicações");
		}
		xml_menu.setElement("link_img", Config.getLinkImg());
		int i=1;
		for(Object obj:myApp){
			Application app = (Application) obj;
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			String page = "/default-page/index&amp;title="+app.getName();
			if(app.getAction_fk()!=0){
				Action ac = new Action();
				ac.setId(app.getAction_fk());
				ac = (Action) ac.getOne();
				page = (ac!=null && ac.getPage()!=null)?ac.getPage()+"/"+ac.getAction():page;
				page = "/"+page;
			}
			xml_menu.setElement("link", "webapps?r=igrp/env/openApp&amp;app="+app.getDad().toLowerCase()+"&amp;page="+page);
			xml_menu.setElement("img", app.getImg_src());
			xml_menu.setElement("title", app.getName());
			xml_menu.setElement("num_alert", ""+i);
			xml_menu.endElement();
			i++;
		}
		for(Object obj:otherApp){
			Application app = (Application) obj;
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "no");
			xml_menu.setElement("link", "");
			xml_menu.setElement("img", app.getImg_src());
			xml_menu.setElement("title", app.getName());
			xml_menu.setElement("num_alert", "");
			xml_menu.endElement();
		}
		xml_menu.endElement();
		return Igrp.getInstance().getResponse().getWriter().append(xml_menu.toString());
	}
	
	
	public Response actionEditar(@RParam(rParamName = "id") String idAplicacao) throws IllegalArgumentException, IllegalAccessException, IOException{
		Env model = new Env();		
		Application aplica_db = new Application();
		aplica_db.setId(Integer.parseInt(idAplicacao));
		aplica_db = (Application) aplica_db.getOne();		
		model.setDad(aplica_db.getDad()); // field dad is the same a Schema
		model.setName(aplica_db.getName());
		model.setDescription(aplica_db.getDescription());
		model.setAction_fk(aplica_db.getAction_fk());
		model.setApache_dad(aplica_db.getApache_dad());
		model.setFlg_external(aplica_db.getFlg_external());
		model.setImg_src(aplica_db.getImg_src());
		model.setStatus(aplica_db.getStatus());
		model.setFlg_old(aplica_db.getFlg_old());
		model.setLink_center(aplica_db.getLink_center());
		model.setLink_menu(aplica_db.getLink_menu());
		model.setTemplates(aplica_db.getTemplates());
		model.setHost(aplica_db.getHost());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			aplica_db.setDad(model.getDad());
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());
			aplica_db.setDescription(model.getDescription());
			aplica_db.setAction_fk(model.getAction_fk());
			aplica_db.setStatus(model.getStatus());
			aplica_db.setFlg_old(model.getFlg_old());
			aplica_db.setLink_menu(model.getLink_menu());
			aplica_db.setLink_center(model.getLink_center());
			aplica_db.setApache_dad(model.getApache_dad());
			aplica_db.setTemplates(model.getTemplates());
			aplica_db.setHost(model.getHost());
			aplica_db.setFlg_external(model.getFlg_external());			
			if(aplica_db.update()){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Aplicação Actualizada com sucesso!!");
				return this.redirect("igrp", "lista-env", "index");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorre um Erro ao tentar Actualizar a Aplicação!!");
			}
		}	
		EnvView view = new EnvView(model);
		view.sectionheader_1_text.setValue("Gestão de Aplicação - Actualizar");
		view.btn_gravar.setLink("editar&id=" + idAplicacao);
		view.action_fk.setValue(new Action().getListActions());
		return this.renderView(view);
	}
	
	
	public Response actionOpenApp(@RParam(rParamName = "app") String app,@RParam(rParamName = "page") String page) throws IOException{
		Permission.changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta
		String[] p = page.split("/");
		return this.redirect(app, p[1], p[2]);
	}
}







