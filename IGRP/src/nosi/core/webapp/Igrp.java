package nosi.core.webapp;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXB;
import java.io.File;
import nosi.core.config.AppConfig;
import nosi.core.dao.IgrpDb;
import nosi.core.servlet.IgrpServlet;
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
	
	// Store all igrp app config. information
	private AppConfig appConfig;
	
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
			
			// load app configuration
			this.loadAppConfig();
			
			// Db pool
			this.igrpDb = new IgrpDb();
			this.igrpDb.init();
			
			this.flashMessage = new FlashMessage(); // Flash Message instance
			
			// User component (Identity)
			this.user = new User();
			this.user.init();
			
		return this;
	}
	
	public void run() throws IOException{ // run the web app 
		if(!this.die)
			this.runController();
		this.exit();
	}
	
	private void exit(){ // Destroy all app components init. before
		this.igrpDb.destroy(); // destroy the Db pool
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

	public IgrpDb getDao(){
		return this.igrpDb;
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
	
	private void loadAppConfig(){
		String path = this.servlet.getServletContext().getRealPath("/WEB-INF/config/app/app.xml");
		File file = new File(path);
		this.appConfig = JAXB.unmarshal(file, AppConfig.class);
	}
	
	public AppConfig getAppConfig(){
		return this.appConfig;
	}
	
}