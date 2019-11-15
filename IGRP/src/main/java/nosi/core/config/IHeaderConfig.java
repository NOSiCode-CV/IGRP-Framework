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

	
	default public String getLinkHome() {
		Integer pageId = Core.getParamInt("p_id_page");
		if(Igrp.getInstance() != null && pageId!=null && "generator".contentEquals(Igrp.getInstance().getCurrentPageName())) {
			 Action ac = new Action().findOne(pageId);
			 Integer idApp = (ac != null && ac.getApplication() != null)?ac.getApplication().getId():null;
			 return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"ListaPage"+"/"+"index")+"&dad=igrp_studio&p_application="+idApp;
		}
        return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"home"+"/"+"index");
	}
	
	default public String getLinkMyApps() {
        String result = "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"myApps") + "&dad="+Core.getCurrentDad();
        return result;
	}
	default public String getTitle() {
        return "";
	}
	default public String getTarget() {
	        return "";
    }
	default public String getTypeHeader() {
        return "normal";
	}
	default public String getLinkOpenApp() { 
        return "webapps?r=" + "igrp_studio"+"/"+"env"+"/"+"openApp"+"&dad="+Core.getCurrentDad()+"&app=";
	}
	default public String getLinkSileMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"myMenu")+"&dad="+Core.getCurrentDad();
	}
	default public String getLinkTopMenu(){
		return "webapps?r="+ EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"topMenu") +"&dad=" + Core.getCurrentDad() ;
	}

	default public String getPackageInstance(){
		return "";
	}

	default public String getPackageCopyDb(){
		return "";
	}
	default public String getPackageCopyHtml(){
		return "";
	}
}
