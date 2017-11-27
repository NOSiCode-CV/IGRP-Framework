/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 
import static nosi.core.i18n.Translator.gt;
public class NovoMenuView extends View { 
	public String title = "Novo Menu";		
	
	public Field sectionheader_1_text;
	public Field code;
	public Field descr;
	public Field self_id;
	public Field env_fk;
	public Field action_fk;
	public Field target;
	public Field orderby;
	public Field status; 
	public Field flg_base;
	public Field link;
	public Field p_area;
	public Field p_img_src;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovoMenuView(NovoMenu model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(""); 
		sectionheader_1_text.setValue(gt("Gestão Menu - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		code = new TextField(model,"code");
		code.setLabel(gt("Código"));
		code.propertie().add("name","p_code").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descr = new TextField(model,"descr");
		descr.setLabel(gt("Título")); 
		descr.propertie().add("name","p_descr").add("type","text").add("maxlength","80").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		self_id = new ListField(model,"self_id");
		self_id.setLabel(gt("Menu Principal"));
		self_id.propertie().add("name","p_self_id").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false");
		action_fk = new ListField(model,"action_fk");
		action_fk.setLabel(gt("Página"));
		action_fk.propertie().add("name","p_action_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		target = new ListField(model,"target");
		target.setLabel("Target");
		target.propertie().add("name","p_target").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		orderby = new NumberField(model,"orderby");
		orderby.setLabel(gt("Ordem"));
		orderby.propertie().add("name","p_orderby").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Activo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		flg_base = new CheckBoxField(model,"flg_base");
		flg_base.setLabel("Menu Base?");
		flg_base.propertie().add("name","p_flg_base").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		link = new TextField(model,"link");
		link.setLabel("Link (Procedure)");
		link.propertie().add("name","p_link").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_area = new HiddenField(model,"p_area");
		p_area.setLabel("");
		p_area.propertie().add("name","p_area").add("type","hidden").add("maxlength","30").add("tag","area");
		p_img_src = new HiddenField(model,"p_img_src");
		p_img_src.setLabel("");
		p_img_src.propertie().add("name","p_img_src").add("type","hidden").add("maxlength","30").add("tag","img_src");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","NovoMenu","gravar","submit","info|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton(gt("Voltar"),"igrp","NovoMenu","voltar","_self","warning|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar"); 
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(env_fk);
		form_1.addField(code);
		form_1.addField(descr);
		form_1.addField(self_id);
		form_1.addField(action_fk);
		form_1.addField(target);
		form_1.addField(orderby);
		form_1.addField(status);
		form_1.addField(flg_base);
		form_1.addField(link);
		form_1.addField(p_area);
		form_1.addField(p_img_src);
		form_1.addField(p_id);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/