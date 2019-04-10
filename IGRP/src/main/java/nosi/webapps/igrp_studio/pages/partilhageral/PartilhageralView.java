package nosi.webapps.igrp_studio.pages.partilhageral;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PartilhageralView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao_origem;
	public Field elemento;
	public Field app_or;
	public Field estado;
	public Field estado_check;
	public Field nome;
	public Field aplicacao_destino;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPForm form_2;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_partilhar;

	public PartilhageralView(){

		this.setPageTitle("Partilha Página");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		form_2 = new IGRPForm("form_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Partilha geral entre aplicações"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","40");
		
		aplicacao_origem = new ListField(model,"aplicacao_origem");
		aplicacao_origem.setLabel(gt("Aplicação origem"));
		aplicacao_origem.propertie().add("name","p_aplicacao_origem").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		elemento = new ListField(model,"elemento");
		elemento.setLabel(gt("Tipo"));
		elemento.propertie().add("name","p_elemento").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		app_or = new HiddenField(model,"app_or");
		app_or.setLabel(gt(""));
		app_or.propertie().add("name","p_app_or").add("type","hidden").add("maxlength","250").add("java-type","String").add("tag","app_or");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt(" "));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","").add("check","true").add("desc","true");
		
		nome = new PlainTextField(model,"nome");
		nome.setLabel(gt("Nome (code)"));
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100");
		
		aplicacao_destino = new ListField(model,"aplicacao_destino");
		aplicacao_destino.setLabel(gt("Aplicação destino"));
		aplicacao_destino.propertie().add("name","p_aplicacao_destino").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_partilhar = new IGRPButton("Partilhar","igrp_studio","Partilhageral","partilhar","submit","success|fa-share-alt","","");
		btn_partilhar.propertie.add("type","specific").add("rel","partilhar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao_origem);
		form_1.addField(elemento);
		form_1.addField(app_or);

		table_1.addField(estado);
		table_1.addField(estado_check);
		table_1.addField(nome);

		form_2.addField(aplicacao_destino);


		toolsbar_1.addButton(btn_partilhar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(form_2);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao_origem.setValue(model);
		elemento.setValue(model);
		app_or.setValue(model);
		estado.setValue(model);
		nome.setValue(model);
		aplicacao_destino.setValue(model);	

		table_1.loadModel(((Partilhageral) model).getTable_1());
		}
}
