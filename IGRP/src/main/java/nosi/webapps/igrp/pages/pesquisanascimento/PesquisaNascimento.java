package nosi.webapps.igrp.pages.pesquisanascimento;


import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class PesquisaNascimento extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_n_registo")
	private String n_registo;
	@RParam(rParamName = "p_nome")
	private String nome;
	
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
	
	public void setN_registo(String n_registo){
		this.n_registo = n_registo;
	}
	public String getN_registo(){
		return this.n_registo;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String n_registo_tabela;
		private String nome_tabela;
		private String data_facto;
		private String nome_mae;
		private String nome_pai;
		public void setN_registo_tabela(String n_registo_tabela){
			this.n_registo_tabela = n_registo_tabela;
		}
		public String getN_registo_tabela(){
			return this.n_registo_tabela;
		}

		public void setNome_tabela(String nome_tabela){
			this.nome_tabela = nome_tabela;
		}
		public String getNome_tabela(){
			return this.nome_tabela;
		}

		public void setData_facto(String data_facto){
			this.data_facto = data_facto;
		}
		public String getData_facto(){
			return this.data_facto;
		}

		public void setNome_mae(String nome_mae){
			this.nome_mae = nome_mae;
		}
		public String getNome_mae(){
			return this.nome_mae;
		}

		public void setNome_pai(String nome_pai){
			this.nome_pai = nome_pai;
		}
		public String getNome_pai(){
			return this.nome_pai;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
