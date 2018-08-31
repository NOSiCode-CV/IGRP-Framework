package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.stream.Collectors;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;
import org.apache.commons.io.IOUtils;
import org.apache.openjpa.jdbc.sql.ResultSetResult;

//import org.apache.openjpa.lib.util.Files;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import ch.qos.logback.core.net.SyslogOutputStream;
import nosi.core.config.Config;
import nosi.core.cversion.Svn;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;
import nosi.webapps.igrp.dao.User;
import nosi.core.webapp.compiler.helpers.Compiler;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/

public class EnvController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Env model = new Env();
		model.load();
		EnvView view = new EnvView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		model.setStatus(1);
      	model.setGen_auto_code(1); 
      	model.setImg_src("default.svg");	
	
		
		view.host.setVisible(true);
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.action_fk.setVisible(false);
		view.flg_old.setVisible(false);
		view.flg_external.setValue(0);
	

	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Env model = new Env();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","ListaPage","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(gravar)----*/ 
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
		
			Application app = new Application();		
			Action ac = new Action();
			if(Core.isInt(model.getAction_fk())){
				ac.setId(Integer.getInteger(model.getAction_fk()));
			}
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());	
			app.setExternal(model.getFlg_external());
			
			boolean autoDeploy = false;
			
			if(app.getExternal() == 1) 
				if(Core.isNotNull(model.getHost()))
					app.setUrl(model.getHost().trim());
				else {
					/*String uri = Igrp.getInstance().getRequest().getRequestURI();
					String url = Igrp.getInstance().getRequest().getRequestURL().toString().replace(uri, "");
					url += "/" + app.getDad().trim().toUpperCase() + "/app/webapps?r=" + app.getDad().trim().toLowerCase() + "/default-page/index" ;
					app.setUrl(url); 				
					*/
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
				Core.setMessageError(gt("Código da aplicação inválido ou já existe."));
				app = null;
			}else
				app = app.insert();
			
			if(app != null){
				
				//createSvnRepo(app);
				
				FileHelper.createDiretory(this.getConfig().getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				
				if(autoDeploy && !appAutoDeploy(app.getDad())) 
					Core.setMessageWarning(gt("Ocorreu um erro ao tenta fazer o autodeploy da aplicação.")); 				
				Core.setMessageSuccess();				
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
			
			String result = this.config.getPathOfImagesFolder().replace("IGRP", "FrontIGRP").replace("images", "IGRP-Template.war"); 		     
			File file = new File(result); 			
			File destinationFile = new File(result.replace("IGRP-Template", appDad.toUpperCase())); 			
			//boolean b  = Files.copy(file, destinationFile);
			
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
			 
			String aux = "WEB-INF/classes/nosi/webapps/" + appDad.toLowerCase() + "/pages/defaultpage/";			
			String string1 = this.getConfig().getBasePathClass() + "nosi" + "/" + "webapps" + "/" + appDad.toLowerCase() + "/" + "pages" + "/" + "defaultpage/DefaultPageController.java";			
			String string2 = this.getConfig().getBasePathClass() + "nosi" + "/" + "webapps" + "/" + appDad.toLowerCase() + "/" + "pages" + "/" + "defaultpage/DefaultPageController.class";			
			JarEntry je1 = new JarEntry(aux + "DefaultPageController.java");
			jos.putNextEntry(je1);
			FileInputStream fis1 = new FileInputStream(string1);
			for(int r = fis1.read(); r!=-1 ; r = fis1.read()){
				jos.write(r);
			}
			fis1.close();			
			jos.closeEntry(); 
			
			JarEntry je2 = new JarEntry(aux + "DefaultPageController.class");
			jos.putNextEntry(je2);
			FileInputStream fis2 = new FileInputStream(string2);
			for(int r = fis2.read(); r!=-1 ; r = fis2.read()){
				jos.write(r);
			}
			fis2.close();
			
			jos.closeEntry();
			 
			jos.close();
			cos.close();
			fos.close();
			
			File newWarFile =  new File(destinationFile.getAbsolutePath().replace(File.separator + "FrontIGRP", ""));
			flag = destinationFile.renameTo(newWarFile) && newWarFile.exists();
			
		}catch(Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	
	private void createSvnRepo(Application app){
		Svn  svnapi = new Svn();
		String env = "";
		env = Igrp.getInstance().getServlet().getInitParameter("env");
		switch(env) {
			case "dev": 
				svnapi.setWorkFolder("dev/" + app.getDad().toLowerCase() + "/pages");
			break;
			case "prod": 
				svnapi.setWorkFolder("prod/" + app.getDad().toLowerCase() + "/pages");
			break;
			case "sta": 
				svnapi.setWorkFolder("sta/" + app.getDad().toLowerCase() + "/pages");
			break;
		}
        svnapi.setMessage("Create Repo. for Application - " + app.getDad());
        boolean flag = false;
		try {
			flag = svnapi.mkdir();
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
      /*  System.out.println("Criar Pasta " + flag); 
        System.out.println(svnapi.getCmd());
        System.out.println(svnapi.getCmdResult());*/
        
		try {
			svnapi.setLocalUriPath(this.getConfig().getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
			svnapi.setSvnUrl("https://subversion.gov.cv:18080/svn/FrontIGRP/trunk/"); 
			svnapi.setSvnUrl(svnapi.getSvnUrl()  + env + "/" + app.getDad().toLowerCase() + "/pages");
			svnapi.setWorkFolder("");
			flag = svnapi.co();
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		} 
	/*	
      System.out.println("Checkout " + flag); 
      System.out.println(svnapi.getCmd());
      System.out.println(svnapi.getCmdResult());*/
        
	}
	
	

	public Response actionEditar() throws IllegalArgumentException, IllegalAccessException, IOException{
		
		Env model = new Env();		
		Application aplica_db = new Application();
		int idAplicacao = Core.getParamInt("p_id");
		aplica_db = aplica_db.findOne(idAplicacao);
		model.setDad(aplica_db.getDad()); 
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
			//aplica_db.setDad(model.getDad());
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());	
			aplica_db.setExternal(model.getFlg_external());
			
			if(aplica_db.getExternal() == 1)
				if(Core.isNotNull(model.getHost()))
					aplica_db.setUrl(model.getHost().trim());
				else
					aplica_db.setUrl(null);
		
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
				return redirect("igrp_studio", "env","editar&p_id=" + idAplicacao);
			}else{
				Core.setMessageError();
				return this.forward("igrp_studio", "env","editar&p_id=" + idAplicacao);
			}
		}	
		EnvView view = new EnvView();
		view.sectionheader_1_text.setValue(gt("App builder - Atualizar"));
    	view.dad.propertie().setProperty("disabled", "true");
		view.btn_gravar.setLink("igrp_studio", "env", "editar&p_id=" + idAplicacao);
		view.action_fk.setValue(new Action().getListActions(idAplicacao));
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.flg_old.setVisible(false);
		view.setModel(model);
		return this.renderView(view);
	
	}

	// App list I have access to 
	public Response actionMyApps() throws IOException{
		String type = Core.getParam("type");
		
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
		//getAllApps(allowApps,denyApps);
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
	
	private String getLinkOpenApp() {
        return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"openApp")+"&app=";
	}


	public Response actionOpenApp(@RParam(rParamName = "app") String app,@RParam(rParamName = "page") String page) throws IOException{
		String[] p = page.split("/");
		if(new Permission().isPermition(app, p[1], p[2])) {
			new Permission().changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta 
			
			Application env = new Application().find().andWhere("dad", "=", app).one();
			
			Properties properties = this.load("sso", "oauth2.xml");
			String currentEnv = Igrp.getInstance().getServlet().getInitParameter("env");
			String devUrl = properties.getProperty("igrp.env.dev.url"); 			
			if(env != null && env.getDad().equalsIgnoreCase("igrp_studio") && currentEnv != null && !currentEnv.equalsIgnoreCase("dev") && devUrl != null && !devUrl.isEmpty()) { 
				String qs = "?_t=" + Base64.getEncoder().encodeToString((Core.getCurrentUser().getUser_name() + ":" + Core.getCurrentUser().getValid_until()).getBytes());
				devUrl += qs;
			return redirectToUrl(devUrl);
			}
			
			if(env.getExternal() == 1) {
				
				if(env.getUrl() != null && !env.getUrl().isEmpty()) {
					String aux = env.getUrl();
					Action action = env.getAction();
					if(action != null && env.getExternal() != 1) {
						aux = aux.replace(URI.create(aux).getQuery(), ""); 
						aux += "r=" + EncrypDecrypt.encrypt(env.getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction());
					}
					
					return this.redirectToUrl(aux);
				}else {
					
					//String warName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName();
					String uri = Igrp.getInstance().getRequest().getRequestURI();
					String url = Igrp.getInstance().getRequest().getRequestURL().toString().replace(uri, "");
					Action action = env.getAction();
					
					User currentUser = Core.getCurrentUser();
					url += "/" + env.getDad().trim().toLowerCase() + "/igrpoauth2sso?_t=" + Base64.getEncoder().encodeToString((currentUser.getUser_name() + ":" + currentUser.getValid_until()).getBytes()); 
					
					if(action != null) 
						url += "&_url=" + action.getApplication().getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction();
					else
						url += "&_url=tutorial/DefaultPage/index";
					
					return this.redirectToUrl(url);
				}
				
			}
			this.addQueryString("dad", app);
			return this.redirect(p[0], p[1], p[2],this.queryString());
		}
		return this.redirectError();
	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<IgrpPLSQLApp> allowApps /*INOUT var*/, List<IgrpPLSQLApp> denyApps  /*INOUT var*/) {
		try {
			
			Properties properties = this.load("sso", "oauth2.xml");
			String baseUrl = properties.getProperty("igrp.plsql.url");
			if(baseUrl == null || baseUrl.isEmpty())
				throw new Exception("Invalid url ...");
			
			String endpoint = baseUrl + ((nosi.webapps.igrp.dao.User)Igrp.getInstance().getUser().getIdentity()).getEmail();
			
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
			BufferedReader cin = new BufferedReader(new InputStreamReader(conn.getInputStream(),"ISO-8859-1"));
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
	
	private Properties load(String filePath, String fileName) {
		
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
		
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}

	/*----#end-code----*/
	}
