/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novoperfil;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NovoPerfil extends Model{		
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_organica")
	private int organica;
	@RParam(rParamName = "p_perfil")
	private int perfil;
	@RParam(rParamName = "p_activo")
	private int activo;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganica(int organica){
		this.organica = organica;
	}
	public int getOrganica(){
		return this.organica;
	}
	
	public void setPerfil(int perfil){
		this.perfil = perfil;
	}
	public int getPerfil(){
		return this.perfil;
	}
	
	public void setActivo(int activo){
		this.activo = activo;
	}
	public int getActivo(){
		return this.activo;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


}
/*-------------------------*/