package nosi.webapps.igrp_studio.pages.pesquisa_bi_cni_passport;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_bi_cni_passport extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_tipo_documento")
	private String tipo_documento;
	@RParam(rParamName = "p_numero_do_documento")
	private String numero_do_documento;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_data_nascimento")
	private String data_nascimento;
	
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
	
	public void setTipo_documento(String tipo_documento){
		this.tipo_documento = tipo_documento;
	}
	public String getTipo_documento(){
		return this.tipo_documento;
	}
	
	public void setNumero_do_documento(String numero_do_documento){
		this.numero_do_documento = numero_do_documento;
	}
	public String getNumero_do_documento(){
		return this.numero_do_documento;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setData_nascimento(String data_nascimento){
		this.data_nascimento = data_nascimento;
	}
	public String getData_nascimento(){
		return this.data_nascimento;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String tipo_documento_tab;
		private String n_doc_tab;
		private String nome_tab;
		private String sexo_tab;
		private String data_nascimento_tab;
		private String nome_pai_tab;
		private String nome_mae_tab;
		private String data_emissao_tab;
		private String emissor_tab;
		private String nic_cni_tab;
		private String estado_civil;
		private String nat_conselho;
		private String residencia;
		private String dt_validade;
		private String bi_tab;
		private String passaporte_tab;
		public void setTipo_documento_tab(String tipo_documento_tab){
			this.tipo_documento_tab = tipo_documento_tab;
		}
		public String getTipo_documento_tab(){
			return this.tipo_documento_tab;
		}

		public void setN_doc_tab(String n_doc_tab){
			this.n_doc_tab = n_doc_tab;
		}
		public String getN_doc_tab(){
			return this.n_doc_tab;
		}

		public void setNome_tab(String nome_tab){
			this.nome_tab = nome_tab;
		}
		public String getNome_tab(){
			return this.nome_tab;
		}

		public void setSexo_tab(String sexo_tab){
			this.sexo_tab = sexo_tab;
		}
		public String getSexo_tab(){
			return this.sexo_tab;
		}

		public void setData_nascimento_tab(String data_nascimento_tab){
			this.data_nascimento_tab = data_nascimento_tab;
		}
		public String getData_nascimento_tab(){
			return this.data_nascimento_tab;
		}

		public void setNome_pai_tab(String nome_pai_tab){
			this.nome_pai_tab = nome_pai_tab;
		}
		public String getNome_pai_tab(){
			return this.nome_pai_tab;
		}

		public void setNome_mae_tab(String nome_mae_tab){
			this.nome_mae_tab = nome_mae_tab;
		}
		public String getNome_mae_tab(){
			return this.nome_mae_tab;
		}

		public void setData_emissao_tab(String data_emissao_tab){
			this.data_emissao_tab = data_emissao_tab;
		}
		public String getData_emissao_tab(){
			return this.data_emissao_tab;
		}

		public void setEmissor_tab(String emissor_tab){
			this.emissor_tab = emissor_tab;
		}
		public String getEmissor_tab(){
			return this.emissor_tab;
		}

		public void setNic_cni_tab(String nic_cni_tab){
			this.nic_cni_tab = nic_cni_tab;
		}
		public String getNic_cni_tab(){
			return this.nic_cni_tab;
		}

		public void setEstado_civil(String estado_civil){
			this.estado_civil = estado_civil;
		}
		public String getEstado_civil(){
			return this.estado_civil;
		}

		public void setNat_conselho(String nat_conselho){
			this.nat_conselho = nat_conselho;
		}
		public String getNat_conselho(){
			return this.nat_conselho;
		}

		public void setResidencia(String residencia){
			this.residencia = residencia;
		}
		public String getResidencia(){
			return this.residencia;
		}

		public void setDt_validade(String dt_validade){
			this.dt_validade = dt_validade;
		}
		public String getDt_validade(){
			return this.dt_validade;
		}

		public void setBi_tab(String bi_tab){
			this.bi_tab = bi_tab;
		}
		public String getBi_tab(){
			return this.bi_tab;
		}

		public void setPassaporte_tab(String passaporte_tab){
			this.passaporte_tab = passaporte_tab;
		}
		public String getPassaporte_tab(){
			return this.passaporte_tab;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
