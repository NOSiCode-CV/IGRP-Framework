package cv.nosi.webapps.igrp.pages.novodominio;

import cv.nosi.core.webapp.annotation.RParam;
import cv.nosi.core.webapp.mvc.Model;

public class NovoDominio extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_dominio")
	private String dominio;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setDominio(String dominio){
		this.dominio = dominio;
	}
	public String getDominio(){
		return this.dominio;
	}



}
