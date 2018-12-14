package nosi.webapps.igrp.pages.gestao_tipo_documento;


import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Gestao_tipo_documento extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_ativo")
	private int ativo;
	@RParam(rParamName = "p_ativo_check")
	private int ativo_check;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
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


	public static class Table_1 extends IGRPTable.Table{
		private String t_aplicacao;
		private String t_codigo;
		private String t_nome;
		private String t_descricao;
		private String t_estado;
		private String id;
		public void setT_aplicacao(String t_aplicacao){
			this.t_aplicacao = t_aplicacao;
		}
		public String getT_aplicacao(){
			return this.t_aplicacao;
		}

		public void setT_codigo(String t_codigo){
			this.t_codigo = t_codigo;
		}
		public String getT_codigo(){
			return this.t_codigo;
		}

		public void setT_nome(String t_nome){
			this.t_nome = t_nome;
		}
		public String getT_nome(){
			return this.t_nome;
		}

		public void setT_descricao(String t_descricao){
			this.t_descricao = t_descricao;
		}
		public String getT_descricao(){
			return this.t_descricao;
		}

		public void setT_estado(String t_estado){
			this.t_estado = t_estado;
		}
		public String getT_estado(){
			return this.t_estado;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
