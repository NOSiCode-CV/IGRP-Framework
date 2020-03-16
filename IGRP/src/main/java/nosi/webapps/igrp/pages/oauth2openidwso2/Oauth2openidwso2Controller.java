package nosi.webapps.igrp.pages.oauth2openidwso2;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.xml.XMLWritter;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import java.io.Serializable;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Menu.MenuProfile;
import nosi.webapps.igrp.dao.Organization;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.Igrp;

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;
import java.util.Map.Entry;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import com.google.gson.Gson;

import nosi.core.config.Config;
import nosi.core.config.ConfigApp;

/*----#end-code----*/
		
public class Oauth2openidwso2Controller extends Controller {
	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Oauth2openidwso2 model = new Oauth2openidwso2();
		model.load();
		Oauth2openidwso2View view = new Oauth2openidwso2View();
		/*----#start-code(index)----*/ 
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionLogout() throws IOException, IllegalArgumentException, IllegalAccessException{
		Oauth2openidwso2 model = new Oauth2openidwso2();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(logout)----*/ 
		
		// First check if the session exits 
		String sessionValue = (String)Igrp.getInstance().getRequest().getSession().getAttribute("_identity-igrp");
		if(sessionValue != null && !sessionValue.isEmpty()) {
			String logoutUrl = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/logout"; 
			return redirectToUrl(logoutUrl); 
		} 
		
		String oidcIdToken = (String) Core.getFromSession("_oidcIdToken", true); 
		String oidcState = (String) Core.getFromSession("_oidcState", true); 
		
		if(oidcIdToken != null && !oidcIdToken.isEmpty() && oidcState != null && !oidcState.isEmpty()) {
			Properties settings = loadConfig("common", "main.xml"); 
			String r = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
			if(r != null && r.equalsIgnoreCase("true")) {
				String oidcLogout = settings.getProperty("ids.wso2.oauth2.endpoint.logout"); 
				if(oidcLogout != null && !oidcLogout.isEmpty()) {
					String aux = oidcLogout + "?id_token_hint=" + oidcIdToken + "&state=" + oidcState; 
					String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
					String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getName(); 
					aux = redirect_uri != null && !redirect_uri.isEmpty() ? aux + "&post_logout_redirect_uri=" + redirect_uri.replace("IGRP", warName) : aux;
					
					return redirectToUrl(aux); 
				}
			}
		}
		
		Core.setMessageWarning("A serious problem has occured. Please try login and if the problem persist clear your browser cache and try login again ! "); 
		
		return redirect("igrp", "Oauth2openidwso2", "index"); 
		
		/*----#end-code----*/
			
	}
	
