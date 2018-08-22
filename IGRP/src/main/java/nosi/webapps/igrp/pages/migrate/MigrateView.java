package nosi.webapps.igrp.pages.migrate;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class MigrateView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field tipo_base_dados;
	public Field nome_de_conexao;
	public Field config;
	public Field url_connection;
	public Field driver_connection;
	public Field paragraph_1;
	public Field credenciais;
	public Field username;
	public Field password;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_migrar;

	public MigrateView(){

		this.setPageTitle("Migrate IGRP");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Migração de base de dados"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		tipo_base_dados = new ListField(model,"tipo_base_dados");
		tipo_base_dados.setLabel(gt("Tipo de base de dados"));
		tipo_base_dados.propertie().add("name","p_tipo_base_dados").add("type","select").add("multiple","false").add("maxlength","20").add("required","true").add("disabled","false").add("domain","").add("java-type","").add("tags","false");
		
		nome_de_conexao = new TextField(model,"nome_de_conexao");
		nome_de_conexao.setLabel(gt("Nome da conexão"));
		nome_de_conexao.propertie().add("name","p_nome_de_conexao").add("type","text").add("maxlength","30").add("required","true").add("readonly","false").add("disabled","false");
		
		config = new SeparatorField(model,"config");
		config.setLabel(gt("Config"));
		config.propertie().add("name","p_config").add("type","separator").add("maxlength","30");
		
		url_connection = new TextField(model,"url_connection");
		url_connection.setLabel(gt("Url Connection"));
		url_connection.propertie().add("name","p_url_connection").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false");
		
		driver_connection = new TextField(model,"driver_connection");
		driver_connection.setLabel(gt("Driver Connection"));
		driver_connection.propertie().add("name","p_driver_connection").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false");
		
		paragraph_1 = new PlainTextField(model,"paragraph_1");
		paragraph_1.setLabel(gt("Example"));
		paragraph_1.propertie().add("name","p_paragraph_1").add("type","plaintext").add("clear","false").add("maxlength","250");
		
		credenciais = new SeparatorField(model,"credenciais");
		credenciais.setLabel(gt("Credenciais"));
		credenciais.propertie().add("name","p_credenciais").add("type","separator").add("maxlength","30");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","80").add("required","true").add("readonly","false").add("disabled","false");
		
		password = new PasswordField(model,"password");
		password.setLabel(gt("Password"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","80").add("required","false").add("readonly","false").add("disabled","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_migrar = new IGRPButton("Migrar","igrp","Migrate","migrar","submit","info|fa-exchange","","");
		btn_migrar.propertie.add("type","specific").add("rel","migrar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);
		form_1.addField(tipo_base_dados);
		form_1.addField(nome_de_conexao);
		form_1.addField(config);
		form_1.addField(url_connection);
		form_1.addField(driver_connection);
		form_1.addField(paragraph_1);
		form_1.addField(credenciais);
		form_1.addField(username);
		form_1.addField(password);

		toolsbar_1.addButton(btn_migrar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		tipo_base_dados.setValue(model);
		nome_de_conexao.setValue(model);
		config.setValue(model);
		url_connection.setValue(model);
		driver_connection.setValue(model);
		paragraph_1.setValue(model);
		credenciais.setValue(model);
		username.setValue(model);
		password.setValue(model);	

		}
}
