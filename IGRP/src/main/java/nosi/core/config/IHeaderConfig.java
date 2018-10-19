package nosi.core.config;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.EncrypDecrypt;

/**
 * Emanuel
 * 23 Feb 2018
 */
public interface IHeaderConfig {

	default public String getLinkHome() {
        return "webapps?r="+new EncrypDecrypt().encrypt("igrp"+"/"+"home"+"/"+"index");
	}
	default public String getLinkHomeStudio() {
		return getLinkHome();//"webapps?r="+new EncrypDecrypt().encrypt("igrp_studio"+"/"+"ListaPage"+"/"+"index") +"&dad="+Core.getCurrentDad();  
	}
	default public String getLinkMyApps() {
        String result = "webapps?r="+new EncrypDecrypt().encrypt("igrp_studio"+"/"+"env"+"/"+"myApps") + "&dad="+Core.getCurrentDad();
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
       // return "webapps?r="+new EncrypDecrypt().encrypt("igrp_studio"+"/"+"env"+"/"+"openApp")+"&dad="+Core.getCurrentDad()+"&app="; 
        return "webapps?r=" + "igrp_studio"+"/"+"env"+"/"+"openApp"+"&dad="+Core.getCurrentDad()+"&app=";
	}
	default public String getLinkSileMenu(){
		return "webapps?r="+new EncrypDecrypt().encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"myMenu")+"&dad="+Core.getCurrentDad();
	}
	default public String getLinkTopMenu(){
		return "webapps?r="+new EncrypDecrypt().encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"topMenu") +"&dad=" + Core.getCurrentDad() ;
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
