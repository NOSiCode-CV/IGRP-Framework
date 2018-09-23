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
	@RParam(rParamName = "p_sign_in")
	private IGRPLink sign_in;
	@RParam(rParamName = "p_sign_in_desc")
	private String sign_in_desc;
	
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
	
	public IGRPLink setSign_in(String app,String page,String action){
		this.sign_in = new IGRPLink(app,page,action);
		return this.sign_in;
	}
	public IGRPLink getSign_in(){
		return this.sign_in;
	}
	public void setSign_in_desc(String sign_in_desc){
		this.sign_in_desc = sign_in_desc;
	}
	public String getSign_in_desc(){
		return this.sign_in_desc;
	}
	public IGRPLink setSign_in(String link){
		this.sign_in = new IGRPLink(link);
		return this.sign_in;
	}
	public IGRPLink setSign_in(Report link){
		this.sign_in = new IGRPLink(link);
		return this.sign_in;
	}



}