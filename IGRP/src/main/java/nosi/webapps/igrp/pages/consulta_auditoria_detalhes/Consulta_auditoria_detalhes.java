package nosi.webapps.igrp.pages.consulta_auditoria_detalhes;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Consulta_auditoria_detalhes extends Model{		
	@RParam(rParamName = "p_utilizador")
	private String utilizador;
	@RParam(rParamName = "p_tabela")
	private String tabela;
	@RParam(rParamName = "p_ip")
	private String ip;
	@RParam(rParamName = "p_data")
	private String data;
	@RParam(rParamName = "p_accao")
	private String accao;
	@RParam(rParamName = "p_contexto")
	private String contexto;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
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
	
	public void setIp(String ip){
		this.ip = ip;
	}
	public String getIp(){
		return this.ip;
	}
	
	public void setData(String data){
		this.data = data;
	}
	public String getData(){
		return this.data;
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
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String coluna;
		private String antigo;
		private String novo;
		public void setColuna(String coluna){
			this.coluna = coluna;
		}
		public String getColuna(){
			return this.coluna;
		}

		public void setAntigo(String antigo){
			this.antigo = antigo;
		}
		public String getAntigo(){
			return this.antigo;
		}

		public void setNovo(String novo){
			this.novo = novo;
		}
		public String getNovo(){
			return this.novo;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
