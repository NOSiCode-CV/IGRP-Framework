package nosi.webapps.igrp_studio.pages.env;

import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.pdex.service.AppConfig;
import nosi.core.integration.pdex.service.AppConfig.App;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.*;
import org.apache.commons.io.IOUtils;

import jakarta.jws.WebService;
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.function.Function;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.stream.Collectors;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;

import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class EnvController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		model.load();
		EnvView view = new EnvView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.img_src.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.templates.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.flg_external.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		view.img_src.setValue(this.getIcons());
		view.templates.setValue(this.getThemes());

		final Application application = new Application().findOne(Core.getParam("p_id"));
		model.setImg_src(application != null && Core.isNotNull(application.getImg_src()) ? application.getImg_src() : "default.svg");
		model.setGen_auto_code(1);
		model.setStatus(1);

		view.host.setVisible(true);
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.action_fk.setVisible(false);
		view.flg_old.setVisible(false);
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
		/* Start-Code-Block (gravar)  *//* End-Code-Block  */
		/*----#start-code(gravar)----*/ 
		
		if(Core.isHttpPost()){
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
			app.setExternal(Core.toInt(model.getFlg_external()));
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

				return this.redirect("igrp_studio", "env","index");		
				
			}else
				Core.setMessageError(); 
			
		}
		
		return this.forward("igrp_studio", "env", "index");
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	private boolean appAutoDeploy(String appDad) {
		boolean flag = true;
		try {
		
			String result = System.getProperty("catalina.base");
			if(result != null) {
				result += File.separator + "FrontIGRP" + File.separator + "IGRP-Template.war";
			File file = new File(result); 	
			
			File destinationFile = new File(result.replace("IGRP-Template", appDad.toLowerCase()));
			
			try(FileOutputStream fos = new FileOutputStream(destinationFile.getAbsolutePath())){	
			try(CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32())){			
			try(JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos))){					
			try(FileInputStream fis = new FileInputStream(file)){				
			try(CheckedInputStream cis = new CheckedInputStream(fis, new Adler32())){				
			try(JarInputStream jis = new JarInputStream(new BufferedInputStream(cis))){				
			JarEntry entry = null;
			
			while((entry=jis.getNextJarEntry()) != null){					
				JarEntry aux = new JarEntry(entry.getName());				
				jos.putNextEntry(aux); 				
				jos.write(IOUtils.toByteArray(jis));				
				jos.closeEntry();
				jis.closeEntry();
			}			
			
			File newWarFile =  new File(result.replace("FrontIGRP", "webapps").replace("IGRP-Template", appDad.toLowerCase()));
			flag = destinationFile.renameTo(newWarFile) && newWarFile.exists();
			}}}}}}}
		}catch(Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public Response actionEditar() throws IllegalArgumentException, IllegalAccessException, IOException{

		Env model = new Env();

		final Integer idAplicacao = Core.getParamInt("p_id");
		Application application = new Application().findOne(idAplicacao);

		model.setDad(application.getDad());
		model.setName(application.getName());
		model.setDescription(application.getDescription());
		model.setFlg_external(application.getExternal() + "");
		model.setHost(application.getUrl());
		if(Core.isNotNull(application.getAction())){
			model.setAction_fk(application.getAction().getId().toString());
		}
		model.setImg_src(application.getImg_src());
		model.setStatus(application.getStatus());
		model.setTemplates(application.getTemplate());
		model.setPlsql_codigo(application.getPlsql_code());
		
		if(Core.isHttpPost()){
			model.load();			
			application.setName(model.getName());
			application.setImg_src(model.getImg_src());
			application.setExternal(Core.toInt(model.getFlg_external()));
			application.setPlsql_code(model.getPlsql_codigo());
			
			if(application.getExternal() == 2) {
				application.setUrl(model.getHost().trim());
			}
			
			if(application.getExternal() == 1) {
				if(Core.isNotNull(model.getHost()))
					application.setUrl(model.getHost().trim());
				else
					application.setUrl(null);
			}
		
			application.setDescription(model.getDescription());
			if(Core.isInt(model.getAction_fk())){
				Action ac = new Action().findOne(Integer.parseInt(model.getAction_fk()));
				application.setAction(ac);
			}else {
				
				Application tutorial = new Application().find().andWhere("dad", "=", "tutorial").one();
				if(tutorial != null) {
					Action hp = new Action().find().andWhere("page", "=", "DefaultPage").andWhere("application.id", "=", tutorial.getId()).one();
					if(hp != null && application.getExternal() != 1)
						application.setAction(hp);
					else 
						application.setAction(null);
				}
				
			}
			application.setStatus(model.getStatus());
			application.setTemplate(model.getTemplates());
			application = application.update();
			if(application != null){
				
				Core.setMessageSuccess(); 
				
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
		view.plsql_codigo.setLabel("IGRP (code)");
		view.img_src.setValue(this.getIcons());
		view.templates.setValue(this.getThemes());
		view.flg_external.setValue(new Application().getAtivesEstadoRegisto());
		view.setModel(model);
		return this.renderView(view); 
	}

	// App list I have access to 
	public Response actionMyApps() { 
		String type = Core.getParam("type");
		Igrp.getInstance().getResponse().setContentType("text/xml");
		List<Profile> myApp = new Application().getMyApp(); 
		myApp = myApp.stream()
				  .filter(profile->profile.getOrganization().getApplication().getStatus()==1).collect(Collectors.toList());
		if(type.equalsIgnoreCase("dev")) {
			myApp = myApp.stream()					 
					.filter(profile->!profile.getOrganization().getApplication().getDad().equalsIgnoreCase("tutorial"))
					.filter(profile->!profile.getOrganization().getApplication().getDad().equalsIgnoreCase("igrp_studio"))
					.collect(Collectors.toList());
		}
		List<Application> otherApp = new Application().getOtherApp();
		List<Integer> aux = new ArrayList<>();
		XMLWritter xmlMenu = new XMLWritter();
		xmlMenu.startElement("applications");
		/** IGRP-PLSQL Apps **/
		/** Begin **/
		List<App> allowApps = new ArrayList<>();
		List<App> denyApps = new ArrayList<>();
		getAllApps(allowApps,denyApps);
		/** End **/
		boolean displaySubtitle = false;
		boolean displayTitle = false;
		xmlMenu.setElement("link_img", this.getConfig().getLinkImg());
		for(Profile profile:myApp){
			xmlMenu.startElement("application");
			xmlMenu.writeAttribute("available", "yes");
			String page = "tutorial/DefaultPage/index&title="+profile.getOrganization().getApplication().getName();
			if(profile.getOrganization().getApplication().getAction()!=null){
				Action ac = profile.getOrganization().getApplication().getAction();
				page = (ac!=null && ac.getPage()!=null)? ac.getApplication().getDad().toLowerCase()+"/" + ac.getPage()+"/"+ac.getAction():page;
			}
			xmlMenu.setElement("link", this.getLinkOpenApp() + profile.getOrganization().getApplication().getDad().toLowerCase()+"&page="+page);
			xmlMenu.setElement("img", Core.isNotNull(profile.getOrganization().getApplication().getImg_src())?profile.getOrganization().getApplication().getImg_src():"default.svg");
			xmlMenu.setElement("title", profile.getOrganization().getApplication().getName());
			xmlMenu.setElement("description", profile.getOrganization().getApplication().getDescription());
			xmlMenu.setElement("num_alert", ""+profile.getOrganization().getApplication().getId());
			xmlMenu.endElement();
			aux.add(profile.getOrganization().getApplication().getId());
			displayTitle = (type==null || type.equalsIgnoreCase(""));
		}
		if(type==null || type.equals("")) {
			for(Application app:otherApp){
				if(!aux.contains(app.getId())){ // :-)
					xmlMenu.startElement("application");
					xmlMenu.writeAttribute("available", "no");
					xmlMenu.setElement("link", "");
					xmlMenu.setElement("img", Core.isNotNull(app.getImg_src())?app.getImg_src():"default.svg");
					xmlMenu.setElement("title",app.getName());
					xmlMenu.setElement("num_alert", "");
					xmlMenu.setElement("description", app.getDescription());
					xmlMenu.endElement();
					displaySubtitle = (type==null || type.equalsIgnoreCase(""));
				}
			}
		}
		/** IGRP-PLSQL Apps **/
		/** Begin **/
		for(App obj: allowApps){
			xmlMenu.startElement("application");
			xmlMenu.writeAttribute("available", "yes");
			xmlMenu.setElement("link", obj.getLink());
			xmlMenu.setElement("img", obj.getImg_src());
			xmlMenu.setElement("title", obj.getName());
			xmlMenu.setElement("num_alert", "");
			xmlMenu.setElement("description", obj.getDescription());
			xmlMenu.endElement();
			displayTitle = true;
		}
		for(App obj: denyApps){
			xmlMenu.startElement("application");
			xmlMenu.writeAttribute("available", "no");
			xmlMenu.setElement("link", obj.getLink());
			xmlMenu.setElement("img", obj.getImg_src());
			xmlMenu.setElement("title", obj.getName());
			xmlMenu.setElement("num_alert", "");
			xmlMenu.setElement("description", obj.getDescription());
			xmlMenu.endElement();
			displaySubtitle = true; 
		}
		/** End **/
		if(displayTitle)
			xmlMenu.setElement("title", Core.gt("Minhas Aplicações"));
		if(displaySubtitle)
			xmlMenu.setElement("subtitle", Core.gt("Outras Aplicações"));
		xmlMenu.endElement();
		Response response = new Response();
		response.setCharacterEncoding(Response.CHARSET_UTF_8);
		response.setContentType(Response.FORMAT_XML);
		response.setContent(xmlMenu + "");
		response.setType(1);

		return response;
	}
	
	private String getLinkOpenApp() {
        return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"openApp")+"&app=";
	}


	public Response actionOpenApp(@RParam(rParamName = "app") String app, @RParam(rParamName = "page") String page) throws Exception {
		String[] p = page.split("/");
		Permission permission = new Permission();
		if(permission.isPermition(app, p[0], p[1], p[2])) { 
			Application env = Core.findApplicationByDad(app);
			// 2 - custom dad 
			String url = null; 
			if(env.getExternal() == 2)
				url = buildAppUrlUsingAutentikaForSSO(env);
			// 1 External 
			if(env.getExternal() == 1)
				url = env.getUrl(); 
			if(url != null) 
				return redirectToUrl(url); 
			
			permission.changeOrgAndProfile(app); // Muda perfil e organica de acordo com aplicacao aberta 
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
							p[2]="index";
						}
					}
				}
			}catch (Exception e) {
				System.err.println("EnvController line535:"+e.getLocalizedMessage());
				e.printStackTrace();
			}
			this.addQueryString("dad", app); 
			String params = Core.getParam("p_params");

			String[] allParams = params.split(";");
			for (String param : allParams) {
				String[] splitedParam = param.split("=");
				if (splitedParam.length == 2)
					this.addQueryString(splitedParam[0].trim(), splitedParam[1].trim());
			}

			return this.redirect(p[0], p[1], p[2],this.queryString());
		}		
		Core.setMessageError(gt("Não tem permissão! No permission! Page: ") + page);		
		Core.setAttribute("jakarta.servlet.error.message", gt("Não tem permissão! No permission! Page: ") + page);		
		return this.redirectError();
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<App> allowApps /*INOUT var*/, List<App> denyApps  /*INOUT var*/) {
		Properties properties =  this.configApp.getMainSettings(); 
		String baseUrl = properties.getProperty(ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_URL.value()); 
		String token = properties.getProperty(ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_TOKEN.value()); 
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
	
	// XML for Blocky's consume 
	public Response actionRetornarxml() throws IllegalArgumentException{
		String app = Core.getParam("app_name");
		XMLWritter xml = new XMLWritter(); 
		xml.startElement(app);
		this.gerarXMLFromDAO(app, xml); 
		this.gerarXMLFromServices(app, xml);
		xml.endElement();
		this.format = Response.FORMAT_XML;
		return this.renderView(xml.toString());
	} 
	
	private String buildAppUrlUsingAutentikaForSSO(Application env) {
		String url = null;
		try {
			String contextName = Core.getDeployedWarName(); 
			if(env != null && env.getUrl() != null && !env.getUrl().isEmpty() && !contextName.equalsIgnoreCase(env.getUrl())) {
				Action ac = env.getAction(); 
				String page = "tutorial/DefaultPage/index";
				if(ac != null && ac.getApplication() != null) {
					page = String.format("%s/%s/index", ac.getApplication().getDad().toLowerCase(), ac.getPage());
					if(ac.getAction_descr() != null)
						page = String.format("%s&title=%s", page, URLEncoder.encode(ac.getAction_descr(), Charset.forName("utf-8")));
				}
				url = this.configApp.getExternalUrl(env.getUrl());
				url = String.format("%s?r=%s", url, page);
			}
		} catch (Exception ignored) {
			// Ignored
		}
		return url;
	}
	
	public Map<String,String> listFilesDirectory(String path) {
		Map<String,String> files = new LinkedHashMap<>();
		if(FileHelper.fileExists(path)){
		File folder = new File(path);
		   for (final File fileEntry : folder.listFiles()) {
		       if (fileEntry.isDirectory()) {
		           files.putAll(listFilesDirectory(fileEntry.toString()));
		       } else {
		       	files.put(fileEntry.getName(), fileEntry.getAbsolutePath());
		       }
		   }
		}
		return files;
	}
	
	public void gerarXMLFromServices(String dad, XMLWritter xml){
		xml.startElement("services");
		String x = this.getConfig().getPathServerClass(dad) + File.separator + "services";
		if(Core.isNotNull(this.getConfig().getRawBasePathClassWorkspace()))
			x = this.getConfig().getBasePahtClassWorkspace(dad) + File.separator + "services";
		Map<String,String> services = listFilesDirectory(x);
		if(!services.isEmpty()) {
			for (Map.Entry<String, String> entry : services.entrySet()) {
				try {
					String fullClassName = entry.getValue().substring(entry.getValue().indexOf("nosi"+File.separator+"webapps"+File.separator)).replace(".java", "").replace(File.separator, ".");
					Class<?> c = Class.forName(fullClassName); 
					if(c.isInterface() && c.isAnnotationPresent(WebService.class)) {
						String className = entry.getKey().replace(".java", "");
						xml.startElement(className);
							xml.setElement("full_class_name", c.getName());
							xml.startElement("operations");
								Method []methods = c.getMethods();
								if(methods != null)
									for(Method m : methods) {
										xml.startElement(m.getName());
											xml.startElement("params");
												Parameter[] parameters = m.getParameters();
												if(parameters != null)
													for(Parameter p : parameters) {
														xml.startElement(p.getName());
															xml.text(p.getType().getTypeName());
														xml.endElement();
													}
											xml.endElement();
											xml.startElement("return");
												xml.startElement("tipo");
													xml.text(m.getReturnType().getName());
												xml.endElement();
												xml.addXml(generateXMLFieldsStructure(m.getReturnType()));
											xml.endElement();
										xml.endElement();
									}
							xml.endElement();
						xml.endElement();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		xml.endElement();
	}
		
	public void gerarXMLFromDAO(String dad, XMLWritter xml){
		xml.startElement("dao");
		String x = this.getConfig().getPathServerClass(dad) + File.separator + "dao";
		if(Core.isNotNull(this.getConfig().getRawBasePathClassWorkspace()))
			x = this.getConfig().getBasePahtClassWorkspace(dad) + File.separator + "dao";
		Map<String,String> dao = listFilesDirectory(x);
		if(!dao.isEmpty()) {
			for (Map.Entry<String, String> entry : dao.entrySet()) {
				try {
					String path = entry.getValue().substring(entry.getValue().indexOf("nosi"+File.separator+"webapps"+File.separator)).replace(".java", "").replace(File.separator, ".");
					String className = entry.getKey().replace(".java", "");
					Class<?> obj = Class.forName(path);
					xml.startElement(className);
					Field[] fields = obj.getDeclaredFields();
					for (Field field : fields) {
						if (!field.getName().startsWith("pc") && !field.getName().startsWith("class") && !field.getName().startsWith("serialVersion")) {
							xml.startElement("field");
							xml.startElement("nome");
							xml.text(field.getName());
							xml.endElement();
							xml.startElement("tipo");
							String aux = field.getType().getSimpleName();
							if (field.getAnnotation(ManyToOne.class) != null || field.getAnnotation(OneToOne.class) != null)
								aux += "_FK#";
							else if (field.getAnnotation(GeneratedValue.class) != null)
								aux += "_PK#";
							xml.text(aux);
							xml.endElement();
							xml.endElement();

						}
					}
			         xml.endElement();
				} catch (Exception e) {	
					e.printStackTrace();
				}
			}
		}
		xml.endElement();
	} 
	
	private String generateXMLFieldsStructure(Class<?> obj) {
		XMLWritter xml = new XMLWritter(); 
		Field[] fields = obj.getDeclaredFields();
		if(fields.length > 0) {
			xml.startElement("fields");
				for(Field field : fields) {
					xml.startElement("field");
						xml.setElement("nome", field.getName());
						xml.setElement("tipo", field.getType().getName());
						if(field.getType().getName().startsWith("nosi.webapps"))
							return generateXMLFieldsStructure(field.getClass()); 
					xml.endElement();
				}
			xml.endElement();
		}
		return xml.toString(); 
	}

	private Map<String, String> getIcons() {
		try {

			final String iconAppPath = new Config().getPathOfImagesFolder() + "/IGRP/IGRP2.3/assets/img/iconApp";

			final Map<String, String> files = new FileHelper().readAllFileDirectory(iconAppPath);

			if (null != files)
				return files.keySet()
						.stream()
						.collect(Collectors.toMap(Function.identity(), Function.identity(), (x, y) -> x, LinkedHashMap::new));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new HashMap<>();
	}

	private Map<String, String> getThemes() {

		final Map<String, String> themes = new LinkedHashMap<>();

		try {

			final String iconAppPath = new Config().getPathOfImagesFolder() + "/IGRP/IGRP2.3/themes";

			themes.put(null, "-- Seleccionar --");

			new FileHelper().getDirectoriesFromPath(iconAppPath)
					.forEach(obj -> themes.put(obj, obj));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return themes;
	}
	
	/*----#end-code----*/
}
