package nosi.webapps.igrp.pages.pesquisanif;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class PesquisaNIF extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nif")
	private float nif;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_n_documento")
	private float n_documento;
	@RParam(rParamName = "p_tipo_contribuinte")
	private String tipo_contribuinte;
	
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
	
	public void setNif(float nif){
		this.nif = nif;
	}
	public float getNif(){
		return this.nif;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setN_documento(float n_documento){
		this.n_documento = n_documento;
	}
	public float getN_documento(){
		return this.n_documento;
	}
	
	public void setTipo_contribuinte(String tipo_contribuinte){
		this.tipo_contribuinte = tipo_contribuinte;
	}
	public String getTipo_contribuinte(){
		return this.tipo_contribuinte;
	}


	public static class Table_1{
		private String nif_tabela;
		private String nome_tabela;
		private String desig_social;
		private String data_nascimento;
		private String nome_pai;
		private String nome_mae;
		private String documento;
		public void setNif_tabela(String nif_tabela){
			this.nif_tabela = nif_tabela;
		}
		public String getNif_tabela(){
			return this.nif_tabela;
		}

		public void setNome_tabela(String nome_tabela){
			this.nome_tabela = nome_tabela;
		}
		public String getNome_tabela(){
			return this.nome_tabela;
		}

		public void setDesig_social(String desig_social){
			this.desig_social = desig_social;
		}
		public String getDesig_social(){
			return this.desig_social;
		}

		public void setData_nascimento(String data_nascimento){
			this.data_nascimento = data_nascimento;
		}
		public String getData_nascimento(){
			return this.data_nascimento;
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

		public void setDocumento(String documento){
			this.documento = documento;
		}
		public String getDocumento(){
			return this.documento;
		}

	}
}
