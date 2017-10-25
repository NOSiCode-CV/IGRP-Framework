/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.import_export;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class Import_export extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_data_de")
	private String data_de;
	@RParam(rParamName = "p_data_ate")
	private String data_ate;
	@RParam(rParamName = "p_tipo")
	private String tipo;

	private List<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> gettable_1(){
		return this.table_1;
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
	
	public void setData_de(String data_de){
		this.data_de = data_de;
	}
	public String getData_de(){
		return this.data_de;
	}
	
	public void setData_ate(String data_ate){
		this.data_ate = data_ate;
	}
	public String getData_ate(){
		return this.data_ate;
	}
	
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
	public String getTipo(){
		return this.tipo;
	}


	public static class Table_1{
		private String aplicacao_tabela;
		private String utilizador;
		private String data;
		private String tipo_tabela;
		private String download;
		public void setAplicacao_tabela(String aplicacao_tabela){
			this.aplicacao_tabela = aplicacao_tabela;
		}
		public String getAplicacao_tabela(){
			return this.aplicacao_tabela;
		}

		public void setUtilizador(String utilizador){
			this.utilizador = utilizador;
		}
		public String getUtilizador(){
			return this.utilizador;
		}

		public void setData(String data){
			this.data = data;
		}
		public String getData(){
			return this.data;
		}

		public void setTipo_tabela(String tipo_tabela){
			this.tipo_tabela = tipo_tabela;
		}
		public String getTipo_tabela(){
			return this.tipo_tabela;
		}

		public void setDownload(String download){
			this.download = download;
		}
		public String getDownload(){
			return this.download;
		}

	}
}
/*-------------------------*/