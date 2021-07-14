package nosi.webapps.igrp_studio.pages.migration;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class MigrationView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field pagina_ids;
	public Field pagina_ids_check;
	public Field descricao_pagina;
	public Field report_ids;
	public Field report_ids_check;
	public Field descricao_report;
	public Field domain_ids;
	public Field domain_ids_check;
	public Field descricao_domain;
	public Field tipo_doc_ids;
	public Field tipo_doc_ids_check;
	public Field descricao_tipo_doc;
	public Field transation_ids;
	public Field transation_ids_check;
	public Field descricao_transation;
	public Field conexao_ids;
	public Field conexao_ids_check;
	public Field descricao_conexao;
	public Field bpmn_ids;
	public Field bpmn_ids_check;
	public Field descricao_bpmn;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_pagina;
	public IGRPTable table_report;
	public IGRPTable table_domain_info;
	public IGRPTable table_tipo_documento;
	public IGRPTable tbl_transation;
	public IGRPTable table_connections;
	public IGRPTable tbl_bpmn;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_migrar;

	public MigrationView(){

		this.setPageTitle("Migration File Generator");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_pagina = new IGRPTable("table_pagina","Páginas");

		table_report = new IGRPTable("table_report","Reports");

		table_domain_info = new IGRPTable("table_domain_info","Domínios");

		table_tipo_documento = new IGRPTable("table_tipo_documento","Tipo Documento");

		tbl_transation = new IGRPTable("tbl_transation","Transactions");

		table_connections = new IGRPTable("table_connections","Conexões com Base de Dados");

		tbl_bpmn = new IGRPTable("tbl_bpmn","BPMN");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<h2 class='disable-output-escaping set'><span style='font-size:36px;'>Migration - Generator File</span></h2>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		pagina_ids = new CheckBoxField(model,"pagina_ids");
		pagina_ids.setLabel(gt(""));
		pagina_ids.propertie().add("name","p_pagina_ids").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		pagina_ids_check = new CheckBoxField(model,"pagina_ids_check");
		pagina_ids_check.propertie().add("name","p_pagina_ids").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		descricao_pagina = new PlainTextField(model,"descricao_pagina");
		descricao_pagina.setLabel(gt("Titulo (code)"));
		descricao_pagina.propertie().add("name","p_descricao_pagina").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		report_ids = new CheckBoxField(model,"report_ids");
		report_ids.setLabel(gt(""));
		report_ids.propertie().add("name","p_report_ids").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		report_ids_check = new CheckBoxField(model,"report_ids_check");
		report_ids_check.propertie().add("name","p_report_ids").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		descricao_report = new PlainTextField(model,"descricao_report");
		descricao_report.setLabel(gt("Descrição"));
		descricao_report.propertie().add("name","p_descricao_report").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		domain_ids = new CheckBoxField(model,"domain_ids");
		domain_ids.setLabel(gt(""));
		domain_ids.propertie().add("name","p_domain_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		domain_ids_check = new CheckBoxField(model,"domain_ids_check");
		domain_ids_check.propertie().add("name","p_domain_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		descricao_domain = new PlainTextField(model,"descricao_domain");
		descricao_domain.setLabel(gt("Descrição"));
		descricao_domain.propertie().add("name","p_descricao_domain").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		tipo_doc_ids = new CheckBoxField(model,"tipo_doc_ids");
		tipo_doc_ids.setLabel(gt(""));
		tipo_doc_ids.propertie().add("name","p_tipo_doc_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		tipo_doc_ids_check = new CheckBoxField(model,"tipo_doc_ids_check");
		tipo_doc_ids_check.propertie().add("name","p_tipo_doc_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		descricao_tipo_doc = new PlainTextField(model,"descricao_tipo_doc");
		descricao_tipo_doc.setLabel(gt("Descrição"));
		descricao_tipo_doc.propertie().add("name","p_descricao_tipo_doc").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		transation_ids = new CheckBoxField(model,"transation_ids");
		transation_ids.setLabel(gt(""));
		transation_ids.propertie().add("name","p_transation_ids").add("type","checkbox").add("maxlength","20").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		transation_ids_check = new CheckBoxField(model,"transation_ids_check");
		transation_ids_check.propertie().add("name","p_transation_ids").add("type","checkbox").add("maxlength","20").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		descricao_transation = new PlainTextField(model,"descricao_transation");
		descricao_transation.setLabel(gt("Descrição"));
		descricao_transation.propertie().add("name","p_descricao_transation").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		conexao_ids = new CheckBoxField(model,"conexao_ids");
		conexao_ids.setLabel(gt(""));
		conexao_ids.propertie().add("name","p_conexao_ids").add("type","checkbox").add("maxlength","20").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		conexao_ids_check = new CheckBoxField(model,"conexao_ids_check");
		conexao_ids_check.propertie().add("name","p_conexao_ids").add("type","checkbox").add("maxlength","20").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		descricao_conexao = new PlainTextField(model,"descricao_conexao");
		descricao_conexao.setLabel(gt("Descrição"));
		descricao_conexao.propertie().add("name","p_descricao_conexao").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","150").add("showLabel","true").add("group_in","");
		
		bpmn_ids = new CheckBoxField(model,"bpmn_ids");
		bpmn_ids.setLabel(gt(""));
		bpmn_ids.propertie().add("name","p_bpmn_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		bpmn_ids_check = new CheckBoxField(model,"bpmn_ids_check");
		bpmn_ids_check.propertie().add("name","p_bpmn_ids").add("type","checkbox").add("maxlength","100").add("showLabel","true").add("group_in","").add("java-type","String").add("switch","false").add("check","true").add("desc","true");
		
		descricao_bpmn = new PlainTextField(model,"descricao_bpmn");
		descricao_bpmn.setLabel(gt("Descrição"));
		descricao_bpmn.propertie().add("name","p_descricao_bpmn").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","100").add("showLabel","true").add("group_in","");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_migrar = new IGRPButton("Gerar","igrp_studio","Migration","migrar","submit","success|fa-exchange","","");
		btn_migrar.propertie.add("type","specific").add("rel","migrar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);

		table_pagina.addField(pagina_ids);
		table_pagina.addField(pagina_ids_check);
		table_pagina.addField(descricao_pagina);

		table_report.addField(report_ids);
		table_report.addField(report_ids_check);
		table_report.addField(descricao_report);

		table_domain_info.addField(domain_ids);
		table_domain_info.addField(domain_ids_check);
		table_domain_info.addField(descricao_domain);

		table_tipo_documento.addField(tipo_doc_ids);
		table_tipo_documento.addField(tipo_doc_ids_check);
		table_tipo_documento.addField(descricao_tipo_doc);

		tbl_transation.addField(transation_ids);
		tbl_transation.addField(transation_ids_check);
		tbl_transation.addField(descricao_transation);

		table_connections.addField(conexao_ids);
		table_connections.addField(conexao_ids_check);
		table_connections.addField(descricao_conexao);

		tbl_bpmn.addField(bpmn_ids);
		tbl_bpmn.addField(bpmn_ids_check);
		tbl_bpmn.addField(descricao_bpmn);

		toolsbar_1.addButton(btn_migrar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_pagina);
		this.addToPage(table_report);
		this.addToPage(table_domain_info);
		this.addToPage(table_tipo_documento);
		this.addToPage(tbl_transation);
		this.addToPage(table_connections);
		this.addToPage(tbl_bpmn);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		pagina_ids.setValue(model);
		descricao_pagina.setValue(model);
		report_ids.setValue(model);
		descricao_report.setValue(model);
		domain_ids.setValue(model);
		descricao_domain.setValue(model);
		tipo_doc_ids.setValue(model);
		descricao_tipo_doc.setValue(model);
		transation_ids.setValue(model);
		descricao_transation.setValue(model);
		conexao_ids.setValue(model);
		descricao_conexao.setValue(model);
		bpmn_ids.setValue(model);
		descricao_bpmn.setValue(model);	

		table_pagina.loadModel(((Migration) model).getTable_pagina());
		table_report.loadModel(((Migration) model).getTable_report());
		table_domain_info.loadModel(((Migration) model).getTable_domain_info());
		table_tipo_documento.loadModel(((Migration) model).getTable_tipo_documento());
		tbl_transation.loadModel(((Migration) model).getTbl_transation());
		table_connections.loadModel(((Migration) model).getTable_connections());
		tbl_bpmn.loadModel(((Migration) model).getTbl_bpmn());
		}
}
