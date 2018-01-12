package nosi.webapps.igrp.pages.datasource;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class DataSource extends Model{		
	@RParam(rParamName = "p_data_source")
	private String data_source;
	@RParam(rParamName = "p_tipo")
	private String tipo;
	@RParam(rParamName = "p_nome")
	private String nome;
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
	@RParam(rParamName = "p_id_env")
	private String p_id_env;
	
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
	
	public void setP_id_env(String p_id_env){
		this.p_id_env = p_id_env;
	}
	public String getP_id_env(){
		return this.p_id_env;
	}


}
