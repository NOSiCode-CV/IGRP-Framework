
package nosi.webapps.igrp_studio.pages.crudgenerator;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class CRUDGeneratorView extends View {
	
	
	public Field aplicacao;
	public Field data_source;
	public Field schema;
	public Field p_is_schema;
	public Field check_table;
	public Field check_table_check;
	public Field table_name;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gerar;
	public CRUDGeneratorView(CRUDGenerator model){
		this.setPageTitle("CRUD Generator");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false");
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false");
		schema = new RadioListField(model,"schema");
		schema.setLabel(gt("Schema"));
		
		schema.propertie().add("name","p_schema").add("type","radiolist").add("domain","").add("maxlength","30").add("required","false").add("change","true").add("readonly","false").add("disabled","false").add("child_size","12").add("right","false");
		p_is_schema = new HiddenField(model,"p_is_schema");
		p_is_schema.setLabel(gt(""));
		
		p_is_schema.propertie().add("name","p_is_schema").add("type","hidden").add("maxlength","30").add("tag","is_schema");
		check_table = new CheckBoxField(model,"check_table");
		check_table.setLabel(gt(""));
		
		check_table.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		check_table_check = new CheckBoxField(model,"check_table_check");
		check_table_check.propertie().add("name","p_check_table").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		table_name = new TextField(model,"table_name");
		table_name.setLabel(gt("Table Name"));
		
		table_name.propertie().add("name","p_table_name").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gerar = new IGRPButton("Gerar","igrp_studio","CRUDGenerator","gerar","submit","success|fa-gear","","");
		btn_gerar.propertie.add("type","specific").add("code","").add("rel","gerar");
		
	}
		
	@Override
	public void render(){
		

		form_1.addField(aplicacao);
		form_1.addField(data_source);
		form_1.addField(schema);
		form_1.addField(p_is_schema);

		table_1.addField(check_table);
		table_1.addField(check_table_check);
		table_1.addField(table_name);

		toolsbar_1.addButton(btn_gerar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
