package nosi.webapps.igrp.pages.pesquisanascimento;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;


public class PesquisaNascimentoView extends View {

	public Field sectionheader_1_text;
	public Field n_registo;
	public Field nome;
	public Field n_registo_tabela;
	public Field nome_tabela;
	public Field data_facto;
	public Field nome_mae;
	public Field nome_pai;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public PesquisaNascimentoView(){

		this.setPageTitle("Pesquisar Nascimento");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa Nascimento [REGISTOS NOTARIADO E IDENTIFICAÇÃO]"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		n_registo = new TextField(model,"n_registo");
		n_registo.setLabel(gt("Nº Registo"));
		n_registo.propertie().add("name","p_n_registo").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		n_registo_tabela = new TextField(model,"n_registo_tabela");
		n_registo_tabela.setLabel(gt("Nº Registo"));
		n_registo_tabela.propertie().add("name","p_n_registo_tabela").add("type","text").add("maxlength","30");
		
		nome_tabela = new TextField(model,"nome_tabela");
		nome_tabela.setLabel(gt("Nome"));
		nome_tabela.propertie().add("name","p_nome_tabela").add("type","text").add("maxlength","30");
		
		data_facto = new TextField(model,"data_facto");
		data_facto.setLabel(gt("Data Facto"));
		data_facto.propertie().add("name","p_data_facto").add("type","text").add("maxlength","30");
		
		nome_mae = new TextField(model,"nome_mae");
		nome_mae.setLabel(gt("Nome Mãe"));
		nome_mae.propertie().add("name","p_nome_mae").add("type","text").add("maxlength","30");
		
		nome_pai = new TextField(model,"nome_pai");
		nome_pai.setLabel(gt("Nome Pai"));
		nome_pai.propertie().add("name","p_nome_pai").add("type","text").add("maxlength","30");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisaNascimento","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(n_registo);
		form_1.addField(nome);

		table_1.addField(n_registo_tabela);
		table_1.addField(nome_tabela);
		table_1.addField(data_facto);
		table_1.addField(nome_mae);
		table_1.addField(nome_pai);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		n_registo.setValue(model);
		nome.setValue(model);
		n_registo_tabela.setValue(model);
		nome_tabela.setValue(model);
		data_facto.setValue(model);
		nome_mae.setValue(model);
		nome_pai.setValue(model);	

		table_1.loadModel(((PesquisaNascimento) model).getTable_1());
		}
}
