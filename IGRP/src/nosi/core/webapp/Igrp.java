package nosi.core.webapp;

import nosi.core.servlet.IgrpServlet;
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
import nosi.core.dao.IgrpDb;
import nosi.core.exception.NotFoundHttpException;
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
		if(r!=null){
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
		
		this.load(this.convertRoute());
		
	}
	
	private Map<String, String> convertRoute(){
		this.currentActionName = "create-user";
		this.currentPageName = "default-pagina";
		this.currentAppName = "igrp-sis";
		//
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
		
		
		System.out.println(auxActionName);
		System.out.println(auxcontrollerPath);
		
		System.exit(1);
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("controllerPath", auxcontrollerPath);
		result.put("actionName", auxActionName);
		
		return result; // because i need to return 2 variable in one result statement ... 
		
	}
	
	private void load(Map<String, String> m){ // load and apply some dependency injection ...
		
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
					
					if(!parameter.getType().getGenericSuperclass().getTypeName().equals("java.lang.Object") && parameter.getAnnotation(QSParam.class) != null){
						
							// Dependency Injection for simple vars ...
							if(parameter.getType().isArray()){
								
								String []result = Igrp.getInstance().getRequest().getParameterValues(parameter.getAnnotation(QSParam.class).qsParamName());
								paramValues.add(result);
								
							}else{
								
								String result = Igrp.getInstance().getRequest().getParameter(parameter.getAnnotation(QSParam.class).qsParamName());
								paramValues.add(result);
							}
						
						}else
							paramValues.add(null);
					}
				}
				
				action.invoke(controller, paramValues.toArray());
				
			}else{
				action.invoke(controller, null);
			}
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SecurityException | IllegalArgumentException | InvocationTargetException e) {
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
