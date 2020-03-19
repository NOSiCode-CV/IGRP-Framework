package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.io.File;
import nosi.core.config.Config;
import nosi.core.config.ConfigApp;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;

import static nosi.core.i18n.Translator.gt;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.stream.Collectors;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType; 
/*----#end-code----*/
		
public class EnvController extends Controller { 
	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{ 
		Env model = new Env();
		model.load();
		EnvView view = new EnvView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.flg_external.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		Properties settings = ConfigApp.getInstance().loadCommonConfig();
		String igrp_plsql_url = settings.getProperty("igrp.plsql.myapps.url");
		if(igrp_plsql_url == null || igrp_plsql_url.isEmpty()) 
			view.plsql_codigo.setVisible(false);
		
      	model.setGen_auto_code(1); 
      	model.setImg_src("default.svg");	
	
		view.host.setVisible(true);
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.action_fk.setVisible(false);
		view.flg_old.setVisible(false);
		//view.flg_external.setValue(0);
		//view.status.setVisible(false);
		model.setStatus(1);
		view.flg_external.setValue(new Application().getAtivesEstadoRegisto()); 
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ListaPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/ 
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			if(!Character.isJavaIdentifierStart(model.getDad().charAt(0))) {
				Core.setMessageError("Code error! First char is a number: "+model.getDad()+". Change please!");					
				return this.forward("igrp_studio", "env", "index");
			}
			Application app = new Application();		
			Action ac = new Action();
			if(Core.isInt(model.getAction_fk())){
				ac.setId(Integer.getInteger(model.getAction_fk()));
			}
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());	
			app.setExternal(Core.toInt(model.getFlg_external()).intValue());
			app.setPlsql_code(model.getPlsql_codigo());
			
			boolean autoDeploy = false;
			
			if(app.getExternal() == 2) 
				app.setUrl(model.getHost().trim());
			
			if(app.getExternal() == 1) { 
				if(Core.isNotNull(model.getHost()))
					app.setUrl(model.getHost().trim());
				else 
					autoDeploy = true; 
			}
			
			app.setImg_src(model.getImg_src());
			app.setName(model.getName());
			app.setStatus(model.getStatus());
			app.setTemplate(model.getTemplates()); 
			
			Application tutorial = new Application().find().andWhere("dad", "=", "tutorial").one();
			if(tutorial != null && app.getExternal() != 1) {
				Action hp = new Action().find().andWhere("page", "=", "DefaultPage").andWhere("application.id", "=", tutorial.getId()).one();
				if(hp != null && app.getExternal() != 1)
					app.setAction(hp);
				else app.setAction(null);
			}
			
			Application app2 = new Application().find().andWhere("dad", "=", app.getDad()).one();
			if(app2 != null){
				Core.setMessageError(Core.gt("ENV1"));
				app = null;
			}else 
				app = app.insert();
			
			if(app != null){
				
				FileHelper.createDiretory(this.getConfig().getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				
				if(autoDeploy && !appAutoDeploy(app.getDad())) 
					Core.setMessageWarning(Core.gt("Ocorreu um erro ao tenta fazer o autodeploy da aplicação.")); 				
			
				Core.setMessageSuccess();	

				// ... Git control version code here ... 
				
				return this.redirect("igrp_studio", "env","index");				
			}else{
				Core.setMessageError();
			}
		}
		
		return this.forward("igrp_studio", "env", "index");
		/*----#end-code----*/
			
	}
	
		
