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
import nosi.core.integration.pdex.service.AppConfig;
import nosi.core.integration.pdex.service.AppConfig.App;

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

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.apache.commons.io.IOUtils;

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
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.flg_external.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		Properties settings = this.configApp.getMainSettings();
		String igrp_plsql_url = settings.getProperty(this.IGRP_PDEX_APPCONFIG_URL);
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
			}else
				Core.setMessageError(); 
			
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
		List<App> allowApps = new ArrayList<App>();
		List<App> denyApps = new ArrayList<App>();
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
		for(App obj: allowApps){
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

		for(App obj: denyApps){
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
			
			Properties properties = this.configApp.getMainSettings();
			String currentEnv = new Config().getEnvironment();
			String devUrl = properties.getProperty("igrp.env.dev.url"); 
			
			// If you try to open igrp_studio in a not igrp_studio enviroment 
			if(env != null && env.getDad().equalsIgnoreCase("igrp_studio") && currentEnv != null && !currentEnv.equalsIgnoreCase("dev") && devUrl != null && !devUrl.isEmpty()) { 				
				String qs = "?app=" + env.getDad();
				devUrl += qs;
			return redirectToUrl(devUrl); 
			}
			
			// 2 - custom dad 
			String url = null; 
			if(env.getExternal() == 2)  
				url = buildAppUrlUsingAutentikaForSSO(env); 
			// 1 External 
			if(env.getExternal() == 1) 
				url = env.getUrl(); 
			if(url != null) 
				return redirectToUrl(url); 
			
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
			String params = Core.getParam("p_params"); 
			if(params != null) {
				String allParams[] = params.split(";"); 
				for(String param : allParams) {
					String param_[] = param.split("="); 
					if(param_.length == 2)
						this.addQueryString(param_[0].trim(), param_[1].trim()); 
				}
			}
			
			return this.redirect(p[0], p[1], p[2],this.queryString());
		}		
		Core.setMessageError(gt("Não tem permissão! No permission! Page: ")+page);		
		Core.setAttribute("javax.servlet.error.message", gt("Não tem permissão! No permission! Page: ")+page);		
		return this.redirectError();
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<App> allowApps /*INOUT var*/, List<App> denyApps  /*INOUT var*/) {
		Properties properties =  this.configApp.getMainSettings(); 
		String baseUrl = properties.getProperty(IGRP_PDEX_APPCONFIG_URL); 
		String token = properties.getProperty(IGRP_PDEX_APPCONFIG_TOKEN); 
		AppConfig appConfig = new AppConfig(); 
		appConfig.setUrl(baseUrl);
		appConfig.setToken(token);
		List<App> allApps = appConfig.userApps(Core.getCurrentUser().getEmail()); 
		for(App app : allApps) { 
			if(app.getAvailable().equals("yes")) 
				allowApps.add(app);
			else 
				denyApps.add(app);
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
					        	 
							        	 xml += fields[i].getType().getSimpleName(); 
					        	 		if(fields[i].getAnnotation(ManyToOne.class) != null || fields[i].getAnnotation(OneToOne.class) != null) 
					        	 			xml += "_FK#";
							        	 		 
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
			if(env != null && env.getUrl() != null && !env.getUrl().isEmpty() && !contextName.equalsIgnoreCase(env.getUrl())) {
				url = this.configApp.getAutentikaUrlForSso(); 
				url = url.replace("state=igrpweb", "state=ENV|" + env.getDad()); 
				url = url.replace("/IGRP/", "/" + env.getUrl() + "/"); 
			}
		} catch (Exception e) { 
		}
		
		return url;
	}
	
	
	private final String IGRP_PDEX_APPCONFIG_URL = "igrp.pdex.appconfig.url";
	private final String IGRP_PDEX_APPCONFIG_TOKEN = "igrp.pdex.appconfig.token"; 
	
	/*----#end-code----*/
}
