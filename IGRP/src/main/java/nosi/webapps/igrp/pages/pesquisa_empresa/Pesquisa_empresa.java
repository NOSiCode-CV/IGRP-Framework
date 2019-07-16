package nosi.webapps.igrp.pages.pesquisa_empresa;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_empresa extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nif")
	private String nif;
	@RParam(rParamName = "p_nome_da_firma")
	private String nome_da_firma;
	
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
	
	public void setNif(String nif){
		this.nif = nif;
	}
	public String getNif(){
		return this.nif;
	}
	
	public void setNome_da_firma(String nome_da_firma){
		this.nome_da_firma = nome_da_firma;
	}
	public String getNome_da_firma(){
		return this.nome_da_firma;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nif_tab;
		private String nome_da_firma_tab;
		private String matriculan_reg_comercial;
		private String data_registo_data_reg_comercial;
		private String data_inicio_atividade;
		private String natureza_juridica;
		private String natureza_juridica_desc;
		private String tipo_entidade;
		private String tipo_entidade_desc;
		private String estado;
		public void setNif_tab(String nif_tab){
			this.nif_tab = nif_tab;
		}
		public String getNif_tab(){
			return this.nif_tab;
		}

		public void setNome_da_firma_tab(String nome_da_firma_tab){
			this.nome_da_firma_tab = nome_da_firma_tab;
		}
		public String getNome_da_firma_tab(){
			return this.nome_da_firma_tab;
		}

		public void setMatriculan_reg_comercial(String matriculan_reg_comercial){
			this.matriculan_reg_comercial = matriculan_reg_comercial;
		}
		public String getMatriculan_reg_comercial(){
			return this.matriculan_reg_comercial;
		}

		public void setData_registo_data_reg_comercial(String data_registo_data_reg_comercial){
			this.data_registo_data_reg_comercial = data_registo_data_reg_comercial;
		}
		public String getData_registo_data_reg_comercial(){
			return this.data_registo_data_reg_comercial;
		}

		public void setData_inicio_atividade(String data_inicio_atividade){
			this.data_inicio_atividade = data_inicio_atividade;
		}
		public String getData_inicio_atividade(){
			return this.data_inicio_atividade;
		}

		public void setNatureza_juridica(String natureza_juridica){
			this.natureza_juridica = natureza_juridica;
		}
		public String getNatureza_juridica(){
			return this.natureza_juridica;
		}

		public void setNatureza_juridica_desc(String natureza_juridica_desc){
			this.natureza_juridica_desc = natureza_juridica_desc;
		}
		public String getNatureza_juridica_desc(){
			return this.natureza_juridica_desc;
		}

		public void setTipo_entidade(String tipo_entidade){
			this.tipo_entidade = tipo_entidade;
		}
		public String getTipo_entidade(){
			return this.tipo_entidade;
		}

		public void setTipo_entidade_desc(String tipo_entidade_desc){
			this.tipo_entidade_desc = tipo_entidade_desc;
		}
		public String getTipo_entidade_desc(){
			return this.tipo_entidade_desc;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
