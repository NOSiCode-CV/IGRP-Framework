package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class EnvView extends View {

	public Field sectionheader_1_text;
	public Field name;
	public Field dad;
	public Field description;
	public Field status;
	public Field status_check;
	public Field gen_auto_code;
	public Field gen_auto_code_check;
	public Field personalizacoes;
	public Field img_src;
	public Field templates;
	public Field template_theme_24_;
	public Field action_fk;
	public Field _nada;
	public Field flg_external;
	public Field host;
	public Field plsql_codigo;
	public Field _nada2;
	public Field flg_old;
	public Field flg_old_check;
	public Field link_menu;
	public Field link_center;
	public Field apache_dad;
	public IGRPSectionHeader sectionheader_1;
	public IGRPBox box_1;
	public IGRPForm form_1;
	public IGRPForm form_more;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public EnvView(){

		this.setPageTitle("Registar Aplicacao");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		box_1 = new IGRPBox("box_1","");

		form_1 = new IGRPForm("form_1","");

		form_more = new IGRPForm("form_more","Mais opções...");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("App builder - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		name = new TextField(model,"name");
		name.setLabel(gt("Nome"));
		name.propertie().add("name","p_name").add("type","text").add("maxlength","50").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		dad = new TextField(model,"dad");
		dad.setLabel(gt("Código"));
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		description = new TextAreaField(model,"description");
		description.setLabel(gt("Descrição"));
		description.propertie().add("name","p_description").add("type","textarea").add("maxlength","500").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("disablehtml","true").add("tooltip","false").add("disable_copy_paste","false");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		gen_auto_code = new CheckBoxField(model,"gen_auto_code");
		gen_auto_code.setLabel(gt("Gen Auto Code"));
		gen_auto_code.propertie().add("name","p_gen_auto_code").add("type","checkbox").add("maxlength","2").add("required","false").add("readonly","false").add("disabled","false").add("switch","false").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("check","true");
		
		personalizacoes = new SeparatorField(model,"personalizacoes");
		personalizacoes.setLabel(gt("Personalizações"));
		personalizacoes.propertie().add("name","p_personalizacoes").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		img_src = new ListField(model,"img_src");
		img_src.setLabel(gt("Logotipo (icon)"));
		img_src.propertie().add("name","p_img_src").add("type","select").add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		
		templates = new ListField(model,"templates");
		templates.setLabel(gt("Template (theme 2.3)"));
		templates.propertie().add("name","p_templates").add("type","select").add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		
		template_theme_24_ = new ListField(model,"template_theme_24_");
		template_theme_24_.setLabel(gt("Template (theme 2.4) "));
		template_theme_24_.propertie().add("name","p_template_theme_24_").add("type","select").add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		
		action_fk = new ListField(model,"action_fk");
		action_fk.setLabel(gt("Primeira Página"));
		action_fk.propertie().add("name","p_action_fk").add("type","select").add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		
		_nada = new SeparatorField(model,"_nada");
		_nada.setLabel(gt(" "));
		_nada.propertie().add("name","p__nada").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		flg_external = new ListField(model,"flg_external");
		flg_external.setLabel(gt("Externo?"));
		flg_external.propertie().add("name","p_flg_external").add("type","select").add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("tooltip","false").add("disable_copy_paste","false");
		
		host = new TextField(model,"host");
		host.setLabel(gt("Host / Custom dad"));
		host.propertie().add("name","p_host").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		plsql_codigo = new TextField(model,"plsql_codigo");
		plsql_codigo.setLabel(gt("IGRP (code)"));
		plsql_codigo.propertie().add("name","p_plsql_codigo").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		_nada2 = new SeparatorField(model,"_nada2");
		_nada2.setLabel(gt(" "));
		_nada2.propertie().add("name","p__nada2").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		flg_old = new CheckBoxField(model,"flg_old");
		flg_old.setLabel(gt("Antigo?"));
		flg_old.propertie().add("name","p_flg_old").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("tooltip","false").add("disable_copy_paste","false").add("switch","true").add("check","true");
		
		link_menu = new TextField(model,"link_menu");
		link_menu.setLabel(gt("Link Menu (Antigo)"));
		link_menu.propertie().add("name","p_link_menu").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		link_center = new TextField(model,"link_center");
		link_center.setLabel(gt("Link Centro (Antigo)"));
		link_center.propertie().add("name","p_link_center").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		apache_dad = new TextField(model,"apache_dad");
		apache_dad.setLabel(gt("DAD"));
		apache_dad.propertie().add("name","p_apache_dad").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp_studio","Env","gravar","submit","primary|fa-floppy-o","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);



		form_1.addField(name);
		form_1.addField(dad);
		form_1.addField(description);
		form_1.addField(status);
		form_1.addField(gen_auto_code);

		form_more.addField(personalizacoes);
		form_more.addField(img_src);
		form_more.addField(templates);
		form_more.addField(template_theme_24_);
		form_more.addField(action_fk);
		form_more.addField(_nada);
		form_more.addField(flg_external);
		form_more.addField(host);
		form_more.addField(plsql_codigo);
		form_more.addField(_nada2);
		form_more.addField(flg_old);
		form_more.addField(link_menu);
		form_more.addField(link_center);
		form_more.addField(apache_dad);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(box_1);
		this.addToPage(form_1);
		this.addToPage(form_more);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		name.setValue(model);
		dad.setValue(model);
		description.setValue(model);
		status.setValue(model);
		gen_auto_code.setValue(model);
		personalizacoes.setValue(model);
		img_src.setValue(model);
		templates.setValue(model);
		template_theme_24_.setValue(model);
		action_fk.setValue(model);
		_nada.setValue(model);
		flg_external.setValue(model);
		host.setValue(model);
		plsql_codigo.setValue(model);
		_nada2.setValue(model);
		flg_old.setValue(model);
		link_menu.setValue(model);
		link_center.setValue(model);
		apache_dad.setValue(model);	

		}
}
