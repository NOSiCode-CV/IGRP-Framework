package nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Pesquisa_nif_restView extends View {

	public Field sectionheader_1_text;
	public Field tipo_contribuinte;
	public Field nif;
	public Field nome_form;
	public Field n_documento_form;
	public Field nif_tab;
	public Field nome_tab;
	public Field documento_tab;
	public Field dt_nascimento;
	public Field nome_pai;
	public Field nome_mae;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public Pesquisa_nif_restView(){

		this.setPageTitle("Pesquisa NIF");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa NIF [DIREÇÃO GERAL DAS CONTRIBUIÇÕES E IMPOSTOS]"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		tipo_contribuinte = new ListField(model,"tipo_contribuinte");
		tipo_contribuinte.setLabel(gt("Tipo contribuinte"));
		tipo_contribuinte.propertie().add("name","p_tipo_contribuinte").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		nif = new NumberField(model,"nif");
		nif.setLabel(gt("NIF"));
		nif.propertie().add("name","p_nif").add("type","number").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","Integer");
		
		nome_form = new TextField(model,"nome_form");
		nome_form.setLabel(gt("Nome"));
		nome_form.propertie().add("name","p_nome_form").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		n_documento_form = new NumberField(model,"n_documento_form");
		n_documento_form.setLabel(gt("Nº Documento"));
		n_documento_form.propertie().add("name","p_n_documento_form").add("type","number").add("min","").add("max","").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","");
		
		nif_tab = new TextField(model,"nif_tab");
		nif_tab.setLabel(gt("NIF"));
		nif_tab.propertie().add("name","p_nif_tab").add("type","text").add("maxlength","30");
		
		nome_tab = new TextField(model,"nome_tab");
		nome_tab.setLabel(gt("Nome"));
		nome_tab.propertie().add("name","p_nome_tab").add("type","text").add("maxlength","30");
		
		documento_tab = new NumberField(model,"documento_tab");
		documento_tab.setLabel(gt("Documento"));
		documento_tab.propertie().add("name","p_documento_tab").add("type","number").add("min","").add("max","").add("maxlength","30").add("total_footer","false").add("java-type","String");
		
		dt_nascimento = new TextField(model,"dt_nascimento");
		dt_nascimento.setLabel(gt("Dt. Nascimento"));
		dt_nascimento.propertie().add("name","p_dt_nascimento").add("type","text").add("maxlength","30");
		
		nome_pai = new TextField(model,"nome_pai");
		nome_pai.setLabel(gt("Nome pai"));
		nome_pai.propertie().add("name","p_nome_pai").add("type","text").add("maxlength","30");
		
		nome_mae = new TextField(model,"nome_mae");
		nome_mae.setLabel(gt("Nome mãe"));
		nome_mae.propertie().add("name","p_nome_mae").add("type","text").add("maxlength","30");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp_studio","Pesquisa_nif_rest","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(tipo_contribuinte);
		form_1.addField(nif);
		form_1.addField(nome_form);
		form_1.addField(n_documento_form);

		table_1.addField(nif_tab);
		table_1.addField(nome_tab);
		table_1.addField(documento_tab);
		table_1.addField(dt_nascimento);
		table_1.addField(nome_pai);
		table_1.addField(nome_mae);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		tipo_contribuinte.setValue(model);
		nif.setValue(model);
		nome_form.setValue(model);
		n_documento_form.setValue(model);
		nif_tab.setValue(model);
		nome_tab.setValue(model);
		documento_tab.setValue(model);
		dt_nascimento.setValue(model);
		nome_pai.setValue(model);
		nome_mae.setValue(model);	

		table_1.loadModel(((Pesquisa_nif_rest) model).getTable_1());
		}
}
