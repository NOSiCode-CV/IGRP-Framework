package nosi.webapps.igrp.pages.registarutilizador;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class RegistarUtilizador extends Model{		
	@RParam(rParamName = "p_titulo_text")
	private String titulo_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_username")
	private String username;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_password")
	private String password;
	@RParam(rParamName = "p_confirmar_password")
	private String confirmar_password;
	
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



}
