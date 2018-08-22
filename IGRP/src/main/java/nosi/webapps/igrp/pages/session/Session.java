package nosi.webapps.igrp.pages.session;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Session extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_utilizador")
	private String utilizador;
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	@RParam(rParamName = "p_estado")
	private String estado;
	@RParam(rParamName = "p_data_fim")
	private String data_fim;
	
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
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setUtilizador(String utilizador){
		this.utilizador = utilizador;
	}
	public String getUtilizador(){
		return this.utilizador;
	}
	
	public void setData_inicio(String data_inicio){
		this.data_inicio = data_inicio;
	}
	public String getData_inicio(){
		return this.data_inicio;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setData_fim(String data_fim){
		this.data_fim = data_fim;
	}
	public String getData_fim(){
		return this.data_fim;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String aplicacao_t;
		private String utilizadort;
		private String ip;
		private String data_inicio_t;
		private String data_fim_t;
		private String table_1_filter;
		public void setAplicacao_t(String aplicacao_t){
			this.aplicacao_t = aplicacao_t;
		}
		public String getAplicacao_t(){
			return this.aplicacao_t;
		}

		public void setUtilizadort(String utilizadort){
			this.utilizadort = utilizadort;
		}
		public String getUtilizadort(){
			return this.utilizadort;
		}

		public void setIp(String ip){
			this.ip = ip;
		}
		public String getIp(){
			return this.ip;
		}

		public void setData_inicio_t(String data_inicio_t){
			this.data_inicio_t = data_inicio_t;
		}
		public String getData_inicio_t(){
			return this.data_inicio_t;
		}

		public void setData_fim_t(String data_fim_t){
			this.data_fim_t = data_fim_t;
		}
		public String getData_fim_t(){
			return this.data_fim_t;
		}

		public void setTable_1_filter(String table_1_filter){
			this.table_1_filter = table_1_filter;
		}
		public String getTable_1_filter(){
			return this.table_1_filter;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
