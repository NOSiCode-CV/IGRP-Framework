package nosi.core.config;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.page.Page;
import nosi.core.igrp.mingrations.MigrationIGRPInitConfig;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;

public class Config {

	public static final String LINK_XSL_GENERATOR = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/app/igrp/generator/Generator.xsl";
	public static final String LINK_XSL_HOME_STUDIO = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/xsl/IGRP-Studio-home.xsl";
	public static final String LINK_XSL_HOME_APP = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/xsl/IGRP-homeApp.xsl";
	public static final String LINK_XSL_HOME = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/xsl/IGRP-home.xsl";
	public static final String LINK_XSL_LOGIN = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/xsl/IGRP-login.xsl";
	public static final String LINK_XSL_GENERATOR_MCV = Config.getBasePathServerXsl().replace("\\", "/")+"images/IGRP/IGRP2.3/core/formgen/util/plsql_import_to_java/XSL_GENERATOR.xsl";
	public static final String LINK_XSL_GENERATOR_CRUD = Config.getBasePathServerXsl().replace("\\", "/")+"images/IGRP/IGRP2.3/core/formgen/util/GEN.CRUD.xsl";//Generator XSL CRUD
	public static final String LINK_XSL_JSON_GENERATOR = Config.getBasePathServerXsl().replace("\\", "/")+"images/IGRP/IGRP2.3/core/formgen/util/GEN.JSON.xsl";//For CRUD Generator
	public static final String LINK_XSL_JSON_CONVERT = Config.getBasePathServerXsl().replace("\\", "/")+"images/IGRP/IGRP2.3/core/formgen/util/jsonConverter.xsl";//Convert Page in format XML 2.1 to JSON
	public static final String LINK_XSL_MAP_PROCESS = Config.getLinkImgBase().replace("\\", "/")+"images/IGRP/IGRP2.3/xsl/IGRP-process.xsl";
	public static final String PATTERN_CONTROLLER_NAME = "(([a-zA-Z]|_)+([0-9]*({1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
	public static String LINK_MY_APPS = "webapps?r=igrp/env/myApps";
	public static String TITLE = "";
	public static String target = "";
	public static String type_header = "normal";
	public static String LINK_HOME ="webapps?r=igrp/home/index";
	
	public static String getHeader(){
		return getHeader(null);
	}	
	
	public static String getHeader(Action page){
		Application app = new Application().find().andWhere("dad","=",Permission.getCurrentEnv()).one();
		
		if(Igrp.getInstance()!=null && Igrp.getInstance().getRequest()!=null) {
			target = target.equals("")?Igrp.getInstance().getRequest().getParameter("target"):target;//Get Target
		}	
		TITLE = "".equals(TITLE)?app.getName():TITLE;
		XMLWritter xml = new XMLWritter();
		xml.setElement("template", app.getTemplate());
		xml.setElement("title", TITLE);
		xml.setElement("version",getVersion());
		xml.setElement("link",getLink());
		xml.setElement("link_img",getLinkImg());
		if(target!=null && !target.equals("")){
			xml.setElement("target", target);
		}
		xml.startElement("site");
			xml.setElement("welcome_note",getWelcomeNote());
			xml.setElement("footer_note", getFooterName());
			xml.setElement("user_name", getUserName());
			IGRPToolsBar button = new IGRPToolsBar("button");
			button.addButton(new IGRPButton("Sair", "webapps?r=igrp", "login", "logout", "_self", "exit.png","",""));
			xml.addXml(button.toXmlButton());
		xml.endElement();
		xml.setElement("app", page!=null?page.getApplication().getDad():app.getDad());
		xml.setElement("page", page!=null?page.getPage():"Form");
		xml.startElement("plsql");
			xml.setElement("action", "1");
			xml.setElement("package_db", page!=null?page.getPackage_name().substring(0, page.getPackage_name().indexOf("."+page.getPage().toLowerCase())):null);
			xml.setElement("package_html",page!=null?Page.resolvePageName(page.getPage()):null);
			xml.setElement("package_instance", "");
			xml.setElement("with_replace", "false");
			xml.setElement("with_label", "false");
			xml.setElement("with_biztalk", "false");
			xml.setElement("dynamic_menu", "false");
			xml.setElement("copy_menu", "false");
			xml.setElement("package_copy_db", "");
			xml.setElement("package_copy_html", "");
		xml.endElement();
		xml.startElement("navigation");
		xml.writeAttribute("url", "webapps?");
		xml.writeAttribute("prm_app", "prm_app");
		xml.writeAttribute("prm_page", "prm_page");
		xml.writeAttribute("prm_action", "r");
		xml.endElement();
		xml.startElement("slide-menu");
		xml.writeAttribute("file",getLinkSileMenu());
		xml.endElement();
		xml.startElement("top_menu");
		xml.writeAttribute("file",getLinkTopMenu());
		xml.endElement();
		if(type_header.equals("home")){
			xml.startElement("applications");
			xml.writeAttribute("file",LINK_MY_APPS);
			xml.endElement();
		}
		target = "";
		TITLE = "";
		type_header = "normal";
		LINK_MY_APPS = "webapps?r=igrp/env/myApps";
		LINK_HOME = "webapps?r=igrp/home/index";
		return xml.toString();
	}
	
