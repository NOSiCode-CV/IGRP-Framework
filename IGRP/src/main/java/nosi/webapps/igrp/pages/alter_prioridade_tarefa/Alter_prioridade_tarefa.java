package nosi.webapps.igrp.pages.alter_prioridade_tarefa;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Alter_prioridade_tarefa extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_nova_prioridade")
	private Integer nova_prioridade;

	@RParam(rParamName = "p_id")
	private String id;

	@RParam(rParamName = "p_detalhes_do_processo")
	private String detalhes_do_processo;

	@RParam(rParamName = "p_tipo_de_processo")
	private String tipo_de_processo;

	@RParam(rParamName = "p_numero_de_processo")
	private String numero_de_processo;

	@RParam(rParamName = "p_data_inicio_do_processo")
	private String data_inicio_do_processo;

	@RParam(rParamName = "p_detalhes_da_tarefa")
	private String detalhes_da_tarefa;

	@RParam(rParamName = "p_descricao_da_tarefa")
	private String descricao_da_tarefa;

	@RParam(rParamName = "p_data_inicio_da_tarefa")
	private String data_inicio_da_tarefa;

	@RParam(rParamName = "p_prioridade_da_tarefa")
	private String prioridade_da_tarefa;

	@RParam(rParamName = "p_tarefa_atribuida_por")
	private String tarefa_atribuida_por;

	@RParam(rParamName = "p_tarefa_atribuida_a")
	private String tarefa_atribuida_a;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNova_prioridade(Integer nova_prioridade){
		this.nova_prioridade = nova_prioridade;
	}
	public Integer getNova_prioridade(){
		return this.nova_prioridade;
	}
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	
	public void setDetalhes_do_processo(String detalhes_do_processo){
		this.detalhes_do_processo = detalhes_do_processo;
	}
	public String getDetalhes_do_processo(){
		return this.detalhes_do_processo;
	}
	
	public void setTipo_de_processo(String tipo_de_processo){
		this.tipo_de_processo = tipo_de_processo;
	}
	public String getTipo_de_processo(){
		return this.tipo_de_processo;
	}
	
	public void setNumero_de_processo(String numero_de_processo){
		this.numero_de_processo = numero_de_processo;
	}
	public String getNumero_de_processo(){
		return this.numero_de_processo;
	}
	
	public void setData_inicio_do_processo(String data_inicio_do_processo){
		this.data_inicio_do_processo = data_inicio_do_processo;
	}
	public String getData_inicio_do_processo(){
		return this.data_inicio_do_processo;
	}
	
	public void setDetalhes_da_tarefa(String detalhes_da_tarefa){
		this.detalhes_da_tarefa = detalhes_da_tarefa;
	}
	public String getDetalhes_da_tarefa(){
		return this.detalhes_da_tarefa;
	}
	
	public void setDescricao_da_tarefa(String descricao_da_tarefa){
		this.descricao_da_tarefa = descricao_da_tarefa;
	}
	public String getDescricao_da_tarefa(){
		return this.descricao_da_tarefa;
	}
	
	public void setData_inicio_da_tarefa(String data_inicio_da_tarefa){
		this.data_inicio_da_tarefa = data_inicio_da_tarefa;
	}
	public String getData_inicio_da_tarefa(){
		return this.data_inicio_da_tarefa;
	}
	
	public void setPrioridade_da_tarefa(String prioridade_da_tarefa){
		this.prioridade_da_tarefa = prioridade_da_tarefa;
	}
	public String getPrioridade_da_tarefa(){
		return this.prioridade_da_tarefa;
	}
	
	public void setTarefa_atribuida_por(String tarefa_atribuida_por){
		this.tarefa_atribuida_por = tarefa_atribuida_por;
	}
	public String getTarefa_atribuida_por(){
		return this.tarefa_atribuida_por;
	}
	
	public void setTarefa_atribuida_a(String tarefa_atribuida_a){
		this.tarefa_atribuida_a = tarefa_atribuida_a;
	}
	public String getTarefa_atribuida_a(){
		return this.tarefa_atribuida_a;
	}



}
