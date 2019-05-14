package nosi.webapps.igrp_studio.pages.wsdl2java;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Wsdl2java extends Model{		
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_url_wsdl")
	private String url_wsdl;
	@RParam(rParamName = "p_package_name")
	private String package_name;
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setUrl_wsdl(String url_wsdl){
		this.url_wsdl = url_wsdl;
	}
	public String getUrl_wsdl(){
		return this.url_wsdl;
	}
	
	public void setPackage_name(String package_name){
		this.package_name = package_name;
	}
	public String getPackage_name(){
		return this.package_name;
	}



}
