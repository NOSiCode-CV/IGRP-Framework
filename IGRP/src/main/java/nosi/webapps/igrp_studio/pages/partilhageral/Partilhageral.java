package nosi.webapps.igrp_studio.pages.partilhageral;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class Partilhageral extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao_origem")
	private String aplicacao_origem;
	@RParam(rParamName = "p_elemento")
	private String elemento;
	@RParam(rParamName = "p_aplicacao_destino")
	private String aplicacao_destino;
	
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
	
	public void setAplicacao_origem(String aplicacao_origem){
		this.aplicacao_origem = aplicacao_origem;
	}
	public String getAplicacao_origem(){
		return this.aplicacao_origem;
	}
	
	public void setElemento(String elemento){
		this.elemento = elemento;
	}
	public String getElemento(){
		return this.elemento;
	}
	
	public void setAplicacao_destino(String aplicacao_destino){
		this.aplicacao_destino = aplicacao_destino;
	}
	public String getAplicacao_destino(){
		return this.aplicacao_destino;
	}


	public static class Table_1{
		private int estado;
		private int estado_check;
		private String nome;
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

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
