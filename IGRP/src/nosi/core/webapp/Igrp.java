package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 14, 2017
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXB;
import java.io.File;
import nosi.core.config.AppConfig;
import nosi.core.config.Config;
import nosi.core.config.DbConfig;
import nosi.core.config.DbInfo;
import nosi.core.servlet.IgrpServlet;
import nosi.webapps.igrp.pages.migrate.Migrate;

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
	private DbConfig dbConfig;
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
	
	public void loadAppConfig(){
		String path = this.servlet.getServletContext().getRealPath("/WEB-INF/config/app/app.xml");
		File file = new File(path);
		this.appConfig = JAXB.unmarshal(file, AppConfig.class);		

		String path_db = this.servlet.getServletContext().getRealPath("/WEB-INF/config/db/db.xml");
		File file_db = new File(path_db);
		this.dbConfig = JAXB.unmarshal(file_db, DbConfig.class);
	}
	
	public DbConfig getDbConfig() {
		return dbConfig;
	}

	public void setDbConfig(DbConfig dbConfig) {
		this.dbConfig = dbConfig;
	}

	public AppConfig getAppConfig(){
		return this.appConfig;
	}
	
	public void saveAppConfig(AppConfig appconfig,Migrate model){
		String path = this.servlet.getServletContext().getRealPath("/WEB-INF/config/app/app.xml");
		File file = new File(path);
		JAXB.marshal(appconfig, file);
		
		path = appconfig.getProject_loc()+"/WebContent/WEB-INF/config/app/app.xml";
		file = new File(path);
		JAXB.marshal(appconfig, file);
		
		List<DbInfo> listDbI = new ArrayList<>();
		DbInfo dbI = new DbInfo();
		dbI.setDefault_db("true");
		dbI.setConnectionName(model.getTipo_base_dados());
		dbI.setDbmsName(model.getTipo_base_dados());
		dbI.setDbName(model.getNome_de_bade_dados());
		dbI.setHostName(model.getHostname());
		dbI.setPassword(model.getPassword());
		dbI.setUser(model.getUsername());
		dbI.setPort(model.getPort());
		if(!this.getDbConfig().getDbInfo().contains(dbI)){
			listDbI.add(dbI);
		}
		for(DbInfo db:this.getDbConfig().getDbInfo()){
			db.setDefault_db("false");
			if(db.getDbmsName().equals(model.getTipo_base_dados())){
				db.setDefault_db("true");
				db.setConnectionName(model.getTipo_base_dados());
				db.setDbmsName(model.getTipo_base_dados());
				db.setDbName(model.getNome_de_bade_dados());
				db.setHostName(model.getHostname());
				db.setPassword(model.getPassword());
				db.setUser(model.getUsername());
				db.setPort(model.getPort());
			}
			listDbI.add(db);
		}
		this.dbConfig.setDbInfo(listDbI);
		path = this.servlet.getServletContext().getRealPath("/WEB-INF/config/db/db.xml");
		file = new File(path);
		JAXB.marshal(this.dbConfig, file);
		
		path = appconfig.getProject_loc()+"/WebContent/WEB-INF/config/db/db.xml";
		file = new File(path);
		JAXB.marshal(this.dbConfig, file);
	}
}