package nosi.webapps.igrp.pages.datasource;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class DataSource extends Model{		
	@RParam(rParamName = "p_data_source")
	private String data_source;
	@RParam(rParamName = "p_tipo")
	private String tipo;
	@RParam(rParamName = "p_nome")
	private String nome;
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
	private int id_pagina;
	@RParam(rParamName = "p_id_servico")
	private String id_servico;
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_id_env")
	private String id_env;
	
	public void setData_source(String data_source){
		this.data_source = data_source;
	}
	public String getData_source(){
		return this.data_source;
	}
	
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
	
	public void setId_pagina(int id_pagina){
		this.id_pagina = id_pagina;
	}
	public int getId_pagina(){
		return this.id_pagina;
	}
	
	public void setId_servico(String id_servico){
		this.id_servico = id_servico;
	}
	public String getId_servico(){
		return this.id_servico;
	}
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	
	public void setId_env(String id_env){
		this.id_env = id_env;
	}
	public String getId_env(){
		return this.id_env;
	}



}
