package nosi.webapps.igrp_studio.pages.webreport;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
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
	public Field link_source;
	public Field edit_name_report;
	public Field link_config;
	public Field link_upload_img;
	public Field title;
	public Field link;
	public Field descricao;
	public Field id;
	public IGRPForm page_title;
	public IGRPForm tabcontent_1;
	public IGRPForm form_1;
	public IGRPTable gen_table;
	public IGRPChart chart_1;

	public IGRPToolsBar fmn;
	public IGRPButton btn_gravar;
	public IGRPButton btn_preview;

	public WebReportView(){

		this.setPageTitle("Report Builder");
			
		page_title = new IGRPForm("page_title","");

		tabcontent_1 = new IGRPForm("tabcontent_1","");

		form_1 = new IGRPForm("form_1","");

		gen_table = new IGRPTable("gen_table","");

		chart_1 = new IGRPChart("chart_1","Chart");

		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel(gt(""));
		page_title_text.setValue(gt("Web Report"));
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("maxlength","4000");
		
		reports = new TextField(model,"reports");
		reports.setLabel(gt("Reports"));
		reports.propertie().add("name","p_reports").add("type","button").add("request_fields","").add("maxlength","50");
		
		data_source = new TextField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","button").add("request_fields","").add("maxlength","50");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("disabled","false").add("tags","false").add("java-type","");
		
		datasorce_app = new ListField(model,"datasorce_app");
		datasorce_app.setLabel(gt("Datasorce App"));
		datasorce_app.propertie().add("name","p_datasorce_app").add("type","select").add("multiple","true").add("domain","").add("maxlength","100").add("required","false").add("disabled","false").add("tags","false").add("java-type","");
		
		report_editor = new TextEditorField(model,"report_editor");
		report_editor.setLabel(gt("Report Editor"));
		report_editor.propertie().add("name","p_report_editor").add("type","texteditor").add("maxlength","300000").add("required","false").add("readonly","false").add("disabled","false");
		
		link_add_source = new LinkField(model,"link_add_source");
		link_add_source.setLabel(gt("Link add source"));
		link_add_source.setValue(new Config().getResolveUrl("igrp_studio","WebReport","index"));

									link_add_source.propertie().add("name","p_link_add_source").add("type","link").add("target","_self").add("maxlength","2000").add("request_fields","");
		
		dialog_titulo_report = new PlainTextField(model,"dialog_titulo_report");
		dialog_titulo_report.setLabel(gt("Dialog_titulo_report"));
		dialog_titulo_report.propertie().add("name","p_dialog_titulo_report").add("type","plaintext").add("clear","false").add("maxlength","3000");
		
		dialog_keys_report = new PlainTextField(model,"dialog_keys_report");
		dialog_keys_report.setLabel(gt("Dialog_keys_report"));
		dialog_keys_report.propertie().add("name","p_dialog_keys_report").add("type","plaintext").add("clear","false").add("maxlength","3000");
		
		codigo_report = new TextField(model,"codigo_report");
		codigo_report.setLabel(gt("Codigo Report"));
		codigo_report.propertie().add("name","p_codigo_report").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		title_report = new TextField(model,"title_report");
		title_report.setLabel(gt("Title Report"));
		title_report.propertie().add("name","p_title_report").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		link_source = new HiddenField(model,"link_source");
		link_source.setLabel(gt(""));
		link_source.propertie().add("name","p_link_source").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","link_source");
		
		edit_name_report = new HiddenField(model,"edit_name_report");
		edit_name_report.setLabel(gt(""));
		edit_name_report.propertie().add("name","p_edit_name_report").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","edit_name_report");
		
		link_config = new HiddenField(model,"link_config");
		link_config.setLabel(gt(""));
		link_config.propertie().add("name","p_link_config").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","link_config");
		
		link_upload_img = new HiddenField(model,"link_upload_img");
		link_upload_img.setLabel(gt(""));
		link_upload_img.propertie().add("name","p_link_upload_img").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","link_upload_img");
		
		title = new TextField(model,"title");
		title.setLabel(gt("Title"));
		title.propertie().add("name","p_title").add("type","text").add("maxlength","30");
		
		link = new LinkField(model,"link");
		link.setLabel(gt("Link"));
		link.setValue(new Config().getResolveUrl("igrp_studio","WebReport","index"));

									link.propertie().add("name","p_link").add("type","link").add("target","_self").add("maxlength","30").add("request_fields","").add("show_header","true").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		id = new NumberField(model,"id");
		id.setLabel(gt("Id"));
		id.propertie().add("name","p_id").add("type","number").add("min","").add("max","").add("maxlength","30").add("total_footer","false").add("java-type","");
		

		fmn = new IGRPToolsBar("fmn");

		btn_gravar = new IGRPButton("Gravar","igrp_studio","WebReport","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_preview = new IGRPButton("Preview","igrp_studio","WebReport","preview","alert_submit","default|fa-file-video-o","","");
		btn_preview.propertie.add("type","specific").add("rel","preview");

		
		chart_1.setCaption("");
		chart_1.setChart_type("line");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		chart_1.addColor("#a2fa0b").addColor("#1b30cf").addColor("#756b1c").addColor("#e18942");

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
		form_1.addField(link_source);
		form_1.addField(edit_name_report);
		form_1.addField(link_config);
		form_1.addField(link_upload_img);

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
		
	@Override
	public void setModel(Model model) {
		
		reports.setValue(model);
		data_source.setValue(model);
		env_fk.setValue(model);
		datasorce_app.setValue(model);
		report_editor.setValue(model);
		link_add_source.setValue(model);
		dialog_titulo_report.setValue(model);
		dialog_keys_report.setValue(model);
		codigo_report.setValue(model);
		title_report.setValue(model);
		link_source.setValue(model);
		edit_name_report.setValue(model);
		link_config.setValue(model);
		link_upload_img.setValue(model);
		title.setValue(model);
		link.setValue(model);
		descricao.setValue(model);
		id.setValue(model);	

		gen_table.loadModel(((WebReport) model).getGen_table());
		}
}