/*----#start-code(custom_actions)----*/
	
	private boolean appAutoDeploy(String appDad) {
		boolean flag = true;
		try {
			/*String result = this.config.getPathOfImagesFolder().replace("IGRP", "FrontIGRP")
					.replace("webapps", "..")
					.replace("images", "IGRP-Template.war"); */		
			String result = System.getProperty("catalina.base");
			if(result != null)
				result += File.separator + "FrontIGRP" + File.separator + "IGRP-Template.war";
			File file = new File(result); 	
			
			File destinationFile = new File(result.replace("IGRP-Template", appDad.toLowerCase()));
			
			FileOutputStream fos = new FileOutputStream(destinationFile.getAbsolutePath());			
			CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());			
			JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos));				
			FileInputStream fis = new FileInputStream(file);			
			CheckedInputStream cis = new CheckedInputStream(fis, new Adler32());			
			JarInputStream jis = new JarInputStream(new BufferedInputStream(cis));			
			JarEntry entry = null;
			
			while((entry=jis.getNextJarEntry()) != null){					
				JarEntry aux = new JarEntry(entry.getName());				
				jos.putNextEntry(aux); 				
				jos.write(IOUtils.toByteArray(jis));				
				jos.closeEntry();
				jis.closeEntry();
			}
			jis.close();
			
			jos.close();
			cos.close();
			fos.close();
			
			File newWarFile =  new File(result.replace("FrontIGRP", "webapps").replace("IGRP-Template", appDad.toLowerCase()));
			flag = destinationFile.renameTo(newWarFile) && newWarFile.exists();
			
		}catch(Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public Response actionEditar() throws IllegalArgumentException, IllegalAccessException, IOException{
		
		Env model = new Env();		
		Application aplica_db = new Application();
		int idAplicacao = Core.getParamInt("p_id");
		aplica_db = aplica_db.findOne(idAplicacao);
		model.setDad(aplica_db.getDad()); 
		model.setName(aplica_db.getName());
		model.setDescription(aplica_db.getDescription());
		model.setFlg_external(aplica_db.getExternal() + "");
		model.setHost(aplica_db.getUrl());
		if(Core.isNotNull(aplica_db.getAction())){
			model.setAction_fk(aplica_db.getAction().getId().toString());
		}
		model.setImg_src(aplica_db.getImg_src());
		model.setStatus(aplica_db.getStatus());
		model.setTemplates(aplica_db.getTemplate());
		model.setPlsql_codigo(aplica_db.getPlsql_code());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());	
			aplica_db.setExternal(Core.toInt(model.getFlg_external()).intValue());
			aplica_db.setPlsql_code(model.getPlsql_codigo());
			
			if(aplica_db.getExternal() == 2) {
				aplica_db.setUrl(model.getHost().trim());
			}
			
			if(aplica_db.getExternal() == 1) {
				if(Core.isNotNull(model.getHost()))
					aplica_db.setUrl(model.getHost().trim());
				else
					aplica_db.setUrl(null);
			}
		
			aplica_db.setDescription(model.getDescription());
			if(Core.isInt(model.getAction_fk())){
				Action ac = new Action().findOne(Integer.parseInt(model.getAction_fk()));
				aplica_db.setAction(ac);
			}else {
				
				Application tutorial = new Application().find().andWhere("dad", "=", "tutorial").one();
				if(tutorial != null) {
					Action hp = new Action().find().andWhere("page", "=", "DefaultPage").andWhere("application.id", "=", tutorial.getId()).one();
					if(hp != null && aplica_db.getExternal() != 1)
						aplica_db.setAction(hp);  
					else 
						aplica_db.setAction(null); 
				}
				
			}
			aplica_db.setStatus(model.getStatus());
			aplica_db.setTemplate(model.getTemplates());	
			aplica_db = aplica_db.update();
			if(aplica_db != null){
				
				Core.setMessageSuccess(); 
				
				// ... Git control version code here ...	
				
				return redirect("igrp_studio", "env","editar&p_id=" + idAplicacao);
				
			}else{
				Core.setMessageError();
				return this.forward("igrp_studio", "env","editar&p_id=" + idAplicacao);
			}
		}	
		EnvView view = new EnvView();
		view.sectionheader_1_text.setValue(Core.gt("App builder - Atualizar"));
    	view.dad.propertie().setProperty("disabled", "true");
		view.btn_gravar.setLink("igrp_studio", "env", "editar&p_id=" + idAplicacao);
		view.action_fk.setValue(new Menu().getListAction(idAplicacao));
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.flg_old.setVisible(false);
		view.setModel(model);
		
		view.flg_external.setValue(new Application().getAtivesEstadoRegisto()); 
		
		return this.renderView(view);
	
	}

	// App list I have access to 
	public Response actionMyApps() throws IOException{ 
		String type = Core.getParam("type");
		
		Igrp.getInstance().getResponse().setContentType("text/xml");
	
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
		
		xml_menu.setElement("link_img", this.getConfig().getLinkImg());
		for(Profile profile:myApp){
			xml_menu.startElement("application");
			xml_menu.writeAttribute("available", "yes");
			
			String page = "tutorial/DefaultPage/index&title="+profile.getOrganization().getApplication().getName();
			
			if(profile.getOrganization().getApplication().getAction()!=null){
				Action ac = profile.getOrganization().getApplication().getAction();
				page = (ac!=null && ac.getPage()!=null)? ac.getApplication().getDad().toLowerCase()+"/" + ac.getPage()+"/"+ac.getAction():page;
			}
			xml_menu.setElement("link", this.getLinkOpenApp() + profile.getOrganization().getApplication().getDad().toLowerCase()+"&page="+page);
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
			xml_menu.setElement("title", Core.gt("Minhas Aplicações"));
		}
		if(displaySubtitle){
			xml_menu.setElement("subtitle", Core.gt("Outras Aplicações"));
		}
		xml_menu.endElement();

		Response response = new Response();
		response.setCharacterEncoding(Response.CHARSET_UTF_8);
		response.setContentType(Response.FORMAT_XML);
		response.setContent(xml_menu + "");
		response.setType(1);

		return response;
	}
	
	private String getLinkOpenApp() {
        String result = "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"openApp")+"&app="; 
        return result;
	}


	public Response actionOpenApp(@RParam(rParamName = "app") String app, @RParam(rParamName = "page") String page) throws Exception{ 
		
		String[] p = page.split("/");
		Permission permission = new Permission();
		
		if(permission.isPermition(app,p[0], p[1], p[2])) {
			permission.changeOrgAndProfile(app); // Muda perfil e organica de acordo com aplicacao aberta 
			
			Application env = Core.findApplicationByDad(app);
			
			Properties properties = ConfigApp.getInstance().loadCommonConfig();
			String currentEnv = new Config().getEnvironment();
			String devUrl = properties.getProperty("igrp.env.dev.url"); 
			
			// If you try to open igrp_studio in a not igrp_studio enviroment 
			if(env != null && env.getDad().equalsIgnoreCase("igrp_studio") && currentEnv != null && !currentEnv.equalsIgnoreCase("dev") && devUrl != null && !devUrl.isEmpty()) { 				
				String qs = "?app=" + env.getDad();
				devUrl += qs;
			return redirectToUrl(devUrl); 
			}
			
			//1 External ; 2 custom dad 
			if(env.getExternal() == 1 || env.getExternal() == 2) { 
				String url = buildAppUrlUsingAutentikaForSSO(env); 
				if(url != null) 
					return redirectToUrl(url); 
			} 
			
			try {
				final ApplicationPermition applicationPermition = permission.getApplicationPermitionBeforeCookie();
				Integer idPerfil = applicationPermition!=null?applicationPermition.getProfId():null;				
				if(idPerfil != null) {
					ProfileType prof = Core.findProfileById(idPerfil);
					if(prof != null && prof.getFirstPage() != null) {
						Action action = prof.getFirstPage();
						p[0] = action.getApplication().getDad();
						p[1] = action.getPage();
						p[2] = action.getAction();
						if(!permission.isPermition(app,p[0], p[1], p[2])) {
							p[0]="tutorial";
							p[1]="DefaultPage";
							p[1]="index";
						}
					}
				}
			}catch (Exception e) {
				System.err.println("EnvController line535:"+e.getLocalizedMessage());
				e.printStackTrace();
			}
			
			this.addQueryString("dad", app); 		
			return this.redirect(p[0], p[1], p[2],this.queryString());
		}		
		Core.setMessageError(gt("Não tem permissão! No permission! Page: ")+page);		
		Core.setAttribute("javax.servlet.error.message", gt("Não tem permissão! No permission! Page: ")+page);		
		return this.redirectError();
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<IgrpPLSQLApp> allowApps /*INOUT var*/, List<IgrpPLSQLApp> denyApps  /*INOUT var*/) {
		try {
			
			Properties properties =  ConfigApp.getInstance().loadConfig("common", "main.xml"); 
			String baseUrl = properties.getProperty("igrp.plsql.myapps.url"); 
			String token = properties.getProperty("igrp.plsql.myapps.token"); 
			if(baseUrl == null || baseUrl.isEmpty() || token == null || token.isEmpty()) 
				throw new Exception("Invalid url ..."); 
			
			String endpoint = baseUrl + "?p_email=" + "iekini.fernandes@nosi.cv"; 
			
			Client client = ClientBuilder.newClient(); 
			WebTarget webTarget = client.target(endpoint); 
			Invocation.Builder invocationBuilder  = webTarget.request().header(HttpHeaders.AUTHORIZATION, token); 
			javax.ws.rs.core.Response response  = invocationBuilder.get(); 
			
			String json = response.readEntity(String.class); 
			
			client.close(); 
			
			JSONObject obj = new JSONObject(json); 
			JSONObject apps_t = obj.getJSONObject("apps_t"); 
			if(apps_t != null && apps_t.has("apps_o")) {
				JSONArray apps_o = apps_t.getJSONArray("apps_o"); 
				if(apps_o != null) {
					List<IgrpPLSQLApp> allApps = new Gson().fromJson(apps_o.toString(), new TypeToken<List<IgrpPLSQLApp>>() {}.getType()); 
					for(IgrpPLSQLApp app : allApps) { 
						if(app.getAvailable().equals("yes")) 
							allowApps.add(app);
						else 
							denyApps.add(app);
					}
				}
			}
			
		}catch(Exception e) {
			//e.printStackTrace(); 
		}
	}
	
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
	
	public Response actionRetornarxml() throws IOException, IllegalArgumentException, IllegalAccessException{
		String app = Core.getParam("app_name");
		String xml = new EnvController.GetFieldsDAO().GerarXML(this.config, app); 
		this.format = Response.FORMAT_XML;
		return this.renderView(xml);
	}
	
	public static class GetFieldsDAO {
		
		public Map<String,String> listFilesDirectory(String path) {
			Map<String,String> files = new LinkedHashMap<String,String>();
			if(FileHelper.fileExists(path)){
			File folder = new File(path);
			   for (final File fileEntry : folder.listFiles()) {
			       if (fileEntry.isDirectory()) {
			           files.putAll(listFilesDirectory(fileEntry.toString()));
			       } else {
			       	files.put(fileEntry.getName(), fileEntry.getAbsolutePath());
			       }
			   }
			   return files;
			}
			return null;
		}
		
		
		public String GerarXML(Config conf, String dad){
			
			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>";
			
			xml += "<dao>";
			
			if(dad != "") {
				String x;
				String workSpace = conf.getRawBasePathClassWorkspace();
				if(Core.isNotNull(workSpace))
					x = conf.getBasePahtClassWorkspace(dad)+File.separator+"dao";
				else
					x= conf.getPathServerClass(dad)+File.separator+"dao";
				
				Map<String,String> dao = listFilesDirectory(x);
				
				if( dao != null ) {
					
					for (Map.Entry<String, String> entry : dao.entrySet()) {
						
						try {
							 String path=entry.getValue().substring(entry.getValue().indexOf("nosi"+File.separator+"webapps"+File.separator)).replace(".java", "").replace(File.separator, ".");
							 String nome_classe = entry.getKey().replace(".java", "");
							 
							Class<?> obj = Class.forName(path);
							
							 xml += "<" +nome_classe+  ">";
							
							 Field[] fields = obj.getDeclaredFields();
						        
					         
					         for (int i = 0; i < fields.length; i++) 
					         {
					        	 
					        	 if(!fields[i].getName().startsWith("pc") && !fields[i].getName().startsWith("class") && !fields[i].getName().startsWith("serialVersion"))
					        	 {
					        	 xml += "<field>"
					        	 		+ "<nome>" +
					        	 		fields[i].getName()
					        	 		+ "</nome>"
					        	 		
					        	 		+ "<tipo>";
					        	 
					        	 		try {
					        	 			String aux[] = fields[i].getType().getTypeName().split("\\."); 
						        	 		
						        	 		xml += aux[aux.length - 1];
										} catch (Exception e) {
											xml += fields[i].getType().getTypeName();
										}
					        	 		 
					        	 		xml += "</tipo>"
					        	 		+ ""; 
					        	 
					        	 xml += "</field>";
					        	 
					        	 }
					         }
					         
					         xml += "</" +nome_classe+ ">";
					         
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
				}
				
			}
			
			xml += "</dao>";
			
			return xml;
			
		}

	}
	
	private String buildAppUrlUsingAutentikaForSSO(Application env) { 
		String url = null;
		try { 
			String contextName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName(); 
			if(env != null && !contextName.equalsIgnoreCase(env.getUrl())) { 
				
				Properties settings =  ConfigApp.getInstance().loadConfig("common", "main.xml"); 
				url = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
				String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
				String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
				
				url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=igrpweb&redirect_uri=" + redirect_uri; 
				
				url = url.replace("state=igrpweb", "state=" + env.getDad()); 
				
				url = url.replace("/IGRP/", "/" + env.getUrl() + "/"); 
			}
			
		} catch (Exception e) { 
		}
		
		return url;
	}
	
	/*----#end-code----*/
}
