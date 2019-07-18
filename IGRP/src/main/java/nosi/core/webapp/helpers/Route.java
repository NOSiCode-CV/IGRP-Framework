package nosi.core.webapp.helpers;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.PagesScapePermission;

/**
 * @author Marcel Iekiny Apr 18, 2017
 */
public class Route {

	public static String toUrl(String app, String page, String action_, String qs) {
		String queryString = qs+ getQueryString(action_);
		if (!queryString.contains("target")) {
			String target = "";
			if (Core.getParam("target") != null) {
				target = Core.getParam("target");
			}
			queryString += Core.isNotNull(target) ? "&target=" + target : "";
		}
		queryString = UrlHelper.urlEncoding(queryString);
		String action = resolveAction(action_);
		String url = "";
		if(queryString.contains("dad")) {
			url = Route.getResolveUrl(app, page, action+queryString,null,Core.getParamInt("isPublic").intValue());
		}else {
			url = Route.getResolveUrl(app, page, action+queryString);
		}
		url = url.replaceAll("&&", "&");
		return url;
	}

	public static String getResolveUrl(String app,String page,String action){
		return Route.getResolveUrl(app, page, action, Core.getCurrentDad(),Core.getParamInt("isPublic").intValue());
	}

	public static String getResolveUrl(String app,String page,String action_,String dad,int isPublic){
		String qs = Route.getQueryString(action_);//Get Query String
		if(Core.isNotNull(dad)) {
			qs+="&dad="+dad;
		}
		qs = UrlHelper.urlEncoding(qs);
		String action = Route.resolveAction(action_);
		String url = "";
		if(PagesScapePermission.PAGES_SCAPE_ENCRYPT.contains((app + "/" + page + "/"+action).toLowerCase())) {
			url = "webapps?r="+app+"/"+page+"/"+action+qs;
		}else {
			//if a PAGES_SCAPE_ENCRYPT calls a redirect to a public page, must not encrypt it
			if(qs.contains("isPublic=1")) {
				url = "webapps?r="+app+"/"+page+"/"+action+qs+"&target=_blank";
			}else if(qs.contains("isPublic=2")) {
				url = "webapps?r="+EncrypDecrypt.encrypt(app+"/"+page+"/"+action)+qs+"&target=_blank";
			}else {			
				if(isPublic==1) {
					url = "webapps?r="+app+"/"+page+"/"+action+qs+"&isPublic=1&target=_blank";
				}else if(isPublic==2) {
					url = "webapps?r="+EncrypDecrypt.encrypt(app+"/"+page+"/"+action)+qs+"&isPublic=2&target=_blank";
				}
				else {
					url = "?r="+EncrypDecrypt.encrypt(app+"/"+page+"/"+action)+qs;
				}
			}
		}
		return url;
	}
	
	public static String getQueryString(String action) {
		if (action.contains("&")) {
			return UrlHelper.urlEncoding(action.substring(action.indexOf("&")));
		}
		return "";
	}

	public static String resolveAction(String action) {
		if (action.contains("&"))
			return action.substring(0, action.indexOf("&"));
		return action;
	}

	public static String toUrl(String app, String page, String action) {
		return Route.toUrl(app, page, action, "");
	}

	public static String toUrl(String r, String qs) {
		//r = new EncrypDecrypt().decrypt(r); 
		String[] aux = r.split("/");
		return Route.toUrl(aux[0], aux[1], aux[2], qs);
	}

	public static String toUrl(String r) {
		return Route.toUrl(r, "");
	}

	public static String toUrl(String app, String page, String action, String[] paramNames, String[] paramValues) {
		String aux = "";
		for (int i = 0; i < paramNames.length; i++) {
			if (i > 0 && i < paramNames.length)
				aux += "&";
			aux = aux + paramNames[i] + "=" + paramValues[i];
		}
		return Route.toUrl(app, page, action, aux);
	}

	public static void remember() { // For back button funcionality purpose ...
		String qs = Igrp.getInstance().getRequest().getQueryString();
		//String r = Igrp.getInstance().getRequest().getParameter("r");
		
		
	/*	
		if(r != null && qs != null && new EncrypDecrypt().getWakandaList(r)) 
			qs = qs.replace(r, new EncrypDecrypt().encrypt(r));
		*/
		
		
		String route = new String(Igrp.getInstance().getRequest().getRequestURL() + "?" + qs);
		Igrp.getInstance().getRequest().getSession().setAttribute("_route", route);
	}

	public static String previous() { // Catch the previous url in session
		String result = Igrp.getInstance().getRequest() != null && Igrp.getInstance().getRequest().getSession() != null
				&& Igrp.getInstance().getRequest().getSession().getAttribute("_route") != null
						? (String) Igrp.getInstance().getRequest().getSession().getAttribute("_route")
						: null;
		return result != null ? result.toString() : null; // For NullPointerException purpose
	}

	public static String toExternalUrl() { // (Opcional)
		return "";
	}

	public static String home() {
		return "";
		// return Route.toUrl(Igrp.getInstance().getHomeUrl());
	}

	public static String urlEncoding(String r) {
		return r.replaceAll(" ", "+");
	}

	public static String resolveRParam(String r) {
		if (r != null && r.contains("&"))
			return r.substring(0, r.indexOf("&"));
		return r;
	}

}