package nosi.webapps.igrp.pages.consulta_auditoria;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Consulta_auditoria extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_text_1")
	private String text_1;
	@RParam(rParamName = "p_utilizador_form")
	private String utilizador_form;
	@RParam(rParamName = "p_accao_form")
	private String accao_form;
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	@RParam(rParamName = "p_data_fim")
	private String data_fim;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	
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
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}
	
	public void setUtilizador_form(String utilizador_form){
		this.utilizador_form = utilizador_form;
	}
	public String getUtilizador_form(){
		return this.utilizador_form;
	}
	
	public void setAccao_form(String accao_form){
		this.accao_form = accao_form;
	}
	public String getAccao_form(){
		return this.accao_form;
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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String data;
		private String utilizador;
		private String tabela;
		private String accao;
		private String contexto;
		private String id;
		public void setData(String data){
			this.data = data;
		}
		public String getData(){
			return this.data;
		}

		public void setUtilizador(String utilizador){
			this.utilizador = utilizador;
		}
		public String getUtilizador(){
			return this.utilizador;
		}

		public void setTabela(String tabela){
			this.tabela = tabela;
		}
		public String getTabela(){
			return this.tabela;
		}

		public void setAccao(String accao){
			this.accao = accao;
		}
		public String getAccao(){
			return this.accao;
		}

		public void setContexto(String contexto){
			this.contexto = contexto;
		}
		public String getContexto(){
			return this.contexto;
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
