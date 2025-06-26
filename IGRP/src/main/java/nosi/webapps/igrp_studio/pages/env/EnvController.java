package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Controller;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.pdex.service.AppConfig;
import nosi.core.integration.pdex.service.AppConfig.App;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.*;
import org.apache.commons.io.IOUtils;
import jakarta.jws.WebService;
import org.apache.commons.lang3.StringUtils;
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
		var model = new Env();
		model.load();
		var view = new EnvView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.img_src.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.templates.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.template_theme_24_.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.flg_external.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		view.img_src.setValue(this.getIcons());
		view.templates.setValue(this.getThemes("2.3"));
		view.template_theme_24_.setValue(this.getThemes("2.4"));

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
		view.plsql_codigo.setVisible(this.configApp.isActiveGlobalACL());
		view.flg_external.setValue(new Application().getAtivesEstadoRegisto());
		//view.host.propertie().add("tooltip", "EX: the tedkmsamf ");
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new Env();
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
			String theme24=Core.isNotNull(model.getTemplate_theme_24_())?";"+model.getTemplate_theme_24_():"";
			app.setTemplate(model.getTemplates()+theme24);
			
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
		if(application.getTemplateRaw()!=null) {
			String[] themes = application.getTemplateRaw().split(";");
			model.setTemplates(themes[0]);
			if(themes.length>1)
				model.setTemplate_theme_24_(themes[1]);
		}
		
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
			String theme24=Core.isNotNull(model.getTemplate_theme_24_())?";"+model.getTemplate_theme_24_():"";
			application.setTemplate(model.getTemplates()+theme24);
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
		view.plsql_codigo.setVisible(this.configApp.isActiveGlobalACL());
		view.plsql_codigo.setLabel("IGRP (code)");
		view.img_src.setValue(this.getIcons());
		view.templates.setValue(this.getThemes("2.3"));
		view.template_theme_24_.setValue(this.getThemes("2.4"));
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
				  .filter(profile->profile.getOrganization().getApplication().getStatus()==1).toList();
		if(type.equalsIgnoreCase("dev")) {
			myApp = myApp.stream()					 
					.filter(profile->!profile.getOrganization().getApplication().getDad().equalsIgnoreCase("tutorial"))
					.filter(profile->!profile.getOrganization().getApplication().getDad().equalsIgnoreCase("igrp_studio"))
					.toList();
		}
		List<Application> otherApp = new Application().getOtherApp();
		List<Integer> aux = new ArrayList<>();
		XMLWritter xmlMenu = new XMLWritter();
		xmlMenu.startElement("applications");
		
		boolean displaySubtitle = false;
		boolean displayTitle = false;
		xmlMenu.setElement("link_img", this.getConfig().getLinkImg(Config.DEFAULT_V_PAGE));
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
			displayTitle = type.equalsIgnoreCase("");
		}
		if(type.isEmpty()) {
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
					displaySubtitle = type.equalsIgnoreCase("");
				}
			}
		}
		//** IGRP-PLSQL Apps **/
		/* Begin **/
		if(this.configApp.isActiveGlobalACL()) {
			List<App> allowApps = new ArrayList<>();
			List<App> denyApps = new ArrayList<>();
			String host= getAllApps(allowApps,denyApps);
			for(App obj: allowApps){
				xmlMenu.startElement("application");
				xmlMenu.writeAttribute("available", "yes");
				xmlMenu.setElement("link", obj.getLink());
				xmlMenu.setElement("path_acl", host+"gov.cv/images/IGRP/IGRP2.3");
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
				xmlMenu.setElement("path_acl", host+"gov.cv/images/IGRP/IGRP2.3");
				xmlMenu.setElement("img", obj.getImg_src());
				xmlMenu.setElement("title", obj.getName());
				xmlMenu.setElement("num_alert", "");
				xmlMenu.setElement("description", obj.getDescription());
				xmlMenu.endElement();
				displaySubtitle = true; 
			}
		//** End **/
		}
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
		if(permission.hasApp1PagPermition(app, p[0], p[1], p[2])) {
			//TODO: deve ver se a aplicacao da pagina é nao tutorial e ver o que acontece se for diferentes...
			Application env = Core.findApplicationByDad(p[0]);
			if(env.getExternal()==0)
				 env = Core.findApplicationByDad(app);
			// 2 - custom dad 
			String url = null; 
			if(env.getExternal() == 2)
				url = buildAppUrlUsingAutentikaForSSO(env);
			// 1 External 
			if(env.getExternal() == 1)
				url = env.getUrl(); 
			if(url != null && (env.getExternal() == 2 || !url.contains("app/webapps")))
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
						if(!permission.hasMenuPagPermition(Igrp.getInstance().getRequest(),app,p[0], p[1], p[2])) {
							Core.setMessageInfo("Não tem permissão para página principal do perfil! No permission to the home page of this profile! Page: "+p[0]+"/"+p[1]);
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
			if(env.getExternal() == 1)
				return this.redirectToUrl(String.format("%s?r=%s/%s/%s&dad="+app, url, p[0], p[1], p[2]));
			return this.redirect(p[0], p[1], p[2],this.queryString());
		}		
		Core.setMessageError(gt("Não tem permissão/partilha para página principal! No permission/share to the home page! Page: ") + page);
		Core.setAttribute("jakarta.servlet.error.message", gt("Não tem permissão para página principal! No permission to the home page! Page: ") + page);
		return this.redirectError(app);
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private String getAllApps(List<App> allowApps /*INOUT var*/, List<App> denyApps  /*INOUT var*/) {
		String host="";
		String baseUrl = ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_URL.environmentValue();
		String token = ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_TOKEN.environmentValue();
		AppConfig appConfig = new AppConfig(); 
		appConfig.setUrl(baseUrl);
		appConfig.setToken(token);
		List<App> allApps = appConfig.userApps(Core.getCurrentUser().getEmail()); 
		for(App app : allApps) { 
			if(app.getAvailable().equals("yes")) 
				allowApps.add(app);
			else 
				denyApps.add(app);
			if(host.isEmpty() && app.getLink().contains("redirect_uri"))
				host= StringUtils.substringBetween(app.getLink(),"redirect_uri=","gov.cv");
		}
		return host;
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
		try {
			String deployedWarName = Core.getDeployedWarName();
			if(env != null && env.getUrl() != null && !env.getUrl().isEmpty() && !deployedWarName.equalsIgnoreCase(env.getUrl())) {
				Action ac = env.getAction();
				StringBuilder url = new StringBuilder(this.configApp.getExternalUrl(env.getUrl()));
				if(ac != null && ac.getApplication() != null) {
					String dad = env.getDad().toLowerCase();
					String dadOfPage =ac.getApplication().getDad().toLowerCase();
					url.append(String.format("?r=%s/%s/index&dad=%s", dadOfPage, ac.getPage(), dad));
					if(ac.getAction_descr() != null)
						url.append(String.format("&title=%s", URLEncoder.encode(ac.getAction_descr(), StandardCharsets.UTF_8)));
				}else
					url.append(String.format("?r=tutorial/DefaultPage/index&dad=%s", env.getDad().toLowerCase()));
				return url.toString();
			}
		} catch (Exception ignored) {
			// Ignored
		}
		return null;
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
							if (field.isAnnotationPresent(ManyToOne.class) || field.isAnnotationPresent(OneToOne.class))
								aux += "_FK#";
							else if (field.isAnnotationPresent(GeneratedValue.class))
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

	private Map<String, String> getThemes(String version) {

		final Map<String, String> themes = new LinkedHashMap<>();

		try {

			final String iconAppPath = new Config().getPathOfImagesFolder() + "/IGRP/IGRP"+version+"/themes";

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