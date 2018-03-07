package nosi.core.webapp.helpers;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class Route {

	public static String toUrl(String app, String page, String action, String qs){
		qs += getQueryString(action);
		String target = "";
		if(Igrp.getInstance().getRequest().getAttribute("target") !=null && Igrp.getInstance().getRequest().getAttribute("target") instanceof String) {
			target = Igrp.getInstance().getRequest().getAttribute("target").toString();
		}else if(Igrp.getInstance().getRequest().getAttribute("target") !=null && Igrp.getInstance().getRequest().getAttribute("target") instanceof String[]) {
			target =  ((String[])Igrp.getInstance().getRequest().getAttribute("target"))[0];
		}
		qs += Core.isNotNull(target)?"&target="+target:"";
		action = resolveAction(action);
		String aux = "?r=" + EncrypDecrypt.encrypt(app+ "/" +page+ "/" +action) + (qs.equals("") || qs == null ? "" : "&"+ qs);
		return aux.replaceAll("&&", "&");
	}
	
	public static String getQueryString(String action) {
		if(action.contains("&")) {
			return action.substring(action.indexOf("&"));
		}
		return "";
	}

	public static String resolveAction(String action) {
		if(action.contains("&"))
			return action.substring(0, action.indexOf("&"));
		return action;
	}

	public static String toUrl(String app, String page, String action){
		return Route.toUrl(app, page, action, "");
	}
	
	public static String toUrl(String r, String qs){
		r = EncrypDecrypt.decrypt(r);
		String []aux = r.split("/");
		return Route.toUrl(aux[0], aux[1], aux[2], qs);
	}
	
	public static String toUrl(String r){
		return Route.toUrl(r, "");
	}
	
	
	public static String toUrl(String app, String page, String action, String []paramNames, String []paramValues){
		String aux = "";
		for(int i = 0; i < paramNames.length; i++){
			if(i > 0 && i < paramNames.length)
				aux += "&";
			aux = aux + paramNames[i] + "=" + paramValues[i];
		}
		return Route.toUrl(app, page, action, aux);
	}
	
	public static void remember(){ // For back button funcionality purpose ...
		String route = new String(Igrp.getInstance().getRequest().getRequestURL() + "?" + Igrp.getInstance().getRequest().getQueryString());
		Igrp.getInstance().getRequest().getSession().setAttribute("_route", route);
	}
	
	public static String previous(){ // Catch the previous url in session
		String result = Igrp.getInstance().getRequest()!=null && Igrp.getInstance().getRequest().getSession()!=null && Igrp.getInstance().getRequest().getSession().getAttribute("_route")!=null? (String) Igrp.getInstance().getRequest().getSession().getAttribute("_route"):null;
		return result != null ? result.toString() : result; // For NullPointerException purpose
	}
	
	public static String toExternalUrl(){ // (Opcional)
		return "";
	}
	
	public static String home(){
		return "";
		//return Route.toUrl(Igrp.getInstance().getHomeUrl());
	}

	public static String urlEncoding(String r) {
		return r.replaceAll(" ", "+");
	}
	
	public static String resolveRParam(String r) {
		if(r!=null && r.contains("&"))
			return r.substring(0, r.indexOf("&"));
		return r;
	}
	
}