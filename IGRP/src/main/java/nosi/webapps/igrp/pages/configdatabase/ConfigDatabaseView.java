
package nosi.webapps.igrp.pages.configdatabase;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ConfigDatabaseView extends View {
	
	
	public Field sectionheader_1_text;
	public Field nome_de_conexao;
	public Field aplicacao;
	public Field tipo_base_dados;
	public Field config;
	public Field hostname;
	public Field port;
	public Field username;
	public Field password;
	public Field nome_de_bade_dados;
	public Field paragraph_1_text;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPForm paragraph_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_testar_conexao;
	public IGRPButton btn_gravar;
	public ConfigDatabaseView(ConfigDatabase model){
		this.setPageTitle("Configurar Base de Dados de uma aplicação");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		paragraph_1 = new IGRPForm("paragraph_1","Example");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Configuração de base de dados"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		
		nome_de_conexao = new TextField(model,"nome_de_conexao");
		nome_de_conexao.setLabel(gt("Nome de conexão"));
		nome_de_conexao.propertie().add("name","p_nome_de_conexao").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","Ex: DEVNOSI").add("right","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("java-type","");
		
		tipo_base_dados = new ListField(model,"tipo_base_dados");
		tipo_base_dados.setLabel(gt("Tipo Base Dados"));
		tipo_base_dados.propertie().add("name","p_tipo_base_dados").add("type","select").add("multiple","false").add("maxlength","20").add("required","true").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		config = new SeparatorField(model,"config");
		config.setLabel(gt("Config"));
		config.propertie().add("name","p_config").add("type","separator").add("maxlength","30").add("placeholder","").add("right","false");
		
		hostname = new TextField(model,"hostname");
		hostname.setLabel(gt("Hostname"));
		hostname.propertie().add("name","p_hostname").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","Ex: nosidev02.gov.cv").add("right","false");
		
		port = new NumberField(model,"port");
		port.setLabel(gt("Porta"));
		port.propertie().add("name","p_port").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("min","").add("max","").add("java-type","");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","80").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		password = new PasswordField(model,"password");
		password.setLabel(gt("Password"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","80").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		nome_de_bade_dados = new TextField(model,"nome_de_bade_dados");
		nome_de_bade_dados.setLabel(gt("Nome de Bade Dados"));
		nome_de_bade_dados.propertie().add("name","p_nome_de_bade_dados").add("type","text").add("maxlength","50").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","Ex: devnosi.gov.cv").add("right","false");
		
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		paragraph_1_text.setValue(gt("DEVNOSI = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP) (HOST = nosidev02.gov.cv) (PORT=1521)) (CONNECT_DATA = (SERVER = DEDICATED) SERVICE_NAME = devnosi.gov.cv) ) )"));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("persist","true").add("maxlength","4000");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_testar_conexao = new IGRPButton("Testar conexão","igrp","ConfigDatabase","testar_conexao","submit","success|fa-check","","");
		btn_testar_conexao.propertie.add("type","specific").add("code","").add("rel","testar_conexao");
		btn_gravar = new IGRPButton("Gravar","igrp","ConfigDatabase","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(nome_de_conexao);
		form_1.addField(aplicacao);
		form_1.addField(tipo_base_dados);
		form_1.addField(config);
		form_1.addField(hostname);
		form_1.addField(port);
		form_1.addField(username);
		form_1.addField(password);
		form_1.addField(nome_de_bade_dados);

		paragraph_1.addField(paragraph_1_text);

		toolsbar_1.addButton(btn_testar_conexao);
		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(paragraph_1);
		this.addToPage(toolsbar_1);
	}
}
