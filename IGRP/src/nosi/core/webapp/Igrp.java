package nosi.core.webapp;

import nosi.core.servlet.IgrpServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.io.File;
import nosi.core.dao.IgrpDb;
import nosi.core.exception.NotFoundHttpException;
import nosi.core.exception.ServerErrorHttpException;;

/**
 * @author Marcel Iekiny
 * Apr 14, 2017
 */
public class Igrp {
	
	private static Igrp app;
	
	private IgrpServlet servlet; // Refer to HttpServlet
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private Controller controller; // Representa instancia de um controller da qual foi feito request ...
	
	private String currentAppName;
	private String currentPageName;
	private String currentActionName;
	
	private String homeUrl;
	private String basePath;
	private String baseRoute;
	
	// Others Web Application Components
	// Db component
	private IgrpDb igrpDb;

	/**/
	
	private Igrp(){
	}
	
	public static Igrp getInstance(){ // Permite definir a classe Igrp como um Singleton
		if(Igrp.app == null){
			Igrp.app = new Igrp();
		}
	return Igrp.app;
	}
	
	// Inicializa os componentes da web app
	public Igrp init(IgrpServlet servlet, HttpServletRequest request, HttpServletResponse response){
			this.servlet = servlet;
			this.request = request;
			this.response = response;
			
			this.basePath = this.request.getContextPath();
			this.baseRoute = this.request.getServletPath();
			this.homeUrl = "app_name/page_name/action_name";
			
			// init of others configuration
			//this.igrpDb = new IgrpDb("igrp", "root", "").newConnection("");
			
		return this;
	}
	
	public void run() throws IOException{ // run the web app 
		this.resolveRoute(); // (1)
		this.runAction(); // (2)
		//this.exit(); // (3)
	}
	
	private void exit(){ // Destroy todos os componentes da applicação
		
	}
	
	private void resolveRoute() throws IOException{
		String r = this.request.getParameter("r");// Catch always the first "r" parameter in query string
		if(r != null && r.matches("[a-zA-Z]{2,255}/[a-zA-Z]{2,255}/[a-zA-Z]{2,255}")){
			String []aux = r.split("/");
			this.currentAppName = aux[0];
			this.currentPageName = aux[1];
			this.currentActionName = aux[2];
			
			if(!this.validateAppName() || !this.validatePageName() || !this.validateActionName())
				throw new NotFoundHttpException("Page not found.");
		}else
			throw new ServerErrorHttpException("The route format is invalid.");
	}
	
	private boolean validateAppName(){
		/*String path = this.request.getRequestURI() + "/src/nosi/webapps/" + this.currentAppName;
		File file = new File(path);
		System.out.println(file.getAbsolutePath());
		System.out.println(file.exists());
		return file.exists();*/
		return true;
	}
	
	private boolean validatePageName(){
		/*File file = new File("src/nosi/webapps/" + this.currentAppName + "/pages/" + this.currentPageName);
		return file.exists();*/
		return true;
	}
	
	private boolean validateActionName(){
		return true;
	}
	
	public void runAction(){ // run a action in the specific controller
		String auxControllerName = this.currentPageName.substring(0, 1).toUpperCase() + this.currentPageName.substring(1) + "Controller";
		String auxActionName = "action" + this.currentActionName.substring(0, 1).toUpperCase() + this.currentActionName.substring(1);
		String controllerPath = "nosi.webapps." + this.currentAppName + ".pages." + this.currentPageName + "." + auxControllerName;
		try {
			
			Class c = Class.forName(controllerPath);
			Object controller = c.newInstance();
			Method action = c.getMethod(auxActionName, null);
			action.invoke(controller, null);
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SecurityException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException e) {
			e.printStackTrace();
		}
	}
	
	public IgrpDb getDao(){
		return this.igrpDb;
	}
	
	public Controller getCurrentController(){
		return this.controller;
	}
	
	public HttpServletResponse getResponse(){
		return this.response;
	}
	
	public HttpServletRequest getRequest(){
		return this.request;
	}
	
	public String getBaseRoute(){
		return this.baseRoute;
	}
	
	public String getBasePath(){
		return this.basePath;
	}
	
	public String getHomeUrl(){
		return this.homeUrl;
	}
	
	public static void main(String []args){
		Igrp.getInstance().runAction();
	}
	
}
