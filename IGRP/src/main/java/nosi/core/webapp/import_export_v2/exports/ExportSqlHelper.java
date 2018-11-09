package nosi.core.webapp.import_export_v2.exports;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2View;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2.Table_bpmn;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ExportSqlHelper {

	private Application application;
	
	public void loadDataExport(Wizard_export_step_2View view, Wizard_export_step_2 model, String[] opcoes) {
		this.application = new Application().findOne(model.getApplication_id());
		this.showAllTable(view,false);
		for(String type:opcoes) {
			int t = Core.toInt(type);
			if(t==OptionsImportExport.BPMN.getValor()) {
				view.table_bpmn.setVisible(true);
				this.loadBPMNData(model);
			}
			else if(t==OptionsImportExport.DOMAIN.getValor()) {
				view.table_domain.setVisible(true);
				this.loadDomainData(model);
			}
			else if(t==OptionsImportExport.PAGE.getValor()) {
				view.table_pagina.setVisible(true);
				this.loadPageData(model);
			}
			else if(t==OptionsImportExport.REPORT.getValor()) {
				view.table_report.setVisible(true);
				this.loadReportData(model);
			}
			else if(t==OptionsImportExport.CONNECTION.getValor()) {
				view.table_connections.setVisible(true);
				this.loadConnectionData(model);
			}
			else if(t==OptionsImportExport.DAO.getValor()) {
				view.table_dao.setVisible(true);
				this.loadDaoData(model);
			}
			else if(t==OptionsImportExport.MENU.getValor()) {
				view.table_menu.setVisible(true);
				this.loadMenuData(model);
			}
	//		else if(t==ExportTypes.SERVICE.getValor()) {
	//			this.loadServiceData(model);
	//		}
		}
	}


	private void showAllTable(Wizard_export_step_2View view, boolean isVisible) {
		view.table_bpmn.setVisible(isVisible);
		view.table_connections.setVisible(isVisible);
		view.table_dao.setVisible(isVisible);
		view.table_domain.setVisible(isVisible);
		view.table_menu.setVisible(isVisible);
		view.table_pagina.setVisible(isVisible);
		view.table_report.setVisible(isVisible);
		view.table_modulo.setVisible(isVisible);
	}


//	private void loadServiceData(Wizard_export_step_2 model) {
//		this.loadDataFromFile(model,"services");
//	}


	private void loadMenuData(Wizard_export_step_2 model) {
		String sql = "SELECT id as menu_ids,id as menu_ids_check, descr as descricao_menu "
				   + "FROM tbl_menu "
				   + "WHERE env_fk=:application_id";
		model.loadTable_menu(Core.query(null,sql).addInt("application_id", model.getApplication_id()));
	}


	private void loadDaoData(Wizard_export_step_2 model) {
		this.loadDataFromFile(model,"dao");
	}


	private void loadDataFromFile(Wizard_export_step_2 model, String dir) {
		String sql = "";
		String basePath = Path.getPath(this.application);
		basePath += dir + File.separator;
		Map<String, String> files = new FileHelper().readAllFileDirectory(basePath);
		if(files!=null) {
			int size = files.size();
			int count = 0;
			for(Entry<String, String> f:files.entrySet()){
				sql += "SELECT '"+f.getValue()+"' as dao_ids,'"+f.getValue()+"' as dao_ids_check, '"+f.getKey()+"' as descricao_dao ";
				++count;
				if(count!=size) {
					sql+=" UNION ";
				}
			}
		}
		if(Core.isNotNull(sql))
			model.loadTable_dao(Core.query(null,sql));
	}
	private void loadConnectionData(Wizard_export_step_2 model) {
		String sql = "SELECT id as conexao_ids,id as conexao_ids_check, name as descricao_conexao "
				   + "FROM tbl_config_env "
				   + "WHERE env_fk=:application_id";
		model.loadTable_connections(Core.query(null,sql).addInt("application_id", model.getApplication_id()));
	}


	private void loadReportData(Wizard_export_step_2 model) {
		String sql = "SELECT id as report_ids,id as report_ids_check, concat(code,' - ',name) as descricao_report "
				   + "FROM tbl_rep_template "
				   + "WHERE env_fk=:application_id AND status=1";
		model.loadTable_report(Core.query(null,sql).addInt("application_id", model.getApplication_id()));
	}

	private void loadPageData(Wizard_export_step_2 model) {
		String sql = "SELECT id as pagina_ids,id as pagina_ids_check,concat(page,' (',page_descr,')') as descricao_pagina "
				   + "FROM tbl_action "
				   + "WHERE env_fk=:application_id AND status=1 AND processkey is null";
		if(Core.isNotNull(model.getModulo())) {
			sql+= " AND (";
			int count=0;
			int size = model.getModulo().length;			
			for(String modulo:model.getModulo()) {
				sql+=" nomeModulo='"+modulo+"'";
				++count;
				if(count!=size)
					sql+=" OR ";
			}
			sql+= ")";
		}
		model.loadTable_pagina(Core.query(null,sql).addInt("application_id", model.getApplication_id()));
	}

	private void loadDomainData(Wizard_export_step_2 model) {
		String sql = "SELECT id as domain_ids,id as domain_ids_check, concat(dominio,' - ',description) as descricao_domain "
				   + "FROM tbl_domain WHERE status='ATIVE'";
		model.loadTable_domain(Core.query(null,sql));
	}

	private void loadBPMNData(Wizard_export_step_2 model) {
		List<Table_bpmn> table_1 = new ArrayList<>();
		for(ProcessDefinitionService process: new ProcessDefinitionService().getProcessDefinitionsAllAtivos(this.application.getDad())){
			Table_bpmn t = new Table_bpmn();
			t.setBpmn_ids(Core.toInt(process.getId()));
			t.setBpmn_ids_check(Core.toInt(process.getId()));
			t.setDescricao_bpmn(process.getName());
			table_1.add(t );
		}
		model.setTable_bpmn(table_1);
	}

}