	public Response actionSign_in_() throws IOException, IllegalArgumentException, IllegalAccessException{
		Oauth2openidwso2 model = new Oauth2openidwso2();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Oauth2openidwso2","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(sign_in_)----*/
		
		Properties settings = loadConfig("common", "main.xml"); 
		
		String url = settings.getProperty("ids.wso2.oauth2.endpoint.authorize");
		String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
		String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
		
		String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getName(); 
		redirect_uri = redirect_uri.replace("IGRP", warName); 
		
		url += "?response_type=code&client_id=" + client_id + "&scope=openid&state=igrpweb&redirect_uri=" + redirect_uri;
		
		return redirectToUrl(url);
		
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/

		private Properties loadConfig(String filePath, String fileName) {
			String path = new Config().getBasePathConfig() + File.separator + filePath;
			File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath()
					.replaceAll("%20", " "));

			Properties props = new Properties();
			try (FileInputStream fis = new FileInputStream(file)) {
				props.loadFromXML(fis);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return props;
		}
		
		
	public Response actionMyApps() throws IOException, IllegalArgumentException, IllegalAccessException{
		String p_uid =  Core.getParam("p_uid"); 
		
		JSONArray allApps = new JSONArray(); 
		
		List<Profile> p = new Application().getMyAppByEmail(p_uid); 
		
		List<Application> apps = new Application().findAll(); 
		
		int i = 0; 
		
		
		
		if(p != null) {
			for(Application app : apps) {
				JSONObject jsonObject = new JSONObject(); 
				
				jsonObject.put("dad", app.getDad()); 
				jsonObject.put("name", app.getName()); 
				jsonObject.put("description", app.getDescription()); 
				
				String img_src = (Igrp.getInstance().getRequest().getRequestURL() + "").replace(Igrp.getInstance().getRequest().getRequestURI(), "") + Igrp.getInstance().getRequest().getContextPath() + "/images/IGRP/IGRP2.3/assets/img/iconApp/" + app.getImg_src();
				jsonObject.put("img_src", img_src); 
				
				jsonObject.put("link", this.createResponseOauth2OpenIdWso2()); 
				
				Action action = app.getAction(); 
				if(action != null)
					jsonObject.put("action", app.getDad() + "/" + action.getPage() + "/" + action.getAction()); 
				else 
					jsonObject.put("action", "tutorial/DefaultPage/index"); 
				
				if(checkIfExists(app.getDad(), p))
					jsonObject.put("available", "yes"); 
				else
					jsonObject.put("available", "no"); 
				
				allApps.put(i++, jsonObject); 
			}
		}
		
		this.format = Response.FORMAT_JSON; 
		
		return this.renderView(allApps.toString());
	}
	
	private boolean checkIfExists(String dad, List<Profile> apps) {
		boolean flag = false; 
		for(Profile obj : apps) {
			try {
				if(obj.getOrganization().getApplication().getDad().equals(dad)) 
					return true;
			} catch (Exception e) {
			}
		}
		return flag; 
	}
	
	private String createResponseOauth2OpenIdWso2() { 
		try {
			Properties settings = ConfigApp.getInstance().loadConfig("common", "main.xml");
			//String r = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
			String url = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
			//if(r != null && r.equalsIgnoreCase("true") && url != null && !url.isEmpty()) {
				String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
				String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
				url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=igrpweb&redirect_uri=" + redirect_uri; 			
				
				return url; 
			//} 
		} catch (Exception e) { 
		}
		
		return "#"; 
	} 
	
	
	
	public Response actionMyMenus() throws IOException, IllegalArgumentException, IllegalAccessException{	
		
		String json = "{}"; // empty json 
		
		/* String header = Igrp.getInstance().getRequest().getHeader("Authorization"); 
		 nosi.webapps.igrp.dao.Config config = new  nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", "IGRPWEB_INTEGRATION_PLSQL_TOKEN").one(); 
		 if(config != null) { 
			*/  
			 //if(header != null && config.getValue() != null && config.getValue().equals(header)) {
				 
				String currentDad = Core.getParam("p_current_dad");
				String userId = Core.getParam("p_user_id"); 
				String currentOrg = Core.getParam("p_current_org");
				String currentProf = Core.getParam("p_current_prof"); 
				
				Application application = new Application().find().andWhere("plsql_code", "=", currentDad).one(); 
				Organization organization = new Organization().find().andWhere("plsql_code", "=", currentOrg).one();
				ProfileType profileType = new ProfileType().find().andWhere("plsql_code", "=", currentProf).one(); 
				User user = new User().find().andWhere("email", "=", userId).one(); 
				
				try {
					 currentDad = application.getDad(); 
					 userId = user.getId() + ""; 
					 currentOrg = organization.getId() + ""; 
					 currentProf = profileType.getId() + ""; 
				} catch (Exception e) { 
				}
				
				
				 currentDad = "igrp"; 
				 userId = "2";  // email 
				 currentOrg = "1"; 
				 currentProf = "2"; 
				
				
				List<MenuProfile> allMenus = new Menu().getMyMenu(currentDad, Core.toInt(userId), Core.toInt(currentOrg), Core.toInt(currentProf)); 
				List<Oauth2openidwso2Controller.IgrpMenu> myMenus = new ArrayList<Oauth2openidwso2Controller.IgrpMenu>();
					if (allMenus != null) {
						for (MenuProfile m : allMenus) { 
							IgrpMenu igrpMenu = new IgrpMenu(); 
							igrpMenu.setArea(m.getTarget());
							igrpMenu.setId("" + m.getId());
							igrpMenu.setEstado("" + m.getStatus());
							igrpMenu.setImgsrc("");
							igrpMenu.setTitle(m.getTitle());
							igrpMenu.setDescription("");
							igrpMenu.setSelf_id(m.getSelf_id() != null ? m.getSelf_id() + "" : "");
							igrpMenu.setUrl(createOidcEndpoint(m.getApp(), m.getPage(), m.getAction())); 
							
							try {
								if(!igrpMenu.getSelf_id().equals(igrpMenu.getId()) && !checkIfExistsMenus(igrpMenu.getSelf_id(), myMenus)) {
									Menu aux = new Menu().findOne(Core.toInt(igrpMenu.getSelf_id())); 
									if(aux != null) {
										IgrpMenu igrpMenuAux = new IgrpMenu(); 
										igrpMenuAux.setArea(aux.getTarget());
										igrpMenuAux.setId("" + aux.getId());
										igrpMenuAux.setEstado("" + aux.getStatus());
										igrpMenuAux.setImgsrc("");
										igrpMenuAux.setTitle(aux.getDescr());
										igrpMenuAux.setDescription(aux.getDescr());
										igrpMenuAux.setSelf_id("");
										igrpMenuAux.setUrl("#"); 
										
										myMenus.add(igrpMenuAux); 
									}
								}
							} catch (Exception e) {
							}
							
							myMenus.add(igrpMenu); 
							
						}
					}
					
				json = new Gson().toJson(myMenus);
				
			// }
			 
		//}
		
		this.format = Response.FORMAT_JSON;
		
		return this.renderView(json);
	}
	
	private String createOidcEndpoint(String app, String page, String action) { 
		Properties settings = ConfigApp.getInstance().loadCommonConfig();
		String r = settings.getProperty("ids.wso2.oauth2-openid.enabled"); 
		String url = settings.getProperty("ids.wso2.oauth2.endpoint.authorize"); 
		if(r != null && r.equalsIgnoreCase("true") && url != null && !url.isEmpty()) {
			String redirect_uri = settings.getProperty("ids.wso2.oauth2.endpoint.redirect_uri"); 
			String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getName(); 
			redirect_uri = redirect_uri.replace("IGRP", warName); 
			String client_id = settings.getProperty("ids.wso2.oauth2.client_id"); 
			String state = app + "/" + page +  "/" + action; 
			url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=" + state + "&redirect_uri=" + redirect_uri;	
		}
		return url; 
	}
	
	private String buildMenuUrlByDad(String input) {
		String url = null;
		try {
			String []aux = input.split("/");
			String dad = aux[0];
			Application app = Core.findApplicationByDad(dad);
			String u = Igrp.getInstance().getRequest().getRequestURL().toString().replace(Igrp.getInstance().getRequest().getRequestURI(), "");
				
			if(app.getExternal() == 2 && app.getUrl() != null && !app.getUrl().isEmpty()) {
				String customDad = app.getUrl();
				url = u + "/" + customDad + "/app/"; 
			}
			
			if(app.getExternal() == 1)
				url = u + "/" + dad + "/app/"; 
			
		} catch (Exception e) {
		}
		return url;
	}
	
	public static class IgrpMenu implements Serializable{
		
		private String title; 
		private String imgsrc; 
		private String url; 
		private String area;
		private String id;
		private String description; 
		private String estado;
		private String self_id;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getImgsrc() {
			return imgsrc;
		}
		public void setImgsrc(String imgsrc) {
			this.imgsrc = imgsrc;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getArea() {
			return area;
		}
		public void setArea(String area) {
			this.area = area;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getEstado() {
			return estado;
		}
		public void setEstado(String estado) {
			this.estado = estado;
		}
		public String getSelf_id() {
			return self_id;
		}
		public void setSelf_id(String self_id) {
			this.self_id = self_id;
		}
	}
	
	private boolean checkIfExistsMenus(String id, List<IgrpMenu> myMenus) { 
		boolean r = false; 
		try {
			if(myMenus != null) { 
				for(IgrpMenu m : myMenus) { 
					if(id.equals(m.getId())) {
						r = true;
						break;
					}
				}
			}
		} catch (Exception e) { 
		}
		return r; 
	}
		

/*----#end-code----*/
}
