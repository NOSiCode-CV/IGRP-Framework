package nosi.webapps.igrp.pages.page;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class PageView extends View {

	public Field sectionheader_1_text;
	public Field help;
	public Field page_descr;
	public Field page;
	public Field status;
	public Field status_check;
	public Field gen_auto_code;
	public Field gen_auto_code_check;
	public Field publico;
	public Field publico_check;
	public Field public_link;
	public Field public_link_2;
	public Field nada;
	public Field env_fk;
	public Field componente;
	public Field componente_check;
	public Field extras;
	public Field primeira_pagina;
	public Field primeira_pagina_check;
	public Field criar_menu;
	public Field criar_menu_check;
	public Field modulo;
	public Field novo_modulo;
	public Field editar_modulo;
	public Field version;
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
	public Field id_pagin_hidd;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_gravar;
	public IGRPButton btn_eliminar_pagina;

	public PageView(){

		this.setPageTitle("Registar Pagina");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Page builder - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		help = new LinkField(model,"help");
		help.setLabel(gt("Help"));
		help.setValue(Core.getIGRPLink("igrp","Dominio","index"));

									help.propertie().add("name","p_help").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Título"));
		page_descr.propertie().add("remote-generate-link",Core.getIGRPLink("igrp","Page","generate-link")).add("name","p_page_descr").add("type","text").add("maxlength","255").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		page = new TextField(model,"page");
		page.setLabel(gt("Código"));
		page.propertie().add("remote-generate-link",Core.getIGRPLink("igrp","Page","generate-link")).add("name","p_page").add("type","text").add("maxlength","255").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		gen_auto_code = new CheckBoxField(model,"gen_auto_code");
		gen_auto_code.setLabel(gt("Gen Auto Code"));
		gen_auto_code.propertie().add("name","p_gen_auto_code").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","false").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		publico = new CheckBoxField(model,"publico");
		publico.setLabel(gt("Publico"));
		publico.propertie().add("name","p_publico").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","short").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		public_link = new TextField(model,"public_link");
		public_link.setLabel(gt("Public Link"));
		public_link.propertie().add("name","p_public_link").add("type","text").add("maxlength","250").add("required","false").add("readonly","true").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		public_link_2 = new TextField(model,"public_link_2");
		public_link_2.setLabel(gt("Public Encrypted Link"));
		public_link_2.propertie().add("name","p_public_link_2").add("type","text").add("maxlength","250").add("required","false").add("readonly","true").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt("  "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		componente = new CheckBoxField(model,"componente");
		componente.setLabel(gt("Componente?"));
		componente.propertie().add("name","p_componente").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		extras = new SeparatorField(model,"extras");
		extras.setLabel(gt("Extras"));
		extras.propertie().add("name","p_extras").add("type","separator").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		primeira_pagina = new CheckBoxField(model,"primeira_pagina");
		primeira_pagina.setLabel(gt("Primeira Página"));
		primeira_pagina.propertie().add("name","p_primeira_pagina").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		criar_menu = new CheckBoxField(model,"criar_menu");
		criar_menu.setLabel(gt("Criar menu?"));
		criar_menu.propertie().add("name","p_criar_menu").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		modulo = new ListField(model,"modulo");
		modulo.setLabel(gt("Módulo"));
		modulo.propertie().add("remote-setModuloEditar",Core.getIGRPLink("igrp","Page","setModuloEditar")).add("name","p_modulo").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","false").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		novo_modulo = new LinkField(model,"novo_modulo");
		novo_modulo.setLabel(gt("Módulo"));
		novo_modulo.setValue(Core.getIGRPLink("igrp","Page","index"));

									novo_modulo.propertie().add("name","p_novo_modulo").add("type","link").add("target","right_panel").add("class","success").add("img","fa-plus-square").add("maxlength","30").add("placeholder",gt("")).add("request_fields","").add("refresh_submit","false").add("desclabel","false").add("refresh_components","").add("adbcli","").add("tooltip","false").add("disable_copy_paste","false");
		
		editar_modulo = new LinkField(model,"editar_modulo");
		editar_modulo.setLabel(gt("Módulo"));
		editar_modulo.setValue(Core.getIGRPLink("igrp","Dominio","index"));

									editar_modulo.propertie().add("name","p_editar_modulo").add("type","link").add("target","right_panel").add("class","warning").add("img","fa-pencil-square-o").add("maxlength","30").add("placeholder",gt("")).add("request_fields","").add("refresh_submit","false").add("desclabel","false").add("refresh_components","").add("adbcli","").add("tooltip","false").add("disable_copy_paste","false");
		
		version = new ListField(model,"version");
		version.setLabel(gt("Versão de Página"));
		version.propertie().add("name","p_version").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","id");
		
		table_name = new HiddenField(model,"table_name");
		table_name.setLabel(gt(""));
		table_name.propertie().add("name","p_table_name").add("type","hidden").add("maxlength","80").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","table_name");
		
		xsl_src = new HiddenField(model,"xsl_src");
		xsl_src.setLabel(gt(""));
		xsl_src.propertie().add("name","p_xsl_src").add("type","hidden").add("maxlength","2000").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","xsl_src");
		
		img_src = new HiddenField(model,"img_src");
		img_src.setLabel(gt(""));
		img_src.propertie().add("name","p_img_src").add("type","hidden").add("maxlength","2000").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","img_src");
		
		action = new HiddenField(model,"action");
		action.setLabel(gt(""));
		action.propertie().add("name","p_action").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","action");
		
		page_type = new HiddenField(model,"page_type");
		page_type.setLabel(gt(""));
		page_type.propertie().add("name","p_page_type").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","page_type");
		
		flg_menu = new HiddenField(model,"flg_menu");
		flg_menu.setLabel(gt(""));
		flg_menu.propertie().add("name","p_flg_menu").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","flg_menu");
		
		flg_transaction = new HiddenField(model,"flg_transaction");
		flg_transaction.setLabel(gt(""));
		flg_transaction.propertie().add("name","p_flg_transaction").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","flg_transaction");
		
		self_id = new HiddenField(model,"self_id");
		self_id.setLabel(gt(""));
		self_id.propertie().add("name","p_self_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","self_id");
		
		self_fw_id = new HiddenField(model,"self_fw_id");
		self_fw_id.setLabel(gt(""));
		self_fw_id.propertie().add("name","p_self_fw_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","self_fw_id");
		
		db_connection = new HiddenField(model,"db_connection");
		db_connection.setLabel(gt(""));
		db_connection.propertie().add("name","p_db_connection").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","db_connection");
		
		flg_offline = new HiddenField(model,"flg_offline");
		flg_offline.setLabel(gt(""));
		flg_offline.propertie().add("name","p_flg_offline").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","flg_offline");
		
		flg_internet = new HiddenField(model,"flg_internet");
		flg_internet.setLabel(gt(""));
		flg_internet.propertie().add("name","p_flg_internet").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","flg_internet");
		
		proc_name = new HiddenField(model,"proc_name");
		proc_name.setLabel(gt(""));
		proc_name.propertie().add("name","p_proc_name").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","proc_name");
		
		action_descr = new HiddenField(model,"action_descr");
		action_descr.setLabel(gt(""));
		action_descr.propertie().add("name","p_action_descr").add("type","hidden").add("maxlength","30").add("java-type","").add("tooltip","false").add("disable_copy_paste","false").add("tag","action_descr");
		
		id_pagin_hidd = new HiddenField(model,"id_pagin_hidd");
		id_pagin_hidd.setLabel(gt(""));
		id_pagin_hidd.propertie().add("name","p_id_pagin_hidd").add("type","hidden").add("maxlength","250").add("java-type","Integer").add("tooltip","false").add("disable_copy_paste","false").add("tag","id_pagin_hidd");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");

		btn_gravar = new IGRPButton("Gravar","igrp","Page","gravar","submit_ajax","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		btn_eliminar_pagina = new IGRPButton("Eliminar Página","igrp","Page","eliminar_pagina","submit","danger|fa-trash","","");
		btn_eliminar_pagina.propertie.add("type","specific").add("rel","eliminar_pagina").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(help);


		form_1.addField(page_descr);
		form_1.addField(page);
		form_1.addField(status);
		form_1.addField(gen_auto_code);
		form_1.addField(publico);
		form_1.addField(public_link);
		form_1.addField(public_link_2);
		form_1.addField(nada);
		form_1.addField(env_fk);
		form_1.addField(componente);
		form_1.addField(extras);
		form_1.addField(primeira_pagina);
		form_1.addField(criar_menu);
		form_1.addField(modulo);
		form_1.addField(novo_modulo);
		form_1.addField(editar_modulo);
		form_1.addField(version);
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
		form_1.addField(id_pagin_hidd);


		toolsbar_1.addButton(btn_gravar);
		toolsbar_2.addButton(btn_eliminar_pagina);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		help.setValue(model);
		page_descr.setValue(model);
		page.setValue(model);
		status.setValue(model);
		gen_auto_code.setValue(model);
		publico.setValue(model);
		public_link.setValue(model);
		public_link_2.setValue(model);
		nada.setValue(model);
		env_fk.setValue(model);
		componente.setValue(model);
		extras.setValue(model);
		primeira_pagina.setValue(model);
		criar_menu.setValue(model);
		modulo.setValue(model);
		novo_modulo.setValue(model);
		editar_modulo.setValue(model);
		version.setValue(model);
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
		id_pagin_hidd.setValue(model);	

		}
}