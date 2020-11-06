package nosi.webapps.igrp.pages.oauth2openidwso2;

import nosi.core.webapp.annotation.RParam;
import nosi.core.webapp.mvc.Model;

public class Oauth2openidwso2 extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}



}
