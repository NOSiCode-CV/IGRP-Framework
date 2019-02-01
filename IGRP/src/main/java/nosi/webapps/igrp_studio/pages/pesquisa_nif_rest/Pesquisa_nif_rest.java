package nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_nif_rest extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_tipo_contribuinte")
	private String tipo_contribuinte;
	@RParam(rParamName = "p_nif")
	private int nif;
	@RParam(rParamName = "p_nome_form")
	private String nome_form;
	@RParam(rParamName = "p_n_documento_form")
	private int n_documento_form;
	
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
	
	public void setTipo_contribuinte(String tipo_contribuinte){
		this.tipo_contribuinte = tipo_contribuinte;
	}
	public String getTipo_contribuinte(){
		return this.tipo_contribuinte;
	}
	
	public void setNif(int nif){
		this.nif = nif;
	}
	public int getNif(){
		return this.nif;
	}
	
	public void setNome_form(String nome_form){
		this.nome_form = nome_form;
	}
	public String getNome_form(){
		return this.nome_form;
	}
	
	public void setN_documento_form(int n_documento_form){
		this.n_documento_form = n_documento_form;
	}
	public int getN_documento_form(){
		return this.n_documento_form;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nif_tab;
		private String nome_tab;
		private String dt_nascimento;
		private String nome_pai;
		private String nome_mae;
		private String documento_tab;
		public void setNif_tab(String nif_tab){
			this.nif_tab = nif_tab;
		}
		public String getNif_tab(){
			return this.nif_tab;
		}

		public void setNome_tab(String nome_tab){
			this.nome_tab = nome_tab;
		}
		public String getNome_tab(){
			return this.nome_tab;
		}

		public void setDt_nascimento(String dt_nascimento){
			this.dt_nascimento = dt_nascimento;
		}
		public String getDt_nascimento(){
			return this.dt_nascimento;
		}

		public void setNome_pai(String nome_pai){
			this.nome_pai = nome_pai;
		}
		public String getNome_pai(){
			return this.nome_pai;
		}

		public void setNome_mae(String nome_mae){
			this.nome_mae = nome_mae;
		}
		public String getNome_mae(){
			return this.nome_mae;
		}

		public void setDocumento_tab(String documento_tab){
			this.documento_tab = documento_tab;
		}
		public String getDocumento_tab(){
			return this.documento_tab;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
