/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
/*---- Import your packages here... ----*/

import java.io.IOException;

/*import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;
*/

import java.util.List;
import nosi.base.ActiveRecord.PersistenceUtils;
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
import nosi.webapps.igrp.dao.User;

/*---- End ----*/
public class EnvController extends Controller {		

	public Response actionIndex() throws IOException{
		Env model = new Env();
		EnvView view = new EnvView(model);
		view.action_fk.setValue(new Action().getListActions());
		view.img_src.setValue("default.png");
		return this.renderView(view);
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			
			model.load();
			Application app = new Application();		
			Action ac = new Action();
			ac.setId(model.getAction_fk());
//			app.setAction_fk(model.getAction_fk());
//			app.setApache_dad(model.getApache_dad());
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());
//			app.setFlg_external(model.getFlg_external());
//			app.setFlg_old(model.getFlg_old());
			app.setUrl(model.getHost());
			app.setExternal(model.getFlg_external());
			app.setImg_src(model.getImg_src());
//			app.setLink_center(model.getLink_center());
//			app.setLink_menu(model.getLink_menu());
			app.setName(model.getName());
			app.setStatus(model.getStatus());
//			app.setTemplates(model.getTemplates());
			app = app.insert();
			if(app!=null){
				FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				FileHelper.save(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				CompilerHelper.compile(Config.getBasePathClass()+"/"+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java");
				Igrp.getInstance().getFlashMessage().addMessage("success", "Aplicação registada com sucesso!");
				User user = new User();
				user = user.findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
				Organization org = new Organization();				
				org.setCode("org." + model.getDad());
				org.setName("org." + model.getName());
				org.setUser(user);
				org.setApplication(app);
				org.setStatus(1);
				org = org.insert();
				if(org!=null){	
					ProfileType proty = new ProfileType();			
					proty.setCode("Admin." + org.getName());
					proty.setDescr("PefilAdmin.default " + org.getName());
					proty.setOrganization(org);
					proty.setApplication(app);
					proty.setStatus(1);		
					proty = proty.insert();
					if(proty==null){
						Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar o perfil !");
					}					
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar a Orgânica!");
				}
				
				if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
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
//	
//	//App list I have access to
	public Response actionMyApps() throws IOException{
		Igrp.getInstance().getResponse().setContentType("text/xml");
		Igrp.getInstance().getResponse().getWriter().append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		List<Object[]> myApp = new Application().getMyApp();
		List<Object[]> otherApp = new Application().getOtherApp();
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("applications");
		if(myApp.size()>0){
			xml_menu.setElement("title", "Minhas Aplicações");
		}
		if(otherApp.size()>0){
			xml_menu.setElement("subtitle", "Outras Aplicações");
		}
		xml_menu.setElement("link_img", Config.getLinkImg());
		int i=1;
		for(Object[] obj:myApp){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			String page = "/default-page/index&amp;title="+obj[3].toString();
			if(obj[6]!=null){
				Action ac = new Action();
				ac = ac.findOne(Integer.parseInt(obj[6].toString()));
				page = (ac!=null && ac.getPage()!=null)?ac.getPage()+"/"+ac.getAction():page;
				page = "/"+page;
			}
			xml_menu.setElement("link", "webapps?r=igrp/env/openApp&amp;app="+obj[1].toString().toLowerCase()+"&amp;page="+page);
			xml_menu.setElement("img", obj[3].toString());
			xml_menu.setElement("title", obj[4].toString());
			xml_menu.setElement("num_alert", ""+i);
			xml_menu.endElement();
			i++;
		}
		for(Object[] obj:otherApp){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "no");
			xml_menu.setElement("link", "");
			xml_menu.setElement("img", obj[3].toString());
			xml_menu.setElement("title",obj[4].toString() );
			xml_menu.setElement("num_alert", "");
			xml_menu.endElement();
		}
		xml_menu.endElement();
		
		Response response = new Response();
		response.setCharacterEncoding(Response.CHARSET_UTF_8);
		response.setContentType(Response.FORMAT_XML);
		response.setContent(xml_menu + "");
		response.setType(1);
		
		return response;
	}
	
	public Response actionEditar(@RParam(rParamName = "id") String idAplicacao) throws IllegalArgumentException, IllegalAccessException, IOException{
		Env model = new Env();		
		Application aplica_db = new Application();
		aplica_db = aplica_db.findOne(Integer.parseInt(idAplicacao));
		model.setDad(aplica_db.getDad()); // field dad is the same a Schema
		model.setName(aplica_db.getName());
		model.setDescription(aplica_db.getDescription());
		model.setFlg_external(aplica_db.getExternal());
		model.setHost(aplica_db.getUrl());
		if(aplica_db.getAction()!=null){
			model.setAction_fk(aplica_db.getAction().getId());
		}
//		model.setApache_dad(aplica_db.getApache_dad());
//		model.setFlg_external(aplica_db.getFlg_external());
		model.setImg_src(aplica_db.getImg_src());
		model.setStatus(aplica_db.getStatus());
//		model.setFlg_old(aplica_db.getFlg_old());
//		model.setLink_center(aplica_db.getLink_center());
//		model.setLink_menu(aplica_db.getLink_menu());
//		model.setTemplates(aplica_db.getTemplates());
//		model.setHost(aplica_db.getHost());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			aplica_db.setDad(model.getDad());
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());
			aplica_db.setUrl(model.getHost());
			aplica_db.setExternal(model.getFlg_external());
			
			aplica_db.setDescription(model.getDescription());
			Action ac = new Action().findOne(model.getAction_fk());
			aplica_db.setAction(ac);
			aplica_db.setStatus(model.getStatus());
//			aplica_db.setFlg_old(model.getFlg_old());
//			aplica_db.setLink_menu(model.getLink_menu());
//			aplica_db.setLink_center(model.getLink_center());
//			aplica_db.setApache_dad(model.getApache_dad());
//			aplica_db.setTemplates(model.getTemplates());
//			aplica_db.setHost(model.getHost());
//			aplica_db.setFlg_external(model.getFlg_external());			
			aplica_db = aplica_db.update();
			if(aplica_db!=null){
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
		PersistenceUtils.confiOtherConnections(app);
		Permission.changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta
		String[] p = page.split("/");
		return this.redirect(app, p[1], p[2]);
	}
}
