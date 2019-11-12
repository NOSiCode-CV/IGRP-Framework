package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class CRUDGeneratorView extends View {

	public Field aplicacao;
	public Field data_source;
	public Field schema;
	public Field table_type;
	public Field check_table;
	public Field check_table_check;
	public Field table_name;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_3;
	public IGRPToolsBar toolsbar_2;
	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_add_datasource;
	public IGRPButton btn_gerar_dao;
	public IGRPButton btn_gerar;

	public CRUDGeneratorView(){

		this.setPageTitle("CRUD Generator");
			
		form_1 = new IGRPForm("form_1","CRUD/DAO generator");

		table_1 = new IGRPTable("table_1","Escolha a tabela");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("remote",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("remote",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		schema = new ListField(model,"schema");
		schema.setLabel(gt("Schema"));
		schema.propertie().add("remote",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_schema").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		table_type = new ListField(model,"table_type");
		table_type.setLabel(gt("Table Type"));
		table_type.propertie().add("remote",Core.getIGRPLink("igrp_studio","CRUDGenerator","index")).add("name","p_table_type").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","String");
		
		check_table = new CheckBoxField(model,"check_table");
		check_table.setLabel(gt(""));
		check_table.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("showLabel","true").add("java-type","int").add("group_in","").add("check","true").add("desc","true");
		
		check_table_check = new CheckBoxField(model,"check_table_check");
		check_table_check.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("showLabel","true").add("java-type","int").add("group_in","").add("check","true").add("desc","true");
		
		table_name = new TextField(model,"table_name");
		table_name.setLabel(gt("Table Name"));
		table_name.propertie().add("name","p_table_name").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		

		toolsbar_3 = new IGRPToolsBar("toolsbar_3");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_add_datasource = new IGRPButton("Add datasource","igrp_studio","CRUDGenerator","add_datasource","mpsubmit","primary|fa-database","","");
		btn_add_datasource.propertie.add("type","specific").add("rel","add_datasource").add("refresh_components","");

		btn_gerar_dao = new IGRPButton("DAO","igrp_studio","CRUDGenerator","gerar_dao","submit_ajax","danger|fa-gears","","");
		btn_gerar_dao.propertie.add("type","specific").add("rel","gerar_dao").add("refresh_components","");

		btn_gerar = new IGRPButton("CRUD","igrp_studio","CRUDGenerator","gerar","submit_ajax","success|fa-gear","","");
		btn_gerar.propertie.add("type","specific").add("rel","gerar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		

		form_1.addField(aplicacao);
		form_1.addField(data_source);
		form_1.addField(schema);
		form_1.addField(table_type);


		table_1.addField(check_table);
		table_1.addField(check_table_check);
		table_1.addField(table_name);


		toolsbar_3.addButton(btn_add_datasource);
		toolsbar_2.addButton(btn_gerar_dao);
		toolsbar_1.addButton(btn_gerar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_3);
		this.addToPage(toolsbar_2);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		data_source.setValue(model);
		schema.setValue(model);
		table_type.setValue(model);
		check_table.setValue(model);
		table_name.setValue(model);	

		table_1.loadModel(((CRUDGenerator) model).getTable_1());
		}
}
