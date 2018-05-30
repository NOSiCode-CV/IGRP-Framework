package nosi.core.gui.page;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.exception.NotFoundHttpException;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPLogBar;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.gui.fields.Field;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
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
	
	private String template;
	private View view;
	List<Object> gui;
	private String linkXsl=null;
	
	public View getView() {
		return view;
	}

	public void setView(View view) {
		this.view = view;
	}

	public Page(){
		this.gui = new ArrayList<Object>();
	}
	
	private String convertContentToXml(){
		String xml = "";
		for(Object obj:this.gui){
			xml += obj.toString();
		}
		this.gui = null;
		if(IGRPForm.hiddenFields.size() >0) {
			IGRPForm formHidden = new IGRPForm("form_hidden");
			for(Field f:IGRPForm.hiddenFields) {
				formHidden.addField(f);
			}
			xml+=formHidden.toString();
		}
	 return xml;
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
		if(this.gui!=null) {
			this.gui.remove(c);
		}
	}
	private void createTemplate(){
		String path_xsl = "teste";
		String app = Igrp.getInstance().getCurrentAppName();
		String page = Igrp.getInstance().getCurrentPageName();
		String action = Igrp.getInstance().getCurrentActionName();
		if(Core.isNotNull(this.getLinkXsl())) {
			path_xsl = this.getLinkXsl();
		}else {
			if(!app.equals("") && !page.equals("") && !action.equals("")){
				Action ac = new Action();
				ac = ac.find().andWhere("application.dad", "=",app).andWhere("page", "=",Page.resolvePageName(page)).one();
				path_xsl = new Config().getLinkPageXsl(ac);
			}
		}
    
		XMLWritter xml = new XMLWritter("rows", path_xsl, "utf-8");

		xml.addXml(new Config().getHeader(this.getView()));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", "");
		xml.text(":_content");
		
		//new IGRPLogBar()
		xml.text(":_logBar");
		
		IGRPMessage msg = new IGRPMessage();
		String m = msg.toString();
		if(m!=null){
			xml.addXml(m);
		}
		xml.endElement();		
		this.template = xml + "";
	}
	
	public String renderContent(boolean layout){
		if(layout){
			// Create a standard template of IGRP 
			this.createTemplate();
			if(new Config().getEnvironment().equalsIgnoreCase("dev") || new Config().getEnvironment().equalsIgnoreCase("sta"))
				this.template = this.template.replace(":_logBar", new IGRPLogBar().toString());
			else
				this.template = this.template.replace(":_logBar", "");
			return this.template.replace(":_content", this.convertContentToXml());
		}
		IGRPMessage msg = new IGRPMessage();
		String m = msg.toString();
		String aux = this.convertContentToXml().replace(":_message_reseved", m);
		if(new Config().getEnvironment().equalsIgnoreCase("dev") || new Config().getEnvironment().equalsIgnoreCase("sta"))
			aux = aux.replace(":_logBar", new IGRPLogBar().toString());
		else
			aux = aux.replace(":_logBar", "");
		return aux;
	}
	
	public static String getPageName(String page){
		return StringHelper.camelCase(StringHelper.removeSpace(page));
	}
	
	public static boolean validatePage(String page){
		return StringHelper.validateClassName(page);
	}
	
	public static String getPageFolder(String page){
		page = page.toLowerCase();
		page = page.replaceAll("\\s+", "");
		page = page.replaceAll("-", "");
		return page;
	}
	
	public static String resolvePageName(String page){
		String page_name = "";
		for(String aux : page.split("-")){
			page_name += aux.substring(0, 1).toUpperCase() + aux.substring(1);
		}
		page.replaceAll(".", "_");
		return page_name;
	}
	
	public static Object loadPage(String ...params){ // load and apply some dependency injection ...
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
				return action.invoke(controller, paramValues.toArray());
				
			}else{
				return  action.invoke(controller);
			}
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SecurityException | IllegalArgumentException | 
				InvocationTargetException | NullPointerException e) {
			e.printStackTrace();			
			StringWriter sw = new StringWriter();
		    PrintWriter pw = new PrintWriter(sw);
		    e.printStackTrace(pw);
			Igrp.getInstance().getRequest().getSession().setAttribute("igrp.error", sw.toString());
			throw new NotFoundHttpException("Ocorreu um erro, pedimos desculpas. +INFO: \n\n\n\n"+e.getMessage());
		}
	}

}

