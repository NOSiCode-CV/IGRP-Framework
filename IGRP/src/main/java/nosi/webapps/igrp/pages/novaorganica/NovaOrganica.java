package nosi.webapps.igrp.pages.novaorganica;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NovaOrganica extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_ativo")
	private int ativo;
	@RParam(rParamName = "p_ativo_check")
	private int ativo_check;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organizacao_pai")
	private String organizacao_pai;
	
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
	
	public void setAtivo(int ativo){
		this.ativo = ativo;
	}
	public int getAtivo(){
		return this.ativo;
	}
	public void setAtivo_check(int ativo_check){
		this.ativo_check = ativo_check;
	}
	public int getAtivo_check(){
		return this.ativo_check;
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
	
	public void setOrganizacao_pai(String organizacao_pai){
		this.organizacao_pai = organizacao_pai;
	}
	public String getOrganizacao_pai(){
		return this.organizacao_pai;
	}



}
