
package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisarMenuView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field novo;
	public Field t1_menu_principal;
	public Field ativo;
	public Field ativo_check;
	public Field table_titulo;
	public Field pagina;
	public Field checkbox;
	public Field checkbox_check;
	public Field p_id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public PesquisarMenuView(PesquisarMenu model){

		this.setPageTitle("Lista de Menu");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão Menu"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("domain","").add("java-type","");
		
		novo = new LinkField(model,"novo");
		novo.setLabel(gt("Novo"));
		novo.setValue("webapps?r=igrp/NovoMenu/index");
							
		novo.propertie().add("name","p_novo").add("type","link").add("target","modal").add("maxlength","30");
		
		t1_menu_principal = new PlainTextField(model,"t1_menu_principal");
		t1_menu_principal.setLabel(gt("Menu pai"));
		t1_menu_principal.propertie().add("name","p_t1_menu_principal").add("type","plaintext").add("maxlength","100");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		
		ativo_check = new CheckBoxField
		(model,"ativo_check");
		ativo_check.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		table_titulo = new PlainTextField(model,"table_titulo");
		table_titulo.setLabel(gt("Título"));
		table_titulo.propertie().add("name","p_table_titulo").add("type","plaintext").add("maxlength","100");
		
		pagina = new PlainTextField(model,"pagina");
		pagina.setLabel(gt("Página"));
		pagina.propertie().add("name","p_pagina").add("type","plaintext").add("maxlength","100");
		
		checkbox = new CheckBoxField(model,"checkbox");
		checkbox.setLabel(gt("Público"));
		checkbox.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		checkbox_check = new CheckBoxField
		(model,"checkbox_check");
		checkbox_check.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		


		btn_editar = new IGRPButton("Editar","igrp","PesquisarMenu","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarMenu","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(novo);

		table_1.addField(t1_menu_principal);
		table_1.addField(ativo);
		table_1.addField(ativo_check);
		table_1.addField(table_titulo);
		table_1.addField(pagina);
		table_1.addField(checkbox);
		table_1.addField(checkbox_check);
		table_1.addField(p_id);

		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
