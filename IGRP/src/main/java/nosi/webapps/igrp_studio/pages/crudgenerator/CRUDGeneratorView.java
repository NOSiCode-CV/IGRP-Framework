package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class CRUDGeneratorView extends View {

	public Field sectionheader_1_text;
	public Field documento;
	public Field forum;
	public Field aplicacao;
	public Field data_source;
	public Field schema;
	public Field check_table;
	public Field check_table_check;
	public Field table_name;
	public Field table_type;
	public Field form_2_radiolist_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPForm form_crud_dao_gen;
	public IGRPTable table_1;
	public IGRPForm form_2;

	public IGRPToolsBar toolsbar_3;
	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_add_datasource;
	public IGRPButton btn_gerar;
	public IGRPButton btn_gerar_dao;

	public CRUDGeneratorView(){

		this.setPageTitle("CRUD Generator");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		form_crud_dao_gen = new IGRPForm("form_crud_dao_gen","");

		table_1 = new IGRPTable("table_1","Escolha a tabela");

		form_2 = new IGRPForm("form_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>CRUD/DAO generator</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		documento = new LinkField(model,"documento");
		documento.setLabel(gt("Help"));
		documento.setValue(gt("//in controller"));
		documento.propertie().add("name","p_documento").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		forum = new LinkField(model,"forum");
		forum.setLabel(gt("Forum"));
		forum.setValue(gt("//in controller"));
		forum.propertie().add("name","p_forum").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-comments").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Application"));
		aplicacao.propertie().add("remote-index",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("remote-index",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		schema = new ListField(model,"schema");
		schema.setLabel(gt("Schema"));
		schema.propertie().add("remote-index",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_schema").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		check_table = new CheckBoxField(model,"check_table");
		check_table.setLabel(gt(""));
		check_table.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("showLabel","true").add("java-type","String").add("group_in","").add("check","true").add("desc","true");
		
		check_table_check = new CheckBoxField(model,"check_table_check");
		check_table_check.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("showLabel","true").add("java-type","String").add("group_in","").add("check","true").add("desc","true");
		
		table_name = new TextField(model,"table_name");
		table_name.setLabel(gt("Table Name"));
		table_name.propertie().add("name","p_table_name").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		table_type = new ListField(model,"table_type");
		table_type.setLabel(gt("Table Type"));
		table_type.propertie().add("remote-index",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_table_type").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		form_2_radiolist_1 = new RadioListField(model,"form_2_radiolist_1");
		form_2_radiolist_1.setLabel(gt("Escolha 1º"));
		form_2_radiolist_1.propertie().add("name","p_form_2_radiolist_1").add("type","radiolist").add("domain","").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("child_size","6").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		

		toolsbar_3 = new IGRPToolsBar("toolsbar_3");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");

		btn_add_datasource = new IGRPButton("Add datasource","igrp_studio","CRUDGenerator","add_datasource","mpsubmit","primary|fa-database","","");
		btn_add_datasource.propertie.add("type","specific").add("rel","add_datasource").add("refresh_components","");

		btn_gerar = new IGRPButton("CRUD","igrp_studio","CRUDGenerator","gerar","submit_ajax","success|fa-gear","","");
		btn_gerar.propertie.add("type","specific").add("rel","gerar").add("refresh_components","");

		btn_gerar_dao = new IGRPButton("DAO","igrp_studio","CRUDGenerator","gerar_dao","submit_ajax","danger|fa-gears","","");
		btn_gerar_dao.propertie.add("type","specific").add("rel","gerar_dao").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(documento);
		view_1.addField(forum);


		form_crud_dao_gen.addField(aplicacao);
		form_crud_dao_gen.addField(data_source);
		form_crud_dao_gen.addField(schema);

		table_1.addField(check_table);
		table_1.addField(check_table_check);
		table_1.addField(table_name);

		form_2.addField(table_type);
		form_2.addField(form_2_radiolist_1);



		toolsbar_3.addButton(btn_add_datasource);
		toolsbar_1.addButton(btn_gerar);
		toolsbar_2.addButton(btn_gerar_dao);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(form_crud_dao_gen);
		this.addToPage(table_1);
		this.addToPage(form_2);
		this.addToPage(toolsbar_3);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		data_source.setValue(model);
		schema.setValue(model);
		check_table.setValue(model);
		table_name.setValue(model);
		table_type.setValue(model);
		form_2_radiolist_1.setValue(model);	

		table_1.loadModel(((CRUDGenerator) model).getTable_1());
		}
}
