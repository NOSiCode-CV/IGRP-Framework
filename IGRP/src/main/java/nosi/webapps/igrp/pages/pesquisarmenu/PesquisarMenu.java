package nosi.webapps.igrp.pages.pesquisarmenu;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class PesquisarMenu extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_id_app")
	private int id_app;
	
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
	
	public void setId_app(int id_app){
		this.id_app = id_app;
	}
	public int getId_app(){
		return this.id_app;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String t1_menu_principal;
		private int ativo;
		private int ativo_check;
		private String table_titulo;
		private String pagina;
		private int checkbox;
		private int checkbox_check;
		private String id;
		public void setT1_menu_principal(String t1_menu_principal){
			this.t1_menu_principal = t1_menu_principal;
		}
		public String getT1_menu_principal(){
			return this.t1_menu_principal;
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

		public void setTable_titulo(String table_titulo){
			this.table_titulo = table_titulo;
		}
		public String getTable_titulo(){
			return this.table_titulo;
		}

		public void setPagina(String pagina){
			this.pagina = pagina;
		}
		public String getPagina(){
			return this.pagina;
		}

		public void setCheckbox(int checkbox){
			this.checkbox = checkbox;
		}
		public int getCheckbox(){
			return this.checkbox;
		}
		public void setCheckbox_check(int checkbox_check){
			this.checkbox_check = checkbox_check;
		}
		public int getCheckbox_check(){
			return this.checkbox_check;
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
