package nosi.core.gui.page;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.gui.components.IGRPLogBar;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.View;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;

/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class Page{
	
	private static final Logger LOGGER = LogManager.getLogger(Page.class);
	
	private String template;
	private View view;
	List<Object> gui;
	private String linkXsl; 
	
	private boolean showFooter; 
	private String copyright; 
	private String developed; 
	
	public View getView() {
		return view;
	}

	public void setView(View view) {
		this.view = view;
	}

	public Page(){
		this.gui = new ArrayList<>();
		this.copyright = "&copy; Copyright 2021, Núcleo Operacional da Sociedade de informação - E.P.E. Todos os direitos reservados."; 
		this.developed = "Design &amp; Concepção"; 
	}
	
	private String convertContentToXml(){
		StringBuilder xml = new StringBuilder();
		for(Object obj : this.gui)
			xml.append(obj.toString());
		this.gui = null;
		return xml.toString();
	}
	
	public String getLinkXsl() {
		return linkXsl;
	}

	public void setLinkXsl(String linkXsl) {
		this.linkXsl = linkXsl;
	}

	public void addContent(Object c){
		this.gui.add(c);
	}
	
	public void removeContent(Object c) {
		if(this.gui != null) 
			this.gui.remove(c);
	}
	
	private void createTemplate(){
		Igrp igrpApp = Igrp.getInstance();
		String path_xsl = "teste";
		String app = igrpApp.getCurrentAppName();
		String page = igrpApp.getCurrentPageName();
		String action = igrpApp.getCurrentActionName();
		if (this.getLinkXsl() != null && !this.getLinkXsl().isEmpty())
			path_xsl = this.getLinkXsl();
		else
			if (!app.equals("") && !page.equals("") && !action.equals(""))
				path_xsl = new Config().getLinkPageXsl(new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one());
		XMLWritter xml = new XMLWritter("rows", path_xsl, "utf-8");
		xml.addXml(new Config().getHeader(this.getView()));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", "");
		xml.text(":_content");
		xml.addXml(new IGRPMessage().toString());
		if(this.showFooter) { 
			xml.startElement("igrpfooter"); 
			xml.setElement("copyright", this.copyright); 
			xml.setElement("developed", this.developed); 
			xml.startElement("by"); 
			xml.writeAttribute("link", "https://www.nosi.cv"); 
			xml.text("NOSi"); 
			xml.endElement(); 
			xml.endElement(); 
		}
		xml.endElement();		
		this.template = String.valueOf(xml);
	}
	
	public String renderContent(boolean layout){
		if(layout){
			if(new Config().getEnvironment().equalsIgnoreCase("dev") || new Config().getEnvironment().equalsIgnoreCase("sta"))
				new IGRPLogBar().displayLogs();
			// Create a standard template of IGRP 
			this.createTemplate();
			return this.template.replace(":_content", this.convertContentToXml());
		}
		return this.convertContentToXml().replace(":_message_reseved", new IGRPMessage().toString());
	}
	
	public static String getPageName(String page){
		return StringHelper.camelCase(StringHelper.removeSpace(page));
	}
	
	public static boolean validatePage(String page){
		return StringHelper.validateClassName(page);
	}
	
	public static String getPageFolder(String page){
		return page.toLowerCase().replaceAll("\\s+", "").replace("-", "");
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	
	public void setDeveloped(String developed) {
		this.developed = developed;
	}

	public void displayFooter(boolean showFooter) {
		this.showFooter = showFooter;
	}

	public static String resolvePageName(String page){
		String page_name = "";
		for(String aux : page.split("-"))
			page_name += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		return page_name;
	}
	
	public static Object loadPage(String controllerPath, String actionName){
		Igrp igrpApp = Igrp.getInstance();
		try {
			Class<?> classController = Class.forName(controllerPath);
			Object controller = classController.newInstance();
			igrpApp.setCurrentController((Controller) controller);
			Method action = Arrays.stream(classController.getDeclaredMethods()).filter(p -> p.getName().equals(actionName)).findFirst().orElseThrow(NoSuchMethodException::new);
			if(action.getParameterCount() == 0)
				return  action.invoke(controller);
			return action.invoke(controller, formalParameters(action, igrpApp).toArray());
		}catch (Exception e) {
			addParametersToErrorPage(igrpApp);
			LOGGER.fatal(e.getMessage(), e);
			throw new RuntimeException(e.getMessage(), e);
		}
	}
	
	private static List<Object> formalParameters(Method action, Igrp igrpApp) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		List<Object> paramValues = new ArrayList<>();
		for (Parameter parameter : action.getParameters()) {
			if (parameter.getType().getSuperclass().getName().equals("nosi.core.webapp.Model")) {
				// Dependency Injection for models
				Class<?> classModel = Class.forName(parameter.getType().getName());
				nosi.core.webapp.Model model = (Model) classModel.newInstance();
				model.load();
				paramValues.add(model);
			} else // Dependency Injection for simple vars ... 
				if (parameter.getType().getName().equals("java.lang.String") && parameter.getAnnotation(RParam.class) != null) {
					if (parameter.getType().isArray())
						paramValues.add(igrpApp.getRequest().getParameterValues(parameter.getAnnotation(RParam.class).rParamName()));
					else
						paramValues.add(igrpApp.getRequest().getParameter(parameter.getAnnotation(RParam.class).rParamName()));
			} else
				paramValues.add(null);
		}
		return paramValues;
	}
	
	private static void addParametersToErrorPage(Igrp igrpApp) {
		ConfigApp configApp = ConfigApp.getInstance();
		Map<String, Object> errorParam = new HashMap<String, Object>();
		errorParam.put("dad", igrpApp.getCurrentAppName());
		errorParam.put(ConfigCommonMainConstants.IGRP_ENV.value(), configApp.getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_ENV.value()));
		igrpApp.getRequest().setAttribute("igrp.error", errorParam);
	}

}