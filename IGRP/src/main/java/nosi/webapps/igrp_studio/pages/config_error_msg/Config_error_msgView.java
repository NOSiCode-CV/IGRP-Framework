package nosi.webapps.igrp_studio.pages.config_error_msg;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Config_error_msgView extends View {

	public Field sectionheader_1_text;
	public Field msg;
	public Field msg_table;
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
		sectionheader_1_text.setValue(gt("<p><strong>Error Msg</strong></p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		msg = new TextAreaField(model,"msg");
		msg.setLabel(gt("Msg"));
		msg.propertie().add("name","p_msg").add("type","textarea").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		msg_table = new TextField(model,"msg_table");
		msg_table.setLabel(gt("Msg"));
		msg_table.propertie().add("name","p_msg_table").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		


		btn_salvar = new IGRPButton("Salvar","igrp_studio","Config_error_msg","salvar","submit_ajax","primary|fa-save","","");
		btn_salvar.propertie.add("id","button_4835_df78").add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","form_1,table_1");

		btn_edit = new IGRPButton("Edit","igrp_studio","Config_error_msg","edit","submit","warning|fa-pencil","","");
		btn_edit.propertie.add("id","button_c8b6_bc55").add("type","specific").add("class","warning").add("rel","edit").add("refresh_components","form_1");

		btn_delete = new IGRPButton("Delete","igrp_studio","Config_error_msg","delete","confirm","danger|fa-times-circle","","");
		btn_delete.propertie.add("id","button_4769_2e10").add("type","specific").add("class","danger").add("rel","delete").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(msg);

		table_1.addField(msg_table);

		form_1.addButton(btn_salvar);
		table_1.addButton(btn_edit);
		table_1.addButton(btn_delete);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		msg.setValue(model);
		msg_table.setValue(model);	

		table_1.loadModel(((Config_error_msg) model).getTable_1());
		}
}
