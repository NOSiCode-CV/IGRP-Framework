package nosi.webapps.igrp.pages.novaorganica;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class NovaOrganicaView extends View {

	public Field sectionheader_1_text;
	public Field documento;
	public Field nome;
	public Field codigo;
	public Field ativo;
	public Field ativo_check;
	public Field nada;
	public Field aplicacao;
	public Field organizacao_pai;
	public Field extras;
	public Field plsql_codigo;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public NovaOrganicaView(){

		this.setPageTitle("Registar Organica");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Orgânica - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","40");
		
		documento = new LinkField(model,"documento");
		documento.setLabel(gt("Help"));
		documento.setValue(gt("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT;&p_type=organica"));
		documento.propertie().add("name","p_documento").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","60").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","100").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("ex: org2")).add("desclabel","false");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","50").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("java-type","int").add("check","true");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		organizacao_pai = new ListField(model,"organizacao_pai");
		organizacao_pai.setLabel(gt("Organização pai"));
		organizacao_pai.propertie().add("name","p_organizacao_pai").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		extras = new SeparatorField(model,"extras");
		extras.setLabel(gt("Extras"));
		extras.propertie().add("name","p_extras").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false");
		
		plsql_codigo = new TextField(model,"plsql_codigo");
		plsql_codigo.setLabel(gt("PL/SQL (código)"));
		plsql_codigo.propertie().add("name","p_plsql_codigo").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","NovaOrganica","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(documento);


		form_1.addField(nome);
		form_1.addField(codigo);
		form_1.addField(ativo);
		form_1.addField(nada);
		form_1.addField(aplicacao);
		form_1.addField(organizacao_pai);
		form_1.addField(extras);
		form_1.addField(plsql_codigo);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		codigo.setValue(model);
		ativo.setValue(model);
		nada.setValue(model);
		aplicacao.setValue(model);
		organizacao_pai.setValue(model);
		extras.setValue(model);
		plsql_codigo.setValue(model);	

		}
}
