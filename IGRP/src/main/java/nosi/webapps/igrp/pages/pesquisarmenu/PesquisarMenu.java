package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class PesquisarMenu extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_novo")
	private String novo;
	@RParam(rParamName = "p_novo_desc")
	private String novo_desc;
	
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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setNovo(String app,String page,String action){
		this.novo = Config.getResolveUrl(app, page, action);
	}
	public String getNovo(){
		return this.novo;
	}
	public void setNovo_desc(String novo_desc){
		this.novo_desc = novo_desc;
	}
	public String getNovo_desc(){
		return this.novo_desc;
	}


	public static class Table_1{
		private String t1_menu_principal;
		private int ativo;
		private int ativo_check;
		private String table_titulo;
		private String pagina;
		private int checkbox;
		private int checkbox_check;
		private String p_id;
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

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
