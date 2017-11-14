package nosi.core.webapp;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Properties;

import com.google.gson.Gson;

import nosi.core.config.Config;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;

/**
 * @author: Emanuel Pereira
 * 13 Nov 2017
 */
public class Core {

	private static final String URL_CLASS_CORE = "C:/Users/Yma/git/IGRP-Framework/IGRP/src/nosi/core/webapp/Core.java";
	public static void main(String[]args){
		File file = new File(URL_CLASS_CORE);
		try {
		    URL[] urls = new URL[]{file.toURL()};
		    Properties p = new Properties();
		    for(Method method:new URLClassLoader(urls).loadClass("nosi.core.webapp.Core").getDeclaredMethods()){
		    	String methodName = method.getName()+"(";
		    	for(Parameter param:method.getParameters())
		    		methodName +=param.getName()+",";
		    	methodName = methodName.substring(0, methodName.length()-1);
		    	methodName +=");";
		    	p.put(methodName, methodName);
		    }
		    System.out.println(new Gson().toJson(p));
		} catch (MalformedURLException e) {
		} catch (ClassNotFoundException e) {
		}
	}
	//Add Message Error
	public static void setMessageError(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, msg);
	}	

	//Add Message Success
	public static void setMessageSuccess(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, msg);
	}
	
	//Add Message Info
	public static void setMessageInfo(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, msg);
	}

	//Add Message Warning
	public static void setMessageWarning(String msg){
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, msg);
	}	
	
	//Get Config Property
	public static String getConfig(String name){
		nosi.webapps.igrp.dao.Config c = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", name).one();
		return c!=null?c.getValue():null;
	}
	
	//Get Current User
	public static nosi.webapps.igrp.dao.User getCurrentUser(){
		return (nosi.webapps.igrp.dao.User) Igrp.getInstance().getUser().getIdentity();
	}

	//Find User by ID
	public static nosi.webapps.igrp.dao.User findUserById(Integer id){
		return new nosi.webapps.igrp.dao.User().findOne(id);
	}
	
	//Find User by Username
	public static nosi.webapps.igrp.dao.User findUserByUsername(String userName){
		return new nosi.webapps.igrp.dao.User().find().andWhere("username", "=", userName).one();
	}
	
	//Find User by email
	public static nosi.webapps.igrp.dao.User findUserByEmail(String email){
		return new nosi.webapps.igrp.dao.User().find().andWhere("username", "=", email).one();
	}
	
	//Format date and return to Type String
	public static String convertDate(String date, String formatIn, String outputFormat) {
		return DateHelper.convertDate(date,formatIn,outputFormat);
	}
	
	//Format date and return to Type Date
	public static java.sql.Date formatDate(String data,String inputFormat,String outputFormat){
		return DateHelper.formatDate(data,inputFormat,outputFormat);
	}
	
	//Get Current Datetime (dd/MM/yyyy)
	public static String getCurrentDate(){
		return DateHelper.getCurrentDate();
	}

	//Get Current Datetime (User defined output format)
	public static String getCurrentDate(String outputFormat){
		return DateHelper.getCurrentDate(outputFormat);
	}
	
	//Get Current Datetime (dd/MM/yyyy HH:mm:ss)
	public static String getCurrentDataTime() {
		return DateHelper.getCurrentDataTime();
	}
	
	//Get Current Application Dad on Cookie
	public static String getCurrentDad(){
		return Permission.getCurrentEnv();
	}

	//Get Current Organization on Cookie
	public static Integer getCurrentOrganization(){
		return Permission.getCurrentOrganization();
	}

	//Get Current Profile on Cookie
	public static Integer getCurrentProfile(){
		return Permission.getCurrentPerfilId();
	}
	
	//Find Application By ID
	public static Application findApplicationById(Integer id){
		return new Application().findOne(id);
	}
	
	//Find Application By Dad
	public static Application findApplicationByDad(String dad){
		return new Application().find().andWhere("dad", "=", dad).one();
	}
	
	//Find Organization By ID
	public static Organization findOrganizationById(Integer id){
		return new Organization().findOne(id);
	}
	
	//Find Organization By Code
	public static Organization findOrganizationByCode(String code){
		return new Organization().find().andWhere("code", "=", code).one();
	}
	
	//Find Profile By ID
	public static ProfileType findProfileById(Integer id){
		return new ProfileType().findOne(id);
	}
	
	//Find Profile By Code
	public static ProfileType findProfileByCode(String code){
		return new ProfileType().find().andWhere("code", "=", code).one();
	}
	
	//Check permition transaction for current user
	public static boolean checkUserTransaction(String transaction){
		return new Transaction().getPermission(transaction);
	}
	
	public static Response getLinkReport(String code_report,Report rep){
		return new Report().invokeReport(code_report, rep);
	}
}
