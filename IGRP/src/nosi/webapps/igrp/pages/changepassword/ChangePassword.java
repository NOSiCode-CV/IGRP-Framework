package nosi.webapps.igrp.pages.changepassword;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class ChangePassword extends Model{		
	@RParam(rParamName = "p_email_1")
	private String email_1;
	@RParam(rParamName = "p_password_1")
	private String password_1;
	@RParam(rParamName = "p_confirm_password")
	private String confirm_password;
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}
	
	public void setPassword_1(String password_1){
		this.password_1 = password_1;
	}
	public String getPassword_1(){
		return this.password_1;
	}
	
	public void setConfirm_password(String confirm_password){
		this.confirm_password = confirm_password;
	}
	public String getConfirm_password(){
		return this.confirm_password;
	}


}
