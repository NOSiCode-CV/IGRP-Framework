package nosi.core.webapp.import_export_v2.exports;

import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.exports.application.ApplicationExport;
import nosi.core.webapp.import_export_v2.exports.bpmn.BPMNExport;
import nosi.core.webapp.import_export_v2.exports.connection.ConnectionExport;
import nosi.core.webapp.import_export_v2.exports.dao.DAOExport;
import nosi.core.webapp.import_export_v2.exports.domain.DomainExport;
import nosi.core.webapp.import_export_v2.exports.menu.MenuExport;
import nosi.core.webapp.import_export_v2.exports.others_class.OthersClassExport;
import nosi.core.webapp.import_export_v2.exports.page.PageExport;
import nosi.core.webapp.import_export_v2.exports.report.ReportExport;
import nosi.core.webapp.import_export_v2.exports.transation.ExportTransation;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp_studio.pages.wizard_export_step_2.Wizard_export_step_2;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class ExportHelper {
	
	public byte[] export(Wizard_export_step_2 model) {

		String[] report_ids = Core.getParamArray("p_report_ids");
		String[] bpm_ids = Core.getParamArray("p_bpmn_ids");
		String[] domain_ids = Core.getParamArray("p_domain_ids");
		String[] page_ids = Core.getParamArray("p_pagina_ids");
		String[] conexao_ids = Core.getParamArray("p_conexao_ids");
		String[] menu_ids = Core.getParamArray("p_menu_ids");
		String[] dao_ids = Core.getParamArray("p_dao_ids");
		String[] modulo_ids = Core.getParamArray("p_modulo_ids");
		String[] others_class_ids = Core.getParamArray("p_others_class");
		String[] transation_ids = Core.getParamArray("p_transation_ids");
		if(others_class_ids==null && transation_ids==null && dao_ids==null && report_ids==null && domain_ids==null && page_ids==null && conexao_ids==null && menu_ids==null && bpm_ids==null && modulo_ids==null) {
			Core.setMessageError(Core.gt("Por favor selecione os dados a serem exportados"));
			return null;
		}
		Export export = new Export();
		Application application = new Application().findOne(model.getApplication_id());
		new ApplicationExport(application).export(export,null);
		new BPMNExport(application).export(export,bpm_ids);
		new DomainExport().export(export,domain_ids);	
		new PageExport().export(export,page_ids);		
		new ReportExport().export(export,report_ids);
		new ConnectionExport().export(export,conexao_ids);
		new MenuExport().export(export,menu_ids);
		new DAOExport().export(export,dao_ids);
		new OthersClassExport().export(export, others_class_ids);
		new ExportTransation().export(export, transation_ids);
//		new ServicesExport().export(export, ids);
		return export.execute();
	}

}
