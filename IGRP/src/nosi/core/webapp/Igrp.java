package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 14, 2017
 */
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nosi.core.config.Config;
import nosi.core.servlet.IgrpServlet;

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
			this.flashMessage = new FlashMessage(); // Flash Message instance
			
			// User component (Identity)
			this.user = new User();
			this.user.init();
			
		return this;
	}
	
	public void run() throws IOException{ // run the web app 	
		Config.configurationApp();
		if(!this.die){
			this.runController();
		}
		this.exit();
	}
	
	// Send the response ...
	private void exit(){ // Destroy all app components init. before
		this.die = false;
	}
	
	private void runController() throws IOException{
		Controller.initControllerNRunAction();
	}
	
	public IgrpServlet getServlet() {
		return servlet;
	}

	public void setServlet(IgrpServlet servlet) {
		this.servlet = servlet;
	}
	
	public Controller getCurrentController(){
		return this.controller;
	}
	
	public void setCurrentController(Controller controller){
		this.controller = controller;
	}
	
	public HttpServletResponse getResponse(){
		return this.response;
	}
	
	public void setResponse(HttpServletResponse response){
		this.response = response;
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