/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.transferir_tarefas;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Transferir_tarefas extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_numero_processo")
	private String numero_processo;
	@RParam(rParamName = "p_codigo_processo")
	private String codigo_processo;
	@RParam(rParamName = "p_tipo_processo")
	private String tipo_processo;
	@RParam(rParamName = "p_data_criacao")
	private String data_criacao;
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	@RParam(rParamName = "p_data_fim")
	private String data_fim;
	@RParam(rParamName = "p_criado_por_")
	private String criado_por_;
	@RParam(rParamName = "p_atribuido_por")
	private String atribuido_por;
	@RParam(rParamName = "p_utilizador_actual")
	private String utilizador_actual;
	@RParam(rParamName = "p_novo_utilizador")
	private String novo_utilizador;
	@RParam(rParamName = "p_id_utilizador")
	private String p_id_utilizador;
	@RParam(rParamName = "p_id")
	private String p_id;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNumero_processo(String numero_processo){
		this.numero_processo = numero_processo;
	}
	public String getNumero_processo(){
		return this.numero_processo;
	}
	
	public void setCodigo_processo(String codigo_processo){
		this.codigo_processo = codigo_processo;
	}
	public String getCodigo_processo(){
		return this.codigo_processo;
	}
	
	public void setTipo_processo(String tipo_processo){
		this.tipo_processo = tipo_processo;
	}
	public String getTipo_processo(){
		return this.tipo_processo;
	}
	
	public void setData_criacao(String data_criacao){
		this.data_criacao = data_criacao;
	}
	public String getData_criacao(){
		return this.data_criacao;
	}
	
	public void setData_inicio(String data_inicio){
		this.data_inicio = data_inicio;
	}
	public String getData_inicio(){
		return this.data_inicio;
	}
	
	public void setData_fim(String data_fim){
		this.data_fim = data_fim;
	}
	public String getData_fim(){
		return this.data_fim;
	}
	
	public void setCriado_por_(String criado_por_){
		this.criado_por_ = criado_por_;
	}
	public String getCriado_por_(){
		return this.criado_por_;
	}
	
	public void setAtribuido_por(String atribuido_por){
		this.atribuido_por = atribuido_por;
	}
	public String getAtribuido_por(){
		return this.atribuido_por;
	}
	
	public void setUtilizador_actual(String utilizador_actual){
		this.utilizador_actual = utilizador_actual;
	}
	public String getUtilizador_actual(){
		return this.utilizador_actual;
	}
	
	public void setNovo_utilizador(String novo_utilizador){
		this.novo_utilizador = novo_utilizador;
	}
	public String getNovo_utilizador(){
		return this.novo_utilizador;
	}
	
	public void setP_id_utilizador(String p_id_utilizador){
		this.p_id_utilizador = p_id_utilizador;
	}
	public String getP_id_utilizador(){
		return this.p_id_utilizador;
	}
	
	public void setP_id(String p_id){
		this.p_id = p_id;
	}
	public String getP_id(){
		return this.p_id;
	}


}
/*-------------------------*/