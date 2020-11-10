package nosi.webapps.igrp_studio.pages.sql_tools;

import static nosi.core.i18n.Translator.gt;

import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.webapp.Core;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;

public class Sql_toolsView extends View {

	public Field help;
	public Field application;
	public Field data_source;
	public Field separator_1;
	public Field sql;
	public IGRPView view_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_run;

	public Sql_toolsView(){

		this.setPageTitle("SQL Tool");
			
		view_1 = new IGRPView("view_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		help = new LinkField(model,"help");
		help.setLabel(gt("Help"));
		help.setValue(gt("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT;&p_type=sqltools"));
		help.propertie().add("name","p_help").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true");
		
		application = new ListField(model,"application");
		application.setLabel(gt("Aplicação"));
		application.propertie().add("name","p_application").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		separator_1 = new SeparatorField(model,"separator_1");
		separator_1.setLabel(gt("   "));
		separator_1.propertie().add("name","p_separator_1").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false");
		
		sql = new TextAreaField(model,"sql");
		sql.setLabel(gt("SQL"));
		sql.propertie().add("name","p_sql").add("type","textarea").add("maxlength","1000000").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		


		btn_run = new IGRPButton("Run","igrp_studio","Sql_tools","run","submit_form","success|fa-play-circle","","");
		btn_run.propertie.add("id","button_c2cb_2f60").add("type","form").add("class","success").add("rel","run").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		view_1.addField(help);

		form_1.addField(application);
		form_1.addField(data_source);
		form_1.addField(separator_1);
		form_1.addField(sql);


		form_1.addButton(btn_run);
		this.addToPage(view_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		application.setValue(model);
		data_source.setValue(model);
		separator_1.setValue(model);
		sql.setValue(model);	

		table_1.loadModel(((Sql_tools) model).getTable_1());
		}
}
