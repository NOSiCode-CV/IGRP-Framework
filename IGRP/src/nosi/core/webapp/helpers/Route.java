package nosi.core.webapp.helpers;

import nosi.core.webapp.Igrp;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class Route {

	public static String toUrl(String app, String page, String action, String qs){
		String aux = "?r=" + app + "/" + page + "/" + action + (qs.equals("") || qs == null ? "" : "&" + qs);
		return aux;
	}
	
	public static String toUrl(String app, String page, String action){
		return Route.toUrl(app, page, action, "");
	}
	
	public static String toUrl(String r, String qs){
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
		String route = Igrp.getInstance().getRequest().getQueryString();
		Igrp.getInstance().getRequest().getSession().setAttribute("_route", route);
	}
	
	public static String previous(){ // Catch the previous url in session
		String result = Igrp.getInstance().getRequest().getSession().getAttribute("_route").toString();
		result = Igrp.getInstance().getBaseRoute() + result;
		return result;
	}
	
	public static String toExternalUrl(){ // (Opcional)
		return "";
	}
	
	public static String home(){
		return "";
		//return Route.toUrl(Igrp.getInstance().getHomeUrl());
	}
	
}
