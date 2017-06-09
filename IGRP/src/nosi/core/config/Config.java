package nosi.core.config;

import java.io.File;
import java.util.HashMap;
import java.util.Properties;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.page.Page;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.Permission;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;

public class Config {
	
	public static String TITLE = "";
	public static String target = "";
	public static String type_header = "normal";
	public static String RESERVE_CODE_IMPORP_PACKAGE_CONTROLLER = "/*---- Import your packages here... ----*/";
	public static String RESERVE_CODE_ACTIONS_CONTROLLER = "/*---- Insert your actions here... ----*/";
	public static String RESERCE_CODE_ON_ACTIONS_CONTROLLER = "/*---- Insert your code here... ----*/";
	public static String RESERVE_CODE_END = "/*---- End ----*/";
	public static String getHeader(){
		XMLWritter xml = new XMLWritter();
		xml.setElement("tamplate", "");
		xml.setElement("title", TITLE);
		xml.setElement("version",getVersion());
		xml.setElement("link",getLink());
		xml.setElement("link_img",getLinkImg());
		if(!target.equals("")){
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
	
	private static String getUserName() {
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		return (u!=null)?u.getName():"red-igrp";
	}

	public static Properties getConfig(){
		Properties configs = new Properties();
		for(Object c: new nosi.webapps.igrp.dao.Config().getAll()){
			nosi.webapps.igrp.dao.Config obj = (nosi.webapps.igrp.dao.Config) c;
			configs.put(obj.getName(),obj.getValue());
		}
		return configs;
	}
	
	public static String getBasePathConfig(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/");
	}
	
	public static String getPathLib(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/lib/");
	}
	
	public static String getBasePathClass(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/classes/");
	}
	
	public static String getProject_loc(){
		try {
			JAXBContext context = JAXBContext.newInstance(AppConfig.class);
			Unmarshaller unmarshaller = (Unmarshaller) context.createUnmarshaller();
			AppConfig lR = (AppConfig) unmarshaller.unmarshal(new File(getBasePathConfig()+"app"+"/"+"app.xml"));
			return lR.getProject_loc();
		} catch (JAXBException e) {
		} 		
		return null;
	}
	
	public static String getBasePathXsl(){
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
	}
	public static String getLinkImg(){
		return getRootPaht()+(getConfig().get("link_img")!=null? getConfig().get("link_img").toString():"images/IGRP/IGRP2.3");
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
		return getConfig().get("link_top_menu")!=null? getConfig().get("link_top_menu").toString():"";
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
			Action ac = new Action();
			Application env = new Application();
			env.setDad(app);
			ac.setAction(action);
			ac.setPage(Page.resolvePageName(page));
			ac.setEnv(env);
			return ac.getVersion();		
		}
		return "2.3";
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
	
	public static String getResolvePathClass(String app,String page,String version){
		return "images"+"/"+"IGRP"+"/"+"IGRP"+version+"/"+"app"+"/"+app.toLowerCase()+"/"+page.toLowerCase();
	}
	
	public static String getDefaultPageController(String app,String title){
		return "package nosi.webapps."+app.toLowerCase()+".pages.defaultpage;\n"
				 + "import nosi.webapps.igrp.pages.home.HomeAppView;\n"
				 + "import java.io.IOException;\n"
				 + "import nosi.core.webapp.Controller;\n"
				 + "public class DefaultPageController extends Controller {	\n"
						+ "public void actionIndex() throws IOException{\n"
							+ "HomeAppView view = new HomeAppView();\n"
							+ "view.title = \""+title+"\";\n"
							+ "this.renderView(view,true);\n"
						+ "}\n"
				  + "}";
	}
}
