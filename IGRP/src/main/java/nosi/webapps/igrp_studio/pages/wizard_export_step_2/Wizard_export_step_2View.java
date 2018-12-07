package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;


public class Wizard_export_step_2View extends View {

	public Field sectionheader_1_text;
	public Field modulo;
	public Field export_type;
	public Field application_id;
	public Field file_name;
	public Field bpmn_ids;
	public Field bpmn_ids_check;
	public Field descricao_bpmn;
	public Field pagina_ids;
	public Field pagina_ids_check;
	public Field descricao_pagina;
	public Field report_ids;
	public Field report_ids_check;
	public Field descricao_report;
	public Field dao_ids;
	public Field dao_ids_check;
	public Field descricao_dao;
	public Field modulo_ids;
	public Field modulo_ids_check;
	public Field descricao_modulo;
	public Field domain_ids;
	public Field domain_ids_check;
	public Field descricao_domain;
	public Field conexao_ids;
	public Field conexao_ids_check;
	public Field descricao_conexao;
	public Field others_class;
	public Field others_class_check;
	public Field descricao_others_class;
	public Field menu_ids;
	public Field menu_ids_check;
	public Field descricao_menu;
	public Field transation_ids;
	public Field transation_ids_check;
	public Field descricao_transation;
	public IGRPForm sectionheader_1;
	public IGRPForm box_paginas;
	public IGRPForm form_2;
	public IGRPTable table_bpmn;
	public IGRPTable table_pagina;
	public IGRPTable table_report;
	public IGRPTable table_dao;
	public IGRPTable table_modulo;
	public IGRPTable table_domain;
	public IGRPTable table_connections;
	public IGRPTable table_others_class;
	public IGRPTable table_menu;
	public IGRPTable tbl_transation;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_voltar;
	public IGRPButton btn_finalizar;

