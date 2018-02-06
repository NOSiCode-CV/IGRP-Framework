package nosi.webapps.igrp_studio.pages.env;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.DataInputStream;

import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;
import nosi.core.webapp.compiler.helpers.Compiler;

import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class EnvController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Env model = new Env();
		model.setStatus(1);
      	model.setGen_auto_code(1);
      
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		EnvView view = new EnvView(model);
	
		view.img_src.setValue("default.svg");
		view.host.setVisible(true);
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.action_fk.setVisible(false);
		view.flg_old.setVisible(false);
	

		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException, URISyntaxException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Env model = new Env();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Application app = new Application();		
			Action ac = new Action();
			if(Core.isNotNull(model.getAction_fk())){
				ac.setId(Integer.getInteger(model.getAction_fk()));
			}
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());	
			app.setExternal(model.getFlg_external());
			if(app.getExternal() == 1 && Core.isNotNull(model.getHost())) {
				app.setUrl(model.getHost());
			}
			app.setImg_src(model.getImg_src());
			app.setName(model.getName());
			app.setStatus(model.getStatus());
			app.setTemplate(model.getTemplates()); 
			app = app.insert();
			if(app!=null){
				FileHelper.createDiretory(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				FileHelper.save(Config.getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				new Compiler().compile(new File[]{new File(Config.getBasePathClass()+"/"+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages"+"/"+"defaultpage/"+ "DefaultPageController.java")});
				if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/main/java/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getWorkspace()+"/src/main/java/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				}		
				Core.setMessageSuccess();
				return this.redirect("igrp_studio", "env","index");
			}else{
				Core.setMessageError();
			}
		}
		return this.forward("igrp_studio", "env", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	public Response actionEditar(@RParam(rParamName = "id") String idAplicacao) throws IllegalArgumentException, IllegalAccessException, IOException{
		
		Env model = new Env();		
		Application aplica_db = new Application();
		aplica_db = aplica_db.findOne(Integer.parseInt(idAplicacao));
		model.setDad(aplica_db.getDad()); // field dad is the same a Schema
		model.setName(aplica_db.getName());
		model.setDescription(aplica_db.getDescription());
		model.setFlg_external(aplica_db.getExternal());
		model.setHost(aplica_db.getUrl());
		if(Core.isNotNull(aplica_db.getAction())){
			model.setAction_fk(aplica_db.getAction().getId().toString());
		}
		model.setImg_src(aplica_db.getImg_src());
		model.setStatus(aplica_db.getStatus());
		model.setTemplates(aplica_db.getTemplate());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			aplica_db.setDad(model.getDad());
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());	
			
			aplica_db.setExternal(model.getFlg_external());
			
			if(aplica_db.getExternal() == 1 && Core.isNotNull(model.getHost())) {
				aplica_db.setUrl(model.getHost());
			}
			
			aplica_db.setDescription(model.getDescription());
			if(Core.isNotNull(model.getAction_fk())){
				Action ac = new Action().findOne(Integer.parseInt(model.getAction_fk()));
				aplica_db.setAction(ac);
			}
			aplica_db.setStatus(model.getStatus());
			aplica_db.setTemplate(model.getTemplates());	
			aplica_db = aplica_db.update();
			if(aplica_db!=null){
				Core.setMessageSuccess();
			}else{
				Core.setMessageError();
				return this.forward("igrp_studio", "env","editar&id=" + idAplicacao);
			}
		}	
		EnvView view = new EnvView(model);
		view.sectionheader_1_text.setValue(gt("App builder - Atualizar"));
		view.btn_gravar.setLink("igrp_studio", "env", "editar&id=" + idAplicacao);
		view.action_fk.setValue(IgrpHelper.toMap(new Action().find().andWhere("application", "=", Integer.parseInt(idAplicacao)).all(), "id", "page_descr", "-- Selecionar --"));
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.flg_old.setVisible(false);
		return this.renderView(view);
	
	}

	//App list I have access to
	public Response actionMyApps() throws IOException{
		String type = Igrp.getInstance().getRequest().getParameter("type");
		
		Igrp.getInstance().getResponse().setContentType("text/xml");
	//	Igrp.getInstance().getResponse().getWriter().append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");

		List<Profile> myApp = new Application().getMyApp();
		myApp = myApp.stream()
				  .filter(profile->profile.getOrganization().getApplication().getStatus()==1).collect(Collectors.toList());
		if(type!=null && type.equalsIgnoreCase("dev")) {
			myApp = myApp.stream()					 
					.filter(profile->!profile.getOrganization().getApplication().getDad().toLowerCase().equals("tutorial"))
					.filter(profile->!profile.getOrganization().getApplication().getDad().toLowerCase().equals("igrp_studio"))
					.collect(Collectors.toList());
		}
		List<Application> otherApp = new Application().getOtherApp();
		List<Integer> aux = new ArrayList<>();
		XMLWritter xml_menu = new XMLWritter();

		xml_menu.startElement("applications");
		/** IGRP-PLSQL Apps **/
		/** Begin **/
		List<IgrpPLSQLApp> allowApps = new ArrayList<IgrpPLSQLApp>();
		List<IgrpPLSQLApp> denyApps = new ArrayList<IgrpPLSQLApp>();
		getAllApps(allowApps,denyApps);
		/** End **/

		boolean displaySubtitle = false;
		boolean displayTitle = false;
		
		xml_menu.setElement("link_img", Config.getLinkImg());
		for(Profile profile:myApp){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			String page = "/default-page/index&title="+profile.getOrganization().getApplication().getName();
			if(profile.getOrganization().getApplication().getAction()!=null){
				Action ac = profile.getOrganization().getApplication().getAction();
				page = (ac!=null && ac.getPage()!=null)? "/" + ac.getPage()+"/"+ac.getAction():page;
			}
			xml_menu.setElement("link", Config.LINK_OPEN_APP + profile.getOrganization().getApplication().getDad().toLowerCase()+"&page="+page);
			xml_menu.setElement("img", Core.isNotNull(profile.getOrganization().getApplication().getImg_src())?profile.getOrganization().getApplication().getImg_src():"default.svg");
			xml_menu.setElement("title", profile.getOrganization().getApplication().getName());
			xml_menu.setElement("description", profile.getOrganization().getApplication().getDescription());
			xml_menu.setElement("num_alert", ""+profile.getOrganization().getApplication().getId());
			xml_menu.endElement();
			aux.add(profile.getOrganization().getApplication().getId());
			displayTitle = (type==null || type.equalsIgnoreCase(""))?true:false;
		}
		if(type==null || type.equals("")) {
			for(Application app:otherApp){
				if(!aux.contains(app.getId())){ // :-)
					xml_menu.startElement("application");
					xml_menu.writeAttribute("available", "no");
					xml_menu.setElement("link", "");
					xml_menu.setElement("img", Core.isNotNull(app.getImg_src())?app.getImg_src():"default.svg");
					xml_menu.setElement("title",app.getName());
					xml_menu.setElement("num_alert", "");
					xml_menu.setElement("description", app.getDescription());
					xml_menu.endElement();
					displaySubtitle = (type==null || type.equalsIgnoreCase(""))?true:false;
				}
			}
		}
		
		
		/** IGRP-PLSQL Apps **/
		/** Begin **/
		for(IgrpPLSQLApp obj: allowApps){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			xml_menu.setElement("link", obj.getLink());
			xml_menu.setElement("img", obj.getImg_src());
			xml_menu.setElement("title", obj.getName());
			xml_menu.setElement("num_alert", "");
			xml_menu.setElement("description", obj.getDescription());
			xml_menu.endElement();
			displayTitle = true;
		}

		for(IgrpPLSQLApp obj: denyApps){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "no");
			xml_menu.setElement("link", obj.getLink());
			xml_menu.setElement("img", obj.getImg_src());
			xml_menu.setElement("title", obj.getName());
			xml_menu.setElement("num_alert", "");
			xml_menu.setElement("description", obj.getDescription());
			xml_menu.endElement();
			displaySubtitle = true; 
		}
		/** End **/
		if(displayTitle){
			xml_menu.setElement("title", gt("Minhas Aplicações"));
		}
		if(displaySubtitle){
			xml_menu.setElement("subtitle", gt("Outras Aplicações"));
		}
		xml_menu.endElement();

		Response response = new Response();
		response.setCharacterEncoding(Response.CHARSET_UTF_8);
		response.setContentType(Response.FORMAT_XML);
		response.setContent(xml_menu + "");
		response.setType(1);

		return response;
	}
	
	public Response actionOpenApp(@RParam(rParamName = "app") String app,@RParam(rParamName = "page") String page) throws IOException{
//		PersistenceUtils.confiOtherConnections(app);
		
		String[] p = page.split("/");
		if(Permission.isPermition(app, p[1], p[2])) {
			Permission.changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta 
			Application env = new Application().find().andWhere("dad", "=", app).one();
			//System.out.println(env.getExternal() + " - " + env.getUrl());
			if(env.getExternal() == 1 && env.getUrl() != null && !env.getUrl().isEmpty()) {
				return this.redirectToUrl(env.getUrl());
			}
			return this.redirect(app, p[1], p[2]);
		}
		return this.redirectError();
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<IgrpPLSQLApp> allowApps /*INOUT var*/, List<IgrpPLSQLApp> denyApps  /*INOUT var*/) {
		try {
			String endpoint = "http://nosiappsdev.gov.cv/redglobal_lab/restapi/userapps/" + ((nosi.webapps.igrp.dao.User)Igrp.getInstance().getUser().getIdentity()).getEmail();
			
			try {
				String sessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
				
				List<Session> list = new Session().find().andWhere("sessionId", "=", sessionId).all();
				if(list != null && list.size() > 0) {
					list.sort(Comparator.comparing(Session::getId).reversed());
					Session session = list.get(0);
					endpoint += "/" + session.getId() + ":" + session.getSessionId() + "/" + session.getIpAddress();
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			URL url = new URL(endpoint);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			StringBuilder result = new StringBuilder();
			BufferedReader cin = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String aux = null;
			while((aux = cin.readLine()) != null) {
				result.append(aux);
			}
			cin.close();
			conn.disconnect();
			List<IgrpPLSQLApp> allApps = new Gson().fromJson(result.toString(), new TypeToken<List<IgrpPLSQLApp>>() {}.getType());
			for(IgrpPLSQLApp obj : allApps)
				if(obj.getAvailable().equals("yes"))
					allowApps.add(obj);
				else
					denyApps.add(obj);
		}catch(Exception e) {
			// do nothing yet 
		}
	}
	
	// For serialization purpose
	public static class IgrpPLSQLApp {
		private String id;
		private String name;
		private String dad;
		private String description;
		private String img_src;
		private String link;
		private String available;
		
		public String getAvailable() {
			return available;
		}
		public void setAvailable(String available) {
			this.available = available;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDad() {
			return dad;
		}
		public void setDad(String dad) {
			this.dad = dad;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getImg_src() {
			return img_src;
		}
		public void setImg_src(String img_src) {
			this.img_src = img_src;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		
		@Override
		public String toString() {
			return "IgrpPLSQLApp [id=" + id + ", name=" + name + ", dad=" + dad + ", description=" + description
					+ ", img_src=" + img_src + ", link=" + link + ", available=" + available + "]";
		}
	}

	/*----#END-PRESERVED-AREA----*/
}
