package nosi.core.config;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.page.Page;
import nosi.core.igrp.mingrations.MigrationIGRPInitConfig;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.helpers.Route;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;

public class Config {

	private final String LINK_XSL_GENERATOR = "images/IGRP/IGRP2.3/app/igrp/generator/Generator.xsl";
	private final String LINK_XSL_HOME_STUDIO = "images/IGRP/IGRP2.3/xsl/IGRP-Studio-home.xsl";
	private final String LINK_XSL_HOME_APP = "images/IGRP/IGRP2.3/xsl/IGRP-homeApp.xsl";
	private final String LINK_XSL_HOME = "images/IGRP/IGRP2.3/xsl/IGRP-home.xsl";
	private final String LINK_XSL_LOGIN ="images/IGRP/IGRP2.3/xsl/IGRP-login.xsl";
	private final String LINK_XSL_MAP_PROCESS = "images/IGRP/IGRP2.3/xsl/IGRP-process.xsl";	
	private final String LINK_XSL_GENERATOR_MCV_FORM = "images/IGRP/IGRP2.3/core/formgen/util/java/crud/XSL_CRUD_FORM_GENERATOR.xsl";
	private final String LINK_XSL_GENERATOR_MCV_LIST = "images/IGRP/IGRP2.3/core/formgen/util/java/crud/XSL_CRUD_LIST_GENERATOR.xsl";
	private final String LINK_XSL_GENERATOR_MCV = "images/IGRP/IGRP2.3/core/formgen/util/java/XSL_GENERATOR.xsl";//For page sql imported
	private final String LINK_XSL_GENERATOR_CRUD = "images/IGRP/IGRP2.3/core/formgen/util/GEN.CRUD.xsl";//Generator XSL for CRUD pages
	private final String LINK_XSL_JSON_GENERATOR = "images/IGRP/IGRP2.3/core/formgen/util/GEN.JSON.xsl";//Generator JSON for CRUD pages
	private final String LINK_XSL_JSON_CONVERT = "images/IGRP/IGRP2.3/core/formgen/util/jsonConverter.xsl";//Convert Page in format XML 2.1 to JSON
	public static final String SECRET_KEY_ENCRYPT_DB = "igrp.conf.db";
	public static final String PATTERN_CONTROLLER_NAME = "(([a-zA-Z]|_)+([0-9]*({1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
	
	private final static String SEPARATOR_FOR_HTTP = "/";
	private final static String SEPARATOR_FOR_FILESYS = File.separator;