	public Wizard_export_step_2View(){

		this.setPageTitle("Export Wizard Step 2");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		box_paginas = new IGRPForm("box_paginas","Páginas");

		form_2 = new IGRPForm("form_2","");

		table_bpmn = new IGRPTable("table_bpmn","BPMN");

		table_pagina = new IGRPTable("table_pagina","");

		table_report = new IGRPTable("table_report","Reports");

		table_dao = new IGRPTable("table_dao","Classes DAO");

		table_modulo = new IGRPTable("table_modulo","Módulos");

		table_domain = new IGRPTable("table_domain","Domínios");

		table_connections = new IGRPTable("table_connections","Conexões com Base Dados");

		table_others_class = new IGRPTable("table_others_class","Otras classes");

		table_menu = new IGRPTable("table_menu","Menu");

		tbl_transation = new IGRPTable("tbl_transation","Transations");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Exportar Aplicação - Passo 2"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		modulo = new ListField(model,"modulo");
		modulo.setLabel(gt("Módulo"));
		modulo.propertie().add("name","p_modulo").add("type","select").add("multiple","true").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		export_type = new HiddenField(model,"export_type");
		export_type.setLabel(gt(""));
		export_type.propertie().add("name","p_export_type").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","export_type");
		
		application_id = new HiddenField(model,"application_id");
		application_id.setLabel(gt(""));
		application_id.propertie().add("name","p_application_id").add("type","hidden").add("maxlength","250").add("java-type","int").add("tag","application_id");
		
		file_name = new HiddenField(model,"file_name");
		file_name.setLabel(gt(""));
		file_name.propertie().add("name","p_file_name").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","file_name");
		
		bpmn_ids = new CheckBoxField(model,"bpmn_ids");
		bpmn_ids.setLabel(gt(""));
		bpmn_ids.propertie().add("name","p_bpmn_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		bpmn_ids_check = new CheckBoxField(model,"bpmn_ids_check");
		bpmn_ids_check.propertie().add("name","p_bpmn_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_bpmn = new TextField(model,"descricao_bpmn");
		descricao_bpmn.setLabel(gt("Descrição"));
		descricao_bpmn.propertie().add("name","p_descricao_bpmn").add("type","text").add("maxlength","30");
		
		pagina_ids = new CheckBoxField(model,"pagina_ids");
		pagina_ids.setLabel(gt(""));
		pagina_ids.propertie().add("name","p_pagina_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		pagina_ids_check = new CheckBoxField(model,"pagina_ids_check");
		pagina_ids_check.propertie().add("name","p_pagina_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_pagina = new TextField(model,"descricao_pagina");
		descricao_pagina.setLabel(gt("Título (código)"));
		descricao_pagina.propertie().add("name","p_descricao_pagina").add("type","text").add("maxlength","30");
		
		report_ids = new CheckBoxField(model,"report_ids");
		report_ids.setLabel(gt(""));
		report_ids.propertie().add("name","p_report_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		report_ids_check = new CheckBoxField(model,"report_ids_check");
		report_ids_check.propertie().add("name","p_report_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_report = new TextField(model,"descricao_report");
		descricao_report.setLabel(gt("Descrição"));
		descricao_report.propertie().add("name","p_descricao_report").add("type","text").add("maxlength","30");
		
		dao_ids = new CheckBoxField(model,"dao_ids");
		dao_ids.setLabel(gt(""));
		dao_ids.propertie().add("name","p_dao_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		dao_ids_check = new CheckBoxField(model,"dao_ids_check");
		dao_ids_check.propertie().add("name","p_dao_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_dao = new TextField(model,"descricao_dao");
		descricao_dao.setLabel(gt("Descrição"));
		descricao_dao.propertie().add("name","p_descricao_dao").add("type","text").add("maxlength","30");
		
		modulo_ids = new CheckBoxField(model,"modulo_ids");
		modulo_ids.setLabel(gt(""));
		modulo_ids.propertie().add("name","p_modulo_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		modulo_ids_check = new CheckBoxField(model,"modulo_ids_check");
		modulo_ids_check.propertie().add("name","p_modulo_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_modulo = new TextField(model,"descricao_modulo");
		descricao_modulo.setLabel(gt("Descricao"));
		descricao_modulo.propertie().add("name","p_descricao_modulo").add("type","text").add("maxlength","30");
		
		domain_ids = new CheckBoxField(model,"domain_ids");
		domain_ids.setLabel(gt(""));
		domain_ids.propertie().add("name","p_domain_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		domain_ids_check = new CheckBoxField(model,"domain_ids_check");
		domain_ids_check.propertie().add("name","p_domain_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_domain = new TextField(model,"descricao_domain");
		descricao_domain.setLabel(gt("Descrição"));
		descricao_domain.propertie().add("name","p_descricao_domain").add("type","text").add("maxlength","30");
		
		conexao_ids = new CheckBoxField(model,"conexao_ids");
		conexao_ids.setLabel(gt(""));
		conexao_ids.propertie().add("name","p_conexao_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		conexao_ids_check = new CheckBoxField(model,"conexao_ids_check");
		conexao_ids_check.propertie().add("name","p_conexao_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_conexao = new TextField(model,"descricao_conexao");
		descricao_conexao.setLabel(gt("Descrição"));
		descricao_conexao.propertie().add("name","p_descricao_conexao").add("type","text").add("maxlength","30");
		
		others_class = new CheckBoxField(model,"others_class");
		others_class.setLabel(gt(""));
		others_class.propertie().add("name","p_others_class").add("type","checkbox").add("maxlength","30").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		others_class_check = new CheckBoxField(model,"others_class_check");
		others_class_check.propertie().add("name","p_others_class").add("type","checkbox").add("maxlength","30").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		descricao_others_class = new TextField(model,"descricao_others_class");
		descricao_others_class.setLabel(gt("Descrição"));
		descricao_others_class.propertie().add("name","p_descricao_others_class").add("type","text").add("maxlength","30");
		
		menu_ids = new CheckBoxField(model,"menu_ids");
		menu_ids.setLabel(gt(""));
		menu_ids.propertie().add("name","p_menu_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		menu_ids_check = new CheckBoxField(model,"menu_ids_check");
		menu_ids_check.propertie().add("name","p_menu_ids").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","String").add("check","true").add("desc","true");
		
		descricao_menu = new TextField(model,"descricao_menu");
		descricao_menu.setLabel(gt("Descrição"));
		descricao_menu.propertie().add("name","p_descricao_menu").add("type","text").add("maxlength","30");
		
		transation_ids = new CheckBoxField(model,"transation_ids");
		transation_ids.setLabel(gt(" "));
		transation_ids.propertie().add("name","p_transation_ids").add("type","checkbox").add("maxlength","30").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		transation_ids_check = new CheckBoxField(model,"transation_ids_check");
		transation_ids_check.propertie().add("name","p_transation_ids").add("type","checkbox").add("maxlength","30").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		descricao_transation = new TextField(model,"descricao_transation");
		descricao_transation.setLabel(gt("Descrição"));
		descricao_transation.propertie().add("name","p_descricao_transation").add("type","text").add("maxlength","30");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_voltar = new IGRPButton("Voltar","igrp_studio","Wizard_export_step_2","voltar","_self","success|fa-backward","","");
		btn_voltar.propertie.add("type","specific").add("rel","voltar");

		btn_finalizar = new IGRPButton("Finalizar","igrp_studio","Wizard_export_step_2","finalizar","submit","primary|fa-certificate","","");
		btn_finalizar.propertie.add("type","specific").add("rel","finalizar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);



		form_2.addField(modulo);
		form_2.addField(export_type);
		form_2.addField(application_id);
		form_2.addField(file_name);

		table_bpmn.addField(bpmn_ids);
		table_bpmn.addField(bpmn_ids_check);
		table_bpmn.addField(descricao_bpmn);

		table_pagina.addField(pagina_ids);
		table_pagina.addField(pagina_ids_check);
		table_pagina.addField(descricao_pagina);

		table_report.addField(report_ids);
		table_report.addField(report_ids_check);
		table_report.addField(descricao_report);

		table_dao.addField(dao_ids);
		table_dao.addField(dao_ids_check);
		table_dao.addField(descricao_dao);

		table_modulo.addField(modulo_ids);
		table_modulo.addField(modulo_ids_check);
		table_modulo.addField(descricao_modulo);

		table_domain.addField(domain_ids);
		table_domain.addField(domain_ids_check);
		table_domain.addField(descricao_domain);

		table_connections.addField(conexao_ids);
		table_connections.addField(conexao_ids_check);
		table_connections.addField(descricao_conexao);

		table_others_class.addField(others_class);
		table_others_class.addField(others_class_check);
		table_others_class.addField(descricao_others_class);

		table_menu.addField(menu_ids);
		table_menu.addField(menu_ids_check);
		table_menu.addField(descricao_menu);

		tbl_transation.addField(transation_ids);
		tbl_transation.addField(transation_ids_check);
		tbl_transation.addField(descricao_transation);

		toolsbar_1.addButton(btn_voltar);
		toolsbar_1.addButton(btn_finalizar);
		this.addToPage(sectionheader_1);
		this.addToPage(box_paginas);
		this.addToPage(form_2);
		this.addToPage(table_bpmn);
		this.addToPage(table_pagina);
		this.addToPage(table_report);
		this.addToPage(table_dao);
		this.addToPage(table_modulo);
		this.addToPage(table_domain);
		this.addToPage(table_connections);
		this.addToPage(table_others_class);
		this.addToPage(table_menu);
		this.addToPage(tbl_transation);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		modulo.setValue(model);
		export_type.setValue(model);
		application_id.setValue(model);
		file_name.setValue(model);
		bpmn_ids.setValue(model);
		descricao_bpmn.setValue(model);
		pagina_ids.setValue(model);
		descricao_pagina.setValue(model);
		report_ids.setValue(model);
		descricao_report.setValue(model);
		dao_ids.setValue(model);
		descricao_dao.setValue(model);
		modulo_ids.setValue(model);
		descricao_modulo.setValue(model);
		domain_ids.setValue(model);
		descricao_domain.setValue(model);
		conexao_ids.setValue(model);
		descricao_conexao.setValue(model);
		others_class.setValue(model);
		descricao_others_class.setValue(model);
		menu_ids.setValue(model);
		descricao_menu.setValue(model);
		transation_ids.setValue(model);
		descricao_transation.setValue(model);	

		table_bpmn.loadModel(((Wizard_export_step_2) model).getTable_bpmn());
		table_pagina.loadModel(((Wizard_export_step_2) model).getTable_pagina());
		table_report.loadModel(((Wizard_export_step_2) model).getTable_report());
		table_dao.loadModel(((Wizard_export_step_2) model).getTable_dao());
		table_modulo.loadModel(((Wizard_export_step_2) model).getTable_modulo());
		table_domain.loadModel(((Wizard_export_step_2) model).getTable_domain());
		table_connections.loadModel(((Wizard_export_step_2) model).getTable_connections());
		table_others_class.loadModel(((Wizard_export_step_2) model).getTable_others_class());
		table_menu.loadModel(((Wizard_export_step_2) model).getTable_menu());
		tbl_transation.loadModel(((Wizard_export_step_2) model).getTbl_transation());
		}
}
