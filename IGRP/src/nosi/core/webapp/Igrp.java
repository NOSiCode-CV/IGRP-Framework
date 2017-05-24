package nosi.core.webapp;

import nosi.core.servlet.IgrpServlet;
import nosi.core.webapp.helpers.Permission;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.io.File;

import nosi.core.config.IgrpDbMigrate;
import nosi.core.dao.IgrpDb;
import nosi.core.exception.NotFoundHttpException;
import nosi.core.exception.PermissionException;
import nosi.core.exception.ServerErrorHttpException;

/**
 * @author Marcel Iekiny
 * Apr 14, 2017
 */
public class Igrp {
	
	private static Igrp app;
	
	private IgrpServlet servlet; // Refer to HttpServlet
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private Controller controller; // Current controller ...
	
	private String currentAppName;
	private String currentPageName;
	private String currentActionName;
	
	private String homeUrl;
	private String basePath;
	private String baseRoute;
	
	private boolean die;
	
	// Others Web Application Components
	// Db component
	private IgrpDb igrpDb;
	
	//Flash Message
	private FlashMessage flashMessage;
	
	// User component (Identity)
	private User user;
	
	
	private Igrp(){ // Private and empty default constructor ... allow Singleton class
	}
	
	public static Igrp getInstance(){ // Allow us to define the only one instance of Igrp class as a Singleton
		if(Igrp.app == null){
			Igrp.app = new Igrp();
		}
	return Igrp.app;
	}
	
	// Inicialize the web app components
	public Igrp init(IgrpServlet servlet, HttpServletRequest request, HttpServletResponse response){
			this.servlet = servlet;
			this.request = request;
			this.response = response;
			
			this.basePath = this.request.getContextPath();
			this.baseRoute = this.request.getServletPath();
			this.homeUrl = "igrp/home/index";
			
			// init of others configuration
			this.igrpDb = new IgrpDb();
			this.igrpDb.init();
			
			this.flashMessage = new FlashMessage(); // Flash Message instance
			
			// User component (Identity)
			this.user = new User();
			this.user.init();
			
		return this;
	}
	
	public void run() throws IOException{ // run the web app 
		if(!this.die){
			this.resolveRoute(); // (1)
			this.runAction(); // (2)
		}
		this.exit(); // (3)
	}
	
	private void exit(){ // Destroy todos os componentes da applicação
		this.igrpDb.destroy(); // destroy the Db pool
		this.die = false;
	}
	
	private void resolveRoute() throws IOException{
		String r = this.request.getParameter("r");// Catch always the first "r" parameter in query string
		String auxPattern = "([a-zA-Z]+([0-9]*(_{1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
		
			if(r != null && r.matches(auxPattern + "/" + auxPattern + "/" + auxPattern)){
				String []aux = r.split("/");
				this.currentAppName = aux[0];
				this.currentPageName = aux[1];
				this.currentActionName = aux[2];
				
				/*if(!this.validateAppName())
					throw new NotFoundHttpException("Aplicação inválida.");
				if(!this.validatePageName())
					throw new NotFoundHttpException("Esta página não foi encontrada.");*/
			}else{
				throw new ServerErrorHttpException("The route format is invalid.");
			}
		
	}
	
	private boolean validateAppName(){
		String path = this.servlet.getServletContext().getRealPath("/WEB-INF/classes/nosi/webapps/" + this.currentAppName);
		File file = null;
		try{
			file = new File(path);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		 file = new File(path);
		return file.exists() && file.isDirectory();
	}
	
	private boolean validatePageName(){
		String path = this.servlet.getServletContext().getRealPath("/WEB-INF/classes/nosi/webapps/" + this.currentAppName + "/pages/" + this.currentPageName);
		System.out.println(path);
		File file = null;
		try{
			file = new File(path);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		/*
		 * Validação com base de dados
		 * */
		return file.exists() && file.isDirectory();
	}
	
	public void runAction(){ // run a action in the specific controller
		this.load(this.convertRoute());
	}
	
	private Map<String, String> convertRoute(){
		String auxAppName = "";
		String auxActionName = "";
		String auxPageName = "";
		String auxcontrollerPath = "";
		for(String aux : this.currentAppName.split("-"))
			auxAppName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		
		for(String aux : this.currentActionName.split("-"))
			auxActionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		
		String splitPageName = "";
		
		for(String aux : this.currentPageName.split("-")){
			auxPageName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			splitPageName += aux;
		}
		
		auxActionName = "action" + auxActionName;
		auxcontrollerPath = "nosi.webapps." + auxAppName.toLowerCase() + ".pages." + auxPageName.toLowerCase() + "." + auxPageName + "Controller";
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("controllerPath", auxcontrollerPath);
		result.put("actionName", auxActionName);
		return result; // because i need to return 2 variable in one result statement ... 
		
	}
	
	private void load(Map<String, String> m){ // load and apply some dependency injection ...
		/*if(!Permission.isPermition(this.currentAppName,this.currentPageName,this.currentActionName))
			throw new PermissionException("Nao tem permissao para aceder esta aplicacao");
			*/
		String controllerPath = m.get("controllerPath");
		String actionName = m.get("actionName");
		
		try {
			Class c = Class.forName(controllerPath);
			Object controller = c.newInstance();
			Method action = null;
			ArrayList paramValues = new ArrayList();
			
			
			for(Method aux : c.getDeclaredMethods())
				if(aux.getName().equals(actionName))
					action = aux;
			
			int countParameter = action.getParameterCount();
			
			if(countParameter > 0){
				
				for(Parameter parameter : action.getParameters()){
					
					if(parameter.getType().getSuperclass().getName().equals("nosi.core.webapp.Model")){
						
						// Dependency Injection for models
						
						Class c_ = Class.forName(parameter.getType().getName());
						nosi.core.webapp.Model model = (Model) c_.newInstance();
						model.load();
						paramValues.add(model);
						
					}else{
					
					if(parameter.getType().getName().equals("java.lang.String") && parameter.getAnnotation(RParam.class) != null){
						
							// Dependency Injection for simple vars ...
							if(parameter.getType().isArray()){
								
								String []result = Igrp.getInstance().getRequest().getParameterValues(parameter.getAnnotation(RParam.class).rParamName());
								paramValues.add(result);
								
							}else{
								
								String result = Igrp.getInstance().getRequest().getParameter(parameter.getAnnotation(RParam.class).rParamName());
								paramValues.add(result);
							}
						
						}else
							paramValues.add(null);
					}
				}
				action.invoke(controller, paramValues.toArray());
				
			}else{
				action.invoke(controller);
			}
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SecurityException | IllegalArgumentException | 
				InvocationTargetException | NullPointerException e) {
			e.printStackTrace();
			throw new NotFoundHttpException("Página não encontrada.");
		}
	}
	
	
	public IgrpServlet getServlet() {
		return servlet;
	}

	public void setServlet(IgrpServlet servlet) {
		this.servlet = servlet;
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
	
	public FlashMessage getFlashMessage(){
		return this.flashMessage;
	}

	
	public String getCurrentAppName() {
		return currentAppName;
	}

	public void setCurrentAppName(String currentAppName) {
		this.currentAppName = currentAppName;
	}

	public String getCurrentPageName() {
		return currentPageName;
	}

	public void setCurrentPageName(String currentPageName) {
		this.currentPageName = currentPageName;
	}

	public String getCurrentActionName() {
		return currentActionName;
	}

	public void setCurrentActionName(String currentActionName) {
		this.currentActionName = currentActionName;
	}
	
	public User getUser(){
		return this.user;
	}

	public void die(){
		this.die = true;
	}

}