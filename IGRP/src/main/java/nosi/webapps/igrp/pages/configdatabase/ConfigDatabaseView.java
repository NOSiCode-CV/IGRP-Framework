
package nosi.webapps.igrp.pages.configdatabase;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;



public class ConfigDatabaseView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field tipo_base_dados;
	public Field nome_de_conexao;
	public Field config;
	public Field hostname;
	public Field port;
	public Field nome_de_bade_dados;
	public Field credenciais;
	public Field username;
	public Field password;
	public Field paragraph_1_text;
	public Field nome_de_conexao_tabela;
	public Field hostname_tabela;
	public Field porta_tabela;
	public Field nome_base_de_dados_tabela;
	public Field user_name_tabela;
	public Field tipo_de_base_de_dados_tabela;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPForm paragraph_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_delete;

	public ConfigDatabaseView(){

		this.setPageTitle("Configurar Base de Dados de uma aplicação");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		paragraph_1 = new IGRPForm("paragraph_1","Example");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Configuração da base de dados"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("java-type","").add("tags","false");
		
		tipo_base_dados = new ListField(model,"tipo_base_dados");
		tipo_base_dados.setLabel(gt("Tipo de base de dados"));
		tipo_base_dados.propertie().add("name","p_tipo_base_dados").add("type","select").add("multiple","false").add("maxlength","20").add("required","true").add("domain","").add("java-type","").add("tags","false");
		
		nome_de_conexao = new TextField(model,"nome_de_conexao");
		nome_de_conexao.setLabel(gt("Nome da conexão"));
		nome_de_conexao.propertie().add("name","p_nome_de_conexao").add("type","text").add("maxlength","30").add("required","true");
		
		config = new SeparatorField(model,"config");
		config.setLabel(gt("Config"));
		config.propertie().add("name","p_config").add("type","separator").add("maxlength","30");
		
		hostname = new TextField(model,"hostname");
		hostname.setLabel(gt("Host"));
		hostname.propertie().add("name","p_hostname").add("type","text").add("maxlength","100").add("required","true");
		
		port = new NumberField(model,"port");
		port.setLabel(gt("Porta"));
		port.propertie().add("name","p_port").add("type","number").add("maxlength","30").add("required","true").add("min","").add("max","").add("java-type","int");
		
		nome_de_bade_dados = new TextField(model,"nome_de_bade_dados");
		nome_de_bade_dados.setLabel(gt("Nome da base de dados"));
		nome_de_bade_dados.propertie().add("name","p_nome_de_bade_dados").add("type","text").add("maxlength","50").add("required","true");
		
		credenciais = new SeparatorField(model,"credenciais");
		credenciais.setLabel(gt("Credenciais"));
		credenciais.propertie().add("name","p_credenciais").add("type","separator").add("maxlength","30");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","80").add("required","true");
		
		password = new PasswordField(model,"password");
		password.setLabel(gt("Password"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","80").add("required","false");
		
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		paragraph_1_text.setValue(gt("DEVNOSI = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP) (HOST = nosidev02.gov.cv) (PORT=1521)) (CONNECT_DATA = (SERVER = DEDICATED) SERVICE_NAME = devnosi.gov.cv) ) )"));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("maxlength","4000");
		
		nome_de_conexao_tabela = new TextField(model,"nome_de_conexao_tabela");
		nome_de_conexao_tabela.setLabel(gt("Nome da conexão"));
		nome_de_conexao_tabela.propertie().add("name","p_nome_de_conexao_tabela").add("type","text").add("maxlength","30");
		
		hostname_tabela = new TextField(model,"hostname_tabela");
		hostname_tabela.setLabel(gt("Hostname"));
		hostname_tabela.propertie().add("name","p_hostname_tabela").add("type","text").add("maxlength","30");
		
		porta_tabela = new NumberField(model,"porta_tabela");
		porta_tabela.setLabel(gt("Porta"));
		porta_tabela.propertie().add("name","p_porta_tabela").add("type","number").add("min","").add("max","").add("maxlength","30").add("total_footer","false");
		
		nome_base_de_dados_tabela = new TextField(model,"nome_base_de_dados_tabela");
		nome_base_de_dados_tabela.setLabel(gt("Nome da base de dados"));
		nome_base_de_dados_tabela.propertie().add("name","p_nome_base_de_dados_tabela").add("type","text").add("maxlength","30");
		
		user_name_tabela = new TextField(model,"user_name_tabela");
		user_name_tabela.setLabel(gt("Username"));
		user_name_tabela.propertie().add("name","p_user_name_tabela").add("type","text").add("maxlength","30");
		
		tipo_de_base_de_dados_tabela = new TextField(model,"tipo_de_base_de_dados_tabela");
		tipo_de_base_de_dados_tabela.setLabel(gt("Tipo de base de dados"));
		tipo_de_base_de_dados_tabela.propertie().add("name","p_tipo_de_base_de_dados_tabela").add("type","text").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Testar conexão e gravar ","igrp","ConfigDatabase","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_delete = new IGRPButton("Delete","igrp","ConfigDatabase","delete","submit","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);
		form_1.addField(tipo_base_dados);
		form_1.addField(nome_de_conexao);
		form_1.addField(config);
		form_1.addField(hostname);
		form_1.addField(port);
		form_1.addField(nome_de_bade_dados);
		form_1.addField(credenciais);
		form_1.addField(username);
		form_1.addField(password);

		paragraph_1.addField(paragraph_1_text);

		table_1.addField(nome_de_conexao_tabela);
		table_1.addField(hostname_tabela);
		table_1.addField(porta_tabela);
		table_1.addField(nome_base_de_dados_tabela);
		table_1.addField(user_name_tabela);
		table_1.addField(tipo_de_base_de_dados_tabela);
		table_1.addField(id);

		toolsbar_1.addButton(btn_gravar);
		table_1.addButton(btn_delete);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(paragraph_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		tipo_base_dados.setValue(model);
		nome_de_conexao.setValue(model);
		config.setValue(model);
		hostname.setValue(model);
		port.setValue(model);
		nome_de_bade_dados.setValue(model);
		credenciais.setValue(model);
		username.setValue(model);
		password.setValue(model);
		nome_de_conexao_tabela.setValue(model);
		hostname_tabela.setValue(model);
		porta_tabela.setValue(model);
		nome_base_de_dados_tabela.setValue(model);
		user_name_tabela.setValue(model);
		tipo_de_base_de_dados_tabela.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((ConfigDatabase) model).getTable_1());
		
	}
}
