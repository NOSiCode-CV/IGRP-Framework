package nosi.webapps.igrp.pages.consulta_auditoria;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class Consulta_auditoriaView extends View {

	public Field sectionheader_1_text;
	public Field text_1;
	public Field utilizador_form;
	public Field accao_form;
	public Field data_inicio;
	public Field data_fim;
	public Field aplicacao;
	public Field data;
	public Field utilizador;
	public Field tabela;
	public Field accao;
	public Field contexto;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_detalhes;

	public Consulta_auditoriaView(){

		this.setPageTitle("Consulta Auditoria");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Consulta Auditoria</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		text_1 = new TextField(model,"text_1");
		text_1.setLabel(gt("Tabela"));
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","50").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		utilizador_form = new TextField(model,"utilizador_form");
		utilizador_form.setLabel(gt("Utilizador"));
		utilizador_form.propertie().add("name","p_utilizador_form").add("type","text").add("maxlength","50").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		accao_form = new ListField(model,"accao_form");
		accao_form.setLabel(gt("Acção"));
		accao_form.propertie().add("name","p_accao_form").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		data_inicio = new DateField(model,"data_inicio");
		data_inicio.setLabel(gt("Data início"));
		data_inicio.propertie().add("name","p_data_inicio").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		data_fim = new DateField(model,"data_fim");
		data_fim.setLabel(gt("Data fim"));
		data_fim.propertie().add("name","p_data_fim").add("type","date").add("range","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		data = new PlainTextField(model,"data");
		data.setLabel(gt("Data"));
		data.propertie().add("name","p_data").add("type","plaintext").add("maxlength","30").add("showLabel","true");
		
		utilizador = new PlainTextField(model,"utilizador");
		utilizador.setLabel(gt("Utilizador"));
		utilizador.propertie().add("name","p_utilizador").add("type","plaintext").add("maxlength","100").add("showLabel","true");
		
		tabela = new PlainTextField(model,"tabela");
		tabela.setLabel(gt("Tabela"));
		tabela.propertie().add("name","p_tabela").add("type","plaintext").add("maxlength","50").add("showLabel","true");
		
		accao = new PlainTextField(model,"accao");
		accao.setLabel(gt("Acção"));
		accao.propertie().add("name","p_accao").add("type","plaintext").add("maxlength","50").add("showLabel","true");
		
		contexto = new PlainTextField(model,"contexto");
		contexto.setLabel(gt("Contexto"));
		contexto.propertie().add("name","p_contexto").add("type","plaintext").add("maxlength","50").add("showLabel","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","").add("tag","id");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Consulta_auditoria","pesquisar","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_ver_detalhes = new IGRPButton("Ver detalhes","igrp","Consulta_auditoria","ver_detalhes","mpsubmit","info|fa-eye","","");
		btn_ver_detalhes.propertie.add("type","specific").add("rel","ver_detalhes");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(text_1);
		form_1.addField(utilizador_form);
		form_1.addField(accao_form);
		form_1.addField(data_inicio);
		form_1.addField(data_fim);
		form_1.addField(aplicacao);

		table_1.addField(data);
		table_1.addField(utilizador);
		table_1.addField(tabela);
		table_1.addField(accao);
		table_1.addField(contexto);
		table_1.addField(id);

		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_detalhes);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		text_1.setValue(model);
		utilizador_form.setValue(model);
		accao_form.setValue(model);
		data_inicio.setValue(model);
		data_fim.setValue(model);
		aplicacao.setValue(model);
		data.setValue(model);
		utilizador.setValue(model);
		tabela.setValue(model);
		accao.setValue(model);
		contexto.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((Consulta_auditoria) model).getTable_1());
		}
}
