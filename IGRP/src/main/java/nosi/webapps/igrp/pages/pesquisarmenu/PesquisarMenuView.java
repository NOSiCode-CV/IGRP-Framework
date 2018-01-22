
package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisarMenuView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field organica;
	public Field menu_principal;
	public Field novo;
	public Field ativo;
	public Field checkbox;
	public Field checkbox_check;
	public Field t1_menu_principal;
	public Field table_titulo;
	public Field pagina;
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
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		menu_principal = new ListField(model,"menu_principal");
		menu_principal.setLabel(gt("Menu pai"));
		menu_principal.propertie().add("name","p_menu_principal").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		novo = new LinkField(model,"novo");
		novo.setLabel(gt("Novo"));
		novo.propertie().add("name","p_novo").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","NovoMenu").add("app","igrp").add("class","success").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("placeholder","").add("right","true");
		
		ativo = new PlainTextField(model,"ativo");
		ativo.setLabel(gt("Ativo"));
		ativo.propertie().add("name","p_ativo").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		checkbox = new CheckBoxField(model,"checkbox");
		checkbox.setLabel(gt("Público"));
		checkbox.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("align","center").add("lookup_parser","false").add("iskey","false").add("switch","false").add("check","true").add("desc","true");
		
		checkbox_check = new CheckBoxField
		(model,"checkbox_check");
		checkbox_check.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("align","center").add("lookup_parser","false").add("iskey","false").add("switch","false").add("check","true").add("desc","true");
		t1_menu_principal = new PlainTextField(model,"t1_menu_principal");
		t1_menu_principal.setLabel(gt("Menu pai"));
		t1_menu_principal.propertie().add("name","p_t1_menu_principal").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		table_titulo = new PlainTextField(model,"table_titulo");
		table_titulo.setLabel(gt("Título"));
		table_titulo.propertie().add("name","p_table_titulo").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		pagina = new PlainTextField(model,"pagina");
		pagina.setLabel(gt("Página"));
		pagina.propertie().add("name","p_pagina").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");
		

		btn_editar = new IGRPButton("Editar","igrp","PesquisarMenu","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarMenu","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(menu_principal);
		form_1.addField(novo);

		table_1.addField(ativo);
		table_1.addField(checkbox);
		table_1.addField(checkbox_check);
		table_1.addField(t1_menu_principal);
		table_1.addField(table_titulo);
		table_1.addField(pagina);
		table_1.addField(p_id);

		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
