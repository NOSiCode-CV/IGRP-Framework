/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class NovoMenu extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_titulo")
	private String titulo;
	@RParam(rParamName = "p_menu_principal")
	private String menu_principal;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_pagina")
	private String pagina;
	@RParam(rParamName = "p_target")
	private String target;
	@RParam(rParamName = "p_ordem")
	private String ordem;
	@RParam(rParamName = "p_activo")
	private String activo;
	@RParam(rParamName = "p_menu_base")
	private String menu_base;
	@RParam(rParamName = "p_link_procedure")
	private String link_procedure;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setTitulo(String titulo){
		this.titulo = titulo;
	}
	public String getTitulo(){
		return this.titulo;
	}
	
	public void setMenu_principal(String menu_principal){
		this.menu_principal = menu_principal;
	}
	public String getMenu_principal(){
		return this.menu_principal;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setPagina(String pagina){
		this.pagina = pagina;
	}
	public String getPagina(){
		return this.pagina;
	}
	
	public void setTarget(String target){
		this.target = target;
	}
	public String getTarget(){
		return this.target;
	}
	
	public void setOrdem(String ordem){
		this.ordem = ordem;
	}
	public String getOrdem(){
		return this.ordem;
	}
	
	public void setActivo(String activo){
		this.activo = activo;
	}
	public String getActivo(){
		return this.activo;
	}
	
	public void setMenu_base(String menu_base){
		this.menu_base = menu_base;
	}
	public String getMenu_base(){
		return this.menu_base;
	}
	
	public void setLink_procedure(String link_procedure){
		this.link_procedure = link_procedure;
	}
	public String getLink_procedure(){
		return this.link_procedure;
	}


}
/*-------------------------*/