/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.webreport;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class WebReportView extends View {
	public String title_ = "Web Report";		

	public Field page_title_text;
	public Field env_fk;
	public Field datasorce_app;
	public Field report_editor;
	public Field link_add_source;
	public Field dialog_titulo_report;
	public Field dialog_keys_report;
	public Field codigo_report;
	public Field title_report;
	public Field link_source;
	public Field edit_name_report;
	public Field title;
	public Field link;
	public Field descricao;
	public Field id;
	public Field link_desc;
	public Field data_source;
	public Field reports;
	public Field link_config;
	
	public IGRPToolsBar fmn;
	public IGRPForm form1;
	public IGRPForm page_title;
	public IGRPTable table;
	public IGRPTabContent tabcontent_1;
	public IGRPButton btn_preview;
	public IGRPButton btn_gravar;
	
	public WebReportView(WebReport model){
		this.setPageTitle(this.title_);
		page_title = new IGRPForm("page_title");
		page_title_text = new TextField(model, "page_title_text");
		page_title_text.propertie().add("name", "p_page_title_text").add("persist", "true").add("maxlength", "100");
		
		fmn = new IGRPToolsBar("fmn");	
		btn_gravar = new IGRPButton("Gravar", "igrp", "web-report", "saveGenWebReport", "submit", "success|fa-save", "","");
		btn_preview = new IGRPButton("Preview", "igrp", "web-report", "preview", "alert_submit", "warning|fa-file-video-o", "","");
		
		tabcontent_1 = new IGRPTabContent("tabcontent_1");
		reports = new TextField(model,"reports");
		reports.propertie().add("name", "p_reports").add("type", "button").add("outline","false").add("iconColor","#333").add("iconClass","").add("img","fa-file-text-o").add("maxlength","50");
		reports.setLabel("Reports");
		data_source = new TextField(model, "data_source");
		data_source.setLabel("Data Source");
		data_source.propertie().add("name", "p_data_source").add("type", "button").add("outline","false").add("iconColor","#333").add("iconClass","").add("img","fa-database").add("maxlength","50");
		
		form1 = new IGRPForm("form_1");
		env_fk = new ListField(model, "env_fk");
		env_fk.setLabel("Aplicacao");
		env_fk.propertie().add("name","p_env_fk").add("multiple","false").add("required","false").add("change","false").add("disabled","false").add("right","false").add("maxlength","30");
		datasorce_app = new ListField(model, "datasorce_app");
		datasorce_app.setLabel("Data Source");
		datasorce_app.propertie().add("name","p_datasorce_app").add("multiple","false").add("required","false").add("change","false").add("disabled","false").add("right","false").add("maxlength","30");
		report_editor = new TextEditorField(model,"report_editor");
		report_editor.setLabel("Report Editor");
		report_editor.propertie().add("name", "p_report_editor").add("maxlength","30");
		link_add_source = new LinkField(model,"link_add_source");
		link_add_source.setLabel("Link Add Source");
		link_add_source.propertie().add("name", "p_link_add_source").add("maxlength","2000").add("target", "_self").add("right", "false").add("iconColor","#333").add("iconClass","").add("img","fa-link");
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
		link_source = new HiddenField(model,"link_source");
		link_source.propertie().add("name","p_link_source").add("tag","link_source");
		edit_name_report = new HiddenField(model,"edit_name_report");
		edit_name_report.propertie().add("name","p_edit_name_report").add("tag","edit_name_report");
		link_config = new HiddenField(model,"link_config");
		link_config.propertie().add("name","p_link_config").add("tag","link_config");
		
		table = new IGRPTable("gen_table");
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
		fmn.addButton(btn_gravar);
		fmn.addButton(btn_preview);
		
		page_title.addField(page_title_text);
		
		tabcontent_1.addField(reports);
		tabcontent_1.addField(data_source);
		
		form1.addField(env_fk);
		form1.addField(datasorce_app);
		form1.addField(report_editor);
		form1.addField(link_add_source);
		form1.addField(dialog_titulo_report);
		form1.addField(dialog_keys_report);
		form1.addField(codigo_report);
		form1.addField(title_report);
		form1.addField(link_source);
		form1.addField(edit_name_report);
		form1.addField(link_config);

		table.addField(id);
		table.addField(descricao);
		table.addField(title);
		table.addField(link);
		table.addField(link_desc);
		
		this.addToPage(page_title);
		this.addToPage(fmn);
		this.addToPage(tabcontent_1);
		this.addToPage(form1);
		this.addToPage(table);
	}
}
/*-------------------------*/