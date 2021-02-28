package nosi.webapps.igrp_studio.pages.historico_page;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

import nosi.core.validator.constraints.*;

public class Historico_page extends Model{		

	@NotNull()
	@RParam(rParamName = "p_descricao_form")
	private String descricao_form;

	@NotNull()
	@RParam(rParamName = "p_comentario")
	private String comentario;

	@RParam(rParamName = "p_id_historico")
	private String id_historico;

	@RParam(rParamName = "p_id_page_form")
	private String id_page_form;

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setDescricao_form(String descricao_form){
		this.descricao_form = descricao_form;
	}
	public String getDescricao_form(){
		return this.descricao_form;
	}
	
	public void setComentario(String comentario){
		this.comentario = comentario;
	}
	public String getComentario(){
		return this.comentario;
	}
	
	public void setId_historico(String id_historico){
		this.id_historico = id_historico;
	}
	public String getId_historico(){
		return this.id_historico;
	}
	
	public void setId_page_form(String id_page_form){
		this.id_page_form = id_page_form;
	}
	public String getId_page_form(){
		return this.id_page_form;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nome;
		private String descricao;
		private String comentario_tbl;
		private String data;
		private String id_historico_tbl;
		private String id_page;
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setComentario_tbl(String comentario_tbl){
			this.comentario_tbl = comentario_tbl;
		}
		public String getComentario_tbl(){
			return this.comentario_tbl;
		}

		public void setData(String data){
			this.data = data;
		}
		public String getData(){
			return this.data;
		}

		public void setId_historico_tbl(String id_historico_tbl){
			this.id_historico_tbl = id_historico_tbl;
		}
		public String getId_historico_tbl(){
			return this.id_historico_tbl;
		}

		public void setId_page(String id_page){
			this.id_page = id_page;
		}
		public String getId_page(){
			return this.id_page;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
