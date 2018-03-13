package nosi.core.config;

import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.Permission;

/**
 * Emanuel
 * 23 Feb 2018
 */
public interface IHeaderConfig {

	default public String getLinkHome() {
        return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"home"+"/"+"index");
	}
	default public String getLinkHomeStudio() {
		return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"ListaPage"+"/"+"index");
	}
	default public String getLinkMyApps() {
        return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"myApps");
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
        return "webapps?r="+EncrypDecrypt.encrypt("igrp_studio"+"/"+"env"+"/"+"openApp")+"&app=";
	}
	default public String getLinkSileMenu(){
		return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"myMenu")+"&dad="+new Permission().getCurrentEnv();
	}
	default public String getLinkTopMenu(){
		return "webapps?r="+EncrypDecrypt.encrypt("igrp"+"/"+"pesquisar-menu"+"/"+"topMenu");
	}
}
