package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Wizard_export_step_2 extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_modulo")
	private String[] modulo;
	@RParam(rParamName = "p_export_type")
	private String export_type;
	@RParam(rParamName = "p_application_id")
	private Integer application_id;
	@RParam(rParamName = "p_file_name")
	private String file_name;
	
	private List<Table_bpmn> table_bpmn = new ArrayList<>();	
	public void setTable_bpmn(List<Table_bpmn> table_bpmn){
		this.table_bpmn = table_bpmn;
	}
	public List<Table_bpmn> getTable_bpmn(){
		return this.table_bpmn;
	}

	
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

	
	private List<Table_menu> table_menu = new ArrayList<>();	
	public void setTable_menu(List<Table_menu> table_menu){
		this.table_menu = table_menu;
	}
	public List<Table_menu> getTable_menu(){
		return this.table_menu;
	}

	
	private List<Table_domain> table_domain = new ArrayList<>();	
	public void setTable_domain(List<Table_domain> table_domain){
		this.table_domain = table_domain;
	}
	public List<Table_domain> getTable_domain(){
		return this.table_domain;
	}

	
	private List<Table_dao> table_dao = new ArrayList<>();	
	public void setTable_dao(List<Table_dao> table_dao){
		this.table_dao = table_dao;
	}
	public List<Table_dao> getTable_dao(){
		return this.table_dao;
	}

	
	private List<Table_others_class> table_others_class = new ArrayList<>();	
	public void setTable_others_class(List<Table_others_class> table_others_class){
		this.table_others_class = table_others_class;
	}
	public List<Table_others_class> getTable_others_class(){
		return this.table_others_class;
	}

	
	private List<Table_service> table_service = new ArrayList<>();	
	public void setTable_service(List<Table_service> table_service){
		this.table_service = table_service;
	}
	public List<Table_service> getTable_service(){
		return this.table_service;
	}

	
	private List<Table_connections> table_connections = new ArrayList<>();	
	public void setTable_connections(List<Table_connections> table_connections){
		this.table_connections = table_connections;
	}
	public List<Table_connections> getTable_connections(){
		return this.table_connections;
	}

	
	private List<Tbl_transation> tbl_transation = new ArrayList<>();	
	public void setTbl_transation(List<Tbl_transation> tbl_transation){
		this.tbl_transation = tbl_transation;
	}
	public List<Tbl_transation> getTbl_transation(){
		return this.tbl_transation;
	}

	
	private List<Table_modulo> table_modulo = new ArrayList<>();	
	public void setTable_modulo(List<Table_modulo> table_modulo){
		this.table_modulo = table_modulo;
	}
	public List<Table_modulo> getTable_modulo(){
		return this.table_modulo;
	}

	
	private List<Table_doc_type> table_doc_type = new ArrayList<>();	
	public void setTable_doc_type(List<Table_doc_type> table_doc_type){
		this.table_doc_type = table_doc_type;
	}
	public List<Table_doc_type> getTable_doc_type(){
		return this.table_doc_type;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setModulo(String[] modulo){
		this.modulo = modulo;
	}
	public String[] getModulo(){
		return this.modulo;
	}
	
	public void setExport_type(String export_type){
		this.export_type = export_type;
	}
	public String getExport_type(){
		return this.export_type;
	}
	
	public void setApplication_id(Integer application_id){
		this.application_id = application_id;
	}
	public Integer getApplication_id(){
		return this.application_id;
	}
	
	public void setFile_name(String file_name){
		this.file_name = file_name;
	}
	public String getFile_name(){
		return this.file_name;
	}


	public static class Table_bpmn extends IGRPTable.Table{
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
	public static class Table_pagina extends IGRPTable.Table{
		private String pagina_ids;
		private String pagina_ids_check;
		private String descricao_pagina;
		public void setPagina_ids(String pagina_ids){
			this.pagina_ids = pagina_ids;
		}
		public String getPagina_ids(){
			return this.pagina_ids;
		}
		public void setPagina_ids_check(String pagina_ids_check){
			this.pagina_ids_check = pagina_ids_check;
		}
		public String getPagina_ids_check(){
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
		private String report_ids;
		private String report_ids_check;
		private String descricao_report;
		public void setReport_ids(String report_ids){
			this.report_ids = report_ids;
		}
		public String getReport_ids(){
			return this.report_ids;
		}
		public void setReport_ids_check(String report_ids_check){
			this.report_ids_check = report_ids_check;
		}
		public String getReport_ids_check(){
			return this.report_ids_check;
		}

		public void setDescricao_report(String descricao_report){
			this.descricao_report = descricao_report;
		}
		public String getDescricao_report(){
			return this.descricao_report;
		}

	}
	public static class Table_menu extends IGRPTable.Table{
		private String menu_ids;
		private String menu_ids_check;
		private String descricao_menu;
		public void setMenu_ids(String menu_ids){
			this.menu_ids = menu_ids;
		}
		public String getMenu_ids(){
			return this.menu_ids;
		}
		public void setMenu_ids_check(String menu_ids_check){
			this.menu_ids_check = menu_ids_check;
		}
		public String getMenu_ids_check(){
			return this.menu_ids_check;
		}

		public void setDescricao_menu(String descricao_menu){
			this.descricao_menu = descricao_menu;
		}
		public String getDescricao_menu(){
			return this.descricao_menu;
		}

	}
	public static class Table_domain extends IGRPTable.Table{
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
	public static class Table_dao extends IGRPTable.Table{
		private String dao_ids;
		private String dao_ids_check;
		private String descricao_dao;
		public void setDao_ids(String dao_ids){
			this.dao_ids = dao_ids;
		}
		public String getDao_ids(){
			return this.dao_ids;
		}
		public void setDao_ids_check(String dao_ids_check){
			this.dao_ids_check = dao_ids_check;
		}
		public String getDao_ids_check(){
			return this.dao_ids_check;
		}

		public void setDescricao_dao(String descricao_dao){
			this.descricao_dao = descricao_dao;
		}
		public String getDescricao_dao(){
			return this.descricao_dao;
		}

	}
	public static class Table_others_class extends IGRPTable.Table{
		private String others_class_ids;
		private String others_class_ids_check;
		private String descricao_others_class;
		public void setOthers_class_ids(String others_class_ids){
			this.others_class_ids = others_class_ids;
		}
		public String getOthers_class_ids(){
			return this.others_class_ids;
		}
		public void setOthers_class_ids_check(String others_class_ids_check){
			this.others_class_ids_check = others_class_ids_check;
		}
		public String getOthers_class_ids_check(){
			return this.others_class_ids_check;
		}

		public void setDescricao_others_class(String descricao_others_class){
			this.descricao_others_class = descricao_others_class;
		}
		public String getDescricao_others_class(){
			return this.descricao_others_class;
		}

	}
	public static class Table_service extends IGRPTable.Table{
		private String services_ids;
		private String services_ids_check;
		private String descricao_services;
		public void setServices_ids(String services_ids){
			this.services_ids = services_ids;
		}
		public String getServices_ids(){
			return this.services_ids;
		}
		public void setServices_ids_check(String services_ids_check){
			this.services_ids_check = services_ids_check;
		}
		public String getServices_ids_check(){
			return this.services_ids_check;
		}

		public void setDescricao_services(String descricao_services){
			this.descricao_services = descricao_services;
		}
		public String getDescricao_services(){
			return this.descricao_services;
		}

	}
	public static class Table_connections extends IGRPTable.Table{
		private String conexao_ids;
		private String conexao_ids_check;
		private String descricao_conexao;
		public void setConexao_ids(String conexao_ids){
			this.conexao_ids = conexao_ids;
		}
		public String getConexao_ids(){
			return this.conexao_ids;
		}
		public void setConexao_ids_check(String conexao_ids_check){
			this.conexao_ids_check = conexao_ids_check;
		}
		public String getConexao_ids_check(){
			return this.conexao_ids_check;
		}

		public void setDescricao_conexao(String descricao_conexao){
			this.descricao_conexao = descricao_conexao;
		}
		public String getDescricao_conexao(){
			return this.descricao_conexao;
		}

	}
	public static class Tbl_transation extends IGRPTable.Table{
		private String transation_ids;
		private String transation_ids_check;
		private String descricao_transation;
		public void setTransation_ids(String transation_ids){
			this.transation_ids = transation_ids;
		}
		public String getTransation_ids(){
			return this.transation_ids;
		}
		public void setTransation_ids_check(String transation_ids_check){
			this.transation_ids_check = transation_ids_check;
		}
		public String getTransation_ids_check(){
			return this.transation_ids_check;
		}

		public void setDescricao_transation(String descricao_transation){
			this.descricao_transation = descricao_transation;
		}
		public String getDescricao_transation(){
			return this.descricao_transation;
		}

	}
	public static class Table_modulo extends IGRPTable.Table{
		private String modulo_ids;
		private String modulo_ids_check;
		private String descricao_modulo;
		public void setModulo_ids(String modulo_ids){
			this.modulo_ids = modulo_ids;
		}
		public String getModulo_ids(){
			return this.modulo_ids;
		}
		public void setModulo_ids_check(String modulo_ids_check){
			this.modulo_ids_check = modulo_ids_check;
		}
		public String getModulo_ids_check(){
			return this.modulo_ids_check;
		}

		public void setDescricao_modulo(String descricao_modulo){
			this.descricao_modulo = descricao_modulo;
		}
		public String getDescricao_modulo(){
			return this.descricao_modulo;
		}

	}
	public static class Table_doc_type extends IGRPTable.Table{
		private int tipo_doc_ids;
		private int tipo_doc_ids_check;
		private String descricao_tipo_doc;
		public void setTipo_doc_ids(int tipo_doc_ids){
			this.tipo_doc_ids = tipo_doc_ids;
		}
		public int getTipo_doc_ids(){
			return this.tipo_doc_ids;
		}
		public void setTipo_doc_ids_check(int tipo_doc_ids_check){
			this.tipo_doc_ids_check = tipo_doc_ids_check;
		}
		public int getTipo_doc_ids_check(){
			return this.tipo_doc_ids_check;
		}

		public void setDescricao_tipo_doc(String descricao_tipo_doc){
			this.descricao_tipo_doc = descricao_tipo_doc;
		}
		public String getDescricao_tipo_doc(){
			return this.descricao_tipo_doc;
		}

	}

	public void loadTable_bpmn(BaseQueryInterface query) {
		this.setTable_bpmn(this.loadTable(query,Table_bpmn.class));
	}

	public void loadTable_pagina(BaseQueryInterface query) {
		this.setTable_pagina(this.loadTable(query,Table_pagina.class));
	}

	public void loadTable_report(BaseQueryInterface query) {
		this.setTable_report(this.loadTable(query,Table_report.class));
	}

	public void loadTable_menu(BaseQueryInterface query) {
		this.setTable_menu(this.loadTable(query,Table_menu.class));
	}

	public void loadTable_domain(BaseQueryInterface query) {
		this.setTable_domain(this.loadTable(query,Table_domain.class));
	}

	public void loadTable_dao(BaseQueryInterface query) {
		this.setTable_dao(this.loadTable(query,Table_dao.class));
	}

	public void loadTable_others_class(BaseQueryInterface query) {
		this.setTable_others_class(this.loadTable(query,Table_others_class.class));
	}

	public void loadTable_service(BaseQueryInterface query) {
		this.setTable_service(this.loadTable(query,Table_service.class));
	}

	public void loadTable_connections(BaseQueryInterface query) {
		this.setTable_connections(this.loadTable(query,Table_connections.class));
	}

	public void loadTbl_transation(BaseQueryInterface query) {
		this.setTbl_transation(this.loadTable(query,Tbl_transation.class));
	}

	public void loadTable_modulo(BaseQueryInterface query) {
		this.setTable_modulo(this.loadTable(query,Table_modulo.class));
	}

	public void loadTable_doc_type(BaseQueryInterface query) {
		this.setTable_doc_type(this.loadTable(query,Table_doc_type.class));
	}

}
