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
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;

public class Config {
	
	public static String TITLE = "";
	public static String target = "";
	public static String type_header = "normal";

	public static String getHeader(){
		target = target.equals("")?Igrp.getInstance().getRequest().getParameter("target"):target;//Get Target
		XMLWritter xml = new XMLWritter();
		xml.setElement("tamplate", "");
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
		xml.setElement("app", "igrp");
		xml.setElement("page", "form");
		xml.startElement("plsql");
			xml.setElement("action", "1");
			xml.setElement("package_db", "FORM_DESIGNER_DB");
			xml.setElement("package_html", "FORM_DESIGNER_HTML");
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
			xml.writeAttribute("file","webapps?r=igrp/env/myApps");
			xml.endElement();
		}
		target = "";
		TITLE = "";
		type_header = "normal";
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
		return Igrp.getInstance().getServlet().getInitParameter("workspace");
	}
	
	public static String getAutenticationType(){
		return Igrp.getInstance().getServlet().getInitParameter("authentication_type");
	}
	
	public static String getBasePathXsl(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
	}
	public static String getLinkImg(){
		return getRootPaht()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString()+getPageVersion():"images/IGRP/IGRP"+getPageVersion());
	}
	public static String getLinkImg2_2(){
		return getRootPaht()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString()+getPageVersion():"images/IGRP/IGRP2.2/");
	}
	
	public static String getLink(){
		return getConfig().get("link")!=null? getConfig().get("link").toString():"webapps?r=igrp/home/index";
	}
	public static String getVersion(){
		return getConfig().get("version")!=null? getConfig().get("version").toString():"1.0";
	}
	public static String getLinkSileMenu(){
		return "webapps?r=igrp/pesquisar-menu/myMenu&amp;dad="+Permission.getCurrentEnv();
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
		if(!app.equals("") && !page.equals("") && !action.equals("")){
			Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
			return ac!=null?ac.getVersion():"2.3";		
		}
		return "2.3";
	}
	
	public static String getResolveUrl(String app,String page,String action){
		HttpServletRequest req = Igrp.getInstance().getRequest();
		String url = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+"/IGRP/webapps?r="+app+"/"+page+"/"+action+"&amp;dad="+Permission.getCurrentEnv();
		return url;
	}
	public static String getRootPaht(){
		return Igrp.getInstance().getBasePath()+"/";
	}

	public static HashMap<String,String> getVersions() {
		HashMap<String,String> versions = new HashMap<>();
		versions.put("", "--- Version ---");
		versions.put("2.2", "2.2");
		versions.put("2.3", "2.3");
		return versions;
	}
	
	public static String getResolvePathXsl(String app,String page,String version){
		return "images"+"/"+"IGRP"+"/"+"IGRP"+version+"/"+"app"+"/"+app.toLowerCase()+"/"+page.toLowerCase();
	}
	
	public static String getResolvePathXsl(Action page){
		return "images"+"/"+"IGRP"+"/"+"IGRP"+page.getVersion()+"/"+"app"+"/"+page.getApplication().getDad().toLowerCase()+"/"+page.getPage().toLowerCase();
	}
	
	public static String getResolvePathClass(String app,String page,String version){
		return "images"+"/"+"IGRP"+"/"+"IGRP"+version+"/"+"app"+"/"+app.toLowerCase()+"/"+page.toLowerCase();
	}
	
	public static String getDefaultPageController(String app,String title){
		return "package nosi.webapps."+app.toLowerCase()+".pages.defaultpage;\n"
				 + "import nosi.webapps.igrp.pages.home.HomeAppView;\n"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Response;\n"
				 + "import nosi.core.webapp.Controller;\n"
				 + "public class DefaultPageController extends Controller {	\n"
						+ "public Response actionIndex() throws IOException{\n"
							+ "HomeAppView view = new HomeAppView();\n"
							+ "view.title = \""+title+"\";\n"
							+ "return this.renderView(view,true);\n"
						+ "}\n"
				  + "}";
	}
	
	public static String getBasePackage(String app) {
		if(app!=null && !app.equals(""))
			return "nosi.webapps." + app.toLowerCase();
		return "nosi.webapps.igrp.pages";
	}
	
	public static String getBasePahtClass(String app){
		return Config.getWorkspace() + File.separator +  "src"+ File.separator+ Config.getBasePackage(app).replace(".", File.separator) +File.separator;
	}
	
	public static String getBasePahtXsl(Action page){
		return Config.getWorkspace() + File.separator + "WebContent" + File.separator + Config.getResolvePathXsl(page.getApplication().getDad(), page.getPage(), page.getVersion());
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
			System.err.println("Nao foi possivel concluir a instacao do IGRP!");
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