	public static String getUserName() {
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		return (u!=null)?u.getName():"red-igrp";
	}

	public static Properties getConfig(){
		Properties configs = new Properties();
		for(nosi.webapps.igrp.dao.Config c: new nosi.webapps.igrp.dao.Config().findAll()){
			configs.put(c.getName(),c.getValue());
		}
		return configs;
	}
	
	public static String getBasePathConfig(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/");
	}
	
	public static String getPathLib(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/lib/");
	}
	
	public static String getPathExport(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/export/");
	}
	
	public static String getBasePathClass(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/classes/");
	}
	
	public static String getWorkspace(){
		return Igrp.getInstance().getServlet().getServletContext().getInitParameter("workspace");
	}
	
	public synchronized static String getEnvironment() {
		String env = Igrp.getInstance().getServlet().getInitParameter("env");
		return env;
	}
	
	public static String getAutenticationType(){
		return Igrp.getInstance().getServlet().getInitParameter("authentication_type");
	}

	public static String getLinkImgBase() {
		String APP_LINK_IMAGE = null;
		if(Config.isInstall())
			APP_LINK_IMAGE = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", "igrp_images").one().getValue();
		APP_LINK_IMAGE = APP_LINK_IMAGE!=null?((File.separator+APP_LINK_IMAGE+File.separator)).replace("\\", "/"):getRootPaht();
		return APP_LINK_IMAGE;
	}
	
