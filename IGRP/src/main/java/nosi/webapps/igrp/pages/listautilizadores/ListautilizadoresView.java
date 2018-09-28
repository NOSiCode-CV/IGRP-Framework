package nosi.webapps.igrp.pages.listautilizadores;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class ListautilizadoresView extends View {

	public Field sectionheader_1_text;
	public Field usernameemail;
	public Field username;
	public Field nome;
	public Field email;
	public Field ativo;
	public Field ativo_check;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public ListautilizadoresView(){

		this.setPageTitle("ListaUtilizadores");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Lista Utilizadores"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		usernameemail = new TextField(model,"usernameemail");
		usernameemail.setLabel(gt("Username/Email"));
		usernameemail.propertie().add("name","p_usernameemail").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		username = new PlainTextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","plaintext").add("maxlength","200");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100");
		
		email = new PlainTextField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","plaintext").add("maxlength","200");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo?"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		
		ativo_check = new CheckBoxField(model,"ativo_check");
		ativo_check.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","30").add("switch","true").add("check","true").add("desc","true");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Listautilizadores","pesquisar","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(usernameemail);

		table_1.addField(username);
		table_1.addField(nome);
		table_1.addField(email);
		table_1.addField(ativo);
		table_1.addField(ativo_check);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		usernameemail.setValue(model);
		username.setValue(model);
		nome.setValue(model);
		email.setValue(model);
		ativo.setValue(model);	

		table_1.loadModel(((Listautilizadores) model).getTable_1());
		}
}
