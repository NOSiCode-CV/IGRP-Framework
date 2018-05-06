
package nosi.webapps.igrp.pages.page;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;



public class PageView extends View {

	public Field sectionheader_1_text;
	public Field page_descr;
	public Field page;
	public Field status;
	public Field status_check;
	public Field gen_auto_code;
	public Field gen_auto_code_check;
	public Field nada;
	public Field modulo;
	public Field env_fk;
	public Field version;
	public Field nada2;
	public Field criar_menu;
	public Field criar_menu_check;
	public Field componente;
	public Field componente_check;
	public Field id;
	public Field table_name;
	public Field xsl_src;
	public Field img_src;
	public Field action;
	public Field page_type;
	public Field flg_menu;
	public Field flg_transaction;
	public Field self_id;
	public Field self_fw_id;
	public Field db_connection;
	public Field flg_offline;
	public Field flg_internet;
	public Field proc_name;
	public Field action_descr;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_novomodulo;

	public PageView(){

		this.setPageTitle("Registar Pagina");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Page builder - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Título"));
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","255").add("required","true");
		
		page = new TextField(model,"page");
		page.setLabel(gt("Código"));
		page.propertie().add("name","p_page").add("type","text").add("maxlength","255").add("required","true");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("switch","true").add("check","true");
		
		gen_auto_code = new CheckBoxField(model,"gen_auto_code");
		gen_auto_code.setLabel(gt("Gen Auto Code"));
		gen_auto_code.propertie().add("name","p_gen_auto_code").add("type","checkbox").add("maxlength","30").add("required","false").add("switch","false").add("check","true");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt("  "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30");
		
		modulo = new ListField(model,"modulo");
		modulo.setLabel(gt("Módulo"));
		modulo.propertie().add("name","p_modulo").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","false").add("java-type","");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("domain","").add("java-type","");
		
		version = new ListField(model,"version");
		version.setLabel(gt("Versão de Página"));
		version.propertie().add("name","p_version").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("domain","").add("java-type","");
		
		nada2 = new SeparatorField(model,"nada2");
		nada2.setLabel(gt(" "));
		nada2.propertie().add("name","p_nada2").add("type","separator").add("maxlength","30");
		
		criar_menu = new CheckBoxField(model,"criar_menu");
		criar_menu.setLabel(gt("Criar menu?"));
		criar_menu.propertie().add("name","p_criar_menu").add("type","checkbox").add("maxlength","30").add("required","false").add("switch","true").add("check","true");
		
		componente = new CheckBoxField(model,"componente");
		componente.setLabel(gt("Componente?"));
		componente.propertie().add("name","p_componente").add("type","checkbox").add("maxlength","30").add("required","false").add("switch","true").add("check","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		
		table_name = new HiddenField(model,"table_name");
		table_name.setLabel(gt(""));
		table_name.propertie().add("name","p_table_name").add("type","hidden").add("maxlength","80").add("java-type","").add("tag","table_name");
		
		xsl_src = new HiddenField(model,"xsl_src");
		xsl_src.setLabel(gt(""));
		xsl_src.propertie().add("name","p_xsl_src").add("type","hidden").add("maxlength","2000").add("java-type","").add("tag","xsl_src");
		
		img_src = new HiddenField(model,"img_src");
		img_src.setLabel(gt(""));
		img_src.propertie().add("name","p_img_src").add("type","hidden").add("maxlength","2000").add("java-type","").add("tag","img_src");
		
		action = new HiddenField(model,"action");
		action.setLabel(gt(""));
		action.propertie().add("name","p_action").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","action");
		
		page_type = new HiddenField(model,"page_type");
		page_type.setLabel(gt(""));
		page_type.propertie().add("name","p_page_type").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","page_type");
		
		flg_menu = new HiddenField(model,"flg_menu");
		flg_menu.setLabel(gt(""));
		flg_menu.propertie().add("name","p_flg_menu").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","flg_menu");
		
		flg_transaction = new HiddenField(model,"flg_transaction");
		flg_transaction.setLabel(gt(""));
		flg_transaction.propertie().add("name","p_flg_transaction").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","flg_transaction");
		
		self_id = new HiddenField(model,"self_id");
		self_id.setLabel(gt(""));
		self_id.propertie().add("name","p_self_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","self_id");
		
		self_fw_id = new HiddenField(model,"self_fw_id");
		self_fw_id.setLabel(gt(""));
		self_fw_id.propertie().add("name","p_self_fw_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","self_fw_id");
		
		db_connection = new HiddenField(model,"db_connection");
		db_connection.setLabel(gt(""));
		db_connection.propertie().add("name","p_db_connection").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","db_connection");
		
		flg_offline = new HiddenField(model,"flg_offline");
		flg_offline.setLabel(gt(""));
		flg_offline.propertie().add("name","p_flg_offline").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","flg_offline");
		
		flg_internet = new HiddenField(model,"flg_internet");
		flg_internet.setLabel(gt(""));
		flg_internet.propertie().add("name","p_flg_internet").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","flg_internet");
		
		proc_name = new HiddenField(model,"proc_name");
		proc_name.setLabel(gt(""));
		proc_name.propertie().add("name","p_proc_name").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","proc_name");
		
		action_descr = new HiddenField(model,"action_descr");
		action_descr.setLabel(gt(""));
		action_descr.propertie().add("name","p_action_descr").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","action_descr");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Page","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_novomodulo = new IGRPButton("NovoModulo","igrp_studio","modulo","index","right_panel","success|fa-angle-right","","");
		btn_novomodulo.propertie.add("type","specific").add("rel","novomodulo");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(page_descr);
		form_1.addField(page);
		form_1.addField(status);
		form_1.addField(gen_auto_code);
		form_1.addField(nada);
		form_1.addField(modulo);
		form_1.addField(env_fk);
		form_1.addField(version);
		form_1.addField(nada2);
		form_1.addField(criar_menu);
		form_1.addField(componente);
		form_1.addField(id);
		form_1.addField(table_name);
		form_1.addField(xsl_src);
		form_1.addField(img_src);
		form_1.addField(action);
		form_1.addField(page_type);
		form_1.addField(flg_menu);
		form_1.addField(flg_transaction);
		form_1.addField(self_id);
		form_1.addField(self_fw_id);
		form_1.addField(db_connection);
		form_1.addField(flg_offline);
		form_1.addField(flg_internet);
		form_1.addField(proc_name);
		form_1.addField(action_descr);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_novomodulo);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Page model) {
		
		page_descr.setValue(model);
		page.setValue(model);
		status.setValue(model);
		gen_auto_code.setValue(model);
		nada.setValue(model);
		modulo.setValue(model);
		env_fk.setValue(model);
		version.setValue(model);
		nada2.setValue(model);
		criar_menu.setValue(model);
		componente.setValue(model);
		id.setValue(model);
		table_name.setValue(model);
		xsl_src.setValue(model);
		img_src.setValue(model);
		action.setValue(model);
		page_type.setValue(model);
		flg_menu.setValue(model);
		flg_transaction.setValue(model);
		self_id.setValue(model);
		self_fw_id.setValue(model);
		db_connection.setValue(model);
		flg_offline.setValue(model);
		flg_internet.setValue(model);
		proc_name.setValue(model);
		action_descr.setValue(model);	

		
	}
}