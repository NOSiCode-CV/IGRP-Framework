/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class PesquisarMenu extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_menu_principal")
	private String menu_principal;

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


	public class Table_1{
		private String descricao;
		private String titulo;
		private String pagina;
		private String ativo;
		private String checkbox;
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

		public void setCheckbox(String checkbox){
			this.checkbox = checkbox;
		}
		public String getCheckbox(){
			return this.checkbox;
		}

	}
}
/*-------------------------*/