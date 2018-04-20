package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;


import java.util.ArrayList;
import java.util.List;

public class PesquisarPerfil extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
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


	public static class Table_1{
		private String organica;
		private int estado;
		private int estado_check;
		private String descricao;
		private String codigo;
		private String id;
		public void setOrganica(String organica){
			this.organica = organica;
		}
		public String getOrganica(){
			return this.organica;
		}

		public void setEstado(int estado){
			this.estado = estado;
		}
		public int getEstado(){
			return this.estado;
		}
		public void setEstado_check(int estado_check){
			this.estado_check = estado_check;
		}
		public int getEstado_check(){
			return this.estado_check;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setCodigo(String codigo){
			this.codigo = codigo;
		}
		public String getCodigo(){
			return this.codigo;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
