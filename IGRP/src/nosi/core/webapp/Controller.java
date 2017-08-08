package nosi.core.webapp;

import java.io.IOException;

import nosi.core.config.Config;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.gui.page.Page;
import nosi.core.webapp.helpers.Route;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	protected String format = Response.FORMAT_XML;
	private boolean isRedirect; // To specify when to redirect or render the content ... (Detected by the bug with flash message)
	
	public Controller(){
		this.view = null;
		this.isRedirect = false; // Default value ...
	}
	
	protected final Response renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout
		Response resp = new Response();
		if(!this.isRedirect){ // (Bug to fixe) dont render content if redirect
			this.view = view;
			view.setContext(this); // associa controller ao view
			this.view.render();
			String result = this.view.getPage().renderContent(!isRenderPartial);
//			Igrp app = Igrp.getInstance();
//			app.getResponse().setContentType("text/xml;charset=UTF-8");
//			app.getResponse().getWriter().append(result);
			resp.setFormat(this.format);
			resp.setType(1);
			resp.setContent(result);
		}
		return resp;
	}
	
	protected final Response renderView(View view) throws IOException{ // Overload ...
		return this.renderView(view, false);
	}
	
	private final Response redirect_(String url){
		Response resp = new Response();
		resp.setType(2);
		resp.setFormat(this.format);
		this.isRedirect = true;
		try {
			Igrp.getInstance().getResponse().sendRedirect("webapps" + url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resp;
	}
	
	protected final Response redirect(String app, String page, String action, String qs) throws IOException{
		return this.redirect_(Route.toUrl(app, page, action, qs));
	}
	
	protected final Response redirect(String r, String qs) throws IOException{
		return this.redirect_(Route.toUrl(r, qs));
	}
	
	protected final Response redirect(String r){
		return this.redirect_(Route.toUrl(r));
	}
	
	protected final Response redirect(String app, String page, String action) throws IOException{
		return this.redirect_(Route.toUrl(app, page, action));
	}
	
	protected final Response redirect(String app, String page, String action, String []paramNames, String []paramValues) throws IOException{
		return this.redirect_(Route.toUrl(app, page, action, paramNames, paramValues));
	}
	
	protected final Response redirectToUrl(String url){
		Response resp = new Response();
		resp.setType(2);
		resp.setFormat(this.format);
		this.isRedirect = true;
		try {
			Igrp.getInstance().getResponse().sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resp;
	}
	
	public View getView(){
		return this.view;
	}
	
	// ... main statics methods ...
	
	public static void initControllerNRunAction() throws IOException{
		resolveRoute(); // (1)
		render(); // (3)
	}
	
	private static void render() throws IOException{
		 Object obj = run();
		 if(obj instanceof Response){
			 Response resp = (Response) obj;
			 if(resp!=null && resp.getType()==1){
					Igrp app = Igrp.getInstance();
					app.getResponse().setContentType(resp.getFormat());
					app.getResponse().getWriter().append(resp.getContent());
			 }
		 }
	}
	
	private static void resolveRoute() throws IOException{
		Igrp app = Igrp.getInstance();
		String r = app.getRequest().getParameter("r");// Catch always the first "r" parameter in query string
		if(r!=null){
			String auxPattern = "([a-zA-Z]+([0-9]*(_{1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
			if(r.matches(auxPattern + "/" + auxPattern + "/" + auxPattern)){
				String []aux = r.split("/");
				app.setCurrentAppName(aux[0]);
				app.setCurrentPageName(aux[1]);
				app.setCurrentActionName(aux[2]);
			}else{			
				throw new ServerErrorHttpException("The route format is invalid");
			}
		}
	}
	
	private static Object run(){ 
		Igrp app = Igrp.getInstance();
		String auxAppName = "";
		String auxPageName = "";
		String  auxcontrollerPath="";
		String auxActionName = "";
		for(String aux : app.getCurrentAppName().split("-"))
			auxAppName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		for(String aux : app.getCurrentActionName().split("-"))
			auxActionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		for(String aux : app.getCurrentPageName().split("-")){
			auxPageName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		}
		auxActionName = "action" + auxActionName;
		auxcontrollerPath = Config.getPackage(auxAppName,auxPageName,auxActionName);
		return Page.loadPage(auxcontrollerPath, auxActionName); // :-)
	}
	
	//... Others methods ...
	
}
