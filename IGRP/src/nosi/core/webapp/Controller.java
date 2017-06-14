package nosi.core.webapp;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import nosi.core.exception.NotFoundHttpException;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.Route;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Controller {
	
	private View view;
	
	private boolean isRedirect; // To specify when to redirect or render the content ... (Detected by the bug with flash message)
	
	public Controller(){
		this.view = null;
		this.isRedirect = false; // Default value ...
	}
	
	protected final void renderView(View view, boolean isRenderPartial) throws IOException{ // renderiza a view e aplica ou nao um layout
		if(!this.isRedirect){ // (Bug to fixe) dont render content if redirect
			this.view = view;
			view.setContext(this); // associa controller ao view
			this.view.render();
			String result = this.view.getPage().renderContent(!isRenderPartial);
			Igrp app = Igrp.getInstance();
			app.getResponse().setContentType("text/xml;charset=UTF-8");
			app.getResponse().getWriter().append(result);
		}
	}
	
	protected final void renderView(View view) throws IOException{ // Overload ...
		this.renderView(view, false);
	}
	
	private final void redirect_(String url){
		this.isRedirect = true;
		try {
			Igrp.getInstance().getResponse().sendRedirect("webapps" + url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected final void redirect(String app, String page, String action, String qs) throws IOException{
		this.redirect_(Route.toUrl(app, page, action, qs));
	}
	
	protected final void redirect(String r, String qs) throws IOException{
		this.redirect_(Route.toUrl(r, qs));
	}
	
	protected final void redirect(String r){
		this.redirect_(Route.toUrl(r));
	}
	
	protected final void redirect(String app, String page, String action) throws IOException{
		this.redirect_(Route.toUrl(app, page, action));
	}
	
	protected final void redirect(String app, String page, String action, String []paramNames, String []paramValues) throws IOException{
		this.redirect_(Route.toUrl(app, page, action, paramNames, paramValues));
	}
	
	protected final void redirectToUrl(String url){
		this.isRedirect = true;
		try {
			Igrp.getInstance().getResponse().sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public View getView(){
		return this.view;
	}
	
	// ... main statics methods ...
	
	public static void initControllerNRunAction() throws IOException{
		resolveRoute(); // (1)
		run(); // (2)
	}
	
	private static void resolveRoute() throws IOException{
		Igrp app = Igrp.getInstance();
		String r = app.getRequest().getParameter("r");// Catch always the first "r" parameter in query string
		String auxPattern = "([a-zA-Z]+([0-9]*(_{1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
			if(r != null && r.matches(auxPattern + "/" + auxPattern + "/" + auxPattern)){
				String []aux = r.split("/");
				app.setCurrentAppName(aux[0]);
				app.setCurrentPageName(aux[1]);
				app.setCurrentActionName(aux[2]);
			}else{
				throw new ServerErrorHttpException("The route format is invalid.");
			}
	}
	
	private static void load(String ...params){ // load and apply some dependency injection ...
		String controllerPath = params[0];
		String actionName = params[1];
		try {
			Class c = Class.forName(controllerPath);
			Object controller = c.newInstance();
			Igrp.getInstance().setCurrentController((Controller) controller); // store the requested contoller 
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
	
	private static void run(){ 
		Igrp app = Igrp.getInstance();
		String auxAppName = "";
		String auxActionName = "";
		String auxPageName = "";
		String auxcontrollerPath = "";
		for(String aux : app.getCurrentAppName().split("-"))
			auxAppName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		for(String aux : app.getCurrentActionName().split("-"))
			auxActionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		String splitPageName = "";
		for(String aux : app.getCurrentPageName().split("-")){
			auxPageName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			splitPageName += aux;
		}
		auxActionName = "action" + auxActionName;
		auxcontrollerPath = "nosi.webapps." + auxAppName.toLowerCase() + ".pages." + auxPageName.toLowerCase() + "." + auxPageName + "Controller";
		Map<String, String> result = new HashMap<String, String>();
		result.put("controllerPath", auxcontrollerPath);
		result.put("actionName", auxActionName);
		
		load(auxcontrollerPath, auxActionName); // :-)
	}
	
	//... Others methods ...
	
}
