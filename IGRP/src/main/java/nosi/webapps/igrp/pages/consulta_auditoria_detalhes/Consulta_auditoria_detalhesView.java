package nosi.webapps.igrp.pages.consulta_auditoria_detalhes;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class Consulta_auditoria_detalhesView extends View {

	public Field coluna;
	public Field antigo;
	public Field novo;
	public Field utilizador;
	public Field tabela;
	public Field ip;
	public Field data;
	public Field accao;
	public Field contexto;
	public Field sectionheader_1_text;
	public IGRPTable table_1;
	public IGRPForm form_1;
	public IGRPForm sectionheader_1;


	public Consulta_auditoria_detalhesView(){

		this.setPageTitle("Consulta Auditoria - Detalhes");
			
		table_1 = new IGRPTable("table_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1 = new IGRPForm("sectionheader_1","");

		coluna = new PlainTextField(model,"coluna");
		coluna.setLabel(gt("Coluna"));
		coluna.propertie().add("name","p_coluna").add("type","plaintext").add("maxlength","50").add("showLabel","true");
		
		antigo = new PlainTextField(model,"antigo");
		antigo.setLabel(gt("Antigo"));
		antigo.propertie().add("name","p_antigo").add("type","plaintext").add("maxlength","255").add("showLabel","true");
		
		novo = new PlainTextField(model,"novo");
		novo.setLabel(gt("Novo"));
		novo.propertie().add("name","p_novo").add("type","plaintext").add("maxlength","255").add("showLabel","true");
		
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel(gt("Utilizador"));
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		tabela = new TextField(model,"tabela");
		tabela.setLabel(gt("Tabela"));
		tabela.propertie().add("name","p_tabela").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		ip = new TextField(model,"ip");
		ip.setLabel(gt("IP"));
		ip.propertie().add("name","p_ip").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		data = new TextField(model,"data");
		data.setLabel(gt("Data"));
		data.propertie().add("name","p_data").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		accao = new TextField(model,"accao");
		accao.setLabel(gt("Acção"));
		accao.propertie().add("name","p_accao").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		contexto = new TextField(model,"contexto");
		contexto.setLabel(gt("Contexto"));
		contexto.propertie().add("name","p_contexto").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Consulta Auditoria - Detalhes</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		


		
	}
		
	@Override
	public void render(){
		
		table_1.addField(coluna);
		table_1.addField(antigo);
		table_1.addField(novo);

		form_1.addField(utilizador);
		form_1.addField(tabela);
		form_1.addField(ip);
		form_1.addField(data);
		form_1.addField(accao);
		form_1.addField(contexto);

		sectionheader_1.addField(sectionheader_1_text);

		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		coluna.setValue(model);
		antigo.setValue(model);
		novo.setValue(model);
		utilizador.setValue(model);
		tabela.setValue(model);
		ip.setValue(model);
		data.setValue(model);
		accao.setValue(model);
		contexto.setValue(model);	

		table_1.loadModel(((Consulta_auditoria_detalhes) model).getTable_1());
		}
}
