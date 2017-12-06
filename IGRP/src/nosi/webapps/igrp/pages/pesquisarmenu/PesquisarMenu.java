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
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_menu_principal")
	private String menu_principal;
	
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
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setMenu_principal(String menu_principal){
		this.menu_principal = menu_principal;
	}
	public String getMenu_principal(){
		return this.menu_principal;
	}


	public static class Table_1{
		private String descricao;
		private String titulo;
		private String pagina;
		private String ativo;
		private int checkbox;
		private int checkbox_check;
		private String p_id;
		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setTitulo(String titulo){
			this.titulo = titulo;
		}
		public String getTitulo(){
			return this.titulo;
		}

		public void setPagina(String pagina){
			this.pagina = pagina;
		}
		public String getPagina(){
			return this.pagina;
		}

		public void setAtivo(String ativo){
			this.ativo = ativo;
		}
		public String getAtivo(){
			return this.ativo;
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
