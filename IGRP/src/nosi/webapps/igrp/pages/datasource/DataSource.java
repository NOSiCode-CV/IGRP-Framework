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
	private String aplicacao;
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
	@RParam(rParamName = "p_id_pagina")
	private String p_id_pagina;
	@RParam(rParamName = "p_id_servico")
	private String p_id_servico;
	@RParam(rParamName = "p_id")
	private String p_id;
	
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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
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
	
	public void setP_id_pagina(String p_id_pagina){
		this.p_id_pagina = p_id_pagina;
	}
	public String getP_id_pagina(){
		return this.p_id_pagina;
	}
	
	public void setP_id_servico(String p_id_servico){
		this.p_id_servico = p_id_servico;
	}
	public String getP_id_servico(){
		return this.p_id_servico;
	}
	
	public void setP_id(String p_id){
		this.p_id = p_id;
	}
	public String getP_id(){
		return this.p_id;
	}


}
/*-------------------------*/