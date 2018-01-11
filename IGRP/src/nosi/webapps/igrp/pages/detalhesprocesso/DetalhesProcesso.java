package nosi.webapps.igrp.pages.detalhesprocesso;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class DetalhesProcesso extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_tipo_da_tarefa")
	private String tipo_da_tarefa;
	@RParam(rParamName = "p_prioridade_da_tarefa")
	private String prioridade_da_tarefa;
	@RParam(rParamName = "p_tarefa_atribuida_por")
	private String tarefa_atribuida_por;
	@RParam(rParamName = "p_tarefa_atribuida_a")
	private String tarefa_atribuida_a;
	@RParam(rParamName = "p_tipo_de_processo")
	private String tipo_de_processo;
	@RParam(rParamName = "p_numero_de_processo")
	private String numero_de_processo;
	@RParam(rParamName = "p_data_criacao_de_processo")
	private String data_criacao_de_processo;
	@RParam(rParamName = "p_data_inicio_de_processo")
	private String data_inicio_de_processo;
	@RParam(rParamName = "p_data_fim_processo")
	private String data_fim_processo;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setTipo_da_tarefa(String tipo_da_tarefa){
		this.tipo_da_tarefa = tipo_da_tarefa;
	}
	public String getTipo_da_tarefa(){
		return this.tipo_da_tarefa;
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
	
	public void setData_criacao_de_processo(String data_criacao_de_processo){
		this.data_criacao_de_processo = data_criacao_de_processo;
	}
	public String getData_criacao_de_processo(){
		return this.data_criacao_de_processo;
	}
	
	public void setData_inicio_de_processo(String data_inicio_de_processo){
		this.data_inicio_de_processo = data_inicio_de_processo;
	}
	public String getData_inicio_de_processo(){
		return this.data_inicio_de_processo;
	}
	
	public void setData_fim_processo(String data_fim_processo){
		this.data_fim_processo = data_fim_processo;
	}
	public String getData_fim_processo(){
		return this.data_fim_processo;
	}


	public static class Table_1{
	}
}
