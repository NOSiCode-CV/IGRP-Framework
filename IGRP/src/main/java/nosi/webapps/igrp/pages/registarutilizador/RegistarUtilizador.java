package nosi.webapps.igrp.pages.registarutilizador;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.uploadfile.UploadFile;

public class RegistarUtilizador extends Model{		

	@RParam(rParamName = "p_titulo_text")
	private String titulo_text;

	@RParam(rParamName = "p_nome")
	private String nome;

	@RParam(rParamName = "p_username")
	private String username;

	@RParam(rParamName = "p_email")
	private String email;

	@RParam(rParamName = "p_cni")
	private String cni;

	@RParam(rParamName = "p_telefone")
	private String telefone;

	@RParam(rParamName = "p_telemovel")
	private String telemovel;

	@RParam(rParamName = "p_nada")
	private String nada;

	@RParam(rParamName = "p_password")
	private String password;

	@RParam(rParamName = "p_confirmar_password")
	private String confirmar_password;

	@RParam(rParamName = "p_s_ass")
	private String s_ass;

	@RParam(rParamName = "p_form_1_img_1")
	private UploadFile form_1_img_1;

	@RParam(rParamName = "p_fotografia")
	private UploadFile fotografia;
	
	public void setTitulo_text(String titulo_text){
		this.titulo_text = titulo_text;
	}
	public String getTitulo_text(){
		return this.titulo_text;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setCni(String cni){
		this.cni = cni;
	}
	public String getCni(){
		return this.cni;
	}
	
	public void setTelefone(String telefone){
		this.telefone = telefone;
	}
	public String getTelefone(){
		return this.telefone;
	}
	
	public void setTelemovel(String telemovel){
		this.telemovel = telemovel;
	}
	public String getTelemovel(){
		return this.telemovel;
	}
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	
	public void setConfirmar_password(String confirmar_password){
		this.confirmar_password = confirmar_password;
	}
	public String getConfirmar_password(){
		return this.confirmar_password;
	}
	
	public void setS_ass(String s_ass){
		this.s_ass = s_ass;
	}
	public String getS_ass(){
		return this.s_ass;
	}
	
	public void setForm_1_img_1(UploadFile form_1_img_1){
		this.form_1_img_1 = form_1_img_1;
	}
	public UploadFile getForm_1_img_1(){
		return this.form_1_img_1;
	}
	
	public void setFotografia(UploadFile fotografia){
		this.fotografia = fotografia;
	}
	public UploadFile getFotografia(){
		return this.fotografia;
	}



}
