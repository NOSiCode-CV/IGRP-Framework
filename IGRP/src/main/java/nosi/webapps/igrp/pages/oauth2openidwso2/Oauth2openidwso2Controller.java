package nosi.webapps.igrp.pages.oauth2openidwso2;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Profile;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.Igrp;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import org.json.JSONArray;
import org.json.JSONObject;
import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.gui.components.IGRPButton;

/*----#end-code----*/
		
public class Oauth2openidwso2Controller extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Oauth2openidwso2 model = new Oauth2openidwso2();
		model.load();
		Oauth2openidwso2View view = new Oauth2openidwso2View();
		/*----#start-code(index)----*/
		
		//view.btn_logout= new IGRPButton("Logout","igrp","login","logout&isPublic=0&target=_self","_self","primary|fa-sign-out","","");
		
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
		String logoutUrl = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/logout"; 
		return redirectToUrl(logoutUrl); 
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
		

/*----#end-code----*/
}
