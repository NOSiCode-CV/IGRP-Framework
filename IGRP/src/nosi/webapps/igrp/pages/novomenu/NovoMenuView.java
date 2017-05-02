/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NovoMenuView extends View {		
	
	public Field sectionheader_1_text;
	public Field codigo;
	public Field titulo;
	public Field menu_principal;
	public Field aplicacao;
	public Field pagina;
	public Field target;
	public Field ordem;
	public Field activo;
	public Field menu_base;
	public Field link_procedure;
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
		sectionheader_1_text.setValue("Gestão Menu - Novo");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Código");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		titulo = new TextField(model,"titulo");
		titulo.setLabel("Título");
		titulo.propertie().add("name","p_titulo").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		menu_principal = new ListField(model,"menu_principal");
		menu_principal.setLabel("Menu Principal");
		menu_principal.propertie().add("name","p_menu_principal").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicação");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		pagina = new ListField(model,"pagina");
		pagina.setLabel("Página");
		pagina.propertie().add("name","p_pagina").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		target = new ListField(model,"target");
		target.setLabel("Target");
		target.propertie().add("name","p_target").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		ordem = new TextField(model,"ordem");
		ordem.setLabel("Ordem");
		ordem.propertie().add("name","p_ordem").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		activo = new CheckBoxField(model,"activo");
		activo.setLabel("Activo?");
		activo.propertie().add("name","p_activo").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		menu_base = new CheckBoxField(model,"menu_base");
		menu_base.setLabel("Menu Base?");
		menu_base.propertie().add("name","p_menu_base").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		link_procedure = new TextField(model,"link_procedure");
		link_procedure.setLabel("Link (Procedure)");
		link_procedure.propertie().add("name","p_link_procedure").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","novo-menu","index","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","igrp","pesquisar-menu","index","_self","default|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(codigo);
		form_1.addField(titulo);
		form_1.addField(menu_principal);
		form_1.addField(aplicacao);
		form_1.addField(pagina);
		form_1.addField(target);
		form_1.addField(ordem);
		form_1.addField(activo);
		form_1.addField(menu_base);
		form_1.addField(link_procedure);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/