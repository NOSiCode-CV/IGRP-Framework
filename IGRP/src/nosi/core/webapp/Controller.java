package nosi.core.webapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.ServletException;

import nosi.core.config.Config;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.gui.page.Page;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.helpers.Route;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	
	protected String format = Response.FORMAT_XML;
	protected String encoding = Response.CHARSET_UTF_8;
	
	private Response responseWrapper;
	
	public Response getResponseWrapper() {
		return responseWrapper;
	}

	public void setResponseWrapper(Response responseWrapper) {
		this.responseWrapper = responseWrapper;
	}

	public Controller(){this.view = null;}
	
	protected final Response renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout 
		Response resp = new Response();
		this.view = view;
		view.setContext(this); // associa controller ao view
		this.view.render();
		String result = this.view.getPage().renderContent(!isRenderPartial);
		resp.setType(1);
		resp.setCharacterEncoding(Response.CHARSET_UTF_8);
		resp.setContentType(Response.FORMAT_XML);
		resp.setHttpStatus(HttpStatus.STATUS_200);
		resp.setContent(result);
	return resp;
	}
	
	protected final Response renderView(View view) throws IOException{ // Overload ...
		return this.renderView(view, false);
	}
	
	protected final Response renderView(String content){
		Response resp = new Response();
		resp.setType(1);
		resp.setCharacterEncoding(this.encoding);
		resp.setContentType(this.format);
		resp.setContent(content);
		return resp;
	}
	
	private final Response redirect_(String url){
		Response resp = new Response();
		resp.setType(2);
		resp.setContentType(this.format);
		resp.setUrl(url);
		resp.setHttpStatus(HttpStatus.STATUS_200);
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
	
	protected final Response redirectError() throws IOException{
		return this.redirect_(Route.toUrl("igrp", "error-page", "exception"));
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
		resp.setUrl(url);
		resp.setHttpStatus(HttpStatus.STATUS_200);
		return resp;
	}
	
	protected final Response forward(String app, String page, String action) {
		Response resp = new Response();
		resp.setType(3);
		resp.setUrl(Route.toUrl(app, page, action));
		return resp;
	}
	
	protected final Response sendFile(File file, String name, String contentType, boolean download) {
		byte []content = null;
		try {
			content = new byte[(int)file.length()];
			FileInputStream is = new FileInputStream(file);
			is.read(content);
			is.close();
			return this.xSend(content, name, contentType, download);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return this.xSend(content, name, contentType, download); // send it as stream ... binary file 
	}
	// send it as stream ... binary file 
	protected final Response xSend(byte []file, String name, String contentType, boolean download) {
		if(file == null) throw new ServerErrorHttpException();
//		if(/*name.contains(".") && */contentType != null && !contentType.isEmpty()) throw new IllegalArgumentException("Please verify your fileName and contentType.");
		Response response = new Response();
		if(contentType == null || contentType.isEmpty()) {
			contentType = "application/octet-stream"; // default 
		}else {
			try {
				String extension = "." + contentType.split("/")[1];
				name = (name == null || name.isEmpty() ? "igrp-file" + extension : name + extension);
			}catch(Exception e) {
				contentType = "application/octet-stream";
				e.printStackTrace();
			}
		}
		Igrp.getInstance().getResponse().addHeader("Content-Description", "File Transfer");
		if(download)
			Igrp.getInstance().getResponse().addHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
		else
			Igrp.getInstance().getResponse().addHeader("Content-Disposition", "inline");
		response.setType(1);
		response.setContentLength(file.length);
		response.setContentType(contentType);
		response.setStream(file);
		
		return response;
	}
	
	public View getView(){
		return this.view;
	}
	
	// ... main statics methods ...
	
	public static void initControllerNRunAction() throws IOException{
		resolveRoute(); // (1)
		prepareResponse(); // (2)
	}
	
	private static void prepareResponse() throws IOException{
		 Object obj = run();
		 if(obj != null && obj instanceof Response){
			 Response resp = (Response) obj;
			 Igrp.getInstance().getCurrentController().setResponseWrapper(resp);
				//Igrp.getInstance().setResponse(resp);
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
		if(app!=null && app.getCurrentAppName()!=null && app.getCurrentActionName()!=null && app.getCurrentPageName()!=null ){
			for(String aux : app.getCurrentAppName().split("-"))
				auxAppName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			for(String aux : app.getCurrentActionName().split("-"))
				auxActionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			for(String aux : app.getCurrentPageName().split("-")){
				auxPageName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			}
			auxActionName = "action" + auxActionName;
			auxcontrollerPath = Config.getPackage(auxAppName,auxPageName,auxActionName);
		}else {
			auxActionName = "actionIndex";
			auxcontrollerPath = Config.getPackage("igrp","Home",auxActionName);
			System.out.println("path:"+auxcontrollerPath+";ac:"+auxActionName);
		}
		
		return Page.loadPage(auxcontrollerPath, auxActionName); // :-)
	}
	
	public static void sendResponse() {
		Response responseWrapper = Igrp.getInstance().getCurrentController().getResponseWrapper();
		try {
			switch(responseWrapper.getType()) {
			case 1: // render it 
					try {
						if(responseWrapper.getStream() != null && responseWrapper.getStream().length > 0) {
							Igrp.getInstance().getResponse().getOutputStream().write(responseWrapper.getStream());
						}else {
							Igrp.getInstance().getResponse().getWriter().append(responseWrapper.getContent());
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
				case 2: // redirect 
					boolean isAbsolute = false;
					try {
						String url = responseWrapper.getUrl();
						try {
							java.net.URI uri = java.net.URI.create(url);
							isAbsolute = uri.isAbsolute() && uri.toURL().getProtocol().matches("(?i)(http|https)");
						} catch (MalformedURLException e) { // Ensure the url format is perfect ...
							isAbsolute = false;
						}
						Igrp.getInstance().getResponse().sendRedirect( isAbsolute == true ? url : "webapps" + url);
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
				case 3: // forward 
					try {
						Igrp.getInstance().getRequest().getRequestDispatcher("webapps" + responseWrapper.getUrl()).forward(Igrp.getInstance().getRequest(), Igrp.getInstance().getResponse());
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					} 
					break;
				default:;
			}
		}catch(java.lang.NullPointerException e) {
			e.printStackTrace();
		}
	}
	
	//... Others methods ...
	
}
