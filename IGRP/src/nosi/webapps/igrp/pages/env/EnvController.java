/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
/*---- Import your packages here... ----*/



/*import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;
*/
import java.io.DataInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.CompilerHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

/*---- End ----*/
public class EnvController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		EnvView view = new EnvView(model);
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
			app.setDad(nosi.core.gui.page.Page.getPageName(model.getDad()));
			if(!nosi.core.gui.page.Page.validatePage(app.getDad())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,"Nome de dad inválida");
				return this.forward("igrp", "env", "index");
			}
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
						return this.forward("igrp", "env", "index");
					}					
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar a Orgânica!");
					return this.forward("igrp", "env", "index");
				}
				
				if(FileHelper.fileExists(Config.getWorkspace()) && FileHelper.createDiretory(Config.getWorkspace()+"/src/nosi"+"/"+"webapps/"+app.getDad().toLowerCase()+"/pages/defaultpage")){
					FileHelper.save(Config.getWorkspace()+"/src/nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages/defaultpage", "DefaultPageController.java",Config.getDefaultPageController(app.getDad().toLowerCase(), app.getName()));
				}				
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao registar a aplicação!");
				return this.forward("igrp", "env", "index");
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

		List<Profile> myApp = new Application().getMyApp();
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

		if(myApp.size()>0 || allowApps.size()>0){
			xml_menu.setElement("title", "Minhas Aplicações");
		}
		if(otherApp.size()>0 || denyApps.size()>0){
			xml_menu.setElement("subtitle", "Outras Aplicações");
		}
		xml_menu.setElement("link_img", Config.getLinkImg());
		for(Profile profile:myApp){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			String page = "/default-page/index&amp;title="+profile.getOrganization().getApplication().getName();
			if(profile.getOrganization().getApplication().getAction()!=null){
				Action ac = profile.getOrganization().getApplication().getAction();
				page = (ac!=null && ac.getPage()!=null)? "/" + ac.getPage()+"/"+ac.getAction():page;
			}
			xml_menu.setElement("link", "webapps?r=igrp/env/openApp&amp;app="+profile.getOrganization().getApplication().getDad().toLowerCase()+"&amp;page="+page);
			xml_menu.setElement("img", profile.getOrganization().getApplication().getImg_src());
			xml_menu.setElement("title", profile.getOrganization().getApplication().getName());
			xml_menu.setElement("num_alert", ""+profile.getOrganization().getApplication().getId());
			xml_menu.endElement();
			aux.add(profile.getOrganization().getApplication().getId());
		}
		for(Application app:otherApp){
			if(!aux.contains(app.getId())){
				xml_menu.startElement("application");
				xml_menu.writeAttribute("available", "no");
				xml_menu.setElement("link", "");
				xml_menu.setElement("img", app.getImg_src());
				xml_menu.setElement("title",app.getName());
				xml_menu.setElement("num_alert", "");
				xml_menu.endElement();
			}
		}
		
		
		/** IGRP-PLSQL Apps **/
		/** Begin **/
		for(IgrpPLSQLApp obj: allowApps){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			xml_menu.setElement("link", obj.getLink().replaceAll("&", "&amp;"));
			xml_menu.setElement("img", obj.getImg_src());
			xml_menu.setElement("title", obj.getName());
			xml_menu.setElement("num_alert", "");
			xml_menu.endElement();
		}

		for(IgrpPLSQLApp obj: denyApps){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "no");
			xml_menu.setElement("link", obj.getLink().replaceAll("&", "&amp;"));
			xml_menu.setElement("img", obj.getImg_src());
			xml_menu.setElement("title", obj.getName());
			xml_menu.setElement("num_alert", "");
			xml_menu.endElement();
		}

		/** End **/
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
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Aplicação Actualizada com sucesso !!");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorre um Erro ao tentar Actualizar a Aplicação!!");
				return this.forward("igrp", "env", "index");
			}
		}	
		EnvView view = new EnvView(model);
		view.sectionheader_1_text.setValue("Gestão de Aplicação - Actualizar");
		view.btn_gravar.setLink("editar&id=" + idAplicacao);
		view.action_fk.setValue(IgrpHelper.toMap(new Action().find().andWhere("application", "=", Integer.parseInt(idAplicacao)).all(), "id", "page_descr", "--- Selecionar Página ---"));
		return this.renderView(view);
	}
	
	public Response actionOpenApp(@RParam(rParamName = "app") String app,@RParam(rParamName = "page") String page) throws IOException{
		PersistenceUtils.confiOtherConnections(app);
		Permission.changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta
		String[] p = page.split("/");
		return this.redirect(app, p[1], p[2]);
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	private static String endpoint = "http://nosiappsdev.gov.cv/redglobal_lab/restapi/userapps/nositeste@nosi.cv";
	// Begin
	private void getAllApps(List<IgrpPLSQLApp> allowApps /*INOUT var*/, List<IgrpPLSQLApp> denyApps  /*INOUT var*/) {
		try {
			URL url = new URL(endpoint);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			StringBuilder result = new StringBuilder();
			DataInputStream cin = new DataInputStream(conn.getInputStream());
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
			e.printStackTrace();
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
	
	// End
}
