package nosi.core.config;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Action;

/**
 * Emanuel
 * 23 Feb 2018
 */
public interface IHeaderConfig {

	
	 public default String getLinkHome() {
		Integer pageId = Core.getParamInt("p_id_page");
		if(Igrp.getInstance() != null && pageId!=null && "generator".contentEquals(Igrp.getInstance().getCurrentPageName())) {
			 Action ac = new Action().findOne(pageId);
			 Integer idApp = (ac != null && ac.getApplication() != null)?ac.getApplication().getId():null;
			 return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"ListaPage"+"/"+"index")+"&dad=igrp_studio&p_application="+idApp;
		}
        return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"home"+"/"+"index");
	}
	
	public default String getLinkMyApps() {
      return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"myApps") + "&dad="+Core.getCurrentDad();
    }
	public default String getTitle() {
        return "";
	}
	public default String getTarget() {
	        return "";
    }
	public default String getTypeHeader() {
        return "normal";
	}
	public default String getLinkOpenApp() { 
        return "webapps?r=" + "igrp_studio"+"/"+"env"+"/"+"openApp"+"&dad="+Core.getCurrentDad()+"&app=";
	}
	public default String getLinkSileMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"myMenu")+"&dad="+Core.getCurrentDad();
	}
	public default String getLinkTopMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"topMenu") +"&dad=" + Core.getCurrentDad() ;
	}

	public default String getPackageInstance(){
		return "";
	}

	public default String getPackageCopyDb(){
		return "";
	}
	public default String getPackageCopyHtml(){
		return "";
	}
}
