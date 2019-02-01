package nosi.webapps.igrp.pages.pesquisabi;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PesquisaBIView extends View {

	public Field sectionheader_1_text;
	public Field nome;
	public Field bi;
	public Field bi_tabela;
	public Field nome_tabela;
	public Field data_nascimento;
	public Field sexo;
	public Field nome_pai;
	public Field nome_mae;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public PesquisaBIView(){

		this.setPageTitle("Pesquisar BI");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa BI [REGISTOS NOTARIADO E IDENTIFICAÇÃO]"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		bi = new NumberField(model,"bi");
		bi.setLabel(gt("BI"));
		bi.propertie().add("name","p_bi").add("type","number").add("min","").add("max","").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("java-type","");
		
		bi_tabela = new TextField(model,"bi_tabela");
		bi_tabela.setLabel(gt("BI"));
		bi_tabela.propertie().add("name","p_bi_tabela").add("type","text").add("maxlength","30");
		
		nome_tabela = new TextField(model,"nome_tabela");
		nome_tabela.setLabel(gt("Nome"));
		nome_tabela.propertie().add("name","p_nome_tabela").add("type","text").add("maxlength","30");
		
		data_nascimento = new TextField(model,"data_nascimento");
		data_nascimento.setLabel(gt("Data Nascimento"));
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","text").add("maxlength","30");
		
		sexo = new TextField(model,"sexo");
		sexo.setLabel(gt("Sexo"));
		sexo.propertie().add("name","p_sexo").add("type","text").add("maxlength","30");
		
		nome_pai = new TextField(model,"nome_pai");
		nome_pai.setLabel(gt("Nome Pai"));
		nome_pai.propertie().add("name","p_nome_pai").add("type","text").add("maxlength","30");
		
		nome_mae = new TextField(model,"nome_mae");
		nome_mae.setLabel(gt("Nome Mãe"));
		nome_mae.propertie().add("name","p_nome_mae").add("type","text").add("maxlength","30");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisaBI","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nome);
		form_1.addField(bi);

		table_1.addField(bi_tabela);
		table_1.addField(nome_tabela);
		table_1.addField(data_nascimento);
		table_1.addField(sexo);
		table_1.addField(nome_pai);
		table_1.addField(nome_mae);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		bi.setValue(model);
		bi_tabela.setValue(model);
		nome_tabela.setValue(model);
		data_nascimento.setValue(model);
		sexo.setValue(model);
		nome_pai.setValue(model);
		nome_mae.setValue(model);	

		table_1.loadModel(((PesquisaBI) model).getTable_1());
		}
}