	public static String getLinkImg(){
		String link = getLinkImgBase()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString()+getPageVersion():"images/IGRP/IGRP"+getPageVersion());
		link = link.replace("\\", "/");
		return link;
	}
	
	public static String getLink(){
		return LINK_HOME;
	}
	
	public static String getVersion(){
		return getConfig().get("version")!=null? getConfig().get("version").toString():"1.0";
	}
	public static String getLinkSileMenu(){
		return "webapps?r=igrp/pesquisar-menu/myMenu&dad="+Permission.getCurrentEnv();
	}
	public static String getLinkTopMenu(){
		return "webapps?r=igrp/pesquisar-menu/topMenu";//getConfig().get("link_top_menu")!=null? getConfig().get("link_top_menu").toString():"";
	}
	public static String getFooterName(){
		return getConfig().get("footer_name")!=null? getConfig().get("footer_name").toString():"2017 - Copyright NOSI";
	}
	public static String getWelcomeNote(){
		return getConfig().get("welcome_note")!=null? getConfig().get("welcome_note").toString():"Ola";
	}
	
	public static String getPageVersion(){
		String app = Igrp.getInstance().getCurrentAppName();
		String page = Igrp.getInstance().getCurrentPageName();
		String action = Igrp.getInstance().getCurrentActionName();
	
		if(app!=null && page!=null && action!=null && !app.equals("") && !page.equals("") && !action.equals("")){
			Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
			return ac!=null?ac.getVersion():"2.3";		
		}
		return "2.3";
	}
	
	public static String getResolveUrl(String app,String page,String action){
		HttpServletRequest req = Igrp.getInstance().getRequest();
		

//		String url = "webapps?r="+app+"/"+page+"/"+action+"&dad="+Permission.getCurrentEnv();
		String url = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/webapps?r="+app+"/"+page+"/"+action+"&dad="+Permission.getCurrentEnv();

		return url;
	}
	public static String getRootPaht(){
		return Igrp.getInstance().getBasePath()+"/";
	}

	public static HashMap<String,String> getVersions() {
		HashMap<String,String> versions = new HashMap<>();
		versions.put("2.3", "2.3");
		return versions;
	}
	
	public static String getLinkPageXsl(Action ac) {
		return Config.getLinkImgBase()+"images/IGRP/IGRP"+Config.getPageVersion()+"/app/"+ac.getXsl_src();
	}
	
	public static String getResolvePathPage(String app,String page,String version){
		return Config.getLinkImgBase()+"images"+"/"+"IGRP"+"/"+"IGRP"+version+"/"+"app"+"/"+app.toLowerCase()+"/"+page.toLowerCase();
	}
	
	public static String getResolvePathXsl(Action page){
		return getResolvePathPage(page.getApplication().getDad(),page.getPage(),page.getVersion());
	}
	
	public static String getResolvePathClass(String app,String page,String version){
		return getResolvePathPage(app, page, version);
	}
	
	public static String getDefaultPageController(String app,String title){
		return "package nosi.webapps."+app.toLowerCase()+".pages.defaultpage;\n"
				 + "import nosi.webapps.igrp.pages.home.HomeAppView;\n"
				 + "import nosi.webapps.igrp.dao.Application;"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Response;\n"
				 + "import nosi.core.webapp.Controller;\n"
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
	
	public static String getBasePackage(String app) {
		if(app!=null && !app.equals(""))
			return "nosi.webapps." + app.toLowerCase();
		return "nosi.webapps.igrp.pages";
	}
	
	public static String getBasePahtClassWorkspace(String app){
		return Config.getWorkspace() + File.separator +  "src"+File.separator+"main"+File.separator+"java"+ File.separator+ Config.getBasePackage(app).replace(".", File.separator);
	}
	public static String getBasePahtClassWorkspace(String app,String page){
		return Config.getWorkspace() + File.separator +  "src"+File.separator+"main"+File.separator+"java"+ File.separator+ Config.getBasePackage(app,page).replace(".", File.separator);
	}

	private static String getBasePackage(String app,String page) {
		return "nosi.webapps."+app.toLowerCase()+".pages."+page.toLowerCase();
	}

	public static String getBasePathServerXsl(){
		String APP_LINK_IMAGE = null;
		if(Config.isInstall())
			APP_LINK_IMAGE = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", "igrp_images").one().getValue();
		if(APP_LINK_IMAGE!=null) {
			APP_LINK_IMAGE = APP_LINK_IMAGE+File.separator;
			String root = "";
			String paths[] = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(File.separator+File.separator);
			if(paths.length <=1) {
				paths = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(File.separator);
			}
			for(int i=0;i<paths.length-1;i++) {
				root +=paths[i]+File.separator;
			}
			root += APP_LINK_IMAGE;
			return root;
		}
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
	}
	
	public static String getBaseServerPahtXsl(Action page){
		return Config.getBasePathServerXsl() + "images"+File.separator+"IGRP"+File.separator+"IGRP"+page.getVersion()+File.separator+"app"+File.separator+page.getApplication().getDad().toLowerCase()+File.separator+page.getPage().toLowerCase();
	}
	

	public static String getBaseHttpServerPahtXsl(Action page){
		String APP_LINK_IMAGE = null;
		if(Config.isInstall())
			APP_LINK_IMAGE = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", "igrp_images").one().getValue();
		if(APP_LINK_IMAGE!=null) {
			APP_LINK_IMAGE = "/"+APP_LINK_IMAGE+"/";
			return APP_LINK_IMAGE+"images"+"/"+"IGRP"+"/"+"IGRP"+page.getVersion()+"/"+"app"+"/"+page.getApplication().getDad().toLowerCase()+"/"+page.getPage().toLowerCase();
		}
		return getBaseServerPahtXsl(page);
	}
	
	public static String getBasePahtXslWorkspace(Action page){
		return Config.getWorkspace() + File.separator + "WebContent" + File.separator + Config.getBaseHttpServerPahtXsl(page);
	}
	
	public static String getPackage(String app, String page,String action) {
		String basePackage = "nosi.webapps." + app.toLowerCase() + ".pages." + page.toLowerCase() + "." + page + "Controller";
		if(!app.equals("") && !page.equals("") && !action.equals("")){
			Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("action", "=", action).andWhere("page", "=", Page.resolvePageName(page)).one();
			return (ac!=null && ac.getPackage_name()!=null)?ac.getPackage_name().toLowerCase()+ "." + ac.getPage() + "Controller":basePackage;		
		}
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
	
	public static String getStartReseveCodeAction(String actionName){
		return "/*----#START-PRESERVED-AREA("+actionName.toUpperCase()+")----*/";
	}
	
	public static String getEndReserveCode(){
		return "/*----#END-PRESERVED-AREA----*/";
	}
}
