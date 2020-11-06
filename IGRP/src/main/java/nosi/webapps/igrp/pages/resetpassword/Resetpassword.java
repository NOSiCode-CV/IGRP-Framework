package nosi.webapps.igrp.pages.resetpassword;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Resetpassword extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_username")
	private String username;
	@RParam(rParamName = "p_nafa")
	private String nafa;
	@RParam(rParamName = "p_nova_senha")
	private String nova_senha;
	@RParam(rParamName = "p_confirmar_nova_senha")
	private String confirmar_nova_senha;
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
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setNafa(String nafa){
		this.nafa = nafa;
	}
	public String getNafa(){
		return this.nafa;
	}
	
	public void setNova_senha(String nova_senha){
		this.nova_senha = nova_senha;
	}
	public String getNova_senha(){
		return this.nova_senha;
	}
	
	public void setConfirmar_nova_senha(String confirmar_nova_senha){
		this.confirmar_nova_senha = confirmar_nova_senha;
	}
	public String getConfirmar_nova_senha(){
		return this.confirmar_nova_senha;
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
