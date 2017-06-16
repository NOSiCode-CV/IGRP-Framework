package nosi.webapps.igrp.pages.webreport;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPMenu;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.PlainTextField;
import nosi.core.gui.fields.TextEditorField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.View;

/**
 * @author: Emanuel Pereira
 * 14 Jun 2017
 */
public class WebReportViewV2_2 extends View{

	public String title_ = "Web Report";		

	public Field report_editor;
	public Field link_add_source;
	public Field dialog_titulo_report;
	public Field dialog_keys_report;
	public Field codigo_report;
	public Field title_report;
	public Field link_source;
	public Field edit_name_report;
	public Field link_config;
	public Field env_dml;
	public Field prm_target;
	public Field fwl_tab_page;
	public Field fwl_workflow;
	public Field fwl_dialogbox;
	public Field fwl_relbox;
	public Field fwl_tab_menu;
	public Field env_fk;
	public Field datasorce_app;
	public Field env_frm_url;
	public Field title;
	public Field link;
	public Field link_desc;
	public Field id;
	public Field descricao;
	
	public IGRPForm form;
	public IGRPTable table;
	public IGRPButton btn_preview;
	public IGRPButton btn_gravar;
	public IGRPButton report;
	public IGRPButton data_source;
	public IGRPMenu menu;
	
	public WebReportViewV2_2(WebReport model){
		this.setPageTitle(this.title_);
		form = new IGRPForm("form",(float) 2.1);
		
		btn_gravar = new IGRPButton("Gravar", "igrp", "web-report", "saveGenWebReport", "submit", "save.png", "","");
		btn_gravar.setType("specific");
		btn_preview = new IGRPButton("Preview", "igrp", "web-report", "preview", "alert_submit", "preview.png", "","");
		btn_preview.setType("specific");
		
		menu = new IGRPMenu("menu");
		report = new IGRPButton("Report", "igrp", "web-report", "index", "_self", "", "", "");
		data_source = new IGRPButton("Data Source", "igrp", "web-report", "index", "_self", "", "", "");
		
		env_fk = new ListField(model, "env_fk");
		env_fk.setLabel("Aplicacao");
		env_fk.propertie().add("name","p_env_fk").add("multiple","false").add("required","false").add("change","false").add("disabled","false").add("right","false").add("maxlength","30");
		datasorce_app = new ListField(model, "datasorce_app");
		datasorce_app.setLabel("Data Source");
		datasorce_app.propertie().clear();
		datasorce_app.propertie().add("name","p_datasorce_app").add("type", "selectlist").add("multiple","true").add("code","DATASORCE_APP").add("maxlength","30");
		report_editor = new TextEditorField(model,"report_editor");
		report_editor.setLabel("Report Editor");
		report_editor.propertie().add("name", "p_report_editor").add("maxlength","30");
		link_source = new HiddenField(model,"link_source");
		link_source.propertie().add("name","p_link_source").add("tag","link_source");
		edit_name_report = new TextField(model,"edit_name_report");
		edit_name_report.propertie().add("name", "p_edit_name_report");
		link_add_source = new LinkField(model,"link_add_source");
		link_add_source.setLabel("Link Add Source");
		link_add_source.propertie().add("name", "p_link_add_source").add("maxlength","2000");
		dialog_titulo_report = new PlainTextField(model,"dialog_titulo_report");
		dialog_titulo_report.setLabel("Titulo Report");
		dialog_titulo_report.propertie().add("name", "p_dialog_titulo_report").add("maxlength","30");
		dialog_keys_report = new PlainTextField(model,"dialog_keys_report");
		dialog_keys_report.setLabel("Atribuir Valor a(s) chave(s)");
		dialog_keys_report.propertie().add("name", "p_dialog_keys_report").add("maxlength","30");
		codigo_report = new TextField(model,"codigo_report");
		codigo_report.setLabel("Codigo");
		codigo_report.propertie().add("name", "p_codigo_report").add("maxlength","30");
		title_report = new TextField(model,"title_report");
		title_report.setLabel("Titulo Report");
		title_report.propertie().add("name", "p_title_report").add("maxlength","30");
		link_config = new HiddenField(model,"link_config");
		link_config.propertie().add("name","p_link_config").add("tag","link_config");
		env_frm_url = new HiddenField(model,"p_env_frm_url");
		env_frm_url.propertie().add("name","p_env_frm_url").add("tag","p_env_frm_url");
		env_dml = new HiddenField(model,"env_dml");
		env_dml.propertie().add("name","p_env_dml").add("tag","p_env_dml");
		prm_target = new HiddenField(model,"prm_target");
		prm_target.propertie().add("name","p_prm_target").add("tag","p_prm_target");
		fwl_tab_page = new HiddenField(model,"fwl_tab_page");
		fwl_tab_page.propertie().add("name","p_fwl_tab_page").add("tag","p_fwl_tab_page");
		fwl_workflow = new HiddenField(model,"fwl_workflow");
		fwl_workflow.propertie().add("name","p_fwl_workflow").add("tag","p_fwl_workflow");
		fwl_dialogbox = new HiddenField(model,"fwl_dialogbox");
		fwl_dialogbox.propertie().add("name","p_fwl_dialogbox").add("tag","p_fwl_dialogbox");
		fwl_relbox = new HiddenField(model,"fwl_relbox");
		fwl_relbox.propertie().add("name","p_fwl_relbox").add("tag","p_fwl_relbox");
		fwl_tab_menu = new HiddenField(model,"fwl_tab_menu");
		fwl_tab_menu.propertie().add("name","p_fwl_tab_menu").add("tag","p_fwl_tab_menu");
		
		table = new IGRPTable("table",(float) 2.1);
		title = new TextField(model,"title");
		title.setLabel("Titulo");
		title.propertie().add("name","p_title").add("align","left").add("lookup_parser","false");
		link = new LinkField(model,"link");
		link.setLabel("Link");
		link.propertie().add("name","p_link").add("align","left").add("lookup_parser","false").add("class", "link");
		link_desc = new LinkField(model,"link_desc");
		link_desc.propertie().add("name","p_link_desc").add("align","left").add("lookup_parser","false").add("class", "link");
		id = new NumberField(model,"id");
		id.setLabel("ID");
		id.propertie().add("name","p_id").add("align","left").add("lookup_parser","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descricao");
		descricao.propertie().add("name","p_descricao").add("align","left").add("lookup_parser","false");
	}
		
	@Override
	public void render(){	
		Config.target = "_blank";
		form.addField(env_fk);
		form.addField(datasorce_app);
		form.addField(report_editor);
		form.addField(link_source);
		form.addField(edit_name_report);
		form.addField(link_add_source);
		form.addField(dialog_titulo_report);
		form.addField(dialog_keys_report);
		form.addField(codigo_report);
		form.addField(title_report);
		form.addField(link_config);
		form.addField(env_frm_url);
		form.addField(env_dml);
		form.addField(prm_target);
		form.addField(fwl_tab_page);
		form.addField(fwl_workflow);
		form.addField(fwl_dialogbox);
		form.addField(fwl_relbox);
		form.addField(fwl_tab_menu);
		form.addButton(btn_gravar);
		form.addButton(btn_preview);
		
		table.addField(id);
		table.addField(descricao);
		table.addField(title);
		table.addField(link);
		table.addField(link_desc);

		menu.addGroup(" Reports",report);
		menu.addGroup("Data Source",data_source);
		
		this.addToPage(menu);
		this.addToPage(form);
		this.addToPage(table);
	}
}
