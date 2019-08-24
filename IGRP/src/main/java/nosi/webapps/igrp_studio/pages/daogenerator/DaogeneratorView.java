package nosi.webapps.igrp_studio.pages.daogenerator;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class DaogeneratorView extends View {

	public Field aplicacao;
	public Field data_source;
	public Field schema;
	public Field add_datasource_botton;
	public Field check_table;
	public Field check_table_check;
	public Field table_name;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gerar_dao;

	public DaogeneratorView(){

		this.setPageTitle("DAOGenerator");
			
		form_1 = new IGRPForm("form_1","DAO Generator");

		table_1 = new IGRPTable("table_1","Escolha as tabelas");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("remote",new Config().getResolveUrl("igrp_studio","Daogenerator","index")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("remote",new Config().getResolveUrl("igrp_studio","Daogenerator","index")).add("name","p_data_source").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		schema = new ListField(model,"schema");
		schema.setLabel(gt("Schema"));
		schema.propertie().add("name","p_schema").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		add_datasource_botton = new LinkField(model,"add_datasource_botton");
		add_datasource_botton.setLabel(gt("Add datasource"));
		add_datasource_botton.setValue(new Config().getResolveUrl("igrp_studio","ListaPage","index"));

									add_datasource_botton.propertie().add("name","p_add_datasource_botton").add("type","link").add("target","mpsubmit").add("request_fields","").add("refresh_submit","false").add("maxlength","250").add("desclabel","false");
		
		check_table = new CheckBoxField(model,"check_table");
		check_table.setLabel(gt(""));
		check_table.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		check_table_check = new CheckBoxField(model,"check_table_check");
		check_table_check.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		table_name = new TextField(model,"table_name");
		table_name.setLabel(gt("Table Name"));
		table_name.propertie().add("name","p_table_name").add("type","text").add("maxlength","30").add("showLabel","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gerar_dao = new IGRPButton("Gerar DAO","igrp_studio","Daogenerator","gerar_dao","submit_ajax","success|fa-gears","","");
		btn_gerar_dao.propertie.add("type","specific").add("rel","gerar_dao");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(aplicacao);
		form_1.addField(data_source);
		form_1.addField(schema);
		form_1.addField(add_datasource_botton);

		table_1.addField(check_table);
		table_1.addField(check_table_check);
		table_1.addField(table_name);


		toolsbar_1.addButton(btn_gerar_dao);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		data_source.setValue(model);
		schema.setValue(model);
		add_datasource_botton.setValue(model);
		check_table.setValue(model);
		table_name.setValue(model);	

		table_1.loadModel(((Daogenerator) model).getTable_1());
		}
}
