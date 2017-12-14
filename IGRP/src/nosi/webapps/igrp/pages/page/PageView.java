
package nosi.webapps.igrp.pages.page;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PageView extends View {
	
	
	public Field sectionheader_1_text;
	public Field env_fk;
	public Field version;
	public Field action_descr;
	public Field page;
	public Field p_id;
	public Field p_table_name;
	public Field p_xsl_src;
	public Field p_img_src;
	public Field p_action;
	public Field p_page_type;
	public Field p_page_descr;
	public Field p_flg_menu;
	public Field p_flg_transaction;
	public Field p_self_id;
	public Field p_self_fw_id;
	public Field p_db_connection;
	public Field p_flg_offline;
	public Field p_flg_internet;
	public Field p_status;
	public Field p_proc_name;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public PageView(Page model){
		this.setPageTitle("Registar Pagina");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Page builder - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","false").add("disabled","false").add("right","false").add("domain","");
		version = new ListField(model,"version");
		version.setLabel(gt("Versão de Página"));
		
		version.propertie().add("name","p_version").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("domain","");
		action_descr = new TextField(model,"action_descr");
		action_descr.setLabel(gt("Título"));
		
		action_descr.propertie().add("name","p_action_descr").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		page = new TextField(model,"page");
		page.setLabel(gt("Código"));
		
		page.propertie().add("name","p_page").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		p_table_name = new HiddenField(model,"p_table_name");
		p_table_name.setLabel(gt(""));
		
		p_table_name.propertie().add("name","p_table_name").add("type","hidden").add("maxlength","80").add("tag","table_name");
		p_xsl_src = new HiddenField(model,"p_xsl_src");
		p_xsl_src.setLabel(gt(""));
		
		p_xsl_src.propertie().add("name","p_xsl_src").add("type","hidden").add("maxlength","2000").add("tag","xsl_src");
		p_img_src = new HiddenField(model,"p_img_src");
		p_img_src.setLabel(gt(""));
		
		p_img_src.propertie().add("name","p_img_src").add("type","hidden").add("maxlength","2000").add("tag","img_src");
		p_action = new HiddenField(model,"p_action");
		p_action.setLabel(gt(""));
		
		p_action.propertie().add("name","p_action").add("type","hidden").add("maxlength","30").add("tag","action");
		p_page_type = new HiddenField(model,"p_page_type");
		p_page_type.setLabel(gt(""));
		
		p_page_type.propertie().add("name","p_page_type").add("type","hidden").add("maxlength","30").add("tag","page_type");
		p_page_descr = new HiddenField(model,"p_page_descr");
		p_page_descr.setLabel(gt(""));
		
		p_page_descr.propertie().add("name","p_page_descr").add("type","hidden").add("maxlength","30").add("tag","page_descr");
		p_flg_menu = new HiddenField(model,"p_flg_menu");
		p_flg_menu.setLabel(gt(""));
		
		p_flg_menu.propertie().add("name","p_flg_menu").add("type","hidden").add("maxlength","30").add("tag","flg_menu");
		p_flg_transaction = new HiddenField(model,"p_flg_transaction");
		p_flg_transaction.setLabel(gt(""));
		
		p_flg_transaction.propertie().add("name","p_flg_transaction").add("type","hidden").add("maxlength","30").add("tag","flg_transaction");
		p_self_id = new HiddenField(model,"p_self_id");
		p_self_id.setLabel(gt(""));
		
		p_self_id.propertie().add("name","p_self_id").add("type","hidden").add("maxlength","30").add("tag","self_id");
		p_self_fw_id = new HiddenField(model,"p_self_fw_id");
		p_self_fw_id.setLabel(gt(""));
		
		p_self_fw_id.propertie().add("name","p_self_fw_id").add("type","hidden").add("maxlength","30").add("tag","self_fw_id");
		p_db_connection = new HiddenField(model,"p_db_connection");
		p_db_connection.setLabel(gt(""));
		
		p_db_connection.propertie().add("name","p_db_connection").add("type","hidden").add("maxlength","30").add("tag","db_connection");
		p_flg_offline = new HiddenField(model,"p_flg_offline");
		p_flg_offline.setLabel(gt(""));
		
		p_flg_offline.propertie().add("name","p_flg_offline").add("type","hidden").add("maxlength","30").add("tag","flg_offline");
		p_flg_internet = new HiddenField(model,"p_flg_internet");
		p_flg_internet.setLabel(gt(""));
		
		p_flg_internet.propertie().add("name","p_flg_internet").add("type","hidden").add("maxlength","30").add("tag","flg_internet");
		p_status = new HiddenField(model,"p_status");
		p_status.setLabel(gt(""));
		
		p_status.propertie().add("name","p_status").add("type","hidden").add("maxlength","30").add("tag","status");
		p_proc_name = new HiddenField(model,"p_proc_name");
		p_proc_name.setLabel(gt(""));
		
		p_proc_name.propertie().add("name","p_proc_name").add("type","hidden").add("maxlength","30").add("tag","proc_name");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","Page","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","igrp","Page","voltar","_self","default|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(env_fk);
		form_1.addField(version);
		form_1.addField(action_descr);
		form_1.addField(page);
		form_1.addField(p_id);
		form_1.addField(p_table_name);
		form_1.addField(p_xsl_src);
		form_1.addField(p_img_src);
		form_1.addField(p_action);
		form_1.addField(p_page_type);
		form_1.addField(p_page_descr);
		form_1.addField(p_flg_menu);
		form_1.addField(p_flg_transaction);
		form_1.addField(p_self_id);
		form_1.addField(p_self_fw_id);
		form_1.addField(p_db_connection);
		form_1.addField(p_flg_offline);
		form_1.addField(p_flg_internet);
		form_1.addField(p_status);
		form_1.addField(p_proc_name);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
