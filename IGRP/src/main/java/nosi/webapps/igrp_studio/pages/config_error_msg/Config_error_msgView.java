package nosi.webapps.igrp_studio.pages.config_error_msg;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Config_error_msgView extends View {

	public Field sectionheader_1_text;
	public Field application;
	public Field msg;
	public Field application_tab;
	public Field msg_table;
	public Field id_config;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_salvar;
	public IGRPButton btn_edit;
	public IGRPButton btn_delete;

	public Config_error_msgView(){

		this.setPageTitle("Config error msg");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p><span style='font-size:28px;'>Configure your error message by application</span></p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		application = new ListField(model,"application");
		application.setLabel(gt("Application"));
		application.propertie().add("name","p_application").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		msg = new TextAreaField(model,"msg");
		msg.setLabel(gt("Message"));
		msg.propertie().add("name","p_msg").add("type","textarea").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		application_tab = new TextField(model,"application_tab");
		application_tab.setLabel(gt("Application"));
		application_tab.propertie().add("name","p_application_tab").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		msg_table = new TextField(model,"msg_table");
		msg_table.setLabel(gt("Message"));
		msg_table.propertie().add("name","p_msg_table").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_config = new HiddenField(model,"id_config");
		id_config.setLabel(gt(""));
		id_config.propertie().add("name","p_id_config").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_config");
		


		btn_salvar = new IGRPButton("Salvar","igrp_studio","Config_error_msg","salvar","submit","primary|fa-save","","");
		btn_salvar.propertie.add("id","button_4835_df78").add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","");

		btn_edit = new IGRPButton("Edit","igrp_studio","Config_error_msg","edit","submit","warning|fa-pencil","","");
		btn_edit.propertie.add("id","button_c8b6_bc55").add("type","specific").add("class","warning").add("rel","edit").add("refresh_components","form_1");

		btn_delete = new IGRPButton("Delete","igrp_studio","Config_error_msg","delete","confirm","danger|fa-times-circle","","");
		btn_delete.propertie.add("id","button_4769_2e10").add("type","specific").add("class","danger").add("rel","delete").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(application);
		form_1.addField(msg);

		table_1.addField(application_tab);
		table_1.addField(msg_table);
		table_1.addField(id_config);

		form_1.addButton(btn_salvar);
		table_1.addButton(btn_edit);
		table_1.addButton(btn_delete);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		application.setValue(model);
		msg.setValue(model);
		application_tab.setValue(model);
		msg_table.setValue(model);
		id_config.setValue(model);	

		table_1.loadModel(((Config_error_msg) model).getTable_1());
		}
}
