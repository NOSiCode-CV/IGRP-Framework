package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import nosi.core.config.Config;
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
	private int application_id;
	@RParam(rParamName = "p_file_name")
	private String file_name;
	
	private List<Table_bpmn> table_bpmn = new ArrayList<>();	
	public void setTable_bpmn(List<Table_bpmn> table_bpmn){
		this.table_bpmn = table_bpmn;
	}
	public List<Table_bpmn> getTable_bpmn(){
		return this.table_bpmn;
	}
	@RParam(rParamName = "p_table_bpmn_id")
	private String[] p_table_bpmn_id;
	@RParam(rParamName = "p_table_bpmn_del")
	private String[] p_table_bpmn_del;
	
	public void setP_table_bpmn_id(String[] p_table_bpmn_id){
		this.p_table_bpmn_id = p_table_bpmn_id;
	}
	public String[] getP_table_bpmn_id(){
		return this.p_table_bpmn_id;
	}
	
	public void setP_table_bpmn_del(String[] p_table_bpmn_del){
		this.p_table_bpmn_del = p_table_bpmn_del;
	}
	public String[] getP_table_bpmn_del(){
		return this.p_table_bpmn_del;
	}
	
	private List<Table_pagina> table_pagina = new ArrayList<>();	
	public void setTable_pagina(List<Table_pagina> table_pagina){
		this.table_pagina = table_pagina;
	}
	public List<Table_pagina> getTable_pagina(){
		return this.table_pagina;
	}
	@RParam(rParamName = "p_table_pagina_id")
	private String[] p_table_pagina_id;
	@RParam(rParamName = "p_table_pagina_del")
	private String[] p_table_pagina_del;
	
	public void setP_table_pagina_id(String[] p_table_pagina_id){
		this.p_table_pagina_id = p_table_pagina_id;
	}
	public String[] getP_table_pagina_id(){
		return this.p_table_pagina_id;
	}
	
	public void setP_table_pagina_del(String[] p_table_pagina_del){
		this.p_table_pagina_del = p_table_pagina_del;
	}
	public String[] getP_table_pagina_del(){
		return this.p_table_pagina_del;
	}
	
	private List<Table_domain> table_domain = new ArrayList<>();	
	public void setTable_domain(List<Table_domain> table_domain){
		this.table_domain = table_domain;
	}
	public List<Table_domain> getTable_domain(){
		return this.table_domain;
	}
	@RParam(rParamName = "p_table_domain_id")
	private String[] p_table_domain_id;
	@RParam(rParamName = "p_table_domain_del")
	private String[] p_table_domain_del;
	
	public void setP_table_domain_id(String[] p_table_domain_id){
		this.p_table_domain_id = p_table_domain_id;
	}
	public String[] getP_table_domain_id(){
		return this.p_table_domain_id;
	}
	
	public void setP_table_domain_del(String[] p_table_domain_del){
		this.p_table_domain_del = p_table_domain_del;
	}
	public String[] getP_table_domain_del(){
		return this.p_table_domain_del;
	}
	
	private List<Table_report> table_report = new ArrayList<>();	
	public void setTable_report(List<Table_report> table_report){
		this.table_report = table_report;
	}
	public List<Table_report> getTable_report(){
		return this.table_report;
	}
	@RParam(rParamName = "p_table_report_id")
	private String[] p_table_report_id;
	@RParam(rParamName = "p_table_report_del")
	private String[] p_table_report_del;
	
	public void setP_table_report_id(String[] p_table_report_id){
		this.p_table_report_id = p_table_report_id;
	}
	public String[] getP_table_report_id(){
		return this.p_table_report_id;
	}
	
	public void setP_table_report_del(String[] p_table_report_del){
		this.p_table_report_del = p_table_report_del;
	}
	public String[] getP_table_report_del(){
		return this.p_table_report_del;
	}
	
	private List<Table_dao> table_dao = new ArrayList<>();	
	public void setTable_dao(List<Table_dao> table_dao){
		this.table_dao = table_dao;
	}
	public List<Table_dao> getTable_dao(){
		return this.table_dao;
	}
	@RParam(rParamName = "p_table_dao_id")
	private String[] p_table_dao_id;
	@RParam(rParamName = "p_table_dao_del")
	private String[] p_table_dao_del;
	
	public void setP_table_dao_id(String[] p_table_dao_id){
		this.p_table_dao_id = p_table_dao_id;
	}
	public String[] getP_table_dao_id(){
		return this.p_table_dao_id;
	}
	
	public void setP_table_dao_del(String[] p_table_dao_del){
		this.p_table_dao_del = p_table_dao_del;
	}
	public String[] getP_table_dao_del(){
		return this.p_table_dao_del;
	}
	
	private List<Table_connections> table_connections = new ArrayList<>();	
	public void setTable_connections(List<Table_connections> table_connections){
		this.table_connections = table_connections;
	}
	public List<Table_connections> getTable_connections(){
		return this.table_connections;
	}
	@RParam(rParamName = "p_table_connections_id")
	private String[] p_table_connections_id;
	@RParam(rParamName = "p_table_connections_del")
	private String[] p_table_connections_del;
	
	public void setP_table_connections_id(String[] p_table_connections_id){
		this.p_table_connections_id = p_table_connections_id;
	}
	public String[] getP_table_connections_id(){
		return this.p_table_connections_id;
	}
	
	public void setP_table_connections_del(String[] p_table_connections_del){
		this.p_table_connections_del = p_table_connections_del;
	}
	public String[] getP_table_connections_del(){
		return this.p_table_connections_del;
	}
	
	private List<Table_menu> table_menu = new ArrayList<>();	
	public void setTable_menu(List<Table_menu> table_menu){
		this.table_menu = table_menu;
	}
	public List<Table_menu> getTable_menu(){
		return this.table_menu;
	}
	@RParam(rParamName = "p_table_menu_id")
	private String[] p_table_menu_id;
	@RParam(rParamName = "p_table_menu_del")
	private String[] p_table_menu_del;
	
	public void setP_table_menu_id(String[] p_table_menu_id){
		this.p_table_menu_id = p_table_menu_id;
	}
	public String[] getP_table_menu_id(){
		return this.p_table_menu_id;
	}
	
	public void setP_table_menu_del(String[] p_table_menu_del){
		this.p_table_menu_del = p_table_menu_del;
	}
	public String[] getP_table_menu_del(){
		return this.p_table_menu_del;
	}
	
	private List<Table_modulo> table_modulo = new ArrayList<>();	
	public void setTable_modulo(List<Table_modulo> table_modulo){
		this.table_modulo = table_modulo;
	}
	public List<Table_modulo> getTable_modulo(){
		return this.table_modulo;
	}
	@RParam(rParamName = "p_table_modulo_id")
	private String[] p_table_modulo_id;
	@RParam(rParamName = "p_table_modulo_del")
	private String[] p_table_modulo_del;
	
	public void setP_table_modulo_id(String[] p_table_modulo_id){
		this.p_table_modulo_id = p_table_modulo_id;
	}
	public String[] getP_table_modulo_id(){
		return this.p_table_modulo_id;
	}
	
	public void setP_table_modulo_del(String[] p_table_modulo_del){
		this.p_table_modulo_del = p_table_modulo_del;
	}
	public String[] getP_table_modulo_del(){
		return this.p_table_modulo_del;
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
	
	public void setApplication_id(int application_id){
		this.application_id = application_id;
	}
	public int getApplication_id(){
		return this.application_id;
	}
	
	public void setFile_name(String file_name){
		this.file_name = file_name;
	}
	public String getFile_name(){
		return this.file_name;
	}


	public static class Table_bpmn extends IGRPTable.Table{
		private int bpmn_ids;
		private int bpmn_ids_check;
		private String descricao_bpmn;
		public void setBpmn_ids(int bpmn_ids){
			this.bpmn_ids = bpmn_ids;
		}
		public int getBpmn_ids(){
			return this.bpmn_ids;
		}
		public void setBpmn_ids_check(int bpmn_ids_check){
			this.bpmn_ids_check = bpmn_ids_check;
		}
		public int getBpmn_ids_check(){
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
	public static class Table_domain extends IGRPTable.Table{
		private int domain_ids;
		private int domain_ids_check;
		private String descricao_domain;
		public void setDomain_ids(int domain_ids){
			this.domain_ids = domain_ids;
		}
		public int getDomain_ids(){
			return this.domain_ids;
		}
		public void setDomain_ids_check(int domain_ids_check){
			this.domain_ids_check = domain_ids_check;
		}
		public int getDomain_ids_check(){
			return this.domain_ids_check;
		}

		public void setDescricao_domain(String descricao_domain){
			this.descricao_domain = descricao_domain;
		}
		public String getDescricao_domain(){
			return this.descricao_domain;
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
	public static class Table_dao extends IGRPTable.Table{
		private int dao_ids;
		private int dao_ids_check;
		private String descricao_dao;
		public void setDao_ids(int dao_ids){
			this.dao_ids = dao_ids;
		}
		public int getDao_ids(){
			return this.dao_ids;
		}
		public void setDao_ids_check(int dao_ids_check){
			this.dao_ids_check = dao_ids_check;
		}
		public int getDao_ids_check(){
			return this.dao_ids_check;
		}

		public void setDescricao_dao(String descricao_dao){
			this.descricao_dao = descricao_dao;
		}
		public String getDescricao_dao(){
			return this.descricao_dao;
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
	public static class Table_menu extends IGRPTable.Table{
		private int menu_ids;
		private int menu_ids_check;
		private String descricao_menu;
		public void setMenu_ids(int menu_ids){
			this.menu_ids = menu_ids;
		}
		public int getMenu_ids(){
			return this.menu_ids;
		}
		public void setMenu_ids_check(int menu_ids_check){
			this.menu_ids_check = menu_ids_check;
		}
		public int getMenu_ids_check(){
			return this.menu_ids_check;
		}

		public void setDescricao_menu(String descricao_menu){
			this.descricao_menu = descricao_menu;
		}
		public String getDescricao_menu(){
			return this.descricao_menu;
		}

	}
	public static class Table_modulo extends IGRPTable.Table{
		private int modulo_ids;
		private int modulo_ids_check;
		private String descricao_modulo;
		public void setModulo_ids(int modulo_ids){
			this.modulo_ids = modulo_ids;
		}
		public int getModulo_ids(){
			return this.modulo_ids;
		}
		public void setModulo_ids_check(int modulo_ids_check){
			this.modulo_ids_check = modulo_ids_check;
		}
		public int getModulo_ids_check(){
			return this.modulo_ids_check;
		}

		public void setDescricao_modulo(String descricao_modulo){
			this.descricao_modulo = descricao_modulo;
		}
		public String getDescricao_modulo(){
			return this.descricao_modulo;
		}

	}

	public void loadTable_bpmn(BaseQueryInterface query) {
		this.setTable_bpmn(this.loadTable(query,Table_bpmn.class));
	}

	public void loadTable_pagina(BaseQueryInterface query) {
		this.setTable_pagina(this.loadTable(query,Table_pagina.class));
	}

	public void loadTable_domain(BaseQueryInterface query) {
		this.setTable_domain(this.loadTable(query,Table_domain.class));
	}

	public void loadTable_report(BaseQueryInterface query) {
		this.setTable_report(this.loadTable(query,Table_report.class));
	}

	public void loadTable_dao(BaseQueryInterface query) {
		this.setTable_dao(this.loadTable(query,Table_dao.class));
	}

	public void loadTable_connections(BaseQueryInterface query) {
		this.setTable_connections(this.loadTable(query,Table_connections.class));
	}

	public void loadTable_menu(BaseQueryInterface query) {
		this.setTable_menu(this.loadTable(query,Table_menu.class));
	}

	public void loadTable_modulo(BaseQueryInterface query) {
		this.setTable_modulo(this.loadTable(query,Table_modulo.class));
	}

}
