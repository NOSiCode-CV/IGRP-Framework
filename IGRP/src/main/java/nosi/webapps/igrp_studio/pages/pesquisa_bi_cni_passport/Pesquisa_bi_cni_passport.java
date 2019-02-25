package nosi.webapps.igrp_studio.pages.pesquisa_bi_cni_passport;

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
		private String tbl_tipo_documento;
		private String n_doc;
		private String nome_tab;
		private String sexo_tab;
		private String data_nascimento_tab;
		private String nome_pai_tab;
		private String nome_mae_tab;
		private String data_emissao_tab;
		private String emissor_tab;
		private String estado_civil;
		private String nat_conselho;
		private String residencia;
		private String dt_validade;
		private String n_bi;
		public void setTbl_tipo_documento(String tbl_tipo_documento){
			this.tbl_tipo_documento = tbl_tipo_documento;
		}
		public String getTbl_tipo_documento(){
			return this.tbl_tipo_documento;
		}

		public void setN_doc(String n_doc){
			this.n_doc = n_doc;
		}
		public String getN_doc(){
			return this.n_doc;
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

		public void setN_bi(String n_bi){
			this.n_bi = n_bi;
		}
		public String getN_bi(){
			return this.n_bi;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
