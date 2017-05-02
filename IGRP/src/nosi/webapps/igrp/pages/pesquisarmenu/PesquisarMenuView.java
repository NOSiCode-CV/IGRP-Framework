/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PesquisarMenuView extends View {		
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field organica;
	public Field menu_principal;
	public Field descricao;
	public Field titulo;
	public Field pagina;
	public Field ativo;
	public Field checkbox;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_menu_base;
	public IGRPButton btn_pesquisar;
	public PesquisarMenuView(PesquisarMenu model){
		//Condig.TITLE = "Detalhe App";			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestao Menu");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Organica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		menu_principal = new ListField(model,"menu_principal");
		menu_principal.setLabel("Menu Principal");
		menu_principal.propertie().add("name","p_menu_principal").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		descricao = new PlainTextField(model,"descricao");
		descricao.setLabel("Descricao");
		descricao.propertie().add("name","p_descricao").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false");
		titulo = new PlainTextField(model,"titulo");
		titulo.setLabel("Titulo");
		titulo.propertie().add("name","p_titulo").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false");
		pagina = new PlainTextField(model,"pagina");
		pagina.setLabel("Pagina");
		pagina.propertie().add("name","p_pagina").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false");
		ativo = new PlainTextField(model,"ativo");
		ativo.setLabel("Ativo");
		ativo.propertie().add("name","p_ativo").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");
		checkbox = new CheckBoxField(model,"checkbox");
		checkbox.setLabel("Checkbox");
		checkbox.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","RED","Teste","Action","_self","default|fa-plus-square","default||fa-plus-square|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_menu_base = new IGRPButton("Menu Base","RED","Teste","Action","submit","default|fa-save","default||fa-save|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_menu_base.propertie.add("type","specific").add("code","").add("rel","menu_base");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(menu_principal);


		table_1.addField(descricao);
		table_1.addField(titulo);
		table_1.addField(pagina);
		table_1.addField(ativo);
		table_1.addField(checkbox);

		toolsbar_1.addButton(btn_novo);
		toolsbar_1.addButton(btn_menu_base);
		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/