package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.io.File;
import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import java.io.FileInputStream;
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
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
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
		
		model.setStatus(1);
      	model.setGen_auto_code(1); 
      	model.setImg_src("default.svg");	
	
		
		view.host.setVisible(true);
		view.apache_dad.setVisible(false); 
		view.link_menu.setVisible(false);
		view.link_center.setVisible(false);
		view.action_fk.setVisible(false);
		view.flg_old.setVisible(false);
		//view.flg_external.setValue(0);
		view.status.setVisible(false);
		
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
		 return this.forward("igrp_studio","ListaPage","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
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
			
			boolean autoDeploy = false;
			
			if(app.getExternal() == 2) 
				app.setUrl(model.getHost().trim());
			
			if(app.getExternal() == 1) { 
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
				
				//createSvnRepo(app);
				
				FileHelper.createDiretory(this.getConfig().getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
				
				if(autoDeploy && !appAutoDeploy(app.getDad())) 
					Core.setMessageWarning(Core.gt("Ocorreu um erro ao tenta fazer o autodeploy da aplicação.")); 				
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
			/*String result = this.config.getPathOfImagesFolder().replace("IGRP", "FrontIGRP")
					.replace("webapps", "..")
					.replace("images", "IGRP-Template.war"); */		
			String result = System.getProperty("catalina.base");
			if(result != null)
				result += File.separator + "FrontIGRP" + File.separator + "IGRP-Template.war";
			File file = new File(result); 	
			
			File destinationFile = new File(result.replace("IGRP-Template", appDad.toLowerCase()));
			
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
	
//	private void createSvnRepo(Application app){
//		Svn  svnapi = new Svn();
//		String env = "";
//		env = Igrp.getInstance().getServlet().getInitParameter("env");
//		switch(env) {
//			case "dev": 
//				svnapi.setWorkFolder("dev/" + app.getDad().toLowerCase() + "/pages");
//			break;
//			case "prod": 
//				svnapi.setWorkFolder("prod/" + app.getDad().toLowerCase() + "/pages");
//			break;
//			case "sta": 
//				svnapi.setWorkFolder("sta/" + app.getDad().toLowerCase() + "/pages");
//			break;
//		}
//        svnapi.setMessage("Create Repo. for Application - " + app.getDad());
//        boolean flag = false;
//		try {
//			flag = svnapi.mkdir();
//		} catch (IOException | InterruptedException e) {
//			e.printStackTrace();
//		}
//      /*  System.out.println("Criar Pasta " + flag); 
//        System.out.println(svnapi.getCmd());
//        System.out.println(svnapi.getCmdResult());*/
//        
//		try {
//			svnapi.setLocalUriPath(this.getConfig().getBasePathClass()+"nosi"+"/"+"webapps"+"/"+app.getDad().toLowerCase()+"/"+"pages");
//			svnapi.setSvnUrl("https://subversion.gov.cv:18080/svn/FrontIGRP/trunk/"); 
//			svnapi.setSvnUrl(svnapi.getSvnUrl()  + env + "/" + app.getDad().toLowerCase() + "/pages");
//			svnapi.setWorkFolder("");
//			flag = svnapi.co();
//		} catch (IOException | InterruptedException e) {
//			e.printStackTrace();
//		} 
//	/*	
//      System.out.println("Checkout " + flag); 
//      System.out.println(svnapi.getCmd());
//      System.out.println(svnapi.getCmdResult());*/
//        
//	}
	
	

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
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			//aplica_db.setDad(model.getDad());
			aplica_db.setName(model.getName());
			aplica_db.setImg_src(model.getImg_src());	
			aplica_db.setExternal(Core.toInt(model.getFlg_external()).intValue());
			
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
		view.action_fk.setValue(new Action().getListActions(idAplicacao));
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


	public Response actionOpenApp(@RParam(rParamName = "app") String app,@RParam(rParamName = "page") String page) throws Exception{
		String[] p = page.split("/");
		if(new Permission().isPermition(app, p[1], p[2])) {
			new Permission().changeOrgAndProfile(app);//Muda perfil e organica de acordo com aplicacao aberta 
			
			Application env = Core.findApplicationByDad(app);
			
			Properties properties = ConfigApp.getInstance().loadConfig("common", "main.xml");
			String currentEnv = Igrp.getInstance().getServlet().getInitParameter("env");
			String devUrl = properties.getProperty("igrp.env.dev.url"); 
			
//			If you try to open igrp_studio in a not igrp_studio enviroment
			if(env != null && env.getDad().equalsIgnoreCase("igrp_studio") && currentEnv != null && !currentEnv.equalsIgnoreCase("dev") && devUrl != null && !devUrl.isEmpty()) { 
				String qs = "?_t=" + Base64.getEncoder().encodeToString((Core.getCurrentUser().getUser_name() + ":" + Core.getCurrentUser().getValid_until()).getBytes());
				devUrl += qs;
			return redirectToUrl(devUrl);
			}
			//1 External ; 2 custom dad
			if(env.getExternal() == 1 || env.getExternal() == 2) {
				
				if(env.getExternal() != 2 && env.getUrl() != null && !env.getUrl().isEmpty()) {
					String aux = env.getUrl();
					Action action = env.getAction();
					if(action != null && env.getExternal() != 1) {
						aux = aux.replace(URI.create(aux).getQuery(), ""); 
						//aux += "r=" + new EncrypDecrypt().encrypt(env.getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction());
						aux = "r=" + (env.getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction());
					}
//					if(env.getDad().compareTo("kriol_db")==0) {
//						return this.postToPgStudio(env);
//					}
					return this.redirectToUrl(aux.contains("http")||aux.startsWith("/")?aux:"http://"+aux);
				}else {
					
					String deployedWarName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName();
					
				
						
						//String warName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName();
						String uri = Igrp.getInstance().getRequest().getRequestURI();
						String url = Igrp.getInstance().getRequest().getRequestURL().toString().replace(uri, "");
						
						Action action = env.getAction();
						
						User currentUser = Core.getCurrentUser(); 
						
						if(env.getExternal() == 1 && !deployedWarName.equals(env.getDad())) {
							
							url += "/" + env.getDad() + "/igrpoauth2sso?_t=" + Base64.getEncoder().encodeToString((currentUser.getUser_name() + ":" + currentUser.getValid_until()).getBytes()); 
							
							if(action != null) 
								url += "&_url=" + action.getApplication().getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction();
							else
								url += "&_url=tutorial/DefaultPage/index";
							
							return this.redirectToUrl(url);
						}
						
						if(env.getExternal() == 2 && !deployedWarName.equals(env.getUrl())) { // Custom dad 
							url += "/" + env.getUrl() + "/igrpoauth2sso?_t=" + Base64.getEncoder().encodeToString((currentUser.getUser_name() + ":" + currentUser.getValid_until()).getBytes()); 
							
							if(action != null) 
								url += "&_url=" + action.getApplication().getDad().toLowerCase() + "/" + action.getPage() + "/" + action.getAction();
							else
								url += "&_url=tutorial/DefaultPage/index";
							
							return this.redirectToUrl(url);
						}						
					}				
				
			}
			
			try {
				Integer idPerfil = (Integer) Igrp.getInstance().getRequest().getSession().getAttribute("igrp.prof");
				if(idPerfil != null) {
					ProfileType prof = Core.findProfileById(idPerfil);
					if(prof != null && prof.getFirstPage() != null) {
						Action action = prof.getFirstPage();
						p[0] = action.getApplication().getDad();
						p[1] = action.getPage();
						p[2] = action.getAction();
					}
				}
			}catch (Exception e) {
				
				System.err.println("EnvController line535:"+e.getLocalizedMessage());
				e.printStackTrace();
			}
			
			this.addQueryString("dad", app);
			return this.redirect(p[0], p[1], p[2],this.queryString());
		}
		return this.redirectError();
	}
	
//	private Response postToPgStudio(Application env) throws Exception {	
//		// make sure cookies is turn on
//		CookieHandler.setDefault(new CookieManager());
//		String urlParams = "dbURL=" + "kriolplat06.gov.cv"
//				+ "&dbPort=7716"
//				+ "&dbName=" + "kriol116"
//				+ "&username=" + "emanuel.j.pereira@nosi.cv"
//				+ "&password=" + "TMOSFRUH2";
//		String result = this.sendPost("https://kriolbd.igrp.cv/login", urlParams);
//
////		result = result.replaceAll("src=\"", "src=\"//kriolbd.igrp.cv/");
////		result = result.replaceAll("href=\"", "href=\"//kriolbd.igrp.cv/");
////		result = result.replaceAll("//kriolbd.igrp.cv/javascript:''", "javascript:''");
//		System.out.println(result);
////		Response resp = new Response();
////		resp.setContent(result);
////		resp.setType(4);
////		resp.setContentType(Response.FORMAT_HTML);
//		String dbToken = "b90b578310b976db3caa4900348d57c76ec535ea30e37b5f0f5ce00febce5720a19579e28bc7fb35505c2565346fd2b50c5d04d2b5319b69121aa8f3247bb857f9e0c1e843c0896b540b508168d0f1c596aa2c39e360f6224cb51b03d293266f3cb005a65dc6c31b8beed5c40f41d165a1ed655c06fbaacb05729b7d3b3061d02d390ba2f5fb7d3522cb5421272d12ae5a07443963ebaff4";     
//		String dbVersion = "100004";    
//		return this.redirectToUrl("https://kriolbd.igrp.cv/login&dbToken="+dbToken);
//	}

	
	
//	private String sendPost(String url, String postParams) throws Exception {
//		byte[] postData = postParams.getBytes();
//	 	URL obj = new URL(url);
//		HttpsURLConnection conn = (HttpsURLConnection) obj.openConnection();
//
//		conn.setUseCaches(false);
//		conn.setRequestMethod("POST");
//		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//		conn.setRequestProperty("Content-Length", Integer.toString(postData.length));
//		conn.setRequestProperty("User-Agent", Igrp.getInstance().getRequest().getHeader("User-Agent"));
//		conn.setInstanceFollowRedirects(true);
//		conn.setDoOutput(true);
//		conn.setDoInput(true);
//		DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
//		wr.write(postData);
//		wr.flush();
//		wr.close();
//
//		int responseCode = conn.getResponseCode();
//		if(responseCode == HttpURLConnection.HTTP_OK) {
//			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			String inputLine;
//			StringBuffer response = new StringBuffer();
//	
//			while ((inputLine = in.readLine()) != null) {
//				response.append(inputLine);
//			}
//			in.close();
//			return response.toString();
//		}else {
//			Core.setMessageError();
//		}
//		return "";
//		
//	}
	
	/** Integration with IGRP-PLSQL Apps **
	 * */
	// Begin
	private void getAllApps(List<IgrpPLSQLApp> allowApps /*INOUT var*/, List<IgrpPLSQLApp> denyApps  /*INOUT var*/) {
		try {
			
			Properties properties =  ConfigApp.getInstance().loadConfig("common", "main.xml");
			String baseUrl = properties.getProperty("igrp.plsql.url");
			if(baseUrl == null || baseUrl.isEmpty())
				throw new Exception("Invalid url ...");
			
			User u = Core.getCurrentUser();
			String endpoint = baseUrl  + "?_t=" + Base64.getEncoder().encodeToString((u.getUser_name() + ":" + u.getValid_until()).getBytes());
			
			/*String endpoint = baseUrl + ((nosi.webapps.igrp.dao.User)Igrp.getInstance().getUser().getIdentity()).getEmail();
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
			}*/
			
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
			//e.printStackTrace();
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


	/*----#end-code----*/
}
