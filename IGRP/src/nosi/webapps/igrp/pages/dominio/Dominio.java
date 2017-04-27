/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.dominio;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Dominio extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_dominio")
	private String dominio;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setDominio(String dominio){
		this.dominio = dominio;
	}
	public String getDominio(){
		return this.dominio;
	}


	public class Table_1{
		private String dominio;
		private String valor;
		private String significado;
		private String tabela_view;
		public void setDominio(String dominio){
			this.dominio = dominio;
		}
		public String getDominio(){
			return this.dominio;
		}

		public void setValor(String valor){
			this.valor = valor;
		}
		public String getValor(){
			return this.valor;
		}

		public void setSignificado(String significado){
			this.significado = significado;
		}
		public String getSignificado(){
			return this.significado;
		}

		public void setTabela_view(String tabela_view){
			this.tabela_view = tabela_view;
		}
		public String getTabela_view(){
			return this.tabela_view;
		}

	}
}
/*-------------------------*/