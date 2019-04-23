package nosi.webapps.igrp.pages.novomenu;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class NovoMenuView extends View {

	public Field sectionheader_1_text;
	public Field env_fk;
	public Field action_fk;
	public Field detalhes;
	public Field titulo;
	public Field status;
	public Field status_check;
	public Field extra;
	public Field self_id;
	public Field orderby;
	public Field target;
	public Field link;
	public Field flg_base;
	public Field flg_base_check;
	public Field area;
	public Field img_src;
	public Field id;
	public Field app;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public NovoMenuView(){

		this.setPageTitle("Registar Menu");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão Menu - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("disabled","false").add("domain","").add("java-type","int").add("tags","false");
		
		action_fk = new ListField(model,"action_fk");
		action_fk.setLabel(gt("Página"));
		action_fk.propertie().add("name","p_action_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("domain","").add("java-type","int").add("tags","false");
		
		detalhes = new SeparatorField(model,"detalhes");
		detalhes.setLabel(gt("Detalhes"));
		detalhes.propertie().add("name","p_detalhes").add("type","separator").add("maxlength","30");
		
		titulo = new TextField(model,"titulo");
		titulo.setLabel(gt("Título"));
		titulo.propertie().add("name","p_titulo").add("type","text").add("maxlength","80").add("required","true").add("readonly","false").add("disabled","false");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","false").add("java-type","").add("check","true");
		
		extra = new SeparatorField(model,"extra");
		extra.setLabel(gt("Extra"));
		extra.propertie().add("name","p_extra").add("type","separator").add("maxlength","30");
		
		self_id = new ListField(model,"self_id");
		self_id.setLabel(gt("Menu pai"));
		self_id.propertie().add("name","p_self_id").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("domain","").add("java-type","int").add("tags","false");
		
		orderby = new NumberField(model,"orderby");
		orderby.setLabel(gt("Posição"));
		orderby.propertie().add("name","p_orderby").add("type","number").add("min","").add("max","").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int");
		
		target = new ListField(model,"target");
		target.setLabel(gt("Target"));
		target.propertie().add("name","p_target").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		link = new TextField(model,"link");
		link.setLabel(gt("Link (Procedure)"));
		link.propertie().add("name","p_link").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		flg_base = new CheckBoxField(model,"flg_base");
		flg_base.setLabel(gt("Público?"));
		flg_base.propertie().add("name","p_flg_base").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","false").add("java-type","").add("check","true");
		
		area = new HiddenField(model,"area");
		area.setLabel(gt(""));
		area.propertie().add("name","p_area").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","area");
		
		img_src = new HiddenField(model,"img_src");
		img_src.setLabel(gt(""));
		img_src.propertie().add("name","p_img_src").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","img_src");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		app = new HiddenField(model,"app");
		app.setLabel(gt(""));
		app.propertie().add("name","p_app").add("type","hidden").add("maxlength","250").add("java-type","int").add("tag","app");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","NovoMenu","gravar","submit_ajax","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(env_fk);
		form_1.addField(action_fk);
		form_1.addField(detalhes);
		form_1.addField(titulo);
		form_1.addField(status);
		form_1.addField(extra);
		form_1.addField(self_id);
		form_1.addField(orderby);
		form_1.addField(target);
		form_1.addField(link);
		form_1.addField(flg_base);
		form_1.addField(area);
		form_1.addField(img_src);
		form_1.addField(id);
		form_1.addField(app);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		env_fk.setValue(model);
		action_fk.setValue(model);
		detalhes.setValue(model);
		titulo.setValue(model);
		status.setValue(model);
		extra.setValue(model);
		self_id.setValue(model);
		orderby.setValue(model);
		target.setValue(model);
		link.setValue(model);
		flg_base.setValue(model);
		area.setValue(model);
		img_src.setValue(model);
		id.setValue(model);
		app.setValue(model);	

		}
}
