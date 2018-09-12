package nosi.webapps.igrp_studio.pages.crudgenerator;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class CRUDGeneratorView extends View {

	public Field aplicacao;
	public Field data_source;
	public Field add_datasource;
	public Field schema;
	public Field check_table;
	public Field check_table_check;
	public Field table_name;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gerar;

	public CRUDGeneratorView(){

		this.setPageTitle("CRUD Generator");
			
		form_1 = new IGRPForm("form_1","CRUD generator");

		table_1 = new IGRPTable("table_1","Escolha a tabela");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		add_datasource = new LinkField(model,"add_datasource");
		add_datasource.setLabel(gt("Add datasource"));
		add_datasource.setValue(new Config().getResolveUrl("igrp_studio","ListaEnv","index"));

									add_datasource.propertie().add("name","p_add_datasource").add("type","link").add("target","modal").add("maxlength","30").add("request_fields","");
		
		schema = new ListField(model,"schema");
		schema.setLabel(gt("Schema"));
		schema.propertie().add("name","p_schema").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		check_table = new CheckBoxField(model,"check_table");
		check_table.setLabel(gt(""));
		check_table.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		check_table_check = new CheckBoxField(model,"check_table_check");
		check_table_check.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		table_name = new TextField(model,"table_name");
		table_name.setLabel(gt("Table Name"));
		table_name.propertie().add("name","p_table_name").add("type","text").add("maxlength","30");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gerar = new IGRPButton("Gerar CRUD","igrp_studio","CRUDGenerator","gerar","submit","success|fa-gear","","");
		btn_gerar.propertie.add("type","specific").add("rel","gerar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(aplicacao);
		form_1.addField(data_source);
		form_1.addField(add_datasource);
		form_1.addField(schema);

		table_1.addField(check_table);
		table_1.addField(check_table_check);
		table_1.addField(table_name);


		toolsbar_1.addButton(btn_gerar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		data_source.setValue(model);
		add_datasource.setValue(model);
		schema.setValue(model);
		check_table.setValue(model);
		table_name.setValue(model);	

		table_1.loadModel(((CRUDGenerator) model).getTable_1());
		}
}
