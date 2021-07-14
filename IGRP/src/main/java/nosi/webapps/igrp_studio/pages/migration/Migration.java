package nosi.webapps.igrp_studio.pages.migration;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

import nosi.core.validator.constraints.*;

public class Migration extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@NotNull()
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	
	private List<Table_pagina> table_pagina = new ArrayList<>();	
	public void setTable_pagina(List<Table_pagina> table_pagina){
		this.table_pagina = table_pagina;
	}
	public List<Table_pagina> getTable_pagina(){
		return this.table_pagina;
	}

	
	private List<Table_report> table_report = new ArrayList<>();	
	public void setTable_report(List<Table_report> table_report){
		this.table_report = table_report;
	}
	public List<Table_report> getTable_report(){
		return this.table_report;
	}

	
	private List<Table_domain_info> table_domain_info = new ArrayList<>();	
	public void setTable_domain_info(List<Table_domain_info> table_domain_info){
		this.table_domain_info = table_domain_info;
	}
	public List<Table_domain_info> getTable_domain_info(){
		return this.table_domain_info;
	}

	
	private List<Table_tipo_documento> table_tipo_documento = new ArrayList<>();	
	public void setTable_tipo_documento(List<Table_tipo_documento> table_tipo_documento){
		this.table_tipo_documento = table_tipo_documento;
	}
	public List<Table_tipo_documento> getTable_tipo_documento(){
		return this.table_tipo_documento;
	}

	
	private List<Tbl_transation> tbl_transation = new ArrayList<>();	
	public void setTbl_transation(List<Tbl_transation> tbl_transation){
		this.tbl_transation = tbl_transation;
	}
	public List<Tbl_transation> getTbl_transation(){
		return this.tbl_transation;
	}

	
	private List<Table_connections> table_connections = new ArrayList<>();	
	public void setTable_connections(List<Table_connections> table_connections){
		this.table_connections = table_connections;
	}
	public List<Table_connections> getTable_connections(){
		return this.table_connections;
	}

	
	private List<Tbl_bpmn> tbl_bpmn = new ArrayList<>();	
	public void setTbl_bpmn(List<Tbl_bpmn> tbl_bpmn){
		this.tbl_bpmn = tbl_bpmn;
	}
	public List<Tbl_bpmn> getTbl_bpmn(){
		return this.tbl_bpmn;
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


	public static class Table_pagina extends IGRPTable.Table{
		private int pagina_ids;
		private int pagina_ids_check;
		private String descricao_pagina;
		public void setPagina_ids(int pagina_ids){
			this.pagina_ids = pagina_ids;
		}
		public int getPagina_ids(){
			return this.pagina_ids;
		}
		public void setPagina_ids_check(int pagina_ids_check){
			this.pagina_ids_check = pagina_ids_check;
		}
		public int getPagina_ids_check(){
			return this.pagina_ids_check;
		}

		public void setDescricao_pagina(String descricao_pagina){
			this.descricao_pagina = descricao_pagina;
		}
		public String getDescricao_pagina(){
			return this.descricao_pagina;
		}

	}
	public static class Table_report extends IGRPTable.Table{
		private int report_ids;
		private int report_ids_check;
		private String descricao_report;
		public void setReport_ids(int report_ids){
			this.report_ids = report_ids;
		}
		public int getReport_ids(){
			return this.report_ids;
		}
		public void setReport_ids_check(int report_ids_check){
			this.report_ids_check = report_ids_check;
		}
		public int getReport_ids_check(){
			return this.report_ids_check;
		}

		public void setDescricao_report(String descricao_report){
			this.descricao_report = descricao_report;
		}
		public String getDescricao_report(){
			return this.descricao_report;
		}

	}
	public static class Table_domain_info extends IGRPTable.Table{
		private String domain_ids;
		private String domain_ids_check;
		private String descricao_domain;
		public void setDomain_ids(String domain_ids){
			this.domain_ids = domain_ids;
		}
		public String getDomain_ids(){
			return this.domain_ids;
		}
		public void setDomain_ids_check(String domain_ids_check){
			this.domain_ids_check = domain_ids_check;
		}
		public String getDomain_ids_check(){
			return this.domain_ids_check;
		}

		public void setDescricao_domain(String descricao_domain){
			this.descricao_domain = descricao_domain;
		}
		public String getDescricao_domain(){
			return this.descricao_domain;
		}

	}
	public static class Table_tipo_documento extends IGRPTable.Table{
		private String tipo_doc_ids;
		private String tipo_doc_ids_check;
		private String descricao_tipo_doc;
		public void setTipo_doc_ids(String tipo_doc_ids){
			this.tipo_doc_ids = tipo_doc_ids;
		}
		public String getTipo_doc_ids(){
			return this.tipo_doc_ids;
		}
		public void setTipo_doc_ids_check(String tipo_doc_ids_check){
			this.tipo_doc_ids_check = tipo_doc_ids_check;
		}
		public String getTipo_doc_ids_check(){
			return this.tipo_doc_ids_check;
		}

		public void setDescricao_tipo_doc(String descricao_tipo_doc){
			this.descricao_tipo_doc = descricao_tipo_doc;
		}
		public String getDescricao_tipo_doc(){
			return this.descricao_tipo_doc;
		}

	}
	public static class Tbl_transation extends IGRPTable.Table{
		private int transation_ids;
		private int transation_ids_check;
		private String descricao_transation;
		public void setTransation_ids(int transation_ids){
			this.transation_ids = transation_ids;
		}
		public int getTransation_ids(){
			return this.transation_ids;
		}
		public void setTransation_ids_check(int transation_ids_check){
			this.transation_ids_check = transation_ids_check;
		}
		public int getTransation_ids_check(){
			return this.transation_ids_check;
		}

		public void setDescricao_transation(String descricao_transation){
			this.descricao_transation = descricao_transation;
		}
		public String getDescricao_transation(){
			return this.descricao_transation;
		}

	}
	public static class Table_connections extends IGRPTable.Table{
		private int conexao_ids;
		private int conexao_ids_check;
		private String descricao_conexao;
		public void setConexao_ids(int conexao_ids){
			this.conexao_ids = conexao_ids;
		}
		public int getConexao_ids(){
			return this.conexao_ids;
		}
		public void setConexao_ids_check(int conexao_ids_check){
			this.conexao_ids_check = conexao_ids_check;
		}
		public int getConexao_ids_check(){
			return this.conexao_ids_check;
		}

		public void setDescricao_conexao(String descricao_conexao){
			this.descricao_conexao = descricao_conexao;
		}
		public String getDescricao_conexao(){
			return this.descricao_conexao;
		}

	}
	public static class Tbl_bpmn extends IGRPTable.Table{
		private String bpmn_ids;
		private String bpmn_ids_check;
		private String descricao_bpmn;
		public void setBpmn_ids(String bpmn_ids){
			this.bpmn_ids = bpmn_ids;
		}
		public String getBpmn_ids(){
			return this.bpmn_ids;
		}
		public void setBpmn_ids_check(String bpmn_ids_check){
			this.bpmn_ids_check = bpmn_ids_check;
		}
		public String getBpmn_ids_check(){
			return this.bpmn_ids_check;
		}

		public void setDescricao_bpmn(String descricao_bpmn){
			this.descricao_bpmn = descricao_bpmn;
		}
		public String getDescricao_bpmn(){
			return this.descricao_bpmn;
		}

	}

	public void loadTable_pagina(BaseQueryInterface query) {
		this.setTable_pagina(this.loadTable(query,Table_pagina.class));
	}

	public void loadTable_report(BaseQueryInterface query) {
		this.setTable_report(this.loadTable(query,Table_report.class));
	}

	public void loadTable_domain_info(BaseQueryInterface query) {
		this.setTable_domain_info(this.loadTable(query,Table_domain_info.class));
	}

	public void loadTable_tipo_documento(BaseQueryInterface query) {
		this.setTable_tipo_documento(this.loadTable(query,Table_tipo_documento.class));
	}

	public void loadTbl_transation(BaseQueryInterface query) {
		this.setTbl_transation(this.loadTable(query,Tbl_transation.class));
	}

	public void loadTable_connections(BaseQueryInterface query) {
		this.setTable_connections(this.loadTable(query,Table_connections.class));
	}

	public void loadTbl_bpmn(BaseQueryInterface query) {
		this.setTbl_bpmn(this.loadTable(query,Tbl_bpmn.class));
	}

}
