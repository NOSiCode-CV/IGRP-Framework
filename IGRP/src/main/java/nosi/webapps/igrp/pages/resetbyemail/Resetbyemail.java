package nosi.webapps.igrp.pages.resetbyemail;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Resetbyemail extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_form_1_email_1")
	private String form_1_email_1;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setForm_1_email_1(String form_1_email_1){
		this.form_1_email_1 = form_1_email_1;
	}
	public String getForm_1_email_1(){
		return this.form_1_email_1;
	}



}
