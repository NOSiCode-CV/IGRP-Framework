/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

import nosi.core.validator.annotation.*;

public class Login extends Model{
	
	@RParam(rParamName = "p_user")
	@Required(message = "Este campo nao pode ser vazio")
	private String user;
	
	@RParam(rParamName = "p_password")
	@Required
	private String password;
	
	@RParam(rParamName = "p_button")
	private String button;
	
	@RParam(rParamName = "p_buttontoken")
	private String buttontoken;
	
	@RParam(rParamName = "p_sam_message")
	private String sam_message;
	
	@RParam(rParamName = "p_sam_message_digest")
	private String sam_message_digest;
	
	@RParam(rParamName = "p_sam_certificate")
	private String sam_certificate;
	
	@RParam(rParamName = "p_p_env_procedure")
	private String p_env_procedure;
	
	@RParam(rParamName = "p_p_env_dml")
	private String p_env_dml;
	
	public void setUser(String user){
		this.user = user;
	}
	public String getUser(){
		return this.user;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	
	public void setButton(String button){
		this.button = button;
	}
	public String getButton(){
		return this.button;
	}
	
	public void setButtontoken(String buttontoken){
		this.buttontoken = buttontoken;
	}
	public String getButtontoken(){
		return this.buttontoken;
	}
	public String getSam_message() {
		return sam_message;
	}
	public void setSam_message(String sam_message) {
		this.sam_message = sam_message;
	}
	public String getSam_message_digest() {
		return sam_message_digest;
	}
	public void setSam_message_digest(String sam_message_digest) {
		this.sam_message_digest = sam_message_digest;
	}
	public String getSam_certificate() {
		return sam_certificate;
	}
	public void setSam_certificate(String sam_certificate) {
		this.sam_certificate = sam_certificate;
	}
	public String getP_env_procedure() {
		return p_env_procedure;
	}
	public void setP_env_procedure(String p_env_procedure) {
		this.p_env_procedure = p_env_procedure;
	}
	public String getP_env_dml() {
		return p_env_dml;
	}
	public void setP_env_dml(String p_env_dml) {
		this.p_env_dml = p_env_dml;
	}
	
}
/*-------------------------*/