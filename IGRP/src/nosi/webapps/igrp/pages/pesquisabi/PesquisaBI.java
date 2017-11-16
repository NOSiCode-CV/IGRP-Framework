package nosi.webapps.igrp.pages.pesquisabi;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class PesquisaBI extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_bi")
	private float bi;
	
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
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setBi(float bi){
		this.bi = bi;
	}
	public float getBi(){
		return this.bi;
	}


	public static class Table_1{
		private String bi_tabela;
		private String nome_tabela;
		private String data_nascimento;
		private String sexo;
		private String nome_pai;
		private String nome_mae;
		public void setBi_tabela(String bi_tabela){
			this.bi_tabela = bi_tabela;
		}
		public String getBi_tabela(){
			return this.bi_tabela;
		}

		public void setNome_tabela(String nome_tabela){
			this.nome_tabela = nome_tabela;
		}
		public String getNome_tabela(){
			return this.nome_tabela;
		}

		public void setData_nascimento(String data_nascimento){
			this.data_nascimento = data_nascimento;
		}
		public String getData_nascimento(){
			return this.data_nascimento;
		}

		public void setSexo(String sexo){
			this.sexo = sexo;
		}
		public String getSexo(){
			return this.sexo;
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

	}
}
