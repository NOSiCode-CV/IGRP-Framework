package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NovoPerfil extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_activo")
	private int activo;
	@RParam(rParamName = "p_activo_check")
	private int activo_check;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_perfil")
	private String perfil;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setActivo(int activo){
		this.activo = activo;
	}
	public int getActivo(){
		return this.activo;
	}
	public void setActivo_check(int activo_check){
		this.activo_check = activo_check;
	}
	public int getActivo_check(){
		return this.activo_check;
	}
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setPerfil(String perfil){
		this.perfil = perfil;
	}
	public String getPerfil(){
		return this.perfil;
	}


}