	public String getLinkXSLLogin() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_LOGIN;
	}
	public String getLinkXSLGenerator() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_GENERATOR;
	}
	public String getLinkXSLHomeStudio() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_HOME_STUDIO;
	}
	public String getLinkXSLHomeApp() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_HOME_APP;
	}
	public String getLinkXSLHome() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_HOME;
	}
	public String getLinkXSLMapProcess() {
		return this.getLinkImgBase().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_MAP_PROCESS;
	}
	public String getLinkXSLGeneratorMCV() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_GENERATOR_MCV;
	}
	
	public String getLinkXSLGeneratorMCVForm() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_GENERATOR_MCV_FORM;
	}
	
	public String getLinkXSLGeneratorMCVList() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_GENERATOR_MCV_LIST;
	}
	
	public String getLinkXSLGenerator_CRUD() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_GENERATOR_CRUD;
	}
	public String getLinkXSLJsonGenerator() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_JSON_GENERATOR;
	}
	public String getLinkXSLJsonConvert() {
		return this.getBasePathServerXsl().replaceAll("\\\\", SEPARATOR_FOR_HTTP)+this.LINK_XSL_JSON_CONVERT;
	}
	
	public String getUserName() {
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		return (u!=null)?u.getName():"red-igrp";
	}

	public Properties getConfig(){
		Properties configs = new Properties();
		for(nosi.webapps.igrp.dao.Config c: new nosi.webapps.igrp.dao.Config().findAll()){
			configs.put(c.getName(),c.getValue());
		}
		return configs;
	}
	
	public String getBasePathConfig(){
		return "config";
//		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/");
	}
	
	public String getPathLib(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/lib/");
	}
	
	public String getPathExport(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/export/");
	}
	
	public String getBasePathClass(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/classes/");
	}
	
	public String getPathOfImagesFolder() {
		String APP_LINK_IMAGE = this.getLinkImgBase();
	    
	    String deployWarName = "";
	    try {
	    	deployWarName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName().trim();
	    }catch(Exception e) {
	    	
	    }
	    /*
	    Core.setMessageInfo("APP_LINK_IMAGE not is null: " + APP_LINK_IMAGE);
	    
	    Core.setMessageInfo("Nome Servlet: " + Igrp.getInstance().getServlet().getServletContext().getServletContextName());
	    
	    Core.setMessageInfo("Nome war file: " +  deployWarName);
	    */
	    return Igrp.getInstance().getServlet().getServletContext().getRealPath("/images").
	    		replace(deployWarName, APP_LINK_IMAGE);
	}
	
	public String getPathOfXslByPage(Action page) {
		return "images"+SEPARATOR_FOR_FILESYS+"IGRP"+SEPARATOR_FOR_FILESYS+"IGRP"+page.getVersion()+SEPARATOR_FOR_FILESYS+"app"+SEPARATOR_FOR_FILESYS+page.getApplication().getDad().toLowerCase()+SEPARATOR_FOR_FILESYS+page.getPage().toLowerCase();
	}
	
	public String getWorkspace(){
		return Igrp.getInstance().getServlet().getServletContext().getInitParameter("workspace");
	}
	
	public String getEnvironment() {
		String env = Igrp.getInstance().getServlet().getInitParameter("env");
		return env;
	}
	
	public String getAutenticationType(){
		return Igrp.getInstance().getServlet().getInitParameter("authentication_type");
	}

	public String getLinkImgBase() {
		return Igrp.getInstance().getServlet().getServletContext().getInitParameter("images");
	}
	
	public String getLinkImg(){
		String link = getLinkImgBase()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString()+getPageVersion():"images/IGRP/IGRP"+getPageVersion());
		link = link.replaceAll("\\\\", SEPARATOR_FOR_HTTP);
		return link;
	}
	
	public String getVersion(){
		return getConfig().get("version")!=null? getConfig().get("version").toString():"1.0";
	}

	public String getFooterName(){
		return getConfig().get("footer_name")!=null? getConfig().get("footer_name").toString():"2017 - Copyright NOSI";
	}
	public String getWelcomeNote(){
		return getConfig().get("welcome_note")!=null? getConfig().get("welcome_note").toString():"Ola";
	}
	
	public String getPageVersion(){
		String app = Igrp.getInstance().getCurrentAppName();
		String page = Igrp.getInstance().getCurrentPageName();
		String action = Igrp.getInstance().getCurrentActionName();
	
		if(app!=null && page!=null && action!=null && !app.equals("") && !page.equals("") && !action.equals("")){
			Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
			return ac!=null?ac.getVersion():"2.3";		
		}
		return "2.3";
	}
	
	public String getResolveUrl(String app,String page,String action){
		String qs = (Route.getQueryString(action)+"&dad="+new Permission().getCurrentEnv());//Get Query String
		action = Route.resolveAction(action);
		String url = "webapps?r="+EncrypDecrypt.encrypt(app+SEPARATOR_FOR_HTTP+page+SEPARATOR_FOR_HTTP+action)+qs;
		return url;
	}
	
	public String getHostName() {		
		HttpServletRequest req = Igrp.getInstance().getRequest();		
		return req.getRequestURL().toString();
	}
	
	public String getRootPaht(){
		return Igrp.getInstance().getBasePath()+SEPARATOR_FOR_HTTP;
	}

	public HashMap<String,String> getVersions() {
		HashMap<String,String> versions = new HashMap<>();
		versions.put("2.3", "2.3");
		return versions;
	}
	
	public String getLinkPageXsl(Action ac) {
		if(!ac.getApplication().getDad().equalsIgnoreCase("igrp") && !ac.getApplication().getDad().equalsIgnoreCase("igrp_studio")  && !ac.getApplication().getDad().equalsIgnoreCase("tutorial"))
			return this.getRootPaht()+"images/IGRP/IGRP"+this.getPageVersion()+"/app/"+ac.getXsl_src();
		return this.getLinkImgBase()+"images/IGRP/IGRP"+this.getPageVersion()+"/app/"+ac.getXsl_src();
	}
	
	public String getResolvePathPage(String app,String page,String version){
		return this.getLinkImgBase()+"images"+SEPARATOR_FOR_HTTP+"IGRP"+SEPARATOR_FOR_HTTP+"IGRP"+version+SEPARATOR_FOR_HTTP+"app"+SEPARATOR_FOR_HTTP+app.toLowerCase()+SEPARATOR_FOR_HTTP+page.toLowerCase();
	}

	public String getCurrentResolvePathPage(String app,String page,String version){
		return this.getRootPaht()+"images"+SEPARATOR_FOR_HTTP+"IGRP"+SEPARATOR_FOR_HTTP+"IGRP"+version+SEPARATOR_FOR_HTTP+"app"+SEPARATOR_FOR_HTTP+app.toLowerCase()+SEPARATOR_FOR_HTTP+page.toLowerCase();
	}
	
	public String getResolvePathXsl(Action page){
		return getResolvePathPage(page.getApplication().getDad(),page.getPage(),page.getVersion());
	}
	
	public String getResolvePathClass(String app,String page,String version){
		return getResolvePathPage(app, page, version);
	}
	
	public String getDefaultPageController(String app,String title){
		return "package nosi.webapps."+app.toLowerCase()+".pages.defaultpage;\n\n"
				 + "import nosi.webapps.igrp.pages.home.HomeAppView;\n"
				 + "import nosi.webapps.igrp.dao.Application;\n"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Response;\n"
				 + "import nosi.core.webapp.Controller;\n\n"
				 + "public class DefaultPageController extends Controller {	\n"
						+ "\tpublic Response actionIndex() throws IOException{\n"
							+ "\tApplication app = new Application().find().andWhere(\"dad\",\"=\",\""+app+"\").one();\n" 
							+ "\t		if(app!=null && app.getAction()!=null) {\n"
							+ "\t			return this.redirect(app.getDad().toLowerCase(),app.getAction().getPage(), \"index\");\n"
							+ "\t		}\n"
							+ "\tHomeAppView view = new HomeAppView();\n"
							+ "\tview.title = \""+title+"\";\n"
							+ "\treturn this.renderView(view,true);\n"
						+ "\t}\n"
				  + "}";
	}
	
	
	public String getGenTaskController(String app,String processId,String taskId){
		return "package nosi.webapps."+app.toLowerCase()+".process."+processId.toLowerCase()+";\n\n"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Response;\n"
				 + "import javax.servlet.ServletException;\n"
				 + "import nosi.core.webapp.bpmn.BPMNTaskController;\n\n" 
				 + "public class "+taskId+"Controller extends BPMNTaskController {	\n\n"
						+ "\t public Response actionIndex() throws IOException, ServletException{\n"
						+ "\t\t return super.index();\n"
						+ "\t }\n\n"
						+ "\t public Response actionSave() throws IOException, ServletException{\n"
						+ "\t\t return super.save();\n"
						+ "\t }\n\n"+ 
						"\t public Response actionUpdate() throws IOException, ServletException{\n"
						+ "\t\t return super.update();\n"
						+ "\t }\n\n"
				  + "}";
	}
	
	public String getGenTaskController(String app,String processId,String taskId,String formKey){
		if(Core.isNull(formKey))
			return this.getGenTaskController(app, processId, taskId);
		return "package nosi.webapps."+app.toLowerCase()+".process."+processId.toLowerCase()+";\n\n"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Response;\n"
				 + "import javax.servlet.ServletException;\n"
				 + "import nosi.core.webapp.bpmn.BPMNTaskController;\n"
				 + "import nosi.webapps."+app.toLowerCase()+".pages."+formKey.toLowerCase()+"."+formKey+";\n"
				 + "import nosi.webapps."+app.toLowerCase()+".pages."+formKey.toLowerCase()+"."+formKey+"View;\n\n" 
				 + "public class "+taskId+"Controller extends BPMNTaskController {	\n\n"
						+ "\t public Response actionIndex() throws IOException, ServletException, IllegalArgumentException, IllegalAccessException{\n"
						+ "\t\t "+formKey+"View view = new "+formKey+"View();\n"
						+ "\t\t "+formKey+" model = new "+formKey+"();\n"
						+ "\t\t model.load();"
						+ "\t\t return super.index(\""+app+"\", model , view);\n"
						+ "\t }\n\n"
						+ "\t public Response actionSave() throws IOException, ServletException{\n"
						+ "\t\t return super.save();\n"
						+ "\t }\n\n"+ 
						"\t public Response actionUpdate() throws IOException, ServletException{\n"
						+ "\t\t return super.update();\n"
						+ "\t }\n\n"
				  + "}";
	}
	public String getBasePackage(String app) {
		if(app!=null && !app.equals(""))
			return "nosi.webapps." + app.toLowerCase();
		return "nosi.webapps.igrp.pages";
	}
	
	public String getRawBasePathClassWorkspace() {
		return this.getWorkspace() + SEPARATOR_FOR_FILESYS +  "src"+ SEPARATOR_FOR_FILESYS +"main"+ SEPARATOR_FOR_FILESYS +"java"+ SEPARATOR_FOR_FILESYS;
	}

	public String getRawBasePathResourcesWorkspace() {
		return this.getWorkspace() + SEPARATOR_FOR_FILESYS +  "src"+ SEPARATOR_FOR_FILESYS +"main"+ SEPARATOR_FOR_FILESYS +"resources"+ SEPARATOR_FOR_FILESYS;
	}
	
	public String getBasePahtClassWorkspace(String app){
		return this.getRawBasePathClassWorkspace()+ this.getBasePackage(app).replace(".", SEPARATOR_FOR_FILESYS);
	}
	public String getBasePahtClassWorkspace(String app,String page){
		return this.getRawBasePathClassWorkspace()+ Config.getBasePackage(app,page).replace(".", SEPARATOR_FOR_FILESYS);
	}

	private static String getBasePackage(String app,String page) {
		return "nosi.webapps."+app.toLowerCase()+".pages."+page.toLowerCase();
	}

	public String getPathServerClass(String app) {
		return this.getBasePathClass()+"nosi"+File.separator+"webapps"+File.separator+app.toLowerCase()+File.separator;
	}
	public String getBasePathServerXsl(){
		String APP_LINK_IMAGE = null;
		if(Config.isInstall())
			APP_LINK_IMAGE = this.getLinkImgBase();
		if(APP_LINK_IMAGE!=null) {
			APP_LINK_IMAGE = APP_LINK_IMAGE + SEPARATOR_FOR_HTTP;
			String root = "";
			String paths[] = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(File.separator+File.separator);
			if(paths.length <=1) {
				paths = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(File.separator);
			}
			for(int i=0;i<paths.length-1;i++) {
				root += paths[i] + SEPARATOR_FOR_HTTP;
			}
			root += APP_LINK_IMAGE;
			return root;
		}
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
	}
	
	public String getImageAppPath(Action page) {
		return "images"+SEPARATOR_FOR_HTTP+"IGRP"+SEPARATOR_FOR_HTTP+"IGRP2.3"+SEPARATOR_FOR_HTTP+"app"+SEPARATOR_FOR_HTTP+page.getApplication().getDad().toLowerCase()+SEPARATOR_FOR_HTTP+page.getPage().toLowerCase();
	}
	public String getBaseServerPahtXsl(Action page){
		return this.getBasePathServerXsl() + this.getImageAppPath(page);
	}
	
	public String getCurrentBaseServerPahtXsl(Action page) {
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/") + this.getImageAppPath(page);
	}
	
	public String getImageAppPath(Application app) {
		return "images"+SEPARATOR_FOR_HTTP+"IGRP"+SEPARATOR_FOR_HTTP+"IGRP2.3"+SEPARATOR_FOR_HTTP+"app"+SEPARATOR_FOR_HTTP+app.getDad().toLowerCase();
	}
	public String getBaseServerPahtXsl(Application app){
		return this.getBasePathServerXsl() + this.getImageAppPath(app);
	}
	
	public String getBaseHttpServerPahtXsl(Action page){
		String APP_LINK_IMAGE = null;
		if(Config.isInstall())
			APP_LINK_IMAGE = this.getLinkImgBase();
		if(APP_LINK_IMAGE!=null && page!=null) {
			APP_LINK_IMAGE = SEPARATOR_FOR_HTTP + APP_LINK_IMAGE + SEPARATOR_FOR_HTTP;
			return APP_LINK_IMAGE + "images"+ SEPARATOR_FOR_HTTP +"IGRP"+ SEPARATOR_FOR_HTTP + "IGRP" + page.getVersion() + SEPARATOR_FOR_HTTP + "app"+ SEPARATOR_FOR_HTTP +page.getApplication().getDad().toLowerCase() + SEPARATOR_FOR_HTTP + page.getPage().toLowerCase();
		}
		return getBaseServerPahtXsl(page);
	}
	
	public String getBasePahtXslWorkspace(Action page){
		return this.getWorkspace() + File.separator + this.getWebapp() + File.separator + this.getImageAppPath(page);
	}

	public String getBasePahtXslWorkspace(Application app) {
		return this.getWorkspace() + File.separator + this.getWebapp() + File.separator + this.getImageAppPath(app);
	}
	
	public String getWebapp() {
		return "src"+File.separator+"main"+File.separator+"webapp"; 
	}
	
	/** getResourcesConfigDB
	 * 
	 * @return {@code "src"+File.separator+"main"+File.separator+"resources"+File.separator+"config"+File.separator+"db"+File.separator; }
	 */
	public String getResourcesConfigDB() {
		return "src"+File.separator+"main"+File.separator+"resources"+File.separator+"config"+File.separator+"db"+File.separator; 
	}

	public String getPackage(String app, String page,String action) {
		String basePackage = "nosi.webapps." + app.toLowerCase() + ".pages." + page.toLowerCase() + "." + page + "Controller";
		
		if( Core.isNotNull(app)  && Core.isNotNull(page)){
			Action ac = new Action().find().andWhere("application.dad", "=", app.toLowerCase()).andWhere("page", "=", Page.resolvePageName(page)).one();
			if(ac!=null && ac.getPackage_name()!=null) {
				String p = ac.getPackage_name().toLowerCase();
				if(p.endsWith("pages"))
					return ac.getPackage_name().toLowerCase()+"."+ac.getPage().toLowerCase()+ "." + ac.getPage() + "Controller";
				return ac.getPackage_name().toLowerCase()+ "." + ac.getPage() + "Controller";
			}	
		}
		return basePackage;
	}
	
	public String getPackageProcess(String app, String processId,String taskName) {
		String basePackage = "nosi.webapps." + app.toLowerCase() + ".process." + processId.toLowerCase() + "." + taskName + "Controller";
		return basePackage;
	}
	
	public static void configurationApp(){
		if(!isInstall()){
			MigrationIGRPInitConfig.start();
			configSetInstall();
		}
	}
	
	public static boolean isInstall() {
		nosi.webapps.igrp.dao.Config config = null;
		try{
			config = new nosi.webapps.igrp.dao.Config();
			config = config.find().andWhere("name", "=", "install").one();
			return config!=null;
		}catch(Exception e){
			return false;
		}
	}
	
	private static void  configSetInstall(){
		nosi.webapps.igrp.dao.Config config = new nosi.webapps.igrp.dao.Config("install", "ok");
		if(config.insert()!=null){
			System.out.println("IGRP foi instalado com sucesso!");
		}else{
			System.err.println("Nao foi possivel concluir a instação do IGRP!");
		}
	}

	public static String getBaseConnection() {
		return "hibernate-igrp-core";
	}

	public static Object getDatabaseTypes() {
		Map<String,String> tipos = new HashMap<>();
		tipos.put(null, gt("-- Selecione Base de Dados --"));
		tipos.put("mysql", "MySql");
		tipos.put("postgresql", "Postgresql");
		tipos.put("h2", "H2");
		tipos.put("oracle", "Oracle");
		return tipos;
	}
	
	public String getStartReseveCodeAction(String actionName){
		return "/*----#START-PRESERVED-AREA("+actionName.toUpperCase()+")----*/";
	}
	
	public String getEndReserveCode(){
		return "/*----#END-PRESERVED-AREA----*/";
	}
  
	public String getPathConfigDB() {
		return this.getWorkspace() + File.separator +"src"+ File.separator + "main" + File.separator + "resources";
	}
  
	public String getHeader(IHeaderConfig config) {
		return getHeader(config,null);
	}
  
	
	public String getHeader(IHeaderConfig config,Action page) {
		Application app = new Application().find().andWhere("dad","=",new Permission().getCurrentEnv()).one();
		if(config==null) {
			//Use default config
			config = new IHeaderConfig() {
			};
		}
		String target = config.getTarget();
		if(Core.getParam("target") !=null ) {
			target = Core.getParam("target");
		}
		String title = app.getDescription();		
		String link_home = config.getLinkHome();
		if(new Permission().getCurrentEnv().equalsIgnoreCase("igrp_studio")) {
			link_home = config.getLinkHomeStudio();
		}		
		XMLWritter xml = new XMLWritter();
		Random r = new Random();
		xml.setElement("template", app.getTemplate());
		xml.setElement("title", Core.getSwitchNotNullValue(title,config.getTitle()));
		xml.setElement("version",Math.abs(r.nextLong()));
		xml.setElement("link",link_home);
		xml.setElement("link_img",getLinkImg());
		if(Core.isNotNull(target)) {
			xml.setElement("target",target);
		}
		xml.startElement("site");
			xml.setElement("welcome_note",getWelcomeNote());
			xml.setElement("footer_note", getFooterName());
			xml.setElement("user_name", getUserName());
			IGRPToolsBar button = new IGRPToolsBar("button");
			IGRPButton bt = new IGRPButton("Sair", "igrp", "login", "logout", "_self", "exit.png","","");
			bt.setPrefix("webapps?r=");
			button.addButton(bt);
			xml.addXml(button.toXmlButton());
		xml.endElement();
		xml.setElement("app", page!=null?page.getApplication().getDad():app.getDad());
		xml.setElement("page", page!=null?page.getPage():"Form");
		xml.startElement("plsql");
			xml.setElement("action", "1");
			String packageName = page!=null?page.getPackage_name():"";
			int x = page!=null?page.getPackage_name().indexOf("."+page.getPage().toLowerCase()):-1;
			if(x!=-1) {
				packageName = page.getPackage_name().substring(0, page.getPackage_name().indexOf("."+page.getPage().toLowerCase()));
			}
			xml.setElement("package_db", packageName);
			xml.setElement("package_html",page!=null?Page.resolvePageName(page.getPage()):null);
			xml.setElement("package_instance", config.getPackageInstance());
			xml.setElement("with_replace", "false");
			xml.setElement("with_label", "false");
			xml.setElement("with_biztalk", "false");
			xml.setElement("dynamic_menu", "false");
			xml.setElement("copy_menu", "false");
			xml.setElement("package_copy_db", config.getPackageCopyDb());
			xml.setElement("package_copy_html", config.getPackageCopyHtml());
		xml.endElement();
		xml.startElement("navigation");
		xml.writeAttribute("url", "webapps?");
		xml.writeAttribute("prm_app", "prm_app");
		xml.writeAttribute("prm_page", "prm_page");
		xml.writeAttribute("prm_action", "r");
		xml.endElement();
		xml.startElement("slide-menu");
		xml.writeAttribute("file",config.getLinkSileMenu());
		xml.endElement();
		xml.startElement("top_menu");
		xml.writeAttribute("file",config.getLinkTopMenu());
		xml.endElement();
		if(config.getTypeHeader().equals("home")){
			xml.startElement("applications");
			xml.writeAttribute("file",config.getLinkMyApps());
			xml.endElement();
		}
		return xml.toString();
	}
}