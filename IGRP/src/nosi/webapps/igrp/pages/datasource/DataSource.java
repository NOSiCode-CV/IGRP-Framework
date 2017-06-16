/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.datasource;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class DataSource extends Model{		
	@RParam(rParamName = "p_tipo")
	private String tipo;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_area")
	private String area;
	@RParam(rParamName = "p_processo")
	private String processo;
	@RParam(rParamName = "p_etapa")
	private String etapa;
	@RParam(rParamName = "p_objecto")
	private String objecto;
	@RParam(rParamName = "p_pagina")
	private String pagina;
	@RParam(rParamName = "p_query")
	private String query;
	@RParam(rParamName = "p_servico")
	private String servico;
	
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
	public String getTipo(){
		return this.tipo;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setArea(String area){
		this.area = area;
	}
	public String getArea(){
		return this.area;
	}
	
	public void setProcesso(String processo){
		this.processo = processo;
	}
	public String getProcesso(){
		return this.processo;
	}
	
	public void setEtapa(String etapa){
		this.etapa = etapa;
	}
	public String getEtapa(){
		return this.etapa;
	}
	
	public void setObjecto(String objecto){
		this.objecto = objecto;
	}
	public String getObjecto(){
		return this.objecto;
	}
	
	public void setPagina(String pagina){
		this.pagina = pagina;
	}
	public String getPagina(){
		return this.pagina;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	public String getQuery(){
		return this.query;
	}
	
	public void setServico(String servico){
		this.servico = servico;
	}
	public String getServico(){
		return this.servico;
	}


}
/*-------------------------*/