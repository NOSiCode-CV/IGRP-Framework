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

	
	 default String getLinkHome() {
		Integer pageId = Core.getParamInt("p_id_page");
		if(Igrp.getInstance() != null && pageId!=null && "generator".contentEquals(Igrp.getInstance().getCurrentPageName())) {
			 Action ac = new Action().findOne(pageId);
			 Integer idApp = (ac != null && ac.getApplication() != null)?ac.getApplication().getId():null;
			 return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"ListaPage"+"/"+"index")+"&dad=igrp_studio&p_application="+idApp;
		}
        return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"home"+"/"+"index");
	}
	
	default String getLinkMyApps() {
      return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"myApps") + "&dad="+Core.getCurrentDad();
    }
	default String getTitle() {
        return "";
	}
	default String getTarget() {
	        return "";
    }
	default String getTypeHeader() {
        return "normal";
	}
	default String getLinkOpenApp() {
        return "webapps?r=" + "igrp_studio"+"/"+"env"+"/"+"openApp"+"&dad="+Core.getCurrentDad()+"&app=";
	}
	default String getLinkSileMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"myMenu")+"&dad="+Core.getCurrentDad();
	}
	default String getLinkTopMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"topMenu") +"&dad=" + Core.getCurrentDad() ;
	}

	default String getPackageInstance(){
		return "";
	}

	default String getPackageCopyDb(){
		return "";
	}
	default String getPackageCopyHtml(){
		return "";
	}
}
