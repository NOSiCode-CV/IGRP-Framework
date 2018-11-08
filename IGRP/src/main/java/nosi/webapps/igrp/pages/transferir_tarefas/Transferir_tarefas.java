package nosi.webapps.igrp.pages.transferir_tarefas;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Transferir_tarefas extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_detalhes_de_processo")
	private String detalhes_de_processo;
	@RParam(rParamName = "p_numero_processo")
	private String numero_processo;
	@RParam(rParamName = "p_tipo_processo")
	private String tipo_processo;
	@RParam(rParamName = "p_criado_por_")
	private String criado_por_;
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	@RParam(rParamName = "p_detalhes_de_tarefa")
	private String detalhes_de_tarefa;
	@RParam(rParamName = "p_n_tarefa")
	private String n_tarefa;
	@RParam(rParamName = "p_descricao_de_tarefa")
	private String descricao_de_tarefa;
	@RParam(rParamName = "p_atribuido_a")
	private String atribuido_a;
	@RParam(rParamName = "p_novo_utilizador")
	private String novo_utilizador;
	@RParam(rParamName = "p_id_utilizador")
	private String id_utilizador;
	@RParam(rParamName = "p_id")
	private String id;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setDetalhes_de_processo(String detalhes_de_processo){
		this.detalhes_de_processo = detalhes_de_processo;
	}
	public String getDetalhes_de_processo(){
		return this.detalhes_de_processo;
	}
	
	public void setNumero_processo(String numero_processo){
		this.numero_processo = numero_processo;
	}
	public String getNumero_processo(){
		return this.numero_processo;
	}
	
	public void setTipo_processo(String tipo_processo){
		this.tipo_processo = tipo_processo;
	}
	public String getTipo_processo(){
		return this.tipo_processo;
	}
	
	public void setCriado_por_(String criado_por_){
		this.criado_por_ = criado_por_;
	}
	public String getCriado_por_(){
		return this.criado_por_;
	}
	
	public void setData_inicio(String data_inicio){
		this.data_inicio = data_inicio;
	}
	public String getData_inicio(){
		return this.data_inicio;
	}
	
	public void setDetalhes_de_tarefa(String detalhes_de_tarefa){
		this.detalhes_de_tarefa = detalhes_de_tarefa;
	}
	public String getDetalhes_de_tarefa(){
		return this.detalhes_de_tarefa;
	}
	
	public void setN_tarefa(String n_tarefa){
		this.n_tarefa = n_tarefa;
	}
	public String getN_tarefa(){
		return this.n_tarefa;
	}
	
	public void setDescricao_de_tarefa(String descricao_de_tarefa){
		this.descricao_de_tarefa = descricao_de_tarefa;
	}
	public String getDescricao_de_tarefa(){
		return this.descricao_de_tarefa;
	}
	
	public void setAtribuido_a(String atribuido_a){
		this.atribuido_a = atribuido_a;
	}
	public String getAtribuido_a(){
		return this.atribuido_a;
	}
	
	public void setNovo_utilizador(String novo_utilizador){
		this.novo_utilizador = novo_utilizador;
	}
	public String getNovo_utilizador(){
		return this.novo_utilizador;
	}
	
	public void setId_utilizador(String id_utilizador){
		this.id_utilizador = id_utilizador;
	}
	public String getId_utilizador(){
		return this.id_utilizador;
	}
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}



}
