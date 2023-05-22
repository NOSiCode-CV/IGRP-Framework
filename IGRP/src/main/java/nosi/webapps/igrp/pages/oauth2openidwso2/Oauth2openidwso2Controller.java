package nosi.webapps.igrp.pages.oauth2openidwso2;


import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/

import java.util.Properties;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.Igrp;

/*----#end-code----*/
		
public class Oauth2openidwso2Controller extends Controller {
	
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Oauth2openidwso2 model = new Oauth2openidwso2();
		model.load();
		Oauth2openidwso2View view = new Oauth2openidwso2View();
		/*----#start-code(index)----*/ 
		String error = Core.getParam("oauth2_openid_error");
		if(error != null)
			Core.setMessageError(error);
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
			Properties settings = this.configApp.getMainSettings(); 
			String r = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value()); 
			if(r != null && r.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value())) {
				String oidcLogout = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT.value()); 
				if(oidcLogout != null && !oidcLogout.isEmpty()) {
					String aux = oidcLogout + "?id_token_hint=" + oidcIdToken + "&state=" + oidcState; 
					String redirect_uri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value()); 
					String warName = Core.getDeployedWarName(); 
					aux = redirect_uri != null && !redirect_uri.isEmpty() ? aux + "&post_logout_redirect_uri=" + redirect_uri.replace("/IGRP/", "/"+warName+"/") : aux;
					
					return redirectToUrl(aux); 
				}
			}
		}
		
		Core.setMessageWarning("Error!!! Please try login and if the problem persist clear your browser cache and try login again ! "); 
		
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
		return redirect("igrp", "login", "index");
		/*----#end-code----*/
	}
	
/*----#start-code(custom_actions)----*/
	
/*----#end-code----*/
}
