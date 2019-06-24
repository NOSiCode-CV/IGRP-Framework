package nosi.webapps.igrp.pages.oauth2openidwso2;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.xml.XMLWritter;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Menu.MenuProfile;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.Igrp;

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;
import java.util.Map.Entry;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

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
					aux = redirect_uri != null && !redirect_uri.isEmpty() ? aux + "&post_logout_redirect_uri=" + redirect_uri : aux;
					
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
		
		url += "?response_type=code&client_id=" + client_id + "&scope=openid&state=TWILIGHT10&redirect_uri=" + redirect_uri;
		
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
		
		if(p != null)
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
				url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=TWILIGHT10&redirect_uri=" + redirect_uri; 			
				
				return url; 
			//} 
		} catch (Exception e) { 
		}
		
		return "#"; 
	} 
	
	
	
	public Response actionMyMenus() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		String currentDad = Core.getParam("p_current_dad");
		String userId = Core.getParam("p_user_id"); 
		String currentOrg = Core.getParam("p_current_org");
		String currentProf = Core.getParam("p_current_prof"); 
		
		 currentDad = "igrp";
		 userId = "2"; 
		 currentOrg = "1";
		 currentProf = "2";
		
		XMLWritter xml_menu = new XMLWritter();
		xml_menu.startElement("menus");
		
		LinkedHashMap<String, List<MenuProfile>> allMenus = new Menu().getMyMenu(currentDad, Core.toInt(userId), Core.toInt(currentOrg), Core.toInt(currentProf)); 
			
			if (allMenus != null) {
				for (Entry<String, List<MenuProfile>> m : allMenus.entrySet()) {
					xml_menu.startElement("menu");
					xml_menu.setElement("title", gt(m.getKey()));
					
					for (MenuProfile main : m.getValue()) {
						if (main.isSubMenuAndSuperMenu()) {
							
							if(main.getType() == 1) { // menu para uma pagina externa e publica 
								String aux = buildMenuUrlByDad( main.getLink());
								if(aux != null)
									xml_menu.setElement("link", aux + "webapps?r=" + main.getLink()); 
								else 
									xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
							}
							else if(main.getType() == 2) { // Fazer sso obrigatorio 
								xml_menu.setElement("link", main.getLink()); 
							}
							else if(main.getType() == 3) {
								xml_menu.setElement("link", "webapps?r=" + main.getLink());
							}
							else {
								xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
							}
							
							xml_menu.setElement("target", main.getTarget());
						}
						xml_menu.setElement("order", "" + main.getOrder());
						xml_menu.startElement("submenu");
						xml_menu.writeAttribute("title", gt(main.getTitle()));
						xml_menu.writeAttribute("id", "" + main.getId());
						
						if(main.getType() == 1) { // menu para uma pagina externa e publica 
							String aux = buildMenuUrlByDad( main.getLink());
							if(aux != null)
								xml_menu.setElement("link", aux + "webapps?r=" + main.getLink()); 
							else 
								xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
						}
						else if(main.getType() == 2) { // Fazer sso obrigatorio 
							xml_menu.setElement("link", main.getLink()); 
						} else if(main.getType() == 3) {
							xml_menu.setElement("link", "webapps?r=" + main.getLink());
						}
						else {
							xml_menu.setElement("link", "webapps?r=" + main.getLink()); 
						}
						
						xml_menu.setElement("title", gt(main.getTitle()));
						xml_menu.setElement("target", main.getTarget());
						xml_menu.setElement("id", "" + main.getId());
						xml_menu.setElement("status", "" + main.getStatus());
						xml_menu.setElement("order", "" + main.getOrder());
						xml_menu.endElement();
					}
					xml_menu.endElement();
				}
			}
			
		xml_menu.endElement();
		this.format = Response.FORMAT_JSON;
		
		return this.renderView(XML.toJSONObject(xml_menu.toString()).toString());
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
	
		

/*----#end-code----*/
}
