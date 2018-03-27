package nosi.webapps.igrp.pages.dominio;
import nosi.core.config.Config;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Dominio extends Model{		
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
		private String dominio;
		private String description;
		private String valor;
		private String estado;
		private int ordem;
		private String p_id;
		public void setDominio(String dominio){
			this.dominio = dominio;
		}
		public String getDominio(){
			return this.dominio;
		}

		public void setDescription(String description){
			this.description = description;
		}
		public String getDescription(){
			return this.description;
		}

		public void setValor(String valor){
			this.valor = valor;
		}
		public String getValor(){
			return this.valor;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setOrdem(int ordem){
			this.ordem = ordem;
		}
		public int getOrdem(){
			return this.ordem;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
