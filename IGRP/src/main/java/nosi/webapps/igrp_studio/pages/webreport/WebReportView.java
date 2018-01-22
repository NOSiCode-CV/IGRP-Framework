/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp_studio.pages.webreport;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;


public class WebReportView extends View {
	
	
	public Field page_title_text;
	public Field reports;
	public Field data_source;
	public Field env_fk;
	public Field datasorce_app;
	public Field report_editor;
	public Field link_add_source;
	public Field dialog_titulo_report;
	public Field dialog_keys_report;
	public Field codigo_report;
	public Field title_report;
	public Field p_link_source;
	public Field p_edit_name_report;
	public Field p_link_config;
	public Field title;
	public Field link;
	public Field descricao;
	public Field id;
	public IGRPSectionHeader page_title;
	public IGRPTabContent tabcontent_1;
	public IGRPForm form_1;
	public IGRPTable gen_table;
	public IGRPChart chart_1;

	public IGRPToolsBar fmn;
	public IGRPButton btn_gravar;
	public IGRPButton btn_preview;
	public WebReportView(WebReport model){
		this.setPageTitle("Report Builder");
		
		page_title = new IGRPSectionHeader("page_title","");
		tabcontent_1 = new IGRPTabContent("tabcontent_1","");
		form_1 = new IGRPForm("form_1","");
		gen_table = new IGRPTable("gen_table","");
		chart_1 = new IGRPChart("chart_1","Chart");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Web Report");
		page_title_text.setValue("Web Report");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		reports = new TextField(model,"reports");
		reports.setLabel("Reports");
		reports.setValue("");
		reports.propertie().add("name","p_reports").add("type","button").add("target_fields","").add("iconColor","#333").add("iconClass","").add("img","fa-file-text-o").add("maxlength","50");
		data_source = new TextField(model,"data_source");
		data_source.setLabel("Data Source");
		data_source.setValue("");
		data_source.propertie().add("name","p_data_source").add("type","button").add("target_fields","").add("iconColor","#333").add("iconClass","").add("img","fa-database").add("maxlength","50");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.setValue("");
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		datasorce_app = new ListField(model,"datasorce_app");
		datasorce_app.setLabel("Datasorce App");
		datasorce_app.setValue("");
		datasorce_app.propertie().add("name","p_datasorce_app").add("type","select").add("multiple","true").add("domain","").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		report_editor = new TextEditorField(model,"report_editor");
		report_editor.setLabel("Report Editor");
		report_editor.setValue("Sit stract deserunt iste consectetur adipiscing deserunt amet lorem natus stract aliqua lorem adipiscing elit voluptatem magna ut aliqua mollit");
		report_editor.propertie().add("name","p_report_editor").add("type","texteditor").add("maxlength","300000").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		link_add_source = new LinkField(model,"link_add_source");
		link_add_source.setLabel("Link add source");
		link_add_source.setValue("undefinedimages/IGRP/IGRP2.3/app/igrp/webreport/WebReport.xsl");
		link_add_source.propertie().add("name","p_link_add_source").add("type","link").add("target","_self").add("target_fields","").add("action","index").add("page","WebReport").add("app","igrp").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","2000").add("placeholder","").add("right","false");
		dialog_titulo_report = new PlainTextField(model,"dialog_titulo_report");
		dialog_titulo_report.setLabel("Dialog_titulo_report");
		dialog_titulo_report.setValue("Adipiscing unde stract consectetur ut ipsum laudantium consectetur aperiam magna totam consectetur sit voluptatem laudantium");
		dialog_titulo_report.propertie().add("name","p_dialog_titulo_report").add("type","plaintext").add("clear","false").add("maxlength","3000").add("right","false");
		dialog_keys_report = new PlainTextField(model,"dialog_keys_report");
		dialog_keys_report.setLabel("Dialog_keys_report");
		dialog_keys_report.setValue("Aperiam voluptatem rem elit amet elit accusantium omnis totam amet deserunt accusantium adipiscing ipsum aliqua");
		dialog_keys_report.propertie().add("name","p_dialog_keys_report").add("type","plaintext").add("clear","false").add("maxlength","3000").add("right","false");
		codigo_report = new TextField(model,"codigo_report");
		codigo_report.setLabel("Codigo Report");
		codigo_report.setValue("Mollit officia labore anim sed");
		codigo_report.propertie().add("name","p_codigo_report").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		title_report = new TextField(model,"title_report");
		title_report.setLabel("Title Report");
		title_report.setValue("Laudantium amet totam doloremq");
		title_report.propertie().add("name","p_title_report").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_link_source = new HiddenField(model,"p_link_source");
		p_link_source.setLabel("");
		p_link_source.setValue("");
		p_link_source.propertie().add("name","p_link_source").add("type","hidden").add("maxlength","30").add("tag","link_source");
		p_edit_name_report = new HiddenField(model,"p_edit_name_report");
		p_edit_name_report.setLabel("");
		p_edit_name_report.setValue("");
		p_edit_name_report.propertie().add("name","p_edit_name_report").add("type","hidden").add("maxlength","30").add("tag","edit_name_report");
		p_link_config = new HiddenField(model,"p_link_config");
		p_link_config.setLabel("");
		p_link_config.setValue("");
		p_link_config.propertie().add("name","p_link_config").add("type","hidden").add("maxlength","30").add("tag","link_config");
		title = new TextField(model,"title");
		title.setLabel("Title");
		title.setValue("");
		title.propertie().add("name","p_title").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		link = new LinkField(model,"link");
		link.setLabel("Link");
		link.setValue("");
		link.propertie().add("name","p_link").add("type","link").add("target","_self").add("target_fields","").add("action","index").add("page","WebReport").add("app","igrp").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.setValue("");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		id = new NumberField(model,"id");
		id.setLabel("Id");
		id.setValue("");
		id.propertie().add("name","p_id").add("type","number").add("min","").add("max","").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("total_footer","false");

		fmn = new IGRPToolsBar("fmn");
		fmn.getProperties().add("gen-type", "menu");
		fmn.getProperties().add("gen-group", "");
		
		btn_gravar = new IGRPButton(gt("Gravar"),"igrp_studio","WebReport","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_preview = new IGRPButton("Preview","igrp_studio","WebReport","preview","alert_submit","warning|fa-file-video-o","","");
		btn_preview.propertie.add("type","specific").add("code","").add("rel","preview");
		
		chart_1.setCaption("");
		chart_1.setChart_type("line");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		chart_1.addColor("#96ef08").addColor("#5ec1be").addColor("#208689").addColor("#34e6f6");

	}
		
	@Override
	public void render(){
		
		page_title.addField(page_title_text);


		tabcontent_1.addField(reports);
		tabcontent_1.addField(data_source);

		form_1.addField(env_fk);
		form_1.addField(datasorce_app);
		form_1.addField(report_editor);
		form_1.addField(link_add_source);
		form_1.addField(dialog_titulo_report);
		form_1.addField(dialog_keys_report);
		form_1.addField(codigo_report);
		form_1.addField(title_report);
		form_1.addField(p_link_source);
		form_1.addField(p_edit_name_report);
		form_1.addField(p_link_config);

		gen_table.addField(title);
		gen_table.addField(link);
		gen_table.addField(descricao);
		gen_table.addField(id);


		fmn.addButton(btn_gravar);
		fmn.addButton(btn_preview);
		this.addToPage(page_title);
		this.addToPage(tabcontent_1);
		this.addToPage(form_1);
		this.addToPage(gen_table);
		this.addToPage(chart_1);
		this.addToPage(fmn);
	}
}
/*-------------------------*/